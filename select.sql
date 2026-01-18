--- vypočte průměrný počet záznamů na jednu tabulku v DB
select round(avg(number_rows)) as avg_rows
from (
    select count(*) as number_rows from authors
    union all
    select count(*) from books
    union all
    select count(*) from genres
    union all
    select count(*) from genres_books
    union all
    select count(*) from book_status
    union all
    select count(*) from books_authors
    union all
    select count(*) from countries
	union all
	select count(*) from notes
) as table_counts;

--- Najde jména všech autorů, kteří mají alespoň jednu knihu v žánru 'Fantasy'
select authors_name
from authors
where id_authors in (
    select id_authors
    from books_authors
    where id_books in (
        select id_books
        from genres_books
        where id_genres = (
            select id_genres
            from genres
            where name_genre = 'Fantasy'
        )
    )
);

--- Pořadí žánrů podle počtu knih
select
    g.name_genre,
    count(gb.id_books) as pocet_knih,
    rank() over (order by count(gb.id_books) desc) as poradi_popularity
from genres g
left join genres_books gb on g.id_genres = gb.id_genres
group by g.id_genres, g.name_genre;


--- bude potřebovat tabulku v DB s rekurzivní relací
select
    child.name_genre as child,
    parent.name_genre as parent
from genres child
left join genres parent
on child.parent_id = parent.id_genres;
