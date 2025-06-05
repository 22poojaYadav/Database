Create database BankDB;
USE BankDB;

CREATE TABLE Accounts   (
    account_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    balance DECIMAL(10, 2)

);

INSERT INTO Accounts (account_id, customer_name, balance)
VALUES
    (1, 'Amit Sharma', 1000.00),
    (2, 'Neha Mehta', 1500.00),
    (3, 'Rajesh Gupta', 2000.00);
    
SELECT * FROM Accounts;
START TRANSACTION;

UPDATE Accounts
SET balance = balance - 300
WHERE account_id = 1;

SELECT balance FROM Accounts WHERE account_id = 1;

UPDATE Accounts 
SET balance = balance + 300
WHERE account_id = 2;

SELECT balance FROM Accounts WHERE account_id = 2;

COMMIT;

COMMIT;
SELECT * FROM Accounts;

START TRANSACTION;

UPDATE Accounts
SET balance = balance - 500
WHERE Account_id = 2;

SELECT account_id, balance FROM Accounts WHERE account_id = 2;

UPDATE Accounts
SET balance = balance + 500
WHERE account_id = 4;

ROLLBACK;

SELECT * FROM Accounts;

START TRANSACTION;

UPDATE Accounts
SET balance = balance + 200
WHERE account_id = 1;

SELECT * FROM Accounts WHERE account_id = 1;

SAVEPOINT increase_balance;

UPDATE Accounts 
SET balance = balance - 100
WHERE account_id = 5;

ROLLBACK TO increase_balance;

SELECT balance FROM Accounts WHERE account_id = 1;

COMMIT;
SELECT * FROM Accounts;