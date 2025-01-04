-- Active: 1735103228111@@127.0.0.1@3306@joindb
SHOW TABLES;

-- rank employee based on their job and hiredate within thier department
SELECT empno, ename, sal,  deptno, job,hiredate,
ROW_NUMBER() OVER (PARTITION BY deptno ORDER BY hiredate ASC) as job_rank
from emp;

-- find employees with the 3rd highest salary in each department
SELECT empno, ename, sal, deptno, job , hiredate
from (SELECT empno,ename, sal, deptno, job, hiredate,
 RANK() OVER (PARTITION BY deptno ORDER BY sal desc) as salary_rank from emp) as sub 
WHERE salary_rank<=3;


-- rank employees based on thier total earning (salary + commision ) within the company 

SELECT empno, empno,ename, sal,comm,
rank() OVER(ORDER BY sal + IFNULL (comm,0) desc) as salary_rank
from emp;

-- identify the top 3 earning employee (without gaps)

SELECT *  from 
(SELECT empno, ename, sal, comm,
dense_rank() OVER(ORDER BY sal + IFNULL(comm,0) DESC )as salary_rank from emp)
sub 
WHERE salary_rank <= 3;

-- Basic Questions
-- Rank Employees by Salary
-- Write a query to rank employees in the emp table based on their salaries (highest to lowest) using the RANK() function.,

SELECT empno, ename, sal,
DENSE_RANK() OVER(ORDER BY sal DESC) as salary_rank
from emp;


-- Calculate Running Total of Salaries
-- Display a running total of salaries in the emp table using the SUM() window function.
SELECT empno, ename, sal,deptno,
SUM(sal) OVER (PARTITION BY deptno ORDER BY sal DESC) as total_salary
from emp;

-- Calculate Average Salary per Department
-- Use a window function to calculate the average salary for employees in each department.

SELECT empno, ename, sal, deptno,
AVG(sal) OVER(PARTITION BY deptno ORDER BY sal desc) avg_sal_as_dept
from emp;


-- Assign Row Numbers to Employees
-- Assign a row number to each employee, ordered by their hiring date (hire_date).
SELECT empno,ename, deptno, sal, hiredate,
ROW_NUMBER() OVER(ORDER BY hiredate DESC) as order_by_hiredate
from emp;


-- Cumulative Salary Percentage
-- Write a query to calculate the cumulative percentage of total salary using the SUM() function and a window clause.

SELECT empno, ename, deptno, sal,
sum(sal) OVER (ORDER BY sal) as cummulative_salary,
sum(sal) OVER() as total_salary,
ROUND(
    sum(sal) OVER (ORDER BY sal) * 100 / sum(sal) OVER() ,2
) as cummulative_percentage
from emp
ORDER BY sal;
