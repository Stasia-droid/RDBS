--- Procedura v rámci jedné transakce převede všechny knihy na nový žánr a původní žánr následně odstraní.
create or replace procedure sloucit_zanry(p_id_stary int, p_id_novy int)
language plpgsql
as $$
declare
    v_check_stary int;
    v_check_novy int;
begin
    select id_genres into v_check_stary 
    from genres 
    where id_genres = p_id_stary;

    select id_genres into v_check_novy 
    from genres 
    where id_genres = p_id_novy;

    if v_check_stary is null or v_check_novy is null then
        raise exception 'chyba: jeden nebo oba žánry neexistují.';
    end if;

    if p_id_stary = p_id_novy then
        raise exception 'chyba: nemůžete sloučit žánr sám se sebou.';
    end if;


    update genres_books 
    set id_genres = p_id_novy 
    where id_genres = p_id_stary;

    delete from genres 
    where id_genres = p_id_stary;

    raise notice 'úspěch: žánry byly sloučeny. všechny knihy byly převedeny na id %.', p_id_novy;

exception
    when others then
        raise;
end;
$$;



--- call sloucit_zanry(10, 10);
--- call sloucit_zanry(999, 10);

--- insert into genres (id_genres, name_genre, description) values (20, 'Dystopie', 'lalalala');
--- call sloucit_zanry(20, 5);