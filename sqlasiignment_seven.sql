use joindb;
-- 1.	Get all employees and their department names.
SELECT e.empno as emp_no , e.ename as employee, d.dname as departments
from emp e
left join dept d
on e.deptno = d.deptno ;

-- 2.	List all employees and their department names for departments located in New York.
SELECT e.empno as emp_no , e.ename as employee, d.dname as department ,d.loc as location
from emp e
left join dept d
on e.deptno = d.deptno 
WHERE d.loc = "New York";

-- 3.	Get employee names, job titles, and their managers' names.
SELECT e.ename as employee, e.job as jobs, m.ename as manager
from emp e
join emp m
on e.mgr = m.empno ;

-- 4.	Find employees working in the Sales department.

SELECT e.ename as employee , d.dname as department
from emp e
LEFT JOIN dept d
on e.deptno = d.deptno
where d.dname = "Sales";

-- 5.	List employees and their salaries who earn above 2000.
SELECT e.ename as employee , e.sal as sal 
from emp e
where e.sal >2000;

-- 6.	Get the department names along with employee names.
SELECT d.dname as department,
e.ename as employee
from dept d
LEFT JOIN emp e
on d.deptno = e.deptno ;

-- 7.	Find employees who are managers.
SELECT ename as employeee , job
from emp 
where job ="manager";

-- 8.	List employees and their salaries where their salary is between 1000 and 3000.
SELECT ename as employee, sal as salary 
from emp 
where sal BETWEEN 1000 and 3000;

-- 9.	Find employees who do not have a manager.
SELECT ename as employee, mgr as manager
from emp 
where mgr is null;

-- 10.	Get the number of employees in each department.
SELECT d.dname as department, count(empno) as NO_OF_emp
from dept d
left join emp e
on d.deptno = e.deptno
GROUP BY d.dname
ORDER BY count(e.empno) desc;

-- 11.	Get employee names along with their salary and department name.
SELECT e.ename as employee , e.sal as salary, d.dname as departmen
from emp e
left join dept d
on d.deptno = e.deptno;

-- 12.	Find all employees with their department name and location.-
SELECT e.ename as employee, d.dname as department , d.loc as location
from emp e
left JOIN dept d
on d.deptno = e.deptno;

-- 13.	Get employee names, their jobs, and the salary grade based on their salary.
SELECT e.ename as employee , e.job as jobs , sg.grade as salgrade , e.sal as salary
from emp e 
left join salgrade sg
on e.sal BETWEEN sg.losal and sg.hisal;

-- 14.	Get all employees and the grade of their salary.
SELECT e.ename as employee,e.sal as salary, sg.grade as grade
from emp e
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal ;

-- 15.	Find employees with their salary and the department they belong to.
SELECT e.ename as employee, e.sal as salary, d.dname as department
from emp e
left join dept d
on e.deptno = d.deptno;

-- 16.	List employees, their job, and their manager's job.
SELECT e.ename as employee , e.job as jobs , m.ename as manager , m.job as mgr_job
from emp e
join emp m
on e.mgr = m.empno;

-- 17.	Find employees who earn above the average salary in their department.
SELECT e.ename as employee, e.sal as salary , d.dname as department
from emp e 
join dept d
on e.deptno = e.deptno
where	 e.sal in (SELECT avg(e.sal) from emp where deptno=deptno);

-- 18.	Get the employee names along with the salary range they fall under.
SELECT e.ename as employee , e.sal as salary , sg.grade as grade, e.sal as salary
from emp e
left join salgrade sg
on e.sal BETWEEN sg.losal and sg.hisal;

-- 19.	List employees with their manager's name and job title.
SELECT e.ename , m.ename as manager , e.job as jobs
from emp e
left join emp m
 on e.mgr = m.empno;
 
 -- 20.	Find employees who belong to the Research department and earn more than 2000.
SELECT e.ename, d.dname as department, e.sal as salary
from emp e
LEFT JOIN dept d
on e.deptno = e.deptno
where d.dname = "Research" and e.sal >2000;

-- 21.	List all employees and their departments, including employees without a department.
SELECT e.ename as employee , d.dname as department 
from emp e
LEFT JOIN dept d 
on e.deptno = d.deptno;

-- 22.	Get all departments with the names of employees who work in them.
 SELECT  d.dname as department, e.ename as employee 
 from dept d
 left JOIN emp e
 on d.deptno = e.deptno;
 
-- 23.Find all employees who do not belong to a department.
SELECT e.ename  as employee, d.dname as department from emp e
LEFT JOIN dept d
on d.deptno = e.deptno
where d.dname is NULL;

