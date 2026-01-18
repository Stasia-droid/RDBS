--- Index garantuje absenci identických záznamů autorů, a to i v případě, že mají stejné jméno.
create unique index idx_unique_author_identity
on authors (authors_name, birth_year, country_id);

-- Pro efektivní vyhledávání v dlouhých textech v genres.
create index idx_genres_description_fulltext
on genres
using gin (to_tsvector('english', description));


---Ukázka vyhledávání:
select * from genres
where to_tsvector('english', description)
  @@ plainto_tsquery('english', 'story');
