create schema "book-shop";

SET SEARCH_PATH = "book-shop";

-- Создаем таблицы для книжного магазина

DROP TABLE IF EXISTS books CASCADE;
CREATE TABLE books(
    book_id INTEGER NOT NULL UNIQUE PRIMARY KEY,
	book_nm VARCHAR(50) NOT NULL,
    book_genre VARCHAR(20),
    book_sz INTEGER NOT NULL
);

DROP TABLE IF EXISTS author CASCADE;
CREATE TABLE author(
    author_id INTEGER NOT NULL UNIQUE PRIMARY KEY,
	author_nm VARCHAR(50) NOT NULL
);

DROP TABLE IF EXISTS buyer CASCADE;
CREATE TABLE buyer(
    buyer_id INTEGER NOT NULL UNIQUE PRIMARY KEY,
	buyer_nm VARCHAR(50),
	buyer_fav_genre VARCHAR(20)
);

DROP TABLE IF EXISTS publisher CASCADE;
CREATE TABLE publisher(
    publisher_id INTEGER NOT NULL UNIQUE PRIMARY KEY,
	publisher_nm VARCHAR(20),
	adress VARCHAR(20)
);

DROP TABLE IF EXISTS "author-book" CASCADE;
CREATE TABLE "author-book"(
    author_id INTEGER NOT NULL REFERENCES author(author_id),
	book_id INTEGER NOT NULL UNIQUE PRIMARY KEY REFERENCES books(book_id)
);

DROP TABLE IF EXISTS "book-publisher" CASCADE;
CREATE TABLE "book-publisher"(
    book_id INTEGER NOT NULL UNIQUE PRIMARY KEY REFERENCES books(book_id),
	publisher_id INTEGER NOT NULL REFERENCES publisher(publisher_id)
);

DROP TABLE IF EXISTS purchase CASCADE;
CREATE TABLE purchase(
    purchase_id INTEGER NOT NULL PRIMARY KEY REFERENCES purchase(purchase_id),
    buyer_id INTEGER NOT NULL REFERENCES buyer(buyer_id),
	book_id INTEGER NOT NULL UNIQUE REFERENCES books(book_id)
);

-- Заполняем таблицу books
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(1, 'Мастер и Маргарита', 'Роман', 496);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(2, 'Три товарища', 'Роман', 460);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(3, 'Цветы для Элджернона', 'Рассказ', 320);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(4, 'Маленький принц', 'Сказка', 128);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(5, 'Ночь в Лиссабоне', 'Рассказ', 288);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(6, 'Анна Каренина', 'Роман', 884);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(7, 'Убить пересмешника', 'Роман', 416);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(8, 'Преступление и наказание', 'Роман', 331);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(9, 'Вино из одуванчиков', 'Реализм', 384);
INSERT INTO books(book_id, book_nm, book_genre, book_sz) VALUES(10, 'Идиот', 'Фантастика', 640);

-- Заполняем таблицу author
INSERT INTO author(author_id, author_nm) VALUES (3, 'Булгаков М.А.');
INSERT INTO author(author_id, author_nm) VALUES (12, 'Толстой Л.Н.');
INSERT INTO author(author_id, author_nm) VALUES (65, 'Брэдбери Р.');
INSERT INTO author(author_id, author_nm) VALUES (87, 'Киз Д.');
INSERT INTO author(author_id, author_nm) VALUES (11, 'Достоевский Ф.М.');
INSERT INTO author(author_id, author_nm) VALUES (1, 'Харпер Ли');
INSERT INTO author(author_id, author_nm) VALUES (83, 'Ремарк Э.М.');
INSERT INTO author(author_id, author_nm) VALUES (34, 'Пушкин А.С.');
INSERT INTO author(author_id, author_nm) VALUES (6, 'Экзюпери А.');
INSERT INTO author(author_id, author_nm) VALUES (15, 'Роулинг Д.');

