-- There are two types comments first one is single line comment and another one is multiple line comment
--start with two hyphens it is called single line comment
--inside the comment whatever we write is not executed  but written to just understand the query
/* This is a multiple
line comment */
use MyHub; 
--CREATE TABLE: it is used to create a new table in database
--syntax CREATE TABLE table_name (column1 datatype,column2 datatype......columnN datatype);
CREATE TABLE employees (emp_id INT,
first_name VARCHAR(100),
last_name VARCHAR(100),
employee_name VARCHAR(100),
job_titles varchar(40),
department_id INT,
department_name varchar(100),
salary INT,
age INT,
hire_date DATE);
--INSERT INTO table_name(column1_name,column2_name....columnN_name)VALUES(value1,vaue2,..valueN),(value1,vaue2,..valueN);
INSERT INTO employees(emp_id, first_name,last_name,employee_name,job_titles,department_id,department_name,salary,age,hire_date ) VALUES 
(111,'Ganta','Sunil','Sunil','data_analyst',301,'accociate',100000,26,'10-01-2024'),
(112,'annavaram','Anil','Anil','developer',302,'manager',500000,33,'10-02-2024'),
(113,'pilli','Anirudh','Anirudh','software',303,'developer',300000,33,'10-03-2024'),
(114,'guna','Akash','Akash','data_science',304,'ETL_developer',600000,33,'10-04-2024'),
(115,'pandranki','jaideep','jaideep','software',305,'manager',500000,33,'10-05-2024'),
(116,'jammi','eswar','eswar','hardware',306,'manager',800000,33,'10-06-2024');

--SELECT It is used to retrieve data from the database table
-- * It is used to select the all columns in the table
-- from It is specifies the table
--table_name It explain about actual name of the table
-- it is used to get all rows and columns from specified table

--1.Write a query to select all columns from the 'employees' table.
--syntax SELECT * FROM table_name;

SELECT * FROM employees;

-- 2. Write a query to select 'first_name' and 'salary' from 'employees' where salary > 50000.
-- syntax SELECT column1,column2,....column,FROM table_name where column_name condition;
-- > This symbol is used for  comparsion
-- where is used for filtering the data
--syntax for adding elements in table ALTER TABLE table_name Add column_name datatype;
/*ALTER TABLE employees Add first_name varchar(100);*/

SELECT first_name,salary FROM employees  WHERE salary > 50000;


--3. Retrieve all records from the 'departments' table where department_name is 'Sales'.
-- syntax SELECT * FROM table_name where column_name = value;
CREATE TABLE departments(emp_id INT,
first_name VARCHAR(100),
last_name VARCHAR(100),
employee_name VARCHAR(100),
job_titles varchar(40),
department_id INT,
department_name varchar(100),
salary INT,
age INT,
hire_date DATE);
--INSERT INTO table_name(column1_name,column2_name....columnN_name)VALUES(value1,vaue2,..valueN),(value1,vaue2,..valueN);
INSERT INTO departments(emp_id, first_name,last_name,employee_name,job_titles,department_id,department_name,salary,age,hire_date ) VALUES 
(111,'Ganta','Sunil','Sunil','data_analyst',301,'accociate',100000,26,'10-01-2024'),
(112,'annavaram','Anil','Anil','developer',302,'manager',500000,33,'10-02-2024'),
(113,'pilli','Anirudh','Anirudh','software',303,'developer',300000,33,'10-03-2024'),
(114,'guna','Akash','Akash','data_science',304,'ETL_developer',600000,33,'10-04-2024'),
(115,'pandranki','jaideep','jaideep','software',305,'manager',500000,33,'10-05-2024'),
(116,'jammi','eswar','eswar','hardware',306,'manager',800000,33,'10-06-2024');



SELECT * FROM departments WHERE department_name = 'developer';

--4. List all employees whose names start with 'A'.
--syntax select * from table_name where column_name condition;
--like is used for matching the patterns 
--A% is here pattern 
--% it represents the sequence we are put module after A means it check the matching letters starting with A
SELECT * FROM employees WHERE employee_name LIKE 'A%';

