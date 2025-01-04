-- SQL Query Writing Test
-- 1. Retrieve all employees working in the 'SALES' department.
use joindb;
SELECT e.empno, e.ename , d.dname from emp e
left join dept d on e.deptno = d.deptno 
WHERE d.dname = "sales";

-- 2. Display the name, job, and department name of all employees who earn a commission.
SELECT e.ename, e.job , e.comm,d.dname from emp e 
left join dept d on e.deptno = d.deptno
where e.comm is not null and e.comm > 0;


-- 3. Find the highest salary in each department and display the department name along with it.
SELECT DNAME, (SELECT MAX(SAL) FROM EMP WHERE DEPTNO = D.DEPTNO) AS MAX_SAL FROM DEPT D;


-- 4. List the employees whose job is 'MANAGER' and who were hired before January 1, 1990.
SELECT EMPNO, ENAME, JOB,HIREDATE FROM emp
WHERE JOB = "MANAGER" AND hiredate < '1980-01-01';

-- 5. Retrieve all employees along with their salary grade from the salgrade table.
SELECT E.EMPNO, E.ENAME , SG.GRADE FROM EMP E 
LEFT JOIN SALGRADE AS SG ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL ;


-- 6. Display the employee names and their respective managers' names.
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER 
FROM EMP E
INNER JOIN EMP M 
ON E.MGR = M.EMPNO;


-- 7. Find the employees whose salary is greater than their department's average salary.
SELECT EMPNO, 
		ENAME, 
		DEPTNO FROM EMP 
WHERE SAL > (SELECT AVG(SAL) FROM EMP WHERE DEPTNO = DEPTNO);
        

-- 8. List all departments that do not have any employees.
SELECT D.DEPTNO, D.DNAME,COUNT(E.EMPNO) AS  NO_OF_EMP FROM DEPT D
RIGHT JOIN EMP E ON D.DEPTNO = E.DEPTNO 
GROUP BY D.DEPTNO, D.DNAME 
HAVING NO_OF_EMP IS NULL;

-- 9. Display the name of the department and the total number of employees working in each department.
SELECT D.DEPTNO, D.DNAME,COUNT(E.EMPNO) AS  NO_OF_EMP FROM DEPT D
RIGHT JOIN EMP E ON E.DEPTNO = D.DEPTNO 
GROUP BY D.DEPTNO, D.DNAME ;

-- 10. Retrieve the names of employees who are working in the same department as 'SMITH'.
SELECT ENAME, DEPTNO 
FROM EMP 
WHERE DEPTNO  = (SELECT DEPTNO FROM EMP WHERE ENAME = "SMITH");
-- 11. Find the details of the employee(s) with the second highest salary in the company.
SELECT EMPNO, ENAME, SAL FROM 
(SELECT EMPNO, ENAME, SAL, RANK() OVER(ORDER BY SAL DESC) AS RNK FROM EMP) SUB  
WHERE RNK = 2;


-- 12. Display the department name and the total salary paid to employees in each department.
SELECT D.DEPTNO, D.DNAME, E.ENAME, SUM(E.SAL) AS TOTAL_SALARY FROM dept D
LEFT JOIN EMP E
ON D.DEPTNO = E.DEPTNO
GROUP BY DEPTNO, DNAME, E.ENAME;

-- 13. Find the employees who have the same job title as their managers.
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER, E.JOB AS JOBS
FROM EMP E JOIN EMP M ON E.MGR = M.EMPNO 
WHERE E.JOB = M.JOB;

-- 14. List the employees who earn a salary within the salary range of their grade in the salgrade table.
SELECT * FROM SALGRADE;
SELECT E.EMPNO, E.ENAME, SG.GRADE FROM emp E
LEFT JOIN  SALGRADE AS SG 
ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL;

-- 15. Retrieve the names of employees who were hired in the year 1995 and sort them by their hire date in ascending order.
SELECT EMPNO, ENAME , HIREDATE FROM EMP
WHERE YEAR(HIREDATE) = 1980 -- WE DONT HAVE THAT MUCH DATA IN TABLE THATS WHY WE ARE USING SOME OTHER VALUES INSTEAD
ORDER BY HIREDATE;

-- SQL Query Writing Test (Set 3)
-- 1. Retrieve the names of employees who work in departments located in 'NEW YORK'
SELECT EMPNO, ENAME FROM EMP 
WHERE DEPTNO = (SELECT DEPTNO FROM DEPT WHERE LOC="NEW YORK");

SELECT E.EMPNO, E.ENAME, D.DNAME, D.LOC FROM EMP E
LEFT JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
WHERE D.LOC = "NEW YORK"; 

-- 2. Find the employee(s) with the lowest salary in each department and display their names, department names, and salaries.
SELECT E.EMPNO, E.ENAME, E.SAL, D.DNAME FROM EMP E
RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO
WHERE E.SAL = (SELECT 
MIN(SAL) FROM EMP WHERE DEPTNO = D.DEPTNO);


