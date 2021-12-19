create table if not exists humans
(
    id              integer          primary key,
    firstname       varchar(32)      not null,
    middlename      varchar(32)      not null,
    lastname        varchar(32)      not null,
    birth_date      timestamp        not null check (birth_date < now()),
    death_date      timestamp,
    gender          gender           not null
);

create table if not exists creators
(
    id              serial           primary key,
    email           varchar(64)      not null,
    phone_number    varchar(32)      not null,
    human_id        integer          not null,

    foreign key (human_id) references humans (id)
        on delete cascade on update cascade
);

create table if not exists players
(
    id              serial           primary key,
    username        varchar(32)      not null check (username <> ''),
    strength        real             not null check (strength >= 0 and strength <= 1),
    intelligence    real             not null check (intelligence >= 0 and intelligence <= 1),
    leadership      real             not null check (leadership >= 0 and leadership <= 1),
    feeling         real             not null check (feeling >= 0 and feeling <= 1),
    human_id        integer          not null,

    foreign key (human_id) references humans (id)
        on delete cascade on update cascade
);

create table if not exists visas
(
    id              serial           primary key,
    start_date      timestamp        not null,
    expiry_date     timestamp        not null,
    human_id        integer          not null,

    foreign key (human_id) references humans (id)
        on delete cascade on update cascade
);

create table if not exists hobbies
(
    id              serial           primary key,
    name            varchar(64)      not null unique check (name <> '')
);

create table if not exists human_hobbies
(
    human_id        integer          not null,
    hobby_id        integer          not null,

    unique (human_id, hobby_id),

    foreign key (human_id) references humans (id)
        on delete cascade on update cascade,
    foreign key (hobby_id) references hobbies (id)
        on delete cascade on update cascade
);

create table if not exists locations
(
    id              serial           primary key,
    name            varchar(64)      not null unique check (name <> ''),
    latitude        double precision not null,
    longitude       double precision not null
);

create table if not exists cards
(
    id              serial           primary key,
    number          smallint         not null,
    suit            varchar(16)      not null
);

create table if not exists games
(
    id              serial           primary key,
    name            varchar(64)      not null check (name <> ''),
    start_time      timestamp        not null,
    end_time        timestamp        not null,
    player_count    integer          not null check (player_count > 0),
    location_id     integer          not null,
    card_id         integer          not null unique,
    creator_id      integer          not null,

    foreign key (location_id) references locations (id)
        on delete cascade on update cascade,
    foreign key (card_id) references cards (id)
        on delete cascade on update cascade,
    foreign key (creator_id) references creators (id)
        on delete cascade on update cascade
);

create table if not exists animals
(
    id              serial           primary key,
    name            varchar(32)      not null check (name <> ''),
    type            animal           not null,
    health          real             not null check (health >= 0 and health <= 1),
    strength        real             not null check (strength >= 0 and strength <= 1)
);

create table if not exists game_histories
(
    id              serial           primary key,
    game_id         integer          not null,
    player_id       integer          not null,
    animal_id       integer          not null,
    state           boolean          not null,

    unique (game_id, player_id),
    unique (game_id, animal_id),

    foreign key (game_id) references games (id)
        on delete cascade on update cascade,
    foreign key (player_id) references players (id)
        on delete cascade on update cascade,
    foreign key (animal_id) references animals (id)
        on delete cascade on update cascade
);