--5. Display unique job titles from the 'jobs' table.
-- DISTINCT it is used for identifying the unique values
-- syntax select DISTINCT column1,column2,.....columnN FROM table_name;
SELECT DISTINCT job_titles from jobs;

--6. Count how many employees are in each department.
--syntax select column_name,count(column_name) FROM table_name WHERE condition GROUP BY column_name;
-- count is a aggregate function so you must use GROUP BY it used for group the result in department wise
-- here we not use WHERE clause because we are using aggregate function 
SELECT department_name,COUNT(*)FROM employees GROUP BY department_name;

--7. Find the average salary in each department.
--syntax select column_name,avg(column_name) FROM table_name WHERE condition GROUP BY column_name;

SELECT department_name,AVG(salary)FROM employees GROUP BY department_name;

--8. List employees ordered by hire_date descending.
--syntax select column1,column2,.....columnN  from table_name WHERE condition ORDER BY column_name DESC or ASC;
-- it represents the data in form assending or descending
SELECT * FROM employees ORDER BY hire_date DESC

--9. Write a query to find employees with NULL commission_pct.
--syntax  select column1,column2,.....columnN FROM table_name where column_name IS NULL;
-- this syntax explain about column is filled with null value it written true other wise false

SELECT * FROM employees where commission_pct IS NULL;


--10. Retrieve all departments that have more than 5 employees.
--syntax  select column1,column2,.....columnN FROM table_name WHERE condition GROUP BY column_name;
-- having is used for filtering group results
select department_name from employees group by department_name having count(*) > 5;

--11. Write an INNER JOIN between 'employees' and 'departments' on department_id.
-- syntax select column_name FROM table1 INNER JOIN table2 ON table1.column_name=table2.column_name;
-- inner join returns the common records from both tables
-- ON is used for combing the table
SELECT * FROM employees INNER JOIN departments ON employees.department_id=departments.department_id;

--12. Use LEFT JOIN to find employees even if they are not assigned to any department.
--syntax select column_name FROM table1 LEFT JOIN table2 ON table1.column_name=table2.column_name;
--return the all fields in first table and also return common fields in both tables
SELECT * FROM employees LEFT JOIN departments ON employees.department_id = departments.department_id;

--13. List employee names along with their manager names using a SELF JOIN.
--syntax select a.column_name,b.column_name FROM table1 a,table1 b WHERE a.common_field=b.common_field;
-- it is used for to join the table itself
SELECT  e.employee_name as employe_name,m.employee_name as manager_name  from employees e,employees m WHERE e.emp_id=m.manager_id;

--14. Write a query using RIGHT JOIN between 'jobs' and 'employees'.
--syntax select table1.column1,table2.column2.... FROM table1 RIGHT JOIN table2 ON table1.column_field=table2.column_field;
--return the all fields in second table and also return common fields in both tables
SELECT j.job_id,j.job_title,e.employee_id,e.employee_name FROM jobs j RIGHT JOIN employees e ON  j.job_id = e.emp_id;

--15. Perform a FULL OUTER JOIN between 'departments' and 'employees'. (simulate in MySQL)

--16. Show total salary paid per job_id.
--syntax select column_name,sum(column_name) FROM table_name WHERE condition GROUP BY column_name;
SELECT emp_id,sum(salary) FROM employees GROUP BY emp_id;

--17. Find the department with the maximum total salary.
--syntax select column_name,sum(column_name) FROM table_name WHERE condition GROUP BY column_name;
--select is used to retrieve one or more rows from oter database tables  
--from is used to specify which table to select or delete 
--group by is used to group rows that have same values 

SELECT department_name,MAX(salary) FROM employees GROUP BY department_name;

--18. Display departments with average salary above 60000.
--syntax select column_name,avg(column_name) FROM table_name WHERE condition GROUP BY column_name;
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--group by is used to group rows that have same values 
--having is used to to filter and arrange 
SELECT department_name,AVG(salary) FROM employees GROUP BY department_name HAVING AVG(salary)>60000;