-- Заполняем таблицу buyer
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (3, 'Иванов И.И.', 'Стихотворение');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (2, 'Пушкин А.С.', 'Рассказ');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (1, 'Суриков П.С.', 'Повесть');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (6, 'Кострова А.П.', 'Поэма');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (8, 'Смирнов А.Ф.', 'Фантастика');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (25, 'Соловьева Е.Е.', 'Роман');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (32, 'Зверев Д.Ю.', 'Рассказ');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (1708, 'Пушкина О.А.', 'Роман');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (27, 'Крутой И.А.', 'Комедия');
INSERT INTO buyer(buyer_id, buyer_nm, buyer_fav_genre) VALUES (12, 'Путин В.В.', 'Сказка');

-- Заполняем таблицу publisher
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (3, 'Эксмо', 'Москва');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (2, 'Просвещение', 'Санкт-Петербург');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (1, 'Экзамен', 'Екатеринбург');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (6, 'Росмэн', 'Москва');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (4, 'Феникс', 'Москва');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (8, 'Ювента', 'Казань');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (5, 'Дрофа', 'Санкт-Петербург');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (9, 'Вентана-Граф', 'Москва');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (7, 'Перо', 'Новосибирск');
INSERT INTO publisher(publisher_id, publisher_nm, adress) VALUES (111, 'Стрекоза-Пресс', 'Санкт-Петербург');

-- Заполняем таблицу author-book
INSERT INTO "author-book"(author_id, book_id) VALUES (11, 10);
INSERT INTO "author-book"(author_id, book_id) VALUES (65, 9);
INSERT INTO "author-book"(author_id, book_id) VALUES (11, 8);
INSERT INTO "author-book"(author_id, book_id) VALUES (1, 7);
INSERT INTO "author-book"(author_id, book_id) VALUES (12, 6);
INSERT INTO "author-book"(author_id, book_id) VALUES (83, 5);
INSERT INTO "author-book"(author_id, book_id) VALUES (6, 4);
INSERT INTO "author-book"(author_id, book_id) VALUES (87, 3);
INSERT INTO "author-book"(author_id, book_id) VALUES (83, 2);
INSERT INTO "author-book"(author_id, book_id) VALUES (3, 1);

-- Заполняем таблицу book-publisher
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (1, 6);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (2, 4);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (3, 111);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (4, 1);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (5, 7);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (6, 2);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (7, 6);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (8, 3);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (9, 8);
INSERT INTO "book-publisher"(book_id, publisher_id) VALUES (10, 2);

-- Заполняем таблицу purchase
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (100, 1, 1);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (101, 2, 2);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (102, 6, 3);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (103, 1708, 4);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (104, 2, 5);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (105, 8, 6);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (106, 25, 7);
INSERT INTO purchase(purchase_id, buyer_id, book_id) VALUES (107, 32, 8);

-- Первый запрос
SELECT book_genre, count(book_genre)
FROM books, purchase
WHERE books.book_id = purchase.book_id
GROUP BY  book_genre
ORDER BY count(book_genre) DESC;

-- Второй запрос
SELECT books.book_nm, publisher.publisher_nm
FROM books, publisher
JOIN "book-publisher" on publisher.publisher_id = "book-publisher".publisher_id
WHERE books.book_id="book-publisher".book_id;

-- Третий запрос
SELECT author.author_nm, count(author.author_nm)
FROM author
JOIN "author-book" "a-b" on author.author_id = "a-b".author_id
JOIN purchase p on "a-b".book_id = p.book_id
JOIN buyer b on p.buyer_id = b.buyer_id
GROUP BY author.author_nm
ORDER BY count(author_nm) DESC LIMIT 1;

-- Четвертый запрос
SELECT books.book_nm, books.book_genre
FROM books
JOIN purchase p on books.book_id = p.book_id
JOIN buyer b on p.buyer_id = b.buyer_id
WHERE book_genre = buyer_fav_genre;

-- Пятый запрос
SELECT buyer.buyer_nm, books.book_nm
FROM buyer, books
JOIN purchase p on books.book_id = p.book_id
WHERE p.buyer_id = buyer.buyer_id and books.book_genre = 'Роман';

-- CRUD-запросы
-- 1 (CREATE)
INSERT INTO books VALUES (11, 'Гарри Поттер', 'Фантастика', 634);
-- 2 (READ)
SELECT books.book_nm FROM books;
-- 3 (UPDATE)
UPDATE buyer
SET buyer_nm = 'Медведев Д.А.'
WHERE buyer_id = 12;
-- 4 (DELETE)
DELETE FROM author WHERE author_id =  34