-- 24.	List employees who have no manager.
SELECT e.ename as employee , m.ename  as manager
from emp e
left JOIN emp m
on e.mgr = m.empno
WHERE m.empno is NULL;

-- 25.	Get employees who have a manager and their manager's name.
SELECT e.ename as employee , e.job as jobs, m.ename as manager
from emp e
LEFT JOIN emp m
on e.mgr = m.empno
WHERE m.ename is not null;

-- Using RIGHT JOIN
-- 26.	List all departments and employees who work in them, including departments with no employees.
SELECT d.dname as department, e.ename as employeee 
from emp e
RIGHT join dept d
on e.deptno = d.deptno
where d.dname is not NULL;

-- 27.	Get all employees and their departments, including employees who do not belong to any department.
SELECT e.ename as employee, d.dname as department 
from emp e 
RIGHT JOIN dept d 
on e.deptno = d.deptno;

-- 28.	Find all employees and all departments, even those without a match.
SELECT e.ename as employee, d.dname as department
from emp e
LEFT join dept d
on e.deptno = d.deptno
UNION
SELECT e.ename as employee, d.dname as department
from emp e
RIGHT join dept d
on e.deptno = d.deptno;


-- Advanced Join Queries
-- 29.	Get all employees who are managers of other employees.
SELECT DISTINCT e.ename from emp e
where e.empno in (SELECT mgr from emp where mgr is NOT NULL);

-- 30.	Get the department with the highest average salary.
SELECT d.dname as departments , max(e.sal) as highest_salary 
from dept d
left join emp e 
on e.deptno = d.deptno
GROUP BY d.dname;

-- 31.	List the department with the highest number of employees.
SELECT d.dname as departments, count(e.empno) as no_of_emp
from dept as d
left JOIN emp e
on e.deptno = d.deptno
GROUP BY d.dname
ORDER BY no_of_emp desc
LIMIT 1;

-- 32.	Find employees who are analysts and work in the Research department.
SELECT e.ename as employee , e.job as jobs, 
d.dname as department
from emp e
left JOIN dept d
on e.deptno = d.deptno
where e.job = "Analyst" and d.dname = "Research";

-- 33.	List employees with their managers and the number of employees managed by each manager.
SELECT e.ename as employee, m.ename as manager , count(e2.empno) as no_of_enp_managed
from emp e
left join emp m
on e.mgr = m.empno
left join emp e2 
on e2.empno = m.mgr
GROUP BY e.ename, m.ename;


-- 34.	Get the list of employees along with their salary grade.
SELECT e.ename as employee,e.sal as salary, sg.grade as grade
from emp e
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal;

-- 35.	Find employees whose salary is higher than the maximum salary in their department.
SELECT e.ename as employee, e.sal as salary , 
d.dname as department
from emp e
left join dept d
on e.deptno = d.deptno
where sal > (SELECT MAX(sal) from emp where deptno = e.deptno);

-- More Join Variants
-- 36.	Get employees who have a commission.
SELECT e.ename as employee, e.comm
from emp e
where e.comm is not null;

-- 37.	List employees with their department names and location.
SELECT e.ename as employee, 
d.dname as department,
d.loc as location
from emp e
LEFT JOIN dept d
on e.deptno = d.deptno;

-- 38.	Find the department with the highest total salary.
SELECT d.dname as department , sum(e.sal) as total_salary
from dept d
join emp e on e.deptno = d.deptno
GROUP BY d.dname
ORDER BY total_salary desc
LIMIT 1 ;

-- Working with Aggregates and Grouping
-- 39.	List each department and the average salary of employees in each department.
SELECT d.dname as department ,
e.ename as employee, 
avg(e.sal) as avg_salary
from dept d
LEFT JOIN emp e
on e.deptno = d.deptno 
GROUP BY d.dname , e.ename;

-- 40.	Find the department with the highest average salary.
SELECT d.dname as dept, round(AVG(e.sal)) as avarage_salary
from dept as d
left join emp e
on d.deptno = e.deptno
GROUP BY d.dname 
ORDER BY avarage_salary desc
LIMIT 1;


-- 41.	Get the number of employees in each department.
SELECT d.dname as department , count(e.empno) as no_of_emp 
from dept d
left join emp e
on e.deptno = d.deptno
GROUP BY d.dname;

-- 42.	Find departments that have more than 3 employees.
SELECT d.dname as departments, count(e.empno)
as no_of_emp
from dept d
LEFT JOIN emp e
on d.deptno = e.deptno
GROUP BY d.dname
HAVING count(e.empno) > 3;

