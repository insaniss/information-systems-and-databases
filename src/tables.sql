CREATE TABLE IF NOT EXISTS scheme (
    scheme_id   serial,
    type        varchar(32)         NOT NULL,
    height      double precision    NOT NULL CHECK (height > 0),
    width       double precision    NOT NULL CHECK (width > 0),
    model       varchar(32),
    country     varchar(32)         NOT NULL,
    PRIMARY KEY (scheme_id)
);

CREATE TABLE IF NOT EXISTS control (
    control_id  serial,
    time        timestamp   NOT NULL,
    duration    integer     NOT NULL,
    PRIMARY KEY (control_id)
);

CREATE TABLE IF NOT EXISTS color (
    color_id    serial,
    name        varchar(32)     NOT NULL UNIQUE,
    red         smallint        NOT NULL CHECK (red >= 0 and red < 256),
    green       smallint        NOT NULL CHECK (green >= 0 and green < 256),
    blue        smallint        NOT NULL CHECK (blue >= 0 and blue < 256),
    PRIMARY KEY (color_id)
);

CREATE TABLE IF NOT EXISTS cardbox (
    cardbox_id  serial,
    width       double precision    NOT NULL CHECK (width > 0),
    height      double precision    NOT NULL CHECK (height > 0),
    color       integer             NOT NULL,
    FOREIGN KEY (color) REFERENCES color (color_id) ON DELETE CASCADE,
    PRIMARY KEY (cardbox_id)
);

CREATE TABLE IF NOT EXISTS card (
    card_id     serial,
    name        varchar(32)     NOT NULL,
    format      varchar(32),
    cardbox     integer,
    color       integer         NOT NULL,
    FOREIGN KEY (cardbox) REFERENCES cardbox (cardbox_id) ON DELETE CASCADE,
    FOREIGN KEY (color) REFERENCES color (color_id) ON DELETE CASCADE,
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS tester (
    tester_id   serial,
    name        varchar(32)     NOT NULL,
    year        integer         NOT NULL CHECK (year > 0 and year < 2022),
    company     varchar(32),
    card        integer         NOT NULL UNIQUE,
    FOREIGN KEY (card) REFERENCES card (card_id) ON DELETE CASCADE,
    PRIMARY KEY (tester_id)
);

CREATE TABLE IF NOT EXISTS testing_scheme (
    tester      integer,
    scheme      integer,
    control     integer         UNIQUE,
    FOREIGN KEY (tester) REFERENCES tester (tester_id) ON DELETE CASCADE,
    FOREIGN KEY (scheme) REFERENCES scheme (scheme_id) ON DELETE CASCADE,
    FOREIGN KEY (control) REFERENCES control (control_id) ON DELETE CASCADE,
    PRIMARY KEY (tester, scheme, control)
);

CREATE TABLE IF NOT EXISTS display (
    display_id  serial,
    resolution  varchar(16)         NOT NULL,
    diagonal    double precision    NOT NULL CHECK (diagonal > 0),
    power_saver boolean             NOT NULL,
    PRIMARY KEY (display_id)
);

CREATE TABLE IF NOT EXISTS button (
    button_id   serial,
    radius      double precision    NOT NULL,
    color       integer,
    FOREIGN KEY (color) REFERENCES color (color_id) ON DELETE CASCADE,
    PRIMARY KEY (button_id)
);

CREATE TABLE IF NOT EXISTS microscope (
    microscope_id   serial,
    type            varchar(32)         NOT NULL,
    weight          double precision    NOT NULL CHECK (weight > 0),
    model           varchar(32)         NOT NULL,
    country         varchar(32)         NOT NULL,
    PRIMARY KEY (microscope_id)
);

CREATE TABLE IF NOT EXISTS lens (
    lens_id             serial,
    type                varchar(32)         NOT NULL,
    curvature_radius    double precision    NOT NULL CHECK (curvature_radius > 0),
    focal_length        double precision    CHECK (focal_length > 0),
    microscope          integer             UNIQUE,
    FOREIGN KEY (microscope) REFERENCES microscope (microscope_id) ON DELETE CASCADE,
    PRIMARY KEY (lens_id)
);

CREATE TABLE IF NOT EXISTS composition (
    tester      integer         UNIQUE,
    display     integer,
    button      integer         UNIQUE,
    microscope  integer         UNIQUE,
    FOREIGN KEY (tester) REFERENCES tester (tester_id) ON DELETE CASCADE,
    FOREIGN KEY (display) REFERENCES display (display_id) ON DELETE CASCADE,
    FOREIGN KEY (button) REFERENCES button (button_id) ON DELETE CASCADE,
    FOREIGN KEY (microscope) REFERENCES microscope (microscope_id) ON DELETE CASCADE,
    PRIMARY KEY (tester, display, button, microscope)
);