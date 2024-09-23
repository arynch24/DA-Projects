create database SOT;

use SOT;
-- Create Department table
CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(100),
    Location VARCHAR(100),
    ManagerID INT
);

-- Insert data into Department table
INSERT INTO Department (DepartmentID, DepartmentName, Location, ManagerID)
VALUES (1, 'HR', 'New York', 101),(2, 'Finance', 'Chicago', 102), (3, 'Engineering', 'San Francisco', 103),(4, 'Marketing', 'Los Angeles', 104),
(5, 'Sales', 'Miami', 105);

-- Create Employee table
CREATE TABLE Employee (
    EmployeeID INT PRIMARY KEY,
    FirstName VARCHAR(100),
    LastName VARCHAR(100),
    Salary DECIMAL(10, 2),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

-- Insert data into Employee table
INSERT INTO Employee (EmployeeID, FirstName, LastName, Salary, DepartmentID)
VALUES (1, 'John', 'Doe', 60000, 1), (2, 'Jane', 'Smith', 65000, 2), (3, 'Michael', 'Brown', 70000, 3),(4, 'Emily', 'Davis', 72000, 3),
(5, 'James', 'Wilson', 58000, 4), (6, 'Sarah', 'Johnson', 75000, 5), (7, 'David', 'Martinez', 80000, 1), (8, 'Laura', 'Garcia', 55000, 2),
(9, 'Chris', 'Lee', 67000, 3), (10, 'Anna', 'Kim', 60000, 4), (11, 'Mark', 'Clark', 82000, 5), (12, 'Sophia', 'Hall', 71000, 1),
(13, 'Daniel', 'Allen', 63000, 2), (14, 'Olivia', 'Young', 76000, 5),(15, 'Noah', 'King', 62000, 4);

select * from Department;
select * from Employee;

-- 1   
select de.DepartmentName ,SUM(em.Salary)  as total_salary
from Department de join Employee em on de.DepartmentID=em.DepartmentID
group by de.DepartmentID;

-- 2
select  em.FirstName,de.DepartmentName  
from Department de join Employee em on de.DepartmentID=em.DepartmentID
where em.Salary>70000;

-- 3 
INSERT INTO Department (DepartmentID, DepartmentName, Location, ManagerID)
value(6,"Research and Development","Boston",110);

select * from Department;

-- 4
UPDATE Employee
SET DepartmentID=4
where FirstName="Emily";

select * from Employee;

-- 5
select  FirstName,LastName from Employee 
where DepartmentID = NULL;


-- 6
UPDATE Employee
SET DepartmentID=NULL
where DepartmentID=5;

DELETE FROM Department 
WHERE DepartmentName="Sales";

select * from Department;

-- 7

select FirstName,LastName,salary,DepartmentID
from employee
order by salary desc
limit 1;

 -- 8
 
 select avg(salary) AS AVG_SALARY_OF_ENGINEERS
from Department de join Employee em on de.DepartmentID=em.DepartmentID
where DepartmentName="Engineering";
 
 -- 9
 
 select de.DepartmentName , em.FirstName ,em.LastName
 from Department de join Employee em on de.DepartmentID=em.DepartmentID
 order by de.DepartmentName;
 
 -- 10
 
 update employee
 set salary = salary+ 0.05*salary;
 
 select * from employee;
 
 

 



