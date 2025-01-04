use joindb;

SELECT * FROM emp;

SELECT * FROM dept;

SELECT * FROM salgrade;

-- Assign a unique rnk to each employee by salary within each department.
SELECT empno, ename, deptno, sal,
ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal) as rnk
from emp;

-- 2.	Find the top 3 highest-paid employees in each department.
SELECT empno, ename, sal, deptno 
from (SELECT empno, ename, sal, deptno, 
row_number() OVER (PARTITION BY deptno ORDER BY sal) as rnk from emp ) rnkd where rnk = 3;


-- 3.	List employees in order of hire date within each department.
SELECT empno, ename, deptno , sal ,
ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY hiredate) as order_of_hire
from emp;

-- Queries using RANK()
-- 4.	Rank employees by salary, allowing ties, within each department.
SELECT empno, ename, deptno, sal, job,
RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) as rank_
from emp;


-- 5.	Find employees with the second highest salary in each department.
SELECT empno, ename, deptno, sal, Job FROM
(SELECT empno, ename, deptno, sal, job,
rank() OVER(PARTITION BY deptno ORDER BY sal DESC) as rnk from emp) rnked
WHERE rnk = 2;


-- 6.	Dense rnk employees by salary within the entire company.

SELECT empno, ename, deptno, job, sal,
DENSE_RANK() OVER(ORDER BY sal DESC) as ranking_salary_in_com
from emp;

-- 7.	Find the salary rnk for each employee within their department (allow ties).
SELECT empno, ename, deptno, sal, job,
DENSE_RANK() OVER(PARTITION BY deptno ORDER BY sal) as dens_rank_sal
from emp;

-- Queries using AVG()
-- 8.	Calculate the average salary of employees in each department.

SELECT empno, ename, deptno,sal , job ,
ROUND(
AVG(sal) OVER(PARTITION BY deptno) )as avg_sal
from emp;

-- 9.	Compare each employee's salary to the average salary in their department.
SELECT empno, ename, deptno, job,
sal-AVG(sal) OVER(PARTITION BY deptno ORDER BY sal) as diff_sal
from emp;

-- 10.	Find employees earning above the department average salary.
SELECT empno, ename, deptno, sal from
(SELECT empno, ename, sal, deptno,avg(sal) OVER(PARTITION BY deptno ) as avg_sal from emp) sub 
WHERE sal > avg_sal;



-- Queries using SUM()
-- 11.	Calculate the total salary in each department.
SELECT empno,ename, deptno, sal, 
sum(sal) OVER(PARTITION BY deptno ) as total_salary
from emp


-- 12.	Find the cumulative salary in each department.
SELECT empno, ename, deptno, sal,
SUM(sal) OVER(PARTITION BY deptno ORDER BY sal desc) as commany_total_salary
from emp


-- 13.	Calculate the company's total salary for comparison.
SELECT empno, ename, deptno, sal,
sum(sal) OVER() as comapy_total_salary
from emp;


-- Queries using COUNT()
-- 14.	Count the number of employees in each department.

SELECT empno, ename, job, sal, deptno,
COUNT(*) OVER(PARTITION BY deptno) as count_deptno
from emp;

-- Find the running total of employees in each department by hire date.
SELECT empno, ename, sal, job, deptno,hiredate,
COUNT(*) OVER(PARTITION BY deptno ORDER BY hiredate) as running_total
from emp;

-- Queries using MAX() and MIN()
-- 15.	Find the highest salary in each department
SELECT empno, ename, deptno, sal,
MAX(sal) OVER(PARTITION BY deptno  )as highest_salary
from emp;


-- 16.	List employees who earn the highest salary in their department.
SELECT empno, ename, deptno, sal from 
(SELECT empno, ename, deptno , sal,
max(sal) OVER(PARTITION BY deptno) as highest_salary
from emp) sub
WHERE sal= highest_salary;


-- 17.	Find the hire date of the earliest employee in each department.
SELECT EMPNO,ename, sal, deptno,
min(hiredate) OVER(PARTITION BY deptno) as earlist_employee
from emp;

-- Queries combining multiple functions
-- 18.	Rank employees by salary and find the cumulative salary in each department.