--19. Count number of employees in each job group.
--syntax select column_name,count(column_name) FROM table_name WHERE condition GROUP BY column_name;
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--group by is used to group rows that have same values 
SELECT emp_id,COUNT(*)FROM employees GROUP BY emp_id;

--20. List all job titles with their maximum and minimum salary.
-- 
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--group by is used to group rows that have same values 
SELECT job_titles,MAX(salary) as maximum_salary,MIN(salary) as minimum_salary FROM employees group by job_titles;

--21. Find employees earning more than the average salary.
--syntax SELECT column_name [,column_name]FROM tabel[,table2] WHERE column_name OPERATOR( SELECT column_name [,column_name]FROM tabel[,table2][WHERE]); 
-- this involves calculating the average salary using the avg function and then selecting employees with salaries above this average 
--select is used to retrieve one or more rows from oter database tables
--here we use sub query to perform operations that requires many steps and used when the result is unknown 
SELECT employee_name,salary FROM employees WHERE salary > (SELECT avg(salary) FROM employees);


--22. List departments where the maximum salary is over 100000.

--here we need to group deparments and check if the maximum salary in each deparment exceeds 100000
--select is used to retrieve one or more rows from oter database tables
--group by is used to group rows that have same values 
--having is used to to filter and arrange
SELECT department_name,max(salary) FROM employees GROUP BY department_name HAVING max(salary)>100000;


--23. Get names of employees who work in the same department as 'John'.
--first we identify johns deparment then select other employees in the same deparment 
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--here we use sub query to perform operations that requires many steps and used when the result is unknown 
SELECT employee_name FROM employees WHERE department_id IN (SELECT department_id FROM employees WHERE employee_name='John');


--24. List employees who are not managers (no one reports to them).
--select is used to retrieve one or more rows from oter database tables
--not in is used to exclude particular values from the results 
--from is used to specify which table to select or delete
--here we use sub query to perform operations that requires many steps and used when the result is unknown
--where is used to modify and make changes in data 
SELECT employee_name,job_titles FROM employees WHERE emp_id NOT IN (SELECT manager_id FROM employees);


--25. Find employees hired before their managers.

--26. Display employee names in uppercase.
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--upper is used to convert string to upper case 
SELECT UPPER(employee_name) FROM employees;


--27. Concatenate first_name and last_name as 'Full Name'.
--select is used to retrieve one or more rows from oter database tables
--concat is used to add the two fields
--from is used to specify which table to select or delete
SELECT CONCAT(first_name,last_name) FROM employees;

--28. Show the length of each employee's first name.
--
--select is used to retrieve one or more rows from oter database tables
--len is used to return the length of a string 
--from is used to specify which table to select or delete
SELECT employee_name ,len(first_name) FROM employees;

--29. Extract the month from hire_date.
--
--select is used to retrieve one or more rows from oter database tables
--month is used to filter , group and sort the data in month wise 
--from is used to specify which table to select or delete
SELECT MONTH(hire_date) as hire_month FROM employees;

--30. Show current system date and time.
--
--select is used to retrieve one or more rows from oter database tables
--getdate can either usee the default time zone of the system or time zone that has been set by the user 
--as is used to rename a coulm or a tabl with temporary name 
SELECT GETDATE() AS current_datetime;
--31. Round all salaries to 2 decimal places.

--32. Show salary difference between highest and lowest paid employee.
--
--select is used to retrieve one or more rows from oter database tables
--as is used to rename a coulm or a tabl with temporary name
--from is used to specify which table to select or delete
SELECT max(salary)-min(salary) as salary_difference FROM employees;

--34. Show all employees whose name contains the letter 'e'.
--
--from is used to specify which table to select or delete
--select is used to retrieve one or more rows from oter database tables
--where is used to modify and make changes in data 
--like is used to search for a unique pattern in a string value 
SELECT * FROM employees WHERE employee_name LIKE '%e%';


