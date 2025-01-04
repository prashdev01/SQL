-- 1. Which SQL function can be used to calculate the running total of a column?
-- A) SUM() OVER()
-- B) COUNT() OVER()
-- C) AVG() OVER()
-- D) RANK() OVER()
ANS - A

-- 2. Which of the following is the correct syntax to create a stored procedure in SQL?
-- A) CREATE FUNCTION procedure_name()
-- B) CREATE PROCEDURE procedure_name()
-- C) CREATE ROUTINE procedure_name()
-- D) CREATE PROC procedure_name()

ANS - B
-- 3. What is the purpose of the ROW_NUMBER() function in SQL?
-- A) To return the number of rows in a table
-- B) To assign a unique sequential number to rows within a result set
-- C) To assign a random number to rows
-- D) To number columns in a table

ANS - B
-- 4. Which of the following is used to define a foreign key in SQL?
-- A) CONSTRAINT FOREIGN KEY
-- B) FOREIGN KEY KEYNAME
-- C) CREATE FOREIGN KEY
-- D) RELATIONSHIP FOREIGN KEY
ANS- A

-- 5. What does the SQL WITH clause allow you to do?
-- A) Define a temporary result set that can be referred to within the query
-- B) Perform multiple updates in a single query
-- C) Specify the structure of a subquery
-- D) Perform a full outer join
ANS-A
-- 6. Which SQL command is used to remove all records from a table without removing the table itself?
-- A) DELETE
-- B) DROP
-- C) TRUNCATE
-- D) REMOVE
ANS-C
-- 7. Which SQL command is used to prevent duplicate rows from being inserted into a table?
-- A) ADD DISTINCT
-- B) INSERT IGNORE
-- C) UPDATE DISTINCT
-- D) INSERT UNIQUE
ANS - B

-- 8. What is the purpose of the EXCEPT operator in SQL?
-- A) To return all rows from two queries
-- B) To return rows that are in the first query but not in the second query
-- C) To combine the results of two queries with duplicates removed
-- D) To return rows that are common between two queries

ANS - B

-- 9. Which of the following is true about window functions in SQL?
-- A) They are used to calculate aggregate values across a specific group of rows
-- B) They can only operate on one column at a time
-- C) They are used to perform multiple subqueries in a single query
-- D) They require the use of the GROUP BY clause

ANS-A

-- 10. Which clause would you use to filter the results of a GROUP BY query based on aggregate functions like COUNT or AVG?
-- A) HAVING
-- B) WHERE
-- C) FILTER
-- D) SELECT

ANS-A

-- 11. What is the primary use of the CROSS JOIN operator in SQL?
-- A) To combine rows from two tables where there is a matching column value
-- B) To combine rows from two tables and return a Cartesian product
-- C) To combine rows based on a specific condition
-- D) To remove duplicate rows from two tables
ANS - B

-- 12. What is the purpose of the ROLLUP operator in SQL?
-- A) To create a summary report of the data
-- B) To group data by one or more columns in a GROUP BY clause
-- C) To calculate the moving average of a column
-- D) To display the distinct values in a column
ANS - A

-- 13. Which of the following is correct about a self-join in SQL?
-- A) It is used to join a table to itself
-- B) It requires two separate tables to join
-- C) It can only be used with INNER JOIN
-- D) It is not supported by SQL

ANS - A
-- 14. What is the result of a FULL OUTER JOIN between two tables?
-- A) Only rows with matching values from both tables
-- B) All rows from both tables, with NULL where there is no match
-- C) Only rows that have no matching values in either table
-- D) Only rows that have matching values in one of the tables

ANS - B
-- 15. Which of the following is used to create a recursive query in SQL?
-- A) UNION ALL
-- B) WITH RECURSIVE
-- C) JOIN
-- D) SUBQUERY
ANS - B


