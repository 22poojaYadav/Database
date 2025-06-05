CREATE DATABASE IF NOT EXISTS LibraryDB;
USE LibraryDB;
CREATE TABLE IF NOT EXISTS Books (
    book_id INT PRIMARY KEY AUTO_INCREMENT,
    Title VARCHAR(100),
    author VARCHAR(100),
    publication_year INT,
    genre VARCHAR(50),
    available_copies INT
);
INSERT INTO Books (Title, author, publication_year, genre, available_copies)
VALUES
('Artificial intelligence', 'Pooja' , 2020, 'AI', 5),
('Deep learning', 'Archana', 2017, 'AI', 3),
('Machine learning', 'Shilpa', 2019, 'ML', 6),
('Data system', 'Sakshi', 2020, 'DB', 5);
SELECT * FROM Books;
CREATE USER 'librarian_user'@'local host' IDENTIFIED BY 'librarian_password';
CREATE USER 'member_user'@'local host' IDENTIFIED BY 'member_password';
GRANT SELECT, INSERT, UPDATE, DELETE ON libraryDB.Books To 'librarian_user'@'local host';
GRANT SELECT, INSERT ON libraryDB.Books TO 'member_user'@'local host';
SHOW GRANTS FOR 'librarian_user'@'local host';
SHOW GRANTS FOR 'member_user'@'local host';
REVOKE DELETE ON libraryDB.Books FROM 'librarian_user'@'local host';
REVOKE INSERT ON libraryDB.Books FROM 'member_user'@'local host';
SHOW GRANTS FOR 'librarian_user'@'local host';
SHOW GRANTS FOR 'member_user'@'local host';
