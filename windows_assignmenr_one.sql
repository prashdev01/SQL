
show tables;
SELECT * from dept;
SELECT * from emp;
SELECT * from salgrade;

-- 1. Assign a unique rank to each employee by salary within each department.
SELECT empno, ename, deptno, sal,
ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) as rnk
from emp;

-- 2. Find the top 3 highest-paid employees in each department.
SELECT empno, ename, deptno,sal from (SELECT empno, ename, deptno, sal , 
											ROW_NUMBER() over(PARTITION BY deptno ORDER BY sal desc) as rmk
                                            from emp) rnkd
                                            where rmk >=3;
										
-- 3. List employees in order of hire date within each department.
select empno, ename,deptno,sal,
ROW_NUMBER()  over(PARTITION BY deptno ORDER BY hiredate ) as order_of_hire
from emp;

-- 4.Rank employees by salary, allowing ties, within each department.                                   
SELECT empno, ename, deptno,sal,
rank() over(PARTITION BY deptno ORDER BY sal desc) rnk 
from emp;