-- 1. Which of the following SQL clauses is used to filter the results of an aggregate function like SUM() or COUNT()?
-- A) WHERE
-- B) HAVING
-- C) GROUP BY
-- D) ORDER BY
ANS - B
-- 2. What does the DISTINCT keyword do in a SELECT statement?
-- A) It retrieves rows that match a specific pattern.
-- B) It eliminates duplicate rows from the result set.
-- C) It sorts the rows in ascending order.
-- D) It groups the rows based on a common column.
ANS-B
-- 3. Which of the following SQL functions is used to count the number of rows in a table?
-- A) COUNT()
-- B) SUM()
-- C) AVG()
-- D) MIN()
ANS-A
-- 4. What is the purpose of the GROUP BY clause in SQL?
-- A) To filter records based on specific conditions.
-- B) To divide the result set into groups based on one or more columns.
-- C) To combine rows from two or more tables.
-- D) To sort the result set by one or more columns.
ANS-B
-- 5. Which of the following functions is used to calculate the average value of a numeric column in SQL?
-- A) SUM()
-- B) AVG()
-- C) COUNT()
-- D) MAX()
ANS-B
-- 6. What is a subquery in SQL?
-- A) A query that retrieves only a single column from a table.
-- B) A query used to modify the structure of a table.
-- C) A query that is nested inside another query.
-- D) A query used to delete data from a table.
ANS-C
-- 7. What type of join in SQL would you use to combine rows that do not have matching values in both tables?
-- A) INNER JOIN
-- B) LEFT JOIN
-- C) RIGHT JOIN
-- D) OUTER JOIN
ANS-D
-- 8. Which SQL function is used to find the maximum value in a column?
-- A) MAX()
-- B) MIN()
-- C) AVG()
-- D) COUNT()
ANS-A
-- 9. Which of the following statements is true regarding NULL values in SQL?
-- A) NULL is equivalent to an empty string.
-- B) NULL can be compared with another NULL using the equal sign (=).
-- C) NULL represents the absence of a value in a column.
-- D) NULL values are automatically excluded from aggregate functions.
ANS-C
-- 10. In SQL, what does the term "INNER JOIN" refer to?
-- A) It returns all records from the left table, and only the matching records from the right table.
-- B) It returns all records from both tables, with NULL for non-matching rows.
-- C) It returns only the records with matching values in both tables.
-- D) It returns all records from the right table, and only the matching records from the left table.
ANS-C
-- 11. What does the UNION operator do in SQL?
-- A) It combines the results of two or more queries and eliminates duplicate rows.
-- B) It returns the intersection of two queries.
-- C) It returns the difference between two queries.
-- D) It returns all rows from both queries, with duplicates.
ANS-A
-- 12. In SQL, which of the following clauses is used to define the sorting order of the result set?
-- A) GROUP BY
-- B) ORDER BY
-- C) HAVING
-- D) LIMIT
ANS-A
-- 13. Which of the following SQL functions is used to combine the values of multiple rows into a single string?
-- A) GROUP_CONCAT()
-- B) CONCAT()
-- C) JOIN()
-- D) LISTAGG()
ANS-B
-- 14. What does the LIKE operator in SQL allow you to do?
-- A) Compare numerical values between two columns.
-- B) Filter results based on a pattern match.
-- C) Combine values from two columns into one.
-- D) Sort results in a descending order.
ANS-B
-- 15. Which of the following is the correct syntax to update a record in SQL?
-- A) UPDATE table_name SET column_name = value WHERE condition;
-- B) MODIFY table_name SET column_name = value;
-- C) CHANGE table_name SET column_name = value WHERE condition;
-- D) INSERT INTO table_name SET column_name = value WHERE condition;
ANS-A

-- 1. Which SQL query will return the second-highest salary from the "employees" table?

-- A) SELECT MAX(SALARY) FROM employees WHERE SALARY < (SELECT MAX(SALARY) FROM employees);
-- B) SELECT MAX(SALARY) FROM employees WHERE SALARY > (SELECT MIN(SALARY) FROM employees);
-- C) SELECT SALARY FROM employees WHERE RANK() = 2;
-- D) SELECT SALARY FROM employees ORDER BY SALARY DESC LIMIT 1 OFFSET 1;
ans-d

-- 2. Which query will find the employees who have the same job as their manager?

-- A) SELECT EMPLOYEE_NAME FROM employees WHERE JOB = (SELECT JOB FROM employees WHERE EMPLOYEE_ID = MANAGER_ID);
-- B) SELECT EMPLOYEE_NAME FROM employees WHERE JOB = 'Manager';
-- C) SELECT EMPLOYEE_NAME FROM employees JOIN employees AS managers ON employees.MANAGER_ID = managers.EMPLOYEE_ID WHERE employees.JOB = managers.JOB;
-- D) SELECT EMPLOYEE_NAME FROM employees JOIN departments ON employees.DEPARTMENT_ID = departments.DEPARTMENT_ID WHERE employees.JOB = 'Manager';
ans -c
-- 3. Which query is used to find the departments where employees have the highest salary in their respective department?

-- A) SELECT DEPARTMENT_NAME, MAX(SALARY) FROM employees GROUP BY DEPARTMENT_NAME;
-- B) SELECT DEPARTMENT_NAME, SALARY FROM employees WHERE SALARY IN (SELECT MAX(SALARY) FROM employees GROUP BY DEPARTMENT_NAME);
-- C) SELECT DEPARTMENT_NAME, MAX(SALARY) FROM employees WHERE DEPARTMENT_NAME IN (SELECT DEPARTMENT_NAME FROM employees GROUP BY SALARY DESC);
-- D) SELECT DEPARTMENT_NAME, MAX(SALARY) FROM employees GROUP BY SALARY DESC;
ans-a

-- 4. What will the following query do?

-- SELECT employee_name, department_id, salary FROM employees WHERE salary > ALL (SELECT salary FROM employees WHERE department_id = 10);

-- A) Returns all employees whose salary is greater than every employee in department 10.
-- B) Returns all employees whose salary is greater than the average salary in department 10.
-- C) Returns employees who have the highest salary in department 10.
-- D) Returns employees who have the same salary as any employee in department 10.
ans-b
-- 5. Which SQL query is correct to update an employee's salary by 10% in the "employees" table?

