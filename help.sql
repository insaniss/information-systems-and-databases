create function help() returns text language plpgsql as
    $help$ SELECT lab FROM branches; $help$
