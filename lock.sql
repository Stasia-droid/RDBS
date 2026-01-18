--- lock
--- umět zamknout/odemknout tabulku
begin;
lock table books in share mode;
commit;

begin;
lock table books in access exclusive mode;
commit;
--- nebo jen řádek

begin;

select * from books 
where id_books = 1 
for update;

commit;
