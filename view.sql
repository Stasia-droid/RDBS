--- VIEW (1x) s podstatnými informacemi z několika tabulek najednou
create or replace view katalog_knih as
select
    books.title as nazev_knihy,
    authors.authors_name as autor,
    countries.country_name as zeme_puvodu,
    book_status.status as stav_knihy
from books
inner join book_status on books.id_status = book_status.id_status
inner join books_authors on books.id_books = books_authors.id_books
inner join authors on books_authors.id_authors = authors.id_authors
left join countries on authors.country_id = countries.country_id;

select * from katalog_knih;