-- 3. Display the details of employees who do not have a manager.
SELECT EMPNO, ENAME, MGR FROM EMP 
WHERE MGR IS NULL;


-- 4. List the department names and the number of employees earning more than 3000 in each department.
SELECT E.ENAME , D.DNAME, COUNT(E.EMPNO), SAL FROM EMP E
RIGHT JOIN DEPT D ON D.DEPTNO = E.DEPTNO
WHERE E.SAL>3000
GROUP BY E.ENAME,D.DNAME,SAL;

-- 5. Retrieve the names of employees who were hired in the first quarter (Jan–Mar) of any year.
SELECT EMPNO, ENAME,HIREDATE FROM emp
WHERE MONTH(hiredate) BETWEEN '01' AND '04';

-- 6. Display the name and job of the employee(s) who joined the company most recently.
SELECT EMPNO, ENAME, HIREDATE 
FROM EMP
ORDER BY HIREDATE DESC
LIMIT 5;


-- 7. Find the total salary paid to employees in each job role and sort the results in descending order of total salary.
SELECT  JOB,SUM(SAL) FROM EMP 
GROUP BY JOB
ORDER BY SUM(SAL) DESC;

-- 8. Display the employee details for those who are earning a salary that is higher than the highest salary in the 'ACCOUNTING' department.
SELECT *
FROM EMP 
WHERE SAL > (SELECT MAX(SAL) FROM EMP E 
JOIN DEPT D
ON E.DEPTNO = D.DEPTNO
WHERE D.DNAME = "ACCOUNTING");

-- 9. Retrieve the names of employees who have been working in the company for more than 10 years.
SELECT EMPNO,ENAME , HIREDATE
FROM EMP 
WHERE YEAR(curdate()) - YEAR(HIREDATE) > 10;
-- 10. Find the employees who are earning the same salary as another employee in a different department.
SELECT E1.EMPNO AS EMPLOYEE_NO, E1.ENAME AS EMP_NAME, E1.SAL AS SALARY,E1.DEPTNO AS DEPARTMENT
FROM EMP E1 
JOIN EMP E2 ON E1.SAL = E2.SAL AND E1.DEPTNO != E2.DEPTNO;

-- 11. Display the department names and the average salary of employees in each department where the average salary is greater than 2000.
SELECT  D.DNAME, AVG(E.SAL) FROM EMP E
RIGHT JOIN DEPT D ON E.DEPTNO = D.DEPTNO 
GROUP BY D.DNAME
HAVING AVG(E.SAL)>2000;



-- 12. Retrieve the details of employees who are not earning any commission.
SELECT EMPNO, ENAME,COMM FROM EMP 
WHERE COMM IS NULL;


-- 13. List the employees who have the same hire date as their manager.
SELECT E.ENAME AS EMPLOYEE, M.ENAME AS MANAGER
FROM EMP E 
RIGHT JOIN EMP M ON E.MGR = M.EMPNO 
WHERE E.HIREDATE = M.HIREDATE;

-- 14. Display the names of employees and their respective departments, including those who do not belong to any department.
SELECT  E.ENAME ,D.DNAME FROM EMP E
LEFT JOIN DEPT D
ON E.DEPTNO = D.DEPTNO ;


-- 15. Find the names of employees whose salary grade is either the highest or lowest in the salgrade table.
SELECT E.EMPNO,E.ENAME ,SG.GRADE AS SALAGRADE
FROM EMP e
LEFT JOIN salgrade AS SG ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL
WHERE SG.GRADE =(SELECT MAX(GRADE) FROM salgrade)
OR  SG.GRADE = (SELECT MIN(GRADE) FROM SALGRADE);

-- 2. Find the employees who earn the minimum salary in their respective departments.
SELECT E.ENAME, D.DNAME , E.SAL
FROM EMP E
JOIN dept d on e.deptno = d.deptno
where sal = (select min(sal) from emp where deptno = e.deptno);

-- 3. Display the employee name, department name, and job title of the employees who earn more than the highest salary in grade 2 from the salgrade table.
SELECT E.ENAME, D.DNAME, E.JOB,SG.GRADE  FROM EMP E
join dept d on e.deptno = d.deptno 
join salgrade as sg on e.sal BETWEEN sg.losal and sg.hisal 
where sal >( SELECT max(hisal) from salgrade where grade = 2);

-- 4. Retrieve the details of employees who joined the company in the same year as their managers.
SELECT E.ENAME AS EMPLOYEE , M.ENAME AS MANAGER
FROM EMP E JOIN EMP M ON E.MGR = M.EMPNO 
WHERE E.HIREDATE = M.HIREDATE;