SELECT empno, ename, sal, deptno,
rank() OVER( PARTITION BY deptno ORDER BY sal DESC) as salary_rank,
sum(sal) OVER(PARTITION BY deptno ) as total_salary
from emp;


-- Queries exploring complex conditions
-- 20.	List employees hired after the department's first hire date.
SELECT empno, ename, deptno, hiredate
FROM (
    SELECT empno, ename, deptno, hiredate, 
           MIN(hiredate) OVER (PARTITION BY deptno) AS first_hire_date
    FROM emp
) sub
WHERE hiredate > first_hire_date;


-- 21.	Rank employees within salary grades.
SELECT e.empno, e.ename, e.sal , s.grade,
RANK() OVER (PARTITION BY s.grade ORDER BY e.sal DESC) as rnk_within_grade
from emp e
join salgrade s
on e.sal BETWEEN s.losal and s.hisal;



-- Advanced Queries Using ROW_NUMBER()
-- 22.	Find the second newest hire in each department.
SELECT empno, ename, deptno, hiredate from
(SELECT empno, ename, deptno, hiredate, ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY hiredate DESC) as letest_hire from emp) sub
WHERE letest_hire =2;


-- 23.	Rank employees based on hire date across the entire company.
SELECT empno, ename, job, deptno, sal,hiredate,
RANK() OVER(ORDER BY hiredate ASC) as hire_rank
from emp;


-- 24.	List employees in each department with an alternate row color rnk (for reporting purposes).

SELECT empno,ename, deptno, sal,
CASE 
    WHEN RANK() OVER(PARTITION BY deptno ORDER BY sal desc) % 2 = 0 THEN  "EVEN"
    ELSE  "ODD"
END as row_color
from emp;


-- Advanced Queries Using RANK()
-- 26.	Rank employees by commission within their department.

SELECT empno, ename, deptno, sal,comm,
RANK() OVER(PARTITION BY deptno ORDER BY comm DESC) as rank_employee
from emp
WHERE comm is NOT NULL;

-- 27.	Find employees with the second highest commission in each department.
SELECT empno,ename,deptno, sal,comm
FROM
(SELECT empno,ename,deptno,sal,comm, 
RANK() OVER(PARTITION BY deptno ORDER BY comm DESC)as comm_rank
from emp
WHERE comm is NOT NULL) as sub
WHERE comm > 2;


-- Advanced Queries Using DENSE_RANK()
-- 28.	Dense rnk employees by job title and salary within each department.
SELECT empno,ename,sal,job,deptno,
DENSE_RANK() OVER(PARTITION BY deptno,job ORDER BY sal DESC) as employee_dense_rank
from emp;


-- 29.	Find the top 2 highest-paid employees for each job role across the company.

SELECT empno, ename, deptno,job, sal FROM
(SELECT empno, ename, deptno,job, sal ,
DENSE_RANK() OVER(PARTITION BY job ORDER BY sal desc) as job_Rank from emp) sub
WHERE job_rank <=2;

-- Advanced Queries Using AVG()
-- 30.	Calculate the average salary by job role across all departments.

SELECT 
empno, ename, job, deptno,
AVG(sal) OVER(PARTITION BY job ) as avg_sal_per_job
from emp;


-- 31.	Identify employees whose salary is below the company average.
SELECT empno, ename, sal from 
(SELECT empno, ename,sal, AVG(sal) OVER(ORDER BY sal DESC)as comp_avg from emp) sub
WHERE sal<comp_avg;


-- 32.	Compare each employee's commission with the average commission in their department.
SELECT empno,ename,comm, deptno,
avg(sal) OVER(PARTITION BY deptno) as avg_commision
from emp
WHERE comm is NOT NULL;


-- Advanced Queries Using SUM()
-- 33.	Calculate the cumulative commission for each department.
SELECT empno, ename, deptno, comm,
SUM(comm) OVER(PARTITION BY deptno ORDER BY comm) as cumm_commision
FROM emp
WHERE comm is NOT NULL;


-- 34.	Find employees contributing more than 20% to their department's total salary.
SELECT empno, ename, deptno,sal,

