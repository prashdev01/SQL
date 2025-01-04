-- ssignment Queries

-- Queries Using NTILE()
-- 1. Divide employees into 4 quartiles based on their salary.
USE JOINDB;
SELECT EMPNO, ENAME , DEPTNO, SAL,
NTILE(4) OVER(ORDER BY SAL ) AS QUARTILE_SALARY
FROM EMP;

-- 2. Group employees into deciles based on their total earnings (salary + commission).
SELECT EMPNO, ENAME, DEPTNO, SAL ,COMM,
NTILE(10) OVER(ORDER BY SAL + ifnull(COMM, 0) ) AS DECILE_OF_EARNING
FROM EMP;

-- 3. Split employees into groups of approximately equal size by hire date.
SELECT EMPNO, ENAME, DEPTNO, SAL, HIREDATE,
NTILE(5) OVER(ORDER BY HIREDATE ) AS EMPLOYEE_GROUP
FROM EMP
ORDER BY EMPLOYEE_GROUP,HIREDATE;

SELECT 
GROUP_NUM,
COUNT(*) AS GROUP_SIZE,
MIN(HIREDATE) AS GROUP_START_DATE,
MAX(HIREDATE) AS GROUP_END_DATE
FROM 
(SELECT  NTILE(4) OVER(ORDER BY hiredate)AS GROUP_NUM,HIREDATE
FROM EMP) AS SUB_QUERY
GROUP BY GROUP_NUM
ORDER BY GROUP_NUM;


-- Queries Using LEAD() and LAG()
-- 4. Find the salary difference between each employee and the next highest-paid employee
SELECT EMPNO, ENAME, SAL, DEPTNO, 
LEAD(SAL) OVER (ORDER BY SAL DESC) AS NEXT_HIGHEST_SAL,
SAL-LEAD(SAL) OVER(ORDER BY SAL DESC) AS SALARY_DIFFERENCE
FROM EMP
ORDER BY SAL DESC;

-- 5. Find the difference in hire dates between consecutive employees within a department.
SELECT EMPNO,ENAME, DEPTNO,HIREDATE,
LAG(HIREDATE) OVER(PARTITION BY DEPTNO ORDER BY HIREDATE ) AS LAST_HIREDATE,
datediff(HIREDATE, LAG(HIREDATE) OVER(PARTITION BY DEPTNO ORDER BY HIREDATE)) AS HIREDATE_DIFFRENCE
FROM emp
ORDER BY HIREDATE ;


-- Queries Using FIRST_VALUE(), LAST_VALUE() and CUME_DIST()
-- 6. Identify the first hired employee in each department.
SELECT EMPNO,ENAME, HIREDATE,DEPTNO,
FIRST_VALUE(HIREDATE) OVER(PARTITION BY DEPTNO ORDER BY HIREDATE ) AS HIGHEST_HIREDATE
FROM EMP;

-- 7. Find the latest hired employee in the company for each job role.
SELECT EMPNO, ENAME, DEPTNO , JOB,HIREDATE,
FIRST_VALUE(HIREDATE) OVER(PARTITION BY JOB ORDER BY HIREDATE DESC) AS LETEST_HIRE
FROM EMP;


-- 8. Compare each employee’s salary to the highest salary in their department.
SELECT EMPNO, ENAME, DEPTNO, SAL,
FIRST_VALUE(SAL) OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) AS HIGHEST_SALARY,
FIRST_VALUE(SAL) OVER(PARTITION BY DEPTNO ORDER BY SAL DESC) - SAL AS DIFFERENCE_IN_SALARY
FROM EMP;

-- 9. Calculate the cumulative distribution of salaries across the company.
SELECT EMPNO, ENAME, SAL,DEPTNO,
CUME_DIST() OVER(PARTITION BY DEPTNO ORDER BY SAL) AS DISTRIBUTION_SALARY
FROM EMP;

-- Queries with Combining Window Functions
-- 10. Rank employees by salary, show the cumulative total, and find the percentage rank.
SELECT EMPNO, ENAME, SAL,
RANK() OVER(ORDER BY SAL DESC) AS RANK_SALARY,
SUM(SAL) OVER() AS CUMM_TOTAL,
ROUND(PERCENT_RANK() OVER(ORDER BY SAL DESC) ,2) AS PERCENT_RANK_
FROM EMP;

-- 11. List employees with both their job rank and their total earnings rank.
SELECT EMPNO,ENAME,DEPTNO,JOB,SAL,
SUM(SAL) OVER(ORDER BY JOB ) AS TOTAL_EARNING,
RANK() OVER(PARTITION BY JOB ORDER BY SAL DESC) AS JOB_RANK
FROM EMP;

-- 12. Compare each employee’s earnings with the highest and lowest in the company.

SELECT EMPNO, ENAME DEPTNO,SAL,
MAX(SAL) OVER() AS MAX_SALARY,
MIN(SAL) OVER() AS MIN_SALARY,
SAL - MIN(SAL) OVER() AS EARNING_ABOVE_LOWEST,
MAX(SAL) OVER() -SAL AS EARNING_BELOW_HIGHEST
FROM EMP;

