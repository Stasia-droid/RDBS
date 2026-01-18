--- User
--- umět vytvořit/odstranit účet uživatele CREATE/DROP USER

create user kamarad_jmeno with password '2525';
drop user kamarad_jmeno;

--- umět vytvořit/odstranit roli CREATE/DROP ROL

create role reader;
drop role reader;

--- umět přidělit/odebrat uživateli nebo roli nějaká práva GRANT / REVOKE

grant select on books to reader;
grant select on all tables in schema public to reader;
revoke select on books from reader;
grant reader to kamarad_jmeno;
revoke reader from kamarad_jmeno;

