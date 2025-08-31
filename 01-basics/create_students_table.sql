create database create_demo_db;

use create_demo_db;

create table students
(
    student_id int primary key,
    name varchar(30),
    age int,
    email varchar(50)
);