-- A) UPDATE employees SET salary = salary + 0.10 WHERE employee_id = 101;
-- B) UPDATE employees SET salary = salary * 0.10 WHERE employee_id = 101;
-- C) UPDATE employees SET salary = salary + (salary * 0.10) WHERE employee_id = 101;
-- D) UPDATE employees SET salary = salary * 1.10 WHERE employee_id = 101;
ans-b

-- 6. Which query will return the department names that have more than 5 employees?

-- A) SELECT department_name FROM employees GROUP BY department_name HAVING COUNT(*) > 5;
-- B) SELECT department_name FROM employees WHERE COUNT(employee_id) > 5 GROUP BY department_name;
-- C) SELECT department_name FROM employees HAVING COUNT(employee_id) > 5 GROUP BY department_name;
-- D) SELECT department_name FROM employees WHERE COUNT(*) > 5;
ans-a
-- 7. What will the query below return?

-- SELECT DISTINCT department_id, job_id FROM employees WHERE job_id LIKE 'A%';

-- A) Returns distinct department IDs and job IDs for employees with job IDs starting with 'A'.
-- B) Returns the count of department IDs and job IDs for employees with job IDs starting with 'A'.
-- C) Returns the total salary by department and job.
-- D) Returns all employees who have job IDs starting with 'A'.
ans-a

-- 8. What is the purpose of the SQL query below?

-- SELECT department_id, AVG(salary) FROM employees GROUP BY department_id HAVING AVG(salary) > 50000;

-- A) It retrieves the department IDs where the average salary is greater than 50000.
-- B) It retrieves the employees whose salary is greater than 50000.
-- C) It retrieves the department names where employees earn more than 50000.
-- D) It retrieves the department names that pay the highest salary.
ans-a
-- 9. What is the correct syntax to remove a column from a table in SQL?

-- A) ALTER TABLE employees DROP COLUMN salary;
-- B) DELETE COLUMN salary FROM employees;
-- C) REMOVE COLUMN salary FROM employees;
-- D) DROP COLUMN salary FROM employees;
ans-a
-- 10. Which SQL query is used to find the number of employees in each department?

-- A) SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id;
-- B) SELECT department_name, COUNT(employee_id) FROM employees GROUP BY department_name;
-- C) SELECT department_id, COUNT(*) FROM employees GROUP BY department_id;
-- D) SELECT department_name, COUNT(*) FROM employees GROUP BY department_name;

ans-a
-- 11. Which query will retrieve all the employees who work in 'Sales' department and have a salary greater than $5000?

-- A) SELECT employee_name FROM employees WHERE department_name = 'Sales' AND salary > 5000;
-- B) SELECT employee_name FROM employees WHERE department_id = 'Sales' AND salary > 5000;
-- C) SELECT employee_name FROM employees WHERE department_id = 'Sales' OR salary > 5000;
-- D) SELECT employee_name FROM employees WHERE department_name = 'Sales' AND salary < 5000;
ans-a
-- 12. Which query is used to find employees who have been with the company for more than 5 years?

-- A) SELECT employee_name FROM employees WHERE hire_date < NOW() - INTERVAL 5 YEAR;
-- B) SELECT employee_name FROM employees WHERE hire_date < SYSDATE() - 5;
-- C) SELECT employee_name FROM employees WHERE hire_date > DATE_SUB(CURDATE(), INTERVAL 5 YEAR);
-- D) SELECT employee_name FROM employees WHERE hire_date < DATE_ADD(CURRENT_DATE(), INTERVAL 5 YEAR);
ans-c

-- 13. What is the output of the following query?

-- SELECT department_id, COUNT(employee_id) FROM employees GROUP BY department_id ORDER BY COUNT(employee_id) DESC;

-- A) It returns a list of departments sorted by employee count.
-- B) It returns the departments where employee count is the same.
-- C) It returns departments with more than 10 employees.
-- D) It orders employees by their department IDs.
ans-a
-- 14. Which SQL query will find the total salary of employees in the "IT" department?

-- A) SELECT SUM(salary) FROM employees WHERE department_id = 'IT';
-- B) SELECT SUM(salary) FROM employees WHERE department_name = 'IT';
-- C) SELECT SUM(salary) FROM employees WHERE department_name = 'IT' GROUP BY department_id;
-- D) SELECT department_id, SUM(salary) FROM employees WHERE department_name = 'IT';
ans-c
-- 15. Which query will return employees whose salary is in the top 3 highest salaries in their department?

-- A) SELECT employee_name FROM employees WHERE RANK() OVER(PARTITION BY department_id ORDER BY salary DESC) <= 3;
-- B) SELECT employee_name FROM employees WHERE TOP 3 SALARIES ORDER BY salary DESC;
-- C) SELECT employee_name FROM employees WHERE salary IN (SELECT MAX(salary) FROM employees GROUP BY department_id LIMIT 3);
-- D) SELECT employee_name FROM employees ORDER BY salary DESC LIMIT 3;
ans-c