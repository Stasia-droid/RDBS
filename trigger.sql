--- Trigger automaticky zaznamenává historii všech změn v tabulce knih do auditní tabulky.

create or replace function trg_book_journal() 
returns trigger as $$
begin
    if (tg_op = 'INSERT') then
        insert into books_history(action, book_id, new_title)
        values('INSERT', new.id_books, new.title);
        return new;

    elsif (tg_op = 'UPDATE') then
        insert into books_history(action, book_id, old_title, new_title)
        values('UPDATE', new.id_books, old.title, new.title);
        return new;

    elsif (tg_op = 'DELETE') then
        insert into books_history(action, book_id, old_title)
        values('DELETE', old.id_books, old.title);
        return old;
    end if;
end;
$$ language plpgsql;


create trigger trg_books_audit
after insert or update or delete
on books
for each row
execute function trg_book_journal();

--- insert into books (title, publication_year, id_status) values ('Once Upon a Broken Heart', 2021, 1);
--- DELETE FROM books WHERE id_books = 32;
--- select * from books_history;