-- 5. Find the employees whose salaries fall into the highest salary grade.
SELECT E.EMPNO, E.ENAME, E.SAL, SG.GRADE FROM EMP E
JOIN SALGRADE AS SG ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL
WHERE SG.GRADE = (SELECT MAX(SG.GRADE) FROM SALGRADE );

-- 6. List the names of employees who do not have a manager assigned.
SELECT	empno, ename , mgr,deptno from emp
where mgr is null;

-- 7. Display the department name and the average salary of employees in each department, sorted by the average salary in descending order.
SELECT  d.dname ,avg(e.sal) as avg_sal from emp e
right join dept d on e.deptno = d.deptno 
GROUP BY  d.dname 
ORDER BY avg_sal desc;

-- 8. Find the department(s) with the highest total salary paid to its employees.
SELECT d.dname, sum(sal) as max_sal from emp e
right join dept d on e.deptno = d.deptno
GROUP BY d.dname
ORDER BY max_sal desc;


-- 9. List all employees who joined the company before the oldest employee in the 'ACCOUNTING' department.
SELECT empno, ename , hiredate 
from emp 
where hiredate < (select  min(e.hiredate)  from emp e 
join dept d on e.deptno = d.deptno
where d.dname = "Accounting" );


-- 10. Display the employee details (name, salary, job) along with their department name, even if the department name is not available.
SELECT e.ename, e.sal , e.job , d.dname from emp e 
left join dept d on d.deptno = e.deptno ;

-- 11. Retrieve the employee names who have been working in the company for more than 10 years as of today.
SELECT empno, ename , hiredate from emp 
where year(curdate()) - year(hiredate) > 10 ;


-- 12. Find the employees who earn a commission greater than 50% of their salary.
SELECT empno, ename, sal, comm
from emp
where  comm > 0.5 * sal;

-- 13. Display the employee name, department name, and grade for all employees, ensuring that employees with no grade are also shown.
SELECT e.ename, d.dname, sg.grade from emp e
join dept d on e.deptno = d.deptno 
left join salgrade sg on e.sal BETWEEN sg.losal and sg.hisal;


-- 14. Find the department name(s) with the least number of employees.
SELECT d.dname , count(e.empno) from emp e
RIGHT join dept d on d.deptno = e.deptno 
GROUP BY d.dname
ORDER BY count(e.empno);

-- 15. Retrieve the details of employees whose salaries rank in the top 3 salaries of their respective departments.
SELECT ename , sal, deptno 
from (SELECT ename, sal, deptno , rank() over(PARTITION BY deptno ORDER BY sal desc)as rnk from emp) as sub
where rnk=3;

-- 1. Rank Employees by Salary (Descending Order) in Each Department
-- Write a query to rank employees by their salary within their department, displaying their department name, employee name, salary, and rank.

SELECT empno, ename, sal, deptno,
RANK() OVER(PARTITION BY deptno ORDER BY sal DESC) as rank_sal
from emp;

-- 2. Find Employees with No Subordinates
-- List the names of employees who do not manage anyone. Use the MGR column to identify managers.
SELECT 

-- 3. Find the Top N Salaries in the Company
-- Retrieve the top 3 salaries across all employees. Ensure there are no ties, and the result is strictly limited to three rows.

-- 4. Cumulative Salary by Department
-- Display the cumulative salary of employees in each department. Include columns for department name, employee name, salary, and cumulative salary.

-- 5. Find Departments with Salary Above Average
-- Retrieve the departments where the total salary paid to employees is above the average total salary paid across all departments.

-- 6. Find Employees Who Joined in the Same Month
-- List the employee names who joined in the same month as at least one other employee.

-- 7. Identify Missing Employee Records
-- Find all departments that have no employees assigned to them. Include department name and department number.

-- 8. Detect Salary Anomalies
-- List employees whose salaries are higher than the highest salary of any manager in the company.

-- 9. Employees with the Longest Tenure
-- Find the employee(s) who have been working in the company the longest. Include their name, hire date, and tenure in years.

-- 10. Find Employees with Non-Numeric Commission
-- Check for rows where the COMM column contains non-numeric or invalid values.

-- 11. List Employees Earning Below the Average Salary of Their Job Title
-- For each job title, list employees earning below the average salary for their job title. Include job title, employee name, and their salary.

-- 12. Find the Second Highest Salary in Each Department
-- Write a query to retrieve the employee name, department name, and the second highest salary in each department.

-- 13. Compare Salary Growth by Department
-- Assuming the SAL column represents monthly salary, calculate the annual salary for employees and compare the total annual salary for each department.

-- 14. Find Employees Working Under a Specific Manager
-- List the names of all employees working under a manager named 'KING'. Include the manager's name alongside the employees' names.

-- 15. Department Salary Percentage Contribution
-- Calculate the percentage contribution of each department's total salary to the company's overall salary. Display department name, total salary, and percentage contribution.