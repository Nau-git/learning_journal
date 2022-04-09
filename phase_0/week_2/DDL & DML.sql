-- Create table teachers
CREATE TABLE teachers (
    id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    first_name varchar(25) NOT NULL,
    last_name varchar(50),
    school varchar(50) NOT NULL,
    hire_date date,
    salary numeric
    );

-- Menambahkan column Age
alter table teachers add age int 

-- Menghapus column Age
alter table teachers drop COLUMN age

-- Rename table teachers jadi guru
alter table teachers rename to guru

-- Mengganti tipe data column salary
alter table guru modify column salary int 

-- Mengganti nama column first_name
alter table guru change column first_name nama_depan varchar(25)

-- Mengganti nama table ke teachers
alter table guru rename to teachers

-- Mengganti nama column nama_depan
alter table teachers change column nama_depan first_name VARchar(25)


-- Insert data ke database
INSERT INTO teachers (id,first_name, last_name, school, hire_date, salary)
    VALUES (1,'Janet', 'Smith', 'MIT', '2011-10-30', 36200),
           (2,'Lee', 'Reynolds', 'MIT', '1993-05-22', 65000),
           (3,'Samuel', 'Cole', 'Cambridge University', '2005-08-01', 43500),
           (4,'Samantha', 'Bush', 'Cambridge University', '2011-10-30', 36200),
           (5,'Betty', 'Diaz', 'Cambridge University', '2005-08-30', 43500),
           (6,'Kathleen', 'Roush', 'MIT', '2010-10-22', 38500),
           (7,'James', 'Diaz', 'Harvard University', '2003-07-18', 61000),
           (8,'Zack', 'Smith', 'Harvard University', '2000-12-29', 55500),
           (9,'Luis', 'Gonzales', 'Standford University', '2002-12-01', 50000),
           (10,'Frank', 'Abbers', 'Standford University', '1999-01-30', 66000);
           
-- Update salary Janet Smith
update teachers 
set salary=50000
where first_name='Janet'

-- Delete ID ke 10
delete from teachers
where id=10

-- Insert data 2
INSERT INTO teachers (first_name, last_name, school, hire_date, salary)
    VALUES ('Samuel', 'Abbers', 'Standford University', '2006-01-30', 32000),
           ('Jessica', 'Abbers', 'Standford University', '2005-01-30', 33000),
           ('Tom', 'Massi', 'Harvard University', '1999-09-09', 39500),
           ('Esteban', 'Brown', 'MIT', '2007-01-30', 36000),
           ('Carlos', 'Alonso', 'Standford University', '2001-01-30', 44000);
           
-- Menghapus semua data
truncate table teachers

-- Menghapus table teachers
drop table teachers
