insert into book_status ( status)
values 
  ('read'),
  ('unread');

insert into countries ( country_name)
values
  ('France'),
  ('India'),
  ('United States'),
  ('United Kingdom'),
  ('Poland'),
  ('Australia'),
  ('Germany');


insert into books (title, publication_year, id_status)
values
  ('The Little Prince', 1943, 1),
  ('1984', 1949, 2),
  ('Fourth wing', 2023, 1),
  ('Iron Flame', 2023, 2),
  ('Onyx Storm', 2025, 2),
  ('Assassins quest', 1997, 1),
  ('Little Women', 1868, 1),
  ('Icebreaker', 2022, 2),
  ('The Witcher:The last wish', 2007, 1),
  ('Good girl, Bad blood', 2020, 1),
  ('The Cruel Prince', 2018, 1),
  ('The Wicked King', 2019, 1),
  ('The Queen of Nothing', 2019, 1),
  ('How the King of Elfhame Learned to Hate Stories', 2020, 1),
  ('Pride and Prejudice', 1813, 1),
  ('Wuthering Heights', 1847, 1),
  ('The Book Thief', 2005, 1),
  ('Where the Crawdads Sing', 2018, 2),
  ('Cains Jawbone', 1934, 2),
  ('Ordeal by innocence', 1958, 2),
  ('A Murder is Announced', 1950, 2),
  ('The Moving Finger', 1942, 2),
  ('Caraval', 2016, 2),
  ('Legendary', 2018, 2),
  ('Finale', 2019, 2),
  ('11/22/63', 2011, 2),
  ('The Shining', 1977, 2),
  ('Silver 1', 2013, 1),
  ('Silver 2', 2014, 1),
  ('Silver 3', 2015, 1),
  ('Cursed', 2019, 2);

insert into authors (authors_name, birth_year, country_id)
values
  ('Antoine de Saint-Exupéry', 1900, 1),
  ('George Orwell', 1903, 2),
  ('Rebecca Yarros', 1981, 3),
  ('Louisa May Alcott', 1832, 3),
  ('Stephen King', 1947, 3),
  ('Victoria Aveyard', 1990, 3),
  ('Sarah J. Maas', 1986, 3),
  ('Delia Owens', 1949, 3),
  ('Robin Hobb', 1952, 3),
  ('Holly Black', 1971, 3),
  ('Thomas Wheeler', 1970, 3),
  ('Frank Miller', 1957, 3),
  ('Stephanie Garber', 1987, 3),
  ('Agatha Christie', 1890, 4),
  ('Emily Bronte', 1818, 4),
  ('Hannah Grace', 1997, 4),
  ('Holly Jackson', 1992, 4),
  ('Jane Austen', 1775, 4),
  ('Edward Powys Mathers', 1892, 4),
  ('Andrzej Sapkowski', 1948, 5),
  ('Markus Zusak', 1975, 6),
  ('Kerstin Gier', 1966, 7);








insert into books_authors (id_books, id_authors)
values
  (1, 1),
  (2, 2),
  (3, 3), (4, 3), (5, 3),
  (6, 9),
  (7, 4),
  (8, 16),
  (9, 20),
  (10, 17),
  (11, 10), (12, 10), (13, 10), (14, 10),
  (15, 18),
  (16, 15),
  (17, 21),
  (18, 8),
  (19, 19),
  (20, 14), (21, 14), (22, 14),
  (23, 13), (24, 13), (25, 13),
  (26, 5), (27, 5),
  (28, 22), (29, 22), (30, 22),
  (31, 11), (31, 12);
  ;