-- 43.	Get the total salary of employees in each department.
SELECT d.dname as department , sum(e.sal)
as total_salary 
from emp e
left join dept d
on d.deptno = e.deptno
GROUP BY  d.dname ;

SELECT e.ename as employee, avg(e.sal)
from emp e
where e.mgr is not null
GROUP BY e.ename;

-- 45.	Get employees with their salary grade, grouped by salary grade.
SELECT e.ename as empployee , sg.grade as grade
from emp e
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal 
GROUP BY e.ename ,sg.grade;

-- 46.	List departments along with the highest salary in each department.
SELECT d.dname as departmet, max(e.sal) as highest_salary
from dept d
left join emp e
on e.deptno = d.deptno
GROUP BY d.dname;

-- 47.	Find employees who earn more than the average salary of their department.
SELECT e.ename as employee , d.dname as deparment, avg(e.sal) as average_sal
from emp e
left join dept d
on d.deptno = e.deptno 
GROUP BY e.ename , d.dname;

-- 48.	Find departments that have no employees.
SELECT d.dname as departmets , e.empno as employee_no
from emp e
RIGHT join dept d 
on d.deptno = e.deptno 
where e.empno is NULL ;

-- 49.	Get the employees with the highest salary in each department.
SELECT e.ename as employee , d.dname as department, max(e.sal) as highest_salary
from emp e
left join dept d
on d.deptno = e.deptno 
GROUP BY e.ename , d.dname 
ORDER BY highest_salary desc;

SELECT e.ename , e.sal , d.dname 
from emp e
left join dept d
on d.deptno = e.deptno 
where e.sal = (select max(sal) from emp where deptno = e.deptno);


-- 50.	Find the total commission for each department.

SELECT d.dname as department , sum(e.comm) as total_commison 
from dept d
left join emp e
on d.deptno = e.deptno 
GROUP BY d.dname;

-- Using Nested Joins and Subqueries
-- 51.	List employees who earn more than the average salary of their department.

SELECT e.ename as employee, e.sal as salary , d.dname as department
from emp e
left join dept d
on d.deptno = e.deptno 
where e.sal > (SELECT avg(sal) from emp WHERE deptno = e.deptno);


-- 52.	Find the employees whose salary is the same as the highest salary in their department.
SELECT e.ename as employee, e.sal as salary, d.dname as department
from emp e
left join dept d
on d.deptno = e.deptno 
where e.sal = (select max(sal) from emp where deptno=e.deptno);

-- 53.	Get all employees who earn more than any employee in department 20.
SELECT e.ename as employee, e.sal as salary from emp e
where e.sal > (SELECT max(sal) from emp where deptno=20);

-- 54.	Find employees who are paid less than their manager.
SELECT e.ename as employee, e.sal as salary , m.ename as manager
from emp e
left join emp m
on e.mgr = m.empno 
where e.sal < m.sal;

-- 55.	Get departments that have employees earning more than 5000.
SELECT d.dname as departments , e.ename as employee, e.sal as salary
from dept d
left join emp e
on e.deptno = d.deptno
where e.sal > 5000
GROUP BY d.dname,e.ename,e.sal;

-- 56.	List employees who have the same job as their manager.
SELECT e.ename as employee ,e.job as job_emp , m.ename as manager 
from emp e
left join emp m
on e.mgr = m.empno
where e.job = m.job;


-- 57.	Find employees who are not assigned to any department.
SELECT e.ename as empoyee, d.dname as department
from emp e
left join dept d
on e.deptno = d.deptno
where d.dname is null;

-- 58.	List employees who do not have a commission.
SELECT e.ename as employee , e.comm as commision
from emp e
where e.comm is null;

-- 59.	Get employees who were hired after 1995.
SELECT e.ename as employee, e.hiredate as hiredate
from emp e
where e.hiredate > '1995-01-01';

-- 60.	Find the names of employees working in the 'Sales' department but not as 'SALESMAN'.
SELECT e.ename as employee , e.job as jobs , d.dname as departments
from emp e
left join dept d
on d.deptno = e.deptno 
where d.dname = 'Sales' and e.job <> "salesman";

-- Using Full Outer Join (if supported)
-- 61.	Get a list of all employees and departments, including employees without departments and departments without employees.
SELECT e.ename as employee , d.dname as department
from emp e
left join dept d
on e.deptno = d.deptno
WHERE e
UNION 
SELECT e.ename as employee, d.dname as department
from emp e
left join dept d
on d.deptno = e.deptno;

