---Спочатку додаю необхідні дані до бази

ALTER TABLE workers
ADD COLUMN library_filia VARCHAR(20);

UPDATE workers SET library_filia = '2' WHERE worker_id < 4;

INSERT INTO books(title, author_id, publication_year, genre, books_count, available) VALUES 
	('Book1', 5, 1987, 'казка', 1, true),
	('Book2 ', 2, 2006, 'детектив', 2, true),
	('Book3', 2, 2007, 'роман', 1, false),
	('Book4', 3, 1991, 'детектив', 2, true),
	('Book5', 4, 1991, 'роман', 5, true),
	('Book6', 1, 1989, 'роман', 4, true);

INSERT INTO workers(workers_name, workers_position, salary, library_filia) VALUES 
	('worker1', 'Бібліотекар', 6500, '1'),
	('worker2', 'Адміністратор', 9000, '1'),
	('worker3', 'Бібліотекар', 6500, '1'),
	('worker4', 'Адміністратор', 9000, '4'),
	('worker5', 'Бібліотекар', 5000, '3');

INSERT INTO users(users_name, phone_number, email, address) VALUES 
	('user1', '+380991234511', 'user1@example.com', 'вул. Пушкіна, 101'),
	('user2', '+380992345622', 'user2@example.com', 'вул. Пушкіна, 15'),
	('user3', '+380993456733', 'user3@example.com', 'вул. Гоголя, 120'),
	('user4', '+380991234544', 'user4@example.com', 'вул. Пушкіна, 43'),
	('user5', '+380992345655', 'user5@example.com', 'вул. Пушкіна, 253'),
	('user6', '+380993456766', 'user6@example.com', 'вул. Гоголя, 201');

INSERT INTO book_loans(book_id, users_id, worker_id, loan_date, return_date) VALUES 
	(1, 1, 1, '2024-05-02', '2024-06-02'),
	(3, 2, 1, '2024-05-04', '2024-06-04'),
	(5, 3, 2, '2024-05-06', '2024-06-06'),
	(1, 9, 1, '2024-05-07', '2024-06-07'),
	(7, 2, 1, '2024-05-07', '2024-06-07'),
	(5, 5, 2, '2024-05-05', '2024-06-05'),
	(1, 1, 1, '2024-05-11', '2024-06-11'),
	(8, 2, 1, '2024-05-13', '2024-06-13'),
	(4, 3, 2, '2024-05-01', '2024-06-01');

--- Необхідні запити

--Створіть SQL-запит, який виводить кількість книг, які були позичені кожним користувачем. Використайте GROUP BY.

SELECT users_id, COUNT(*) 
FROM book_loans
GROUP BY users_id;

--Створіть SQL-запит, який виводить кількість книг кожного жанру в бібліотеці. Використайте GROUP BY.

SELECT genre, COUNT(*) 
FROM books
GROUP BY genre;

--Створіть SQL-запит, який показує кількість працівників в кожній бібліотечній філії. Використайте GROUP BY.

SELECT library_filia, COUNT(*) 
FROM workers
GROUP BY library_filia;
