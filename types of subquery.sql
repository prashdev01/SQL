use joindb;
SELECT * FROM dept;
SELECT * FROM emp;
SELECT * FROM salgrade;

-- Write a query to find the name of the employee with the highest salary in the company.
SELECT ename as employee , sal as salary
from emp
where sal = (SELECT max(sal) from emp );

-- Write a query to find the name of the employee who has been working in the company for the longest time.
SELECT ename as employee,
hiredate as hiredate
from emp
WHERE hiredate  =(select min(hiredate) from emp);


-- Write a query to find the name of the employee with the highest salary in the emp table
SELECT ename as employee, sal as salary from emp
where sal = ( SELECT max(sal) from emp);


-- Write a query to find the name of the employee with the smallest salary in the emp table
SELECT ename as employee, sal as salary from emp
where sal = (SELECT min(sal) from emp);

-- write a query to find the employee who is receantly hired in the company
SELECT ename as employee, hiredate 
from emp 
where hiredate = (SELECT max(hiredate) from emp);

-- Multi row sub query
-- Write a query to find the names of employees working in departments located in "NEW YORK."
SELECT ename as employee, deptno 
from emp 
where deptno = (SELECT deptno from dept where loc = "New York");

-- Write a query to find the names of employees whose salaries fall within the salary range of grade 3 in the salgrade table.
SELECT ename as employee, sal
from emp 
where sal BETWEEN (select losal from salgrade WHERE grade = 3)
and (SELECT hisal from salgrade where grade = 3);

-- Write a query to find the names of departments that have more than 5 employees.
SELECT dname as departments
from dept 
where deptno in (SELECT deptno
from emp 
GROUP BY deptno
HAVING count(*)>5);

-- Write a query to find the names of employees whose salaries are higher than the average salary of their respective departments.

SELECT e.ename as employee, e.sal as salary
from emp e
WHERE sal > (SELECT avg(sal) from emp where deptno = e.deptno);


-- Write a query to find the names of employees working in departments that do not have a manager.
-- Hint: Check for mgr being NULL in the emp table for the departmenna
SELECT ename as employee 
from emp
where deptno in (select deptno 
					from dept
					where deptno not in (select DISTINCT deptno 
										from emp
                                        where mgr is not null));
                                        
SELECT ename 
FROM emp 
WHERE deptno IN (SELECT deptno 
                 FROM dept 
                 WHERE deptno NOT IN (SELECT DISTINCT deptno 
                                      FROM emp 
                                      WHERE mgr IS NOT NULL));
                                      
                                      
                                      





