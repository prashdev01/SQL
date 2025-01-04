use joindb;
SELECT * from emp;

SELECT * from salesdata;
-- Find the total sales for each product category in a table.
SELECT sum(unit_sold) as total_unit_sold
from salesdata
GROUP BY CATEGORY;

-- Count the number of employees in each department where the department has more than 5 employees.
SELECT COUNT(empno) as NO_of_emp, deptno from emp 
GROUP BY deptno
HAVING COUNT(empno)>5;

-- Find employees whose salaries are above the average salary in the company.

SELECT empno, ename, sal
from emp
where sal> (select avg(sal) from emp );

-- Retrieve the names of products that have never been sold.
SELECT * from salesdata;