-- 62.	Find all employees and departments where an employee is assigned to a department, or the department has no employees.




-- Working with Self-Join
-- 63.	Get the list of employees who are managers (have subordinates).
SELECT e.ename as employee , m.ename as manager
from emp e
join emp m
on e.mgr = m.empno
where e.mgr is not null;

-- 64.	List employees and their direct reports (subordinates).
SELECT e.ename as manager, m.ename as employee
from emp e join emp m
on e.empno = e.mgr;

-- 65.	Find employees who are not managers.
SELECT e.ename as employee 
from emp e
where e.empno not in (SELECT mgr from emp where mgr is not null);

-- 66.	Find employees who manage employees but do not have a manager themselves.
SELECT e.ename as manager
from emp e
WHERE e.empno in(SELECT DISTINCT mgr from emp) and e.mgr is null;


-- More Advanced Join Queries
-- 67.	List all employees with their job, department name, and salary.
SELECT e.ename as employee, e.job as jobs ,d.dname as departments, e.sal as salary 
from emp e
join dept d
on d.deptno = e.deptno;

-- 68.	Find employees whose salary is within the range of any salary grade.
SELECT e.ename as employee , e.sal as salary, sg.grade as salgrade
from emp e
JOIN salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal ;

-- 69.	Get the name of the department with the most number of employees.
SELECT d.dname as department, count(e.empno) as no_of_emp
from emp e
JOIN dept d
on d.deptno = e.deptno 
GROUP BY d.dname
ORDER BY no_of_emp desc
LIMIT 1;

-- 70.	Find departments where the average salary is above 2500.
SELECT d.dname as department, round(avg(e.sal)) as total_salary 
from dept d
left join emp e
on d.deptno = e.deptno 
GROUP BY d.dname
HAVING total_salary >2500;

-- 71.	Get the employee name and the highest salary among their peers in the same department.
SELECT e.ename as employee , e.sal as salary , (select MAX(sal) from emp where deptno=e.deptno) as highest_salary
from emp e;

-- 72.	List employees along with their department location.
SELECT e.ename as employee, d.loc as location , d.dname as department
from emp e
join dept d
on e.deptno = d.deptno;

-- 73.	Get employees who are not in the 'Sales' department.
SELECT e.ename as employee, d.dname as departments
from emp e
left join dept d
on e.deptno = d.deptno 
where d.dname <> "Sales";


-- 74.	List employees with their salaries, including departments that have no employees.
SELECT e.ename as employee, e.sal as salaries, d.dname as department
from dept d
left join emp e
on d.deptno = e.deptno ;


-- 75.	Find employees who are analysts and belong to the 'Research' department.
SELECT e.ename as employee ,e.job as jobs, d.dname as department
from emp e
left join dept d
on d.deptno = e.deptno
where e.job = "Analyst" and d.dname = "Research";

-- 76.	Get employees who have a salary higher than any analyst in the same department.
SELECT e.ename as employee, max(e.sal) as salary, d.dname as department
from emp e 
left join dept d
on e.deptno = d.deptno
where e.job = "Analyst" 
GROUP BY e.ename, d.dname;


SELECT e.ename as employee, e.sal as salary ,e.deptno 
from emp e
where e.sal >(SELECT max(sal) from emp where job = "analyst" and deptno= e.deptno);

-- 77.	Get the department with the highest number of employees earning above 2000.
SELECT d.dname as departments , count(e.empno) as count_of_emp
from emp e
left join dept d
on d.deptno = e.deptno
where e.sal >2000
GROUP BY d.dname
ORDER BY count_of_emp DESC
LIMIT 1;

-- Final Set of Queries
-- 78.	Find employees and their salaries who belong to departments located in 'New York'.
SELECT e.ename as employee, e.sal as salaries , d.loc as location
from emp e
left join dept d
on d.deptno = e.deptno
where d.loc = "New York";

-- 79.	Get employees whose salaries are in the highest grade.
SELECT e.ename as employee, e.sal as salaries ,max(sg.grade) as grade
from emp e
LEFT join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal 
GROUP BY e.ename,e.sal, sg.grade
ORDER BY sg.grade desc
LIMIT 1;

-- 80.	List employees who are clerks and work in the Sales department.
SELECT e.ename as employee, e.job as jobs, d.dname as departments
from emp e
left join dept d
on d.deptno = e.deptno
where e.job = "Clerk" and d.dname = "Sales";

