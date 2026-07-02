CREATE database BankDB;
USE BankDB;
/* Exercise 1
*/
CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY,
    Name VARCHAR(50),
    Age INT,
    Balance DECIMAL(10,2),
    IsVIP BOOLEAN DEFAULT FALSE
);
CREATE TABLE Loans (
    LoanID INT PRIMARY KEY,
    CustomerID INT,
    InterestRate DECIMAL(5,2),
    DueDate DATE,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
INSERT INTO Customers VALUES
(101,'Rahul Sharma',65,12000,FALSE),
(102,'Priya Singh',45,8500,FALSE),
(103,'Amit Verma',70,15000,FALSE),
(104,'Neha Gupta',30,9500,FALSE),
(105,'Rohan Mehta',62,11000,FALSE);
INSERT INTO Loans VALUES
(201,101,9.50,DATE_ADD(CURDATE(),INTERVAL 15 DAY)),
(202,102,10.00,DATE_ADD(CURDATE(),INTERVAL 40 DAY)),
(203,103,8.75,DATE_ADD(CURDATE(),INTERVAL 20 DAY)),
(204,104,11.25,DATE_ADD(CURDATE(),INTERVAL 10 DAY)),
(205,105,9.00,DATE_ADD(CURDATE(),INTERVAL 28 DAY));
SELECT * FROM Customers;
SELECT * FROM Loans;
/*
Scenario 1
Apply a 1% discount to the loan interest rate
for customers whose age is greater than 60.
*/

UPDATE Loans
SET InterestRate = InterestRate - 1
WHERE CustomerID IN (
    SELECT CustomerID
    FROM Customers
    WHERE Age > 60
);
SELECT * FROM Loans;
/* 
Scenario 2
Write a PL/SQL block that iterates through all customers and 
sets a flag IsVIP to TRUE for those with a balance over $10,000.
*/
UPDATE Customers
SET IsVIP = TRUE
WHERE Balance > 10000;
SELECT * FROM Customers;
/* 
Scenario 3
Write a PL/SQL block that fetches all loans due in the next 30 days and 
prints a reminder message for each customer.
*/
SELECT
    c.Name,
    l.LoanID,
    l.DueDate,
    CONCAT('Reminder: Dear ', c.Name,
           ', your Loan ID ',
           l.LoanID,
           ' is due on ',
           DATE_FORMAT(l.DueDate,'%d-%b-%Y')) AS Reminder
FROM Customers c
JOIN Loans l
ON c.CustomerID = l.CustomerID
WHERE l.DueDate BETWEEN CURDATE() AND DATE_ADD(CURDATE(),INTERVAL 30 DAY);


