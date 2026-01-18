from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from sqlalchemy import func
from mydb import *

engine = create_engine(DB_URL)
Session = sessionmaker(bind=engine)

def get_author_count_by_birth_range(session, year_from, year_to):
    count = session.query(func.count(Author.id_authors)) \
        .filter(Author.birth_year.between(year_from, year_to)) \
        .scalar()
    return count


with Session() as session:
    result = get_author_count_by_birth_range(session, 1800, 1900)
    print(f"Počet autorů narozených mezi lety 1800 a 1900: {result}")