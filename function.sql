--- Pocet autoru dle narozeni

create or replace function pocet_autoru_dle_narozeni(datum_od integer, datum_do integer)
returns int
as $$
    select cast(count(*) as int) from authors
    where birth_year between datum_od and datum_do;
$$ language sql;

select pocet_autoru_dle_narozeni(1800, 1900);