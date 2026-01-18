
create table countries (
    country_id serial primary key,
    country_name text not null
);

create table book_status (
    id_status serial primary key,
    status text not null
);

create table audit_logs (
    log_id serial primary key,
    audit_label text not null,
    created_at timestamp without time zone default current_timestamp
);

create table genres (
    id_genres  serial primary key,
    name_genre text not null,
    description text not null,
    created_at integer,
    parent_id integer,
    constraint fk_genres_parent foreign key (parent_id) references genres(id_genres)
);

create table authors (
    id_authors  serial primary key,
    authors_name text not null,
    birth_year integer,
    country_id integer,
    constraint fk_authors_country foreign key (country_id) references countries (country_id)
);

create table books (
    id_books  serial primary key,
    title text not null,
    publication_year integer,
    id_status integer,
    constraint fk_books_status foreign key (id_status) references book_status (id_status)
);

create table notes (
    id_notes  serial primary key,
    created_at timestamp without time zone not null default  current_timestamp,
    notes text,
    id_books integer,
    constraint fk_notes_book foreign key (id_books) references books (id_books)
);

create table books_authors (
    id_authors integer,
    id_books integer not null,
    primary key (id_authors, id_books),
    constraint fk_ba_authors foreign key (id_authors) references authors (id_authors),
    constraint fk_ba_books foreign key (id_books) references books (id_books)
);

create table genres_books (
    id_genres integer not null,
    id_books integer not null,
    PRIMARY KEY (id_genres, id_books),
    constraint fk_gb_genres foreign key (id_genres) references genres (id_genres),
    constraint fk_gb_books foreign key (id_books) references books (id_books)
);

create table books_history (
    history_id  serial primary key,
    action text,
    book_id integer,
    old_title text,
    new_title text,
    change_date timestamp without time zone default  current_timestamp
);

create table audit_stats (
    stat_id  serial primary key,
    log_id integer,
    country_name text,
    total_authors integer,
    total_books integer,
    constraint fk_stats_log foreign key (log_id) references audit_logs (log_id)

);
