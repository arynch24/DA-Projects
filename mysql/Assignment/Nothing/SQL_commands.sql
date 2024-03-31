create database registration_db;
use registration_db;
create table users(
Student_Name char,
Father_Name char,
Mother_Name char,
Phone_Number int,
Email varchar(100),
DOB varchar(50),
Blood_Group char,
Department char,
Course char,
Password_ varchar(50)
);
select * from users;