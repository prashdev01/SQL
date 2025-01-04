-- TYPES OF CTE'S
-- 1. NON-RECURSIVE CTE'S
USE JOINDB;
SHOW TABLES;

SELECT * FROM SALESDATA;

WITH TOTALSALES AS (
SELECT UNIT_SOLD AS TOTAL_UNIT_SOLD
FROM salesdata
WHERE YEAR(SALE_DATE) = 2024
)
SELECT * FROM TOTALSALES
WHERE TOTAL_UNIT_SOLD >100;

-- GET THE EMPLOYEES WORKING IN THE "ACCOUNTING" DEPARTMENT
WITH DEPT_ACC AS (
SELECT EMPNO, ENAME, DEPTNO
FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE DNAME = "ACCOUNTING")
)
SELECT * FROM DEPT_ACC;

-- INLINE CTE'S 

-- GET THE HIGHEST SALARY IN EACH DEPARTMENT
WITH HISH_SAL AS (
SELECT DEPTNO,MAX(SAL) 
FROM EMP 
GROUP BY DEPTNO )
SELECT * from hish_sal;

-- list the employees with their salaray and correspnding grade, inline cte
with emp_grade as (
SELECT e.empno, e.ename, sg.grade as salgrade, e.sal
from emp e
join salgrade sg 
on e.sal between sg.losal and sg.hisal
)
SELECT * from emp_grade;

-- find the employees earning more than 3000
with emp_earning as (
SELECT ename, sal from emp 
)
SELECT * from emp_earning
where sal > 3000;

-- find all employees in the "Research" department and their manager's name
with emp_research as (
SELECT e.empno, e.ename as employee , m.ename as manager 
from emp e
JOIN emp m 
on e.mgr = m.empno
where e.deptno = (select deptno from dept where dname = "Research")
)
SELECT * from emp_research;

-- list employees with salary greater than their department's average salary

with greater_avg_sal as (
SELECT empno, ename, deptno ,sal
from emp 
where sal> (SELECT avg(sal) from emp where deptno = deptno)
)
SELECT * from greater_avg_sal;

-- find the emp(s) and their departments, and salary grade in a single query
with dept_info as (
SELECT e.empno, e.ename, e.deptno, d.dname
from emp e
join dept d on e.deptno = d.deptno
), salary_info as ( 
SELECT e.empno , e.sal,e.deptno, s.grade
from emp e
join salgrade s on e.sal BETWEEN losal and hisal
)
SELECT d.empno, d.ename,s.sal, d.dname, s.grade
from dept_info d
join salary_info s on d.deptno = s.deptno;

-- get employees and manger in the same query with department details (multiple cte)

with emp_info as (
select e.empno, e.ename as employee, m.ename as manager
from emp e
join emp m
on e.mgr = m.empno
), dept_info as(
SELECT e.empno, e.deptno, d.dname from emp e
join dept d
on e.deptno = d.deptno
)
SELECT * from emp_info as e
join dept_info as d
on e.empno = d.empno;

--  find emplolyees with commision greater than 500 and their department name
WITH CE1 AS (
SELECT E.EMPNO , E.ENAME, E.COMM
FROM EMP E
JOIN EMP C ON E.EMPNO = C.EMPNO
WHERE E.COMM > 500 AND E.COMM IS NOT NULL
), CE2 AS (
SELECT E.EMPNO,E.ENAME, D.DNAME
FROM EMP E
JOIN DEPT D 
ON E.DEPTNO = D.DEPTNO
)
SELECT * FROM CE1 C JOIN CE2 E ON C.EMPNO = E.EMPNO;
