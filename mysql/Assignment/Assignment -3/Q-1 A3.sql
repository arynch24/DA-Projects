CREATE DATABASE COMPANY;
USE COMPANY;

CREATE TABLE Employee(
EmployeeID INT PRIMARY KEY,
EmployeeName VARCHAR(45) 
);

CREATE TABLE Department(
Department_ID INT PRIMARY KEY,
Department_Name VARCHAR(225),
EmployeeID INT,
FOREIGN KEY(EmployeeID)
REFERENCES Employee(EmployeeID)
);

CREATE TABLE Project(
ProjectId INT PRIMARY KEY,
ProjectName VARCHAR(255),
Department_ID INT,
FOREIGN KEY(Department_ID) 
REFERENCES Department(Department_ID),
status ENUM('ACTIVE','INACTIVE')
);

CREATE TABLE Assignment(
Assignment_ID INT PRIMARY KEY,
assigning_date DATETIME,
Department_ID INT,
ProjectId INT,
FOREIGN KEY (Department_ID)
REFERENCES Department(Department_ID),
FOREIGN KEY (ProjectId)
REFERENCES Project(ProjectId)
);	

CREATE TABLE Employee_Assignment(
Employee_EmployeeID INT,
Assignment_Assignment_ID INT,
FOREIGN KEY(Employee_EmployeeID)
REFERENCES Employee(EmployeeID),
FOREIGN KEY(Assignment_Assignment_ID)
REFERENCES Assignment(Assignment_ID)
);


-- 1. Insert a new employee named "Alice Johnson" with an EmployeeID of 3. Write the
-- SQL command to insert this new employee.

INSERT Employee(EmployeeID,EmployeeName)
VALUES (3,"Alice Johnson");

-- 2. Insert a new assignment with Assignment_ID of 3, assigning date '2024-07-23', for the
-- 'HR' department and the 'Project Alpha' project. Write the SQL command to insert this
-- new assignment.

INSERT Department(Department_ID,Department_Name,EmployeeID)
VALUES (201,'HR',3);

INSERT Project(ProjectId,ProjectName,Department_ID)
VALUES(101,'Project Alpha' , 201);

INSERT Assignment(Assignment_ID,assigning_date,Department_ID,ProjectId)
VALUES(3,'2024-07-23',201,101);

ALTER TABLE Employee
ADD Email VARCHAR(100);

ALTER TABLE Department
MODIFY Department_Name VARCHAR(255);

ALTER TABLE Employee
ADD salary INT;

UPDATE Employee 
SET salary=salary+0.1*salary;


