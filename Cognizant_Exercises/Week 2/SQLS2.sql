/* EXERCISE 3 
STORED PROCEDURES
*/
CREATE TABLE Accounts (
    AccountID INT PRIMARY KEY,
    CustomerName VARCHAR(50),
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);
INSERT INTO Accounts VALUES
(101,'Rahul Sharma','Savings',5000),
(102,'Priya Singh','Current',12000),
(103,'Amit Verma','Savings',8000),
(104,'Neha Gupta','Savings',15000),
(105,'Rohan Mehta','Current',20000);
SELECT * FROM Accounts;
/* Scenario 1 */
DELIMITER $$

CREATE PROCEDURE ProcessMonthlyInterest()
BEGIN

    UPDATE Accounts
    SET Balance = Balance + (Balance * 0.01)
    WHERE AccountType = 'Savings';

END $$

DELIMITER ;
CALL ProcessMonthlyInterest();
SELECT * FROM Accounts;
/* Scenario 2 */
CREATE TABLE Employees (
    EmployeeID INT PRIMARY KEY,
    EmployeeName VARCHAR(50),
    Department VARCHAR(30),
    Salary DECIMAL(10,2)
);
INSERT INTO Employees VALUES
(1,'Aarav','IT',50000),
(2,'Sneha','HR',45000),
(3,'Karan','IT',60000),
(4,'Riya','Finance',55000),
(5,'Mohit','IT',70000);
SELECT * FROM Employees;
DELIMITER $$

CREATE PROCEDURE UpdateEmployeeBonus(
    IN dept VARCHAR(30),
    IN bonusPercent DECIMAL(5,2)
)

BEGIN

    UPDATE Employees
    SET Salary = Salary + (Salary * bonusPercent / 100)
    WHERE Department = dept;

END $$

DELIMITER ;
CALL UpdateEmployeeBonus('IT',10);
SELECT * FROM Employees;
/* Scenario 3 */
DELIMITER $$

CREATE PROCEDURE TransferFunds(
    IN FromAccount INT,
    IN ToAccount INT,
    IN TransferAmount DECIMAL(10,2)
)

BEGIN

    DECLARE SourceBalance DECIMAL(10,2);

    -- Get the balance of the source account
    SELECT Balance
    INTO SourceBalance
    FROM Accounts
    WHERE AccountID = FromAccount;

    -- Check if balance is sufficient
    IF SourceBalance >= TransferAmount THEN

        -- Deduct amount from source account
        UPDATE Accounts
        SET Balance = Balance - TransferAmount
        WHERE AccountID = FromAccount;

        -- Add amount to destination account
        UPDATE Accounts
        SET Balance = Balance + TransferAmount
        WHERE AccountID = ToAccount;

        SELECT 'Fund Transfer Successful!' AS Message;

    ELSE

        SELECT 'Insufficient Balance!' AS Message;

    END IF;

END $$

DELIMITER ;
CALL TransferFunds(101,102,3000);
SELECT * FROM Accounts;
CALL TransferFunds(102,103,20000);

