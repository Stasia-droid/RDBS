from sqlalchemy import create_engine
from sqlalchemy.orm import sessionmaker
from mydb import *

engine = create_engine(DB_URL)
Base.metadata.create_all(engine)
Session = sessionmaker(bind=engine)


def create_new_genre(name, description,created_at=None, parent_id=None):
    with Session() as session:
        new_genre = Genre(
            name_genre=name,
            description=description,
            created_at=created_at,
            parent_id= parent_id,
        )

        try:
            session.add(new_genre)
            session.commit()
            print(f"Nový žánr '{name}' byl úspěšně vytvořen.")

        except Exception as e:
            session.rollback()
            print(f"Chyba při vytváření žánru: {e}")


if __name__ == "__main__":
    create_new_genre(
        name="Magic",
        description="Magie",
        created_at=2000
    )