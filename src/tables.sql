CREATE TABLE IF NOT EXISTS scheme (
    scheme_id   serial,
    type        varchar(32) NOT NULL,
    width       integer     NOT NULL CHECK (width > 0),
    height      integer     NOT NULL CHECK (height > 0),
    PRIMARY KEY (scheme_id)
);

CREATE TABLE IF NOT EXISTS control (
    control_id  serial,
    date        timestamp   NOT NULL,
    PRIMARY KEY (control_id)
);

CREATE TABLE IF NOT EXISTS color (
    color_id    serial,
    name        varchar(32) NOT NULL,
    PRIMARY KEY (color_id)
);

CREATE TABLE IF NOT EXISTS card (
    card_id     serial,
    name        varchar(32) NOT NULL,
    color       integer     NOT NULL,
    FOREIGN KEY (color) REFERENCES color (color_id),
    PRIMARY KEY (card_id)
);

CREATE TABLE IF NOT EXISTS cardbox (
    cardbox_id  serial,
    card_one    integer,
    card_two    integer,
    card_three  integer,
    color       integer     NOT NULL,
    FOREIGN KEY (card_one) REFERENCES color (color_id),
    FOREIGN KEY (card_two) REFERENCES color (color_id),
    FOREIGN KEY (card_three) REFERENCES color (color_id),
    PRIMARY KEY (cardbox_id)
);

CREATE TABLE IF NOT EXISTS tester (
    tester_id   serial,
    name        varchar(32) NOT NULL,
    year        integer     NOT NULL CHECK (year > 0 and year < 2022),
    company     varchar(32),
    card        integer     NOT NULL,
    FOREIGN KEY (card) REFERENCES card (card_id),
    PRIMARY KEY (tester_id)
);

CREATE TABLE IF NOT EXISTS testing_scheme (
    tester      integer     NOT NULL,
    scheme      integer     NOT NULL,
    control     integer     NOT NULL,
    FOREIGN KEY (tester) REFERENCES tester (tester_id),
    FOREIGN KEY (scheme) REFERENCES scheme (scheme_id),
    FOREIGN KEY (control) REFERENCES control (control_id),
    PRIMARY KEY (tester, scheme, control)
);

CREATE TABLE IF NOT EXISTS display (
    display_id serial,
    resolution  varchar(16) NOT NULL,
    diagonal    integer     NOT NULL,
    PRIMARY KEY (display_id)
);

CREATE TABLE IF NOT EXISTS button (
    button_id   serial,
    radius      integer     NOT NULL,
    color       integer     NOT NULL,
    FOREIGN KEY (color) REFERENCES color (color_id),
    PRIMARY KEY (button_id)
);

CREATE TABLE IF NOT EXISTS lens (
    lens_id      serial,
    radius       integer     NOT NULL,
    focal_length integer     NOT NULL,
    curvature_radius integer NOT NULL,
    PRIMARY KEY (lens_id)
);

CREATE TABLE IF NOT EXISTS microscope (
    microscope_id serial,
    name        varchar(32) NOT NULL,
    height      integer     NOT NULL,
    lens        integer     NOT NULL,
    FOREIGN KEY (lens) REFERENCES lens (lens_id),
    PRIMARY KEY (microscope_id)
);

CREATE TABLE IF NOT EXISTS composition (
    tester      integer     NOT NULL,
    display     integer     NOT NULL,
    button      integer     NOT NULL,
    microscope  integer     NOT NULL,
    FOREIGN KEY (tester) REFERENCES tester (tester_id),
    FOREIGN KEY (display) REFERENCES display (display_id),
    FOREIGN KEY (button) REFERENCES button (button_id),
    FOREIGN KEY (microscope) REFERENCES microscope (microscope_id),
    PRIMARY KEY (tester, display, button, microscope)
);