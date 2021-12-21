create function help() returns text language sql as
    $help$ SELECT lab FROM branches; $help$
