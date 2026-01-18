from sqlalchemy import Column, ForeignKey, Integer, String, Text, DateTime, Table
from sqlalchemy.orm import declarative_base, relationship, sessionmaker
from sqlalchemy import create_engine
from datetime import datetime


import os
from dotenv import load_dotenv


load_dotenv()

DB_URL= os.getenv('DB_URL')

Base = declarative_base()


books_authors = Table(
    'books_authors',
    Base.metadata,
    Column('id_authors', Integer, ForeignKey('authors.id_authors'), primary_key=True),
    Column('id_books', Integer, ForeignKey('books.id_books'), primary_key=True)
)


genres_books = Table(
    'genres_books',
    Base.metadata,
    Column('id_genres', Integer, ForeignKey('genres.id_genres'), primary_key=True),
    Column('id_books', Integer, ForeignKey('books.id_books'), primary_key=True)
)



class Country(Base):
    __tablename__ = 'countries'
    country_id = Column(Integer, primary_key=True, autoincrement=True)
    country_name = Column(String, nullable=False)

    authors = relationship("Author", back_populates="country")


class Author(Base):
    __tablename__ = 'authors'
    id_authors = Column(Integer, primary_key=True, autoincrement=True)
    authors_name = Column(String, nullable=False)
    birth_year = Column(Integer)
    country_id = Column(Integer, ForeignKey('countries.country_id'))

    country = relationship("Country", back_populates="authors")
    books = relationship("Book", secondary=books_authors, back_populates="authors")


class BookStatus(Base):
    __tablename__ = 'book_status'
    id_status = Column(Integer, primary_key=True, autoincrement=True)
    status = Column(String, nullable=False)

    books = relationship("Book", back_populates="status")


class Book(Base):
    __tablename__ = 'books'
    id_books = Column(Integer, primary_key=True, autoincrement=True)
    title = Column(String, nullable=False)
    publication_year = Column(Integer)
    id_status = Column(Integer, ForeignKey('book_status.id_status'))

    status = relationship("BookStatus", back_populates="books")
    notes = relationship("Note", back_populates="book")

    authors = relationship("Author", secondary=books_authors, back_populates="books")
    genres = relationship("Genre", secondary=genres_books, back_populates="books")


class Genre(Base):
    __tablename__ = 'genres'
    id_genres = Column(Integer, primary_key=True, autoincrement=True)
    name_genre = Column(String, nullable=False)
    description = Column(Text)
    created_at = Column(Integer)
    parent_id = Column(Integer, ForeignKey('genres.id_genres'))

    sub_genres = relationship("Genre", backref="parent_genre", remote_side=[id_genres])
    books = relationship("Book", secondary=genres_books, back_populates="genres")


class Note(Base):
    __tablename__ = 'notes'
    id_notes = Column(Integer, primary_key=True, autoincrement=True)
    created_at = Column(DateTime, default=datetime.utcnow)
    notes = Column(Text)
    id_books = Column(Integer, ForeignKey('books.id_books'))

    book = relationship("Book", back_populates="notes")