insert into genres ( name_genre, description, created_at, parent_id)
values
  ('Action and Adventure', 'Fast-paced stories with danger, excitement, and often exotic settings.', 1800, NULL),
  ('Sci-fi', 'Speculative fiction based on futuristic science and technology.', 1920, NULL),
  ('Historical fiction', 'Stories set in the past, often with real historical events or figures.', 1820, NULL),
  ('Fantasy', 'Contains magical elements, mythical creatures, and imaginary worlds.', 1850, NULL),
  ('Romance novel', 'Centers around a love story, often with emotional development.', 1740, NULL),
  ('Western', 'Stories set in the American Old West with cowboys, outlaws, and frontier justice.', 1860, NULL),
  ('Horror', 'Designed to frighten, shock, or disturb readers with suspense or supernatural elements.', 1764, NULL),
  ('Classic', 'Widely acknowledged works of literary excellence across time periods.', NULL, NULL),
  ('Graphic novel', 'A novel told through comic-style illustrations, often with mature themes.', 1970, NULL),
  ('Young Adult', 'Aimed at teenage readers, often featuring coming-of-age themes and young protagonists.', 1940, NULL),
  ('Biography', 'A factual account of a person’s life, written by someone else.', NULL, NULL),
  ('Satire', 'Uses humor, irony, or exaggeration to criticize politics, society, or individuals.', 1600, NULL),
  ('Detective', 'Focuses on solving a mystery or crime, often with a central investigator.', 1841, 1),
  ('Thriller', 'Tense, suspenseful stories involving crime, danger, or high stakes.', 1940, 1),
  ('Dystopia', 'Set in a flawed or oppressive society, usually in the future.', 1908, 3),
  ('Fairy tale', 'Traditional stories with magical creatures, morals, and fantastical events.', NULL, 6),
  ('Folklore', 'Traditional beliefs, customs, and stories passed through generations.', NULL, 6),
  ('Mythology', 'Stories rooted in traditional myths and legends from various cultures.', NULL, 6),
  ('Autobiography', 'A self-written account of the author’s life.', 1800, 15);

insert into genres_books (id_genres, id_books)
values
  (8, 1), (16, 1),
  (8, 2), (2, 2), (15, 2),
  (4, 3), (5, 3), (10, 3),
  (4, 4), (5, 4), (10, 4),
  (4, 5), (5, 5), (10, 5),
  (4, 6), (1, 6),
  (8, 7), (5, 7), (10, 7),
  (5, 8), (10, 8),
  (4, 9), (17, 9),
  (10, 10), (13, 10), (14, 10),
  (4, 11), (10, 11), (4, 12), (10, 12), (4, 13), (10, 13), (4, 14), (10, 14),
  (8, 15), (5, 15), (8, 16), (5, 16),
  (8, 17), (3, 17),
  (5, 18),
  (13, 19), (14, 19), (13, 20), (14, 20), (13, 21), (14, 21), (13, 22), (14, 22),
  (4, 23), (10, 23), (4, 24), (10, 24), (4, 25), (10, 25),
  (2, 26), (3, 26),
  (7, 27), (14, 27),
  (4, 28), (10, 28), (4, 29), (10, 29), (4, 30), (10, 30),
  (4, 31), (17, 31);


insert into notes (created_at, notes, id_books)
values
  ('2025-06-09 08:58:10.665631', 'An allegorical tale about friendship, loneliness, and growing up.', 1),
  ('2025-06-09 08:58:10.665631', 'A fantasy novel with dragons, a military academy, and deadly trials.', 3),
  ('2025-06-09 08:58:10.665631', 'The conclusion of a trilogy about a royal assassin filled with intrigue and pain.', 6),
  ('2025-06-09 08:58:10.665631', 'A warm story of the March sisters’ coming of age, touching and inspiring.', 7),
  ('2025-06-09 08:58:10.665631', 'A collection about the witcher Geralt, blending dark fantasy and Slavic folklore.', 9),
  ('2025-06-09 08:58:10.665631', 'A detective story from a teenager’s perspective, presented as a podcast.', 10),
  ('2025-06-09 08:58:10.665631', 'A faerie court, intrigue, power struggles, and mortal survival in a magical world.', 11),
  ('2025-06-09 08:58:10.665631', 'Complex relationships, betrayals, and fights for power in a fairy tale realm.', 12),
  ('2025-06-09 08:58:10.665631', 'The conclusion of the faerie trilogy with reconciliation and difficult choices.', 13),
  ('2025-06-09 08:58:10.665631', 'An illustrated backstory of a character, rethinking fairy tales.', 14),
  ('2025-06-09 08:58:10.665631', 'Classic English romance, witty and socially critical.', 15),
  ('2025-06-09 08:58:10.665631', 'A gothic tragedy about destructive love and a cursed estate.', 16),
  ('2025-06-09 08:58:10.665631', 'The story of a girl and books in Nazi Germany, narrated by Death.', 17),
  ('2025-06-09 08:58:10.665631', 'Mysterious dreams, diaries, and romance in an unusual school.', 28),
  ('2025-06-09 08:58:10.665631', 'The heroes delve deeper into mysteries; the dream connections become dangerous.', 29),
  ('2025-06-09 08:58:10.665631', 'The trilogy’s finale with answers and a symbolic resolution.', 30),
  ('2025-06-09 16:36:57.348379', 'A touching story about love, responsibility, and seeing with the heart, not the eyes.', 1);