--35. List employees with salary between 50000 and 800000.
--
--select is used to retrieve one or more rows from oter database tables
--from is used to specify which table to select or delete
--where is used to modify and make changes in data 
SELECT * FROM employees WHERE salary between 50000 and 800000;


--36. Create a table named 'projects' with columns: id, name, start_date.
 --syntax CREATE TABLE table_name (column1 datatype,column2 datatype......columnN datatype);
 --create table is used to create a new table within a relational information 
 CREATE TABLE projects(id int,name varchar(100));


 --37. Add a NOT NULL constraint to 'start_date' in 'projects'.
 --syntax for adding elements in table ALTER TABLE table_name Add column_name datatype;
 --alter table is used to add, drop , change or modify the columns in an existing table 
 --alter coulmn is used to change the data of a coulmn in a table 
 ALTER TABLE projects 
 ALTER COLUMN start_date DATE NOT NULL;


 --38. Insert a record into 'projects' table.
 --INSERT INTO table_name(column1_name,column2_name....columnN_name)VALUES(value1,vaue2,..valueN),(value1,vaue2,..valueN);
 --insert into is used to insert new rows in a table 
 INSERT INTO projects(id,project_name,starting_date,ending_date)VALUES(1,'app development','11-10-2021','1-01-2025');


 --39. Delete a project with id = 3 from 'projects'.
--delete from is used to delete records from a table 
 --where is used to modify and make changes in data
 Delete from projects where id = 3;

 --40. Alter 'projects' to add column 'status' with default 'active'.
 --alter table is used to add, drop , change or modify the columns in an existing table 
 --varchar is used to store character of a variable with specified length 
 ALTER TABLE projects add status varchar(30) default 'active'


 --41. Start a transaction, update an employee's salary, then rollback.
 --begin transaction is used to start a new transaction 
 --update is used to update the salary of the employee 
 --rollback  transaction is used to undo the update and restore the orginial salary 
 --set is used to combine two or more statements into a single result 
 begin transaction;
 update employees set salary=salary + 1000 where emp_id=111;
 rollback transaction;


 --42. Use COMMIT to save changes after updating the 'departments' table.
 --begin transaction is used to start a new transaction 
 --set is used to combine two or more statements into a single result 
 --commit transations is used to save the changes permanently 
 begin transaction;
 update departments set department_name='ECE' where department_id=2;
 commit transaction;


 --43. Explain a use case for SAVEPOINT and demonstrate it with queries.
 --  

 --44. Create a view for employees with salary > 70000.
 -- syntax create view table_name
 --create view is used to grant permission to directly access the underlying base table 
 --AS select is used to rename columns in a query 
CREATE VIEW high_salary_employee AS SELECT * FROM employees WHERE salary > 70000;


 --45. Drop the view 'high_salary_employees'.
 --used to delete a view 
DROP VIEW high_salary_employees;


 --46 Create an index on 'last_name' in 'employees' table.
 --create index is used to create an index on a table 
CREATE INDEX last_name ON employees (last_name);


 --47. Drop the index from 'employees' table.
 --drop index is used to delete an index in a table 
DROP INDEX last_name;
--48. Use ROW_NUMBER() to rank employees by salary within each department.
-- the row numbaer assigns the unique values to the table in row wise
SELECT department_id,department_name,salary,ROW_NUMBER() OVER(ORDER BY salary DESC) AS row_num FROM employees;

--49. Use RANK() to identify top 3 earners per department.
--The same column values receieve the same ranks.when multiple rows share same rank the rank next row is not consecutive
SELECT emp_id,salary,department_name,RANK() OVER(PARTITION BY depardepartment_name ORDER BY salary DESC)AS rankers FROM employees;

--50. Use DENSE_RANK() for same salary employees.
--assigns rank each row in partitions with no gaps in ranking values
SELECT employee_name,department_name,salary,DENSE_RANK()OVER (PARTITION BY depardepartment_name ORDER BY salary DESC) AS denser_rank FROM employees;