-- create a database named: mycompanydb
CREATE DATABASE mycompanydb;

-- Connect to the database
USE employeedb;

-- Create tabled called 'Employee'
CREATE TABLE Employees (
 	employee_id INT PRIMARY KEY,
    first_name VARCHAR(64),
    last_name VARCHAR(64),
    salary INT,
    bonus_percentage INT
);

-- Insert some data into 'Employees' table
INSERT INTO Employees (
	employee_id, first_name, last_name, salary, bonus_percentage)
VALUES 
	(1, 'Adam', 'Kimutai', 120000, 10),
	(2, 'Anthony', 'Kamau', 100000, 10),
	(3, 'Peter', 'Rock', 70000, 10),
	(4, 'James', 'Lesser', 110000, 10),
	(5, 'John', 'Mark', 125000, 10),
	(6, 'Mark', 'Otieno', 80000, 10),
	(7, 'Paul', 'Phillip', 65000, 10),
	(8, 'Mary', 'Jane', 55000, 10);

-- using CASE to create a new column 'TOTAL COMPENSATION'
SELECT 
	first_name AS 'First Name', last_name AS 'Last Name', salary AS Salary, bonus_percentage AS 'Bonus %', 
CASE
	WHEN bonus_percentage > 0
	THEN (salary + (bonus_percentage/100*salary))
	ELSE salary
END AS 'TOTAL COMPENSATION'
FROM 
Employees; 

-- Identify employees with Total Compensation greater than 80,000
SELECT 
	first_name AS 'First Name', last_name AS 'Last Name', salary AS Salary, bonus_percentage AS 'Bonus %', 
CASE
	WHEN (salary + (bonus_percentage/100*salary)) > 80000
	THEN 'Total Compensation GREATER than 80,000'
	ELSE 'Total Compensation LESS than 80,000'
END AS 'TOTAL COMPENSATION'
FROM 
Employees ORDER BY salary DESC;