-- ### Order
-- 1. Find all subjects sorted by subject
SELECT * FROM subjects;
-- 2. Find all subjects sorted by location


-- ### Where
-- 3. Find the book "Little Women"
SELECT * FROM books WHERE title = 'Little Women';
-- 4. Find all books containing the word "Python"
SELECT * FROM books WHERE title LIKE '%Python';
-- 5. Find all subjects with the location "Main St" sort them by subject
SELECT * FROM subjects WHERE location = 'Main St';


-- ### Joins

-- 6. Find all books about Computers and list ONLY the book titles
 SELECT books.title
FROM books
JOIN subjects
ON books.subject_id = subject_id
WHERE subjects.subject = 'Computers';
            title 
-- 7. Find all books and display a result table with ONLY the following columns
-- 	* Book title
-- 	* Author's first name
-- 	* Author's last name
-- 	* Book subject
SELECT books.title, authors.first_name, authors.last_name, subjects.subject
FROM books
JOIN authors ON authors.id = books.author_id
JOIN subjects ON subjects.id = books.subject_id;

-- 8. Find all books that are listed in the stock table
-- 	* Sort them by retail price (most expensive first)
-- 	* Display ONLY: title and price
SELECT books.title, stock.retail
FROM editions
JOIN books ON books.id = editions.book_id
JOIN stock ON stock.isbn = editions.isbn
ORDER BY stock.retail DESC;


-- 9. Find the book "Dune" and display ONLY the following columns
-- 	* Book title
-- 	* ISBN number
-- 	* Publisher name
-- 	* Retail price

SELECT books.title, editions.isbn, publishers.name, stock.retail
FROM editions
JOIN books ON books.id = editions.book_id
JOIN stock ON stock.isbn = editions.isbn
JOIN publishers ON publishers.id = editions.publisher_id
WHERE book.title = 'Dune';


-- 10. Find all shipments sorted by ship date display a result table with ONLY the following columns:
-- 	* Customer first name
-- 	* Customer last name
-- 	* ship date
-- 	* book title

SELECT customers.first_name, customers.last_name, shipments.ship_date, books.title
FROM shipments
JOIN customers ON customers.id = shipments.customer_id
JOIN editions ON editions.isbn = shipments.isbn
JOIN books ON books.id = editions.book_id;


-- ### Grouping and Counting

-- 11. Get the COUNT of all books
SELECT COUNT(books.title)
FROM books;
-- 12. Get the COUNT of all Locations
SELECT COUNT(subjects.location)
FROM subjects;
-- 13. Get the COUNT of each unique location in the subjects table. Display the count and the location name. (hint: requires GROUP BY).
SELECT COUNT(subjects.location), subjects.location
FROM subjects
GROUP BY subjects.location;
-- 14. List all books. Display the book_id, title, and a count of how many editions each book has. (hint: requires GROUP BY and JOIN)
SELECT COUNT(editions.edition), books.id, books.title
FROM editions
JOIN books ON books.id = editions.book_id
GROUP BY books.id 
ORDER BY books.id DESC;