-- 81.	Find the highest salary in the department where employee 'ALLEN' works.
SELECT d.dname as departments , e.ename as employee , e.job as job , max(e.sal) as max_salary
from emp e
LEFT join dept d
on d.deptno = e.deptno 
where e.ename = "ALLEN" 
GROUP BY d.dname , e.ename, e.job;

-- 82.	List departments where all employees earn more than 1500.
SELECT d.dname as department 
from emp e
left join dept d
on d.deptno = e.deptno 
where e.sal > 1500;

-- 83.	Get the employees who report directly to the president.
SELECT e.ename
FROM emp e
WHERE e.mgr = (SELECT empno FROM emp WHERE ename = 'KING');

-- 84.	Get employees who have a job title of either 'SALESMAN' or 'MANAGER'.
SELECT e.ename as employee, e.job as jobs 
from emp e
where e.job in( "Salesman" ,"Manager");

-- 85.	Find employees who earn less than the average salary of their department.
SELECT e.ename as employee,d.dname as department, e.sal
from emp e
LEFT join dept d
on d.deptno = e.deptno
where e.sal < (SELECT avg(sal) from emp where deptno= e.deptno);

-- 86.	List employees with their department and job title.
SELECT e.ename as employee, d.dname as departments , e.job as jobs
from emp e
left join dept d
on d.deptno = e.deptno;

-- 87.	Find employees who were hired after '1995-01-01' in the Sales department.
SELECT e.ename as employee, d.dname as departments , e.hiredate as hiredate
from emp e
left join dept d
on d.deptno = e.deptno
where e.hiredate > "1995-01-01" and d.dname = "Sales";

-- 88.	Get employees and their department names where the department is located in 'Boston'.
SELECT e.ename as employee, d.dname as department, d.loc as location
from emp e
left join dept d
on d.deptno = e.deptno 
where d.loc = "Boston";

-- 89.	List employees who were hired after '1990-01-01' in the 'Research' department.
SELECT e.ename as employee, e.hiredate as hiredate, d.dname as department
from emp e
left join dept d 
on e.deptno = d.deptno 
where e.hiredate > "1995-01-01" and d.dname = "Research";

-- 90.	Find the department with the minimum salary.
SELECT d.dname as department, min(e.sal) as minimum_salary
from emp e
left join  dept d
on d.deptno = e.deptno 
GROUP BY d.dname;

-- 91.	List employees whose salary is higher than 'FORD'.
SELECT e.ename as employee
from emp e
where e.sal > (SELECT sal from emp where ename ="FORD");

-- 92.	Get employees who have the same job as 'KING'.
SELECT e.ename as employee
from emp e
where e.job = (select job from emp where ename ="KING");

-- 93.	List employees who are 'SALESMAN' but earn less than 2000.
SELECT e.ename as employee, e.job as jobs , e.sal as salary
from emp e
where e.job = "Salesman" and e.sal < 2000;

-- 94.	Find all employees whose manager has the job 'MANAGER'.
SELECT e.ename 
from emp e
join emp m on e.mgr = m.empno 
where e.job = "Manager";

-- 95.	Get employees who earn between 1500 and 3000.
SELECT e.ename as employee 
from emp e
where e.sal BETWEEN 1500 and 3000;

-- 96.	Find the average salary of employees who work in 'New York'.
SELECT avg(e.sal) as average_salary
from emp e
join dept d on d.deptno = e.deptno
where d.loc = "New York";

-- 97.	List the highest salary employee in each department.
SELECT 
d.dname as department,e.ename as employee,
max(e.sal) as max_salary
from emp e
RIGHT join  dept d 
on d.deptno = e.deptno
GROUP BY e.ename,d.dname;

-- 98.	Find employees who report to 'SCOTT'.
SELECT e.ename as employee 
from emp e
where e.mgr = (select empno from emp where ename = 'SCOTT');

-- 99.	List employees who were hired before '1990-01-01' and earn more than 2000.
SELECT E.ENAME AS EMPLOYEE ,
E.HIREDATE AS HIREDATE,
E.SAL AS SALARY
FROM EMP E
JOIN DEPT D ON D.DEPTNO = E.DEPTNO
WHERE E.HIREDATE < "1991-01-01" AND E.SAL >2000;

-- 100.Find employees who have a job title of 'CLERK' and earn more than 1000.
SELECT E.ENAME AS EMPLOYEE , 
E.JOB AS JOBS,
E.SAL AS SALARY
FROM EMP E
WHERE E.JOB = "CLERK" AND E.SAL >1000;
