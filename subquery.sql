-- subqueries
-- Basic Subqueries
use joindb;
SELECT * from dept;
SELECT * from emp;
SELECT * from salgrade;


-- Retrieve the name of employees working in the same department as the employee "John".
SELECT e.ename, e.deptno from emp e
where deptno = (SELECT deptno from emp WHERE ename = "jones")  and e.ename != "jones";

-- Find employees who have the same job title as "Mary".
SELECT ename as employee, job as jobs from emp
where job = (select job from emp where ename = "James");

-- List all employees who earn more than the average salary in their department.
SELECT e.ename as employee, e.deptno as department
from emp e
where sal > (select avg(sal) from emp where deptno = e.deptno);

-- Display the department name for employees whose salary is higher than 5000.
SELECT DISTINCT d.dname as department from dept d
WHERE d.deptno in (SELECT deptno from emp where sal > 2000);

-- Fetch the details of employees whose salary falls in the range of any grade in the Salgrade table.
SELECT e.ename as employee, e.sal as salary from emp e
WHERE e.sal BETWEEN (SELECT min(losal) from salgrade)
AND (SELECT max(hisal) from salgrade);


-- Single-row Subqueries

-- Identify the employee with the highest salary in the company.
select ename ,sal FROM emp
WHERE sal = (SELECT max(sal) from emp);

-- Retrieve the department with the maximum number of employees.
SELECT dname as department
from dept
where deptno = (SELECT deptno from  emp WHERE count(empno) = 5 );
-- Display the manager name for the employee "Alice" (assuming Mgr links to another EmpID).
-- Find the department location where the employee "James" works.
-- Retrieve the employee details with the earliest hire date.
-- Multi-row Subqueries
-- List the employees whose salaries match any of the MinSalary values in the Salgrade table.
-- Fetch employees who are working in departments located in "New York" or "Chicago".
-- Find the names of all managers (unique Mgr values that also exist as EmpID).
-- Display employees who have a higher salary than anyone in department 10.
-- List departments where at least one employee has a salary higher than 10,000.
-- Correlated Subqueries
-- Retrieve employees whose salary is above the average salary of their department.
-- List all departments where every employee earns less than 15,000.
-- Find the employees whose salary is greater than the average salary of all employees in their job title.
-- Identify the employees whose hire date is earlier than their manager's hire date.
-- Fetch employees who are the only ones working in their respective department.
-- Subqueries in IN, EXISTS, NOT IN, NOT EXISTS
-- List employees who do not belong to any department.
-- Display departments that have no employees.
-- Retrieve employees who work in the same department as their manager.
-- List employees who are not assigned a manager.
-- Identify employees who earn salaries within any salary grade range in the Salgrade table.
-- Subqueries with ALL, ANY
-- Fetch employees who earn more than all employees in department 20.
-- Find employees whose salaries are less than the maximum salary in department 30.
-- List employees who have the lowest salary in their department.
-- Retrieve departments where all employees earn more than 5,000.
-- Display employees whose salaries are higher than any manager's salary.
-- Subqueries in SELECT
-- Display each employee's name along with their department's average salary.
-- List employee names along with their grade based on their salary and the Salgrade table.
-- Fetch each employee's name, job title, and their manager's name.
-- Show each employee along with the count of employees in their department.
-- Retrieve the name of each employee and the maximum salary in their department.
-- Subqueries with Joins
-- List all departments that have employees earning more than 20,000.
-- Retrieve employees who have the same job title as anyone in department 10.
-- Display employee details where the department location is "Dallas".
-- Find employees working in the department with the highest average salary.
-- List employees whose salary matches the highest salary in the company.
-- Complex Subqueries
-- Find employees who earn the second-highest salary in the company.
-- Retrieve departments where at least one employee earns below the department's average salary.
-- List employees whose salaries exceed the average salary of all employees in the company.
-- Fetch departments that have exactly 5 employees.
-- Identify employees who joined the company before the earliest hire date in department 20.
-- Aggregate Functions with Subqueries
-- Display the total salary of all employees in each department where the average salary exceeds 8,000.
-- List the department name and total number of employees for departments with more than 10 employees.
-- Retrieve the maximum salary for each grade in the Salgrade table.
-- Fetch the average salary of employees grouped by their job title.
-- Find the grade from Salgrade that includes the highest salary in the company.