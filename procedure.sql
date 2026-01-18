--- Procedura vypočítá statistiky autorů a knih pro každou zemi.

create or replace procedure audit_world_stats(p_label text)
language plpgsql
security definer
as $$
declare
    cur_countries cursor for select country_id, country_name from countries;
    rec_country record;
    v_authors_count int;
    v_books_count int;
    v_new_log_id int;
begin
    if exists (
        select 1 from audit_logs
        where audit_label = p_label
    ) then
        raise exception 'statistika pro "%" již existuje.', p_label using errcode = 'P0001';
    end if;

    insert into audit_logs (audit_label)
    values (p_label)
    returning log_id into v_new_log_id;

    open cur_countries;

    loop
        fetch cur_countries into rec_country;
        exit when not found;

        select count(*) into v_authors_count 
        from authors 
        where country_id = rec_country.country_id;

        select count(ba.id_books) into v_books_count
        from authors a
        join books_authors ba on a.id_authors = ba.id_authors
        where a.country_id = rec_country.country_id;

        insert into audit_stats (log_id, country_name, total_authors, total_books)
        values (
            v_new_log_id,
            rec_country.country_name,
            v_authors_count,
            v_books_count
        );
    end loop;

    close cur_countries;
    
    raise notice 'statistický audit "%" (id: %) byl úspěšně uložen.', p_label, v_new_log_id;

exception
    when sqlstate 'P0001' then
        raise notice 'upozornění: tento audit už byl v minulosti proveden.';
    when others then
        raise notice 'došlo k chybě při výpočtu statistiky: %', sqlerrm;
        if (select is_open from pg_cursors where name = 'cur_countries') then
            close cur_countries;
        end if;
end;
$$;

call audit_world_stats('leden 2026');

select * from audit_logs;

select 
    l.audit_label,
    l.created_at,
    s.country_name,
    s.total_authors,
    s.total_books
from audit_logs l
join audit_stats s on l.log_id = s.log_id
where l.audit_label = 'leden 2026';