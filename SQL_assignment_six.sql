use joindb;
-- 1-10: Employee and Salary Aggregations  
-- 1. Total Salary by Job  
SELECT job,sum(sal)  as no_of_employee from emp
GROUP BY job;

-- 2. Average Salary by Department  
SELECT d.dname as department, round(avg(e.sal)) as avg_salary
from dept d 
RIGHT join emp e 
ON d.deptno=e.deptno
GROUP BY d.dname;

-- 3. Minimum Salary by Manager 
SELECT m.ename as manager, min(e.sal) as min_sal from emp e
join emp m on e.mgr = m.empno
GROUP BY m.ename;


-- 4. Maximum Salary by Job 
SELECT job, max(sal) as max_sal 
from emp
GROUP BY job;
 
-- 5. Count of Employees by Department  
SELECT d.dname as department , count(e.empno) as no_of_employee
from dept d
RIGHT join emp e 
on d.deptno = e.deptno
GROUP BY d.dname;

-- 6. Total Commission by Job 
SELECT job, sum(comm) as Total_commision
from emp
GROUP BY job;

-- 7. Employee Count by Manager  
SELECT m.ename as manager, count(e.empno) as no_of_employee from emp e
join emp m
on e.mgr = m.empno 
GROUP BY m.ename;

-- 8. Departments with Total Salary Greater Than 5000  
SELECT d.dname as departmet, sum(e.sal) as total_salary
from dept d
RIGHT join emp e
on d.deptno = e.deptno
GROUP BY d.dname
HAVING sum(e.sal) > 5000;

-- 9. Jobs with Average Salary Between 1000 and 3000 
SELECT  job , avg(sal) as avg_of_salary 
from emp
GROUP BY job
HAVING avg(sal) BETWEEN 1000 and 3000;

SELECT  job , avg(sal) as avg_of_salary 
from emp
where sal BETWEEN 1000 and 3000
GROUP BY job;


-- 10. Employees with Null Commissions Grouped by Job  
SELECT ename, job, comm from emp
where comm is null;

-- 11. Earliest Hire Date by Department  
SELECT  d.dname as department,e.hiredate as hiredate 
from emp e
RIGHT join dept d
on d.deptno = e.deptno
ORDER BY e.hiredate desc;

-- 12. Latest Hire Date by Job
SELECT  d.dname as department,e.hiredate as hiredate 
from emp e
RIGHT join dept d
on d.deptno = e.deptno
ORDER BY e.hiredate desc
LIMIT 1;  

-- 13. Total Employees Hired After 1981 Grouped by Manager  

SELECT m.ename as manager_name, count(e.empno) from emp e
left join emp m
on e.mgr = m.empno
WHERE year(e.hiredate) > 1981
GROUP BY m.ename, e.mgr;


-- 14. Average Salary of Employees Hired After 1981  
SELECT ename as employee, avg(sal) avg_of_emp_after_1981 from emp e
WHERE year(e.hiredate) > 1981
GROUP BY ename;

-- 15. Number of Employees Hired Per Job  
SELECT job, COUNT(empno)  as no_of_employees from emp
GROUP BY job;


-- 16. Departments with Maximum Hire Date Before 1983 
SELECT d.dname as department, MAX(e.hiredate) as max_hire
from emp e
RIGHT join dept d 
on e.deptno = d.deptno
where year(e.hiredate) <1983 
GROUP BY d.dname
HAVING max(e.hiredate) is not null;

-- 17. Managers with Employees Hired After 1982 
SELECT m.ename as manager, e.hiredate as hiredate
from emp e
join emp m
on e.mgr = m.empno
where year(e.hiredate) > 1982; 

-- 18. Jobs with Total Salary Above 10000 
SELECT job, sum(sal)  as total_salary from emp
GROUP BY job
HAVING sum(sal) >10000;

-- 19. Departments with Average Commission Above 500  
select d.dname as department, avg(e.comm) as commision from emp e
RIGHT join dept d
on e.deptno = d.deptno 
GROUP BY d.dname
HAVING avg(e.comm) > 500;

-- 20. Jobs with at Least 3 Employees  
SELECT job, count(empno) as no_of_emp
from emp
GROUP BY job
HAVING count(empno) >=3;


-- 21. Salary Grade Distribution 
SELECT 
s.grade as grade,
d.dname as department,
count(e.empno) as employee
from emp e
join salgrade s 
on e.sal BETWEEN s.losal and s.hisal 
LEFT join 
dept d
on e.deptno = d.deptno 
GROUP BY s.grade, d.dname
order BY s.grade, d.dname;
 
-- 22. Departments with Employees in Grade 3 
SELECT d.dname as department,
e.ename as employee,
s.grade as salaey_grade 
from dept d
left join emp e
on d.deptno = e.deptno 
join salgrade s
on e.sal BETWEEN s.losal and s.hisal
where s.grade = 3;


-- 23. Highest Salary in Each Grade  

SELECT sg.grade as grade,
max(e.sal) as higest_salary from salgrade as sg
join emp e
on e.sal BETWEEN sg.losal and sg.hisal 
GROUP BY sg.grade;


-- 24. Departments with Grade 1 Employees  
SELECT d.dname as department,
e.ename as employee,
sg.grade as sal_grade
from dept d
left join emp e
on d.deptno = e.deptno
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal 
where sg.grade =1;

-- 25. Grade-wise Average Salary 
SELECT sg.grade as sal_grade, 
avg(e.sal) as avg_sal
from salgrade as sg
left join emp e 
on e.sal BETWEEN sg.losal and sg.hisal 
GROUP BY sg.grade;


-- 26. Count of Employees Per Department in Grade 4  
SELECT d.dname as department,
count(empno) as no_of_emp,
sg.grade as salgrade
from emp e
RIGHT join dept d
on e.deptno = d.deptno
left join salgrade as sg
on e.sal BETWEEN sg.losal and hisal
where sg.grade = 4
GROUP BY d.dname;

-- 27. Departments with Total Salary Above 10000 in Grade 5  
SELECT d.dname as department,
sum(e.sal) as total_salary,
sg.grade as grade
from dept d
RIGHT join emp e
on e.deptno = d.deptno
left join salgrade as sg
on e.sal between sg.losal and hisal 
where sg.grade = 5
GROUP BY d.dname 
HAVING sum(e.sal) >=5000;

-- 28. Jobs with Employees Only in Grade 1  
SELECT e.ename as employee ,
sg.grade as salgrade
from emp e
left join salgrade as sg
on e.sal between losal and hisal
where sg.grade =1;


-- 29. Departments with Maximum Employee Count in Grade 2  
SELECT d.dname as department,
count(e.empno) as max_employee,
sg.grade as salgrade
from dept d
right join emp e 
on d.deptno = e.deptno 
left join salgrade as sg
on e.sal between sg.losal and sg.hisal 
where sg.grade = 2
GROUP BY d.dname
HAVING max(e.empno);


-- 30. Grades with No Employees in a Specific Department  
SELECT e.ename as employee,
d.dname as department ,
sg.grade as sal_grade
from emp as e
left join dept d
on e.deptno = d.deptno
left join salgrade as sg
on e.sal BETWEEN losal and hisal
where d.dname = "sales" and grade is null;

-- 31-40: Advanced Salary Grade and Department Queries  
-- 31. Highest Grade Reached by Employees in Each Job  
SELECT e.ename as employe,
e.job as job,
max(sg.grade) as max_grade
from emp e
left join dept d
on e.deptno = d.deptno
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
GROUP BY e.ename,e.job;


-- 32. Number of Employees in Grade 5 with Commission  
SELECT sg.grade as grade,
count(e.empno) as no_employees,
e.comm as commision
from emp e
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
where sg.grade = 5 and e.comm is null
GROUP BY sg.grade,e.comm;

-- 33. Departments with Employees in Multiple Grades  
SELECT d.dname as department
,e.ename as employee,
count(sg.grade) as sal_grade 
from dept d
RIGHT join emp e
on d.deptno = e.deptno
left join salgrade as sg
on e.sal BETWEEN sg.losal and hisal
GROUP BY d.dname, e.ename;


-- 34. Jobs with Total Commission Above 500 in Grade 3
SELECT e.job as job,
sum(e.comm) as total_commision
from emp e
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
where sg.grade = 3
GROUP BY e.job
HAVING sum(e.comm)>500;
  
-- 35. Grades with Total Salary Above 20000  
SELECT sg.grade as salgrade,
sum(e.sal) as total_salary
from emp e
left join salgrade as sg
on e.sal between sg.losal and hisal
GROUP BY sg.grade
HAVING sum(e.sal) > 10000;

-- 36. Jobs with No Employees in Grade 2  
SELECT e.job as jobs,
count(e.empno) as no_of_emp,
sg.grade as grade
from emp e
left join salgrade sg
on e.sal between sg.losal and sg.hisal
where sg.grade = 2
GROUP BY e.job ,sg.grade;
-- 37. Department Locations with Maximum Salary in Grade 3  
SELECT d.dname as department,
d.loc as location,
sg.grade as grade,
max(e.sal)
from dept d
right join emp e
on d.deptno = e.deptno
left join salgrade as sg
on e.sal between losal and hisal
where sg.grade = 3 
GROUP BY d.dname, sg.grade, d.loc;


-- 38. Number of Jobs in Each Department with Salary Grade 5  
SELECT d.dname as department,
count(e.job) as count_of_job ,
sg.grade as grade
from dept as d
RIGHT join emp as e
on d.deptno = e.deptno 
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal
where sg.grade = 5
GROUP BY d.dname,sg.grade;


-- 39. Employees in Grade 1 Across Multiple Departments  
SELECT d.dname as department,
count(e.empno) as no_of_emp,
sg.grade as grade
from dept d
RIGHT join emp e
on d.deptno = e.deptno
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
where sg.grade = 1
GROUP BY d.dname,sg.grade;

-- 40. Locations with Total Employees Greater Than 5  
SELECT d.loc as location,
sum(e.empno) as no_of_employees
from dept d
RIGHT join emp e
on e.deptno = d.deptno
GROUP BY d.loc 
HAVING sum(e.empno) >5;


-- 41-50: Miscellaneous and Advanced Queries  
-- 41. Departments with Average Commission Less Than 200  

SELECT d.dname as department ,
avg(e.comm) as avg_commision
from dept d
left join emp e
on e.deptno = d.deptno
where e.comm is not null
group by d.dname
having avg(e.comm) <200;


-- 42. Highest Salary by Location for Grade 4 Employees
select d.loc as location,
sg.grade as grade,
max(e.sal) as max_sal
from dept d
right join emp e
on d.deptno= e.deptno
left join salgrade as sg
on e.sal between sg.losal and hisal
where sg.grade = 4 
GROUP BY d.loc, sg.grade
;
  
-- 43. Departments with More Than 2 Jobs in Grade 3

SELECT d.dname,count(e.job), sg.grade
from dept d
RIGHT JOIN emp e 
on e.deptno = d.deptno 
LEFT JOIN salgrade as sg
on e.sal BETWEEN sg.losal and hisal
where grade = 3
GROUP BY d.dname 
HAVING COUNT(e.job)>2;
  
-- 44. Jobs with Employees Across All Grades  
select e.ename as employee,
e.job as jobs,
sum(sg.grade) as sum_of_grade
from emp e 
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
GROUP BY e.ename, e.job;

-- 45. Departments with Salaries Exceeding 5000 in Grade 2 
SELECT d.dname as department,
e.sal as salary,
sg.grade as  grade 
from dept d
right join emp e
on e.deptno= d.deptno
left join salgrade as sg
on e.sal between sg.losal and sg.hisal
where e.sal > 5000 and sg.grade = 2;

-- 46. Jobs with Maximum Commission in Grade 1  
select e.job as jobs, sg.grade as salgrade ,
max(e.comm) as max_commision
from emp e
left JOIN salgrade as sg
on e.sal between sg.losal and sg.hisal 
where sg.grade = 1 
GROUP BY e.job , sg.grade;

-- 47. Locations with Highest Employee Count Across Grades  
SELECT  D.loc as location,
count(e.empno) as no_of_employee,
sg.grade as salgrade
from dept d
right join emp e
on e.deptno = d.deptno
left join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal
GROUP BY d.loc, sg.grade
having max(DISTINCT E.empno);

-- 48. Grades with Minimum Salary Distribution by Department  
SELECT D.DNAME AS DEPARTMENT,
SG.GRADE AS GRADE,
MIN(E.SAL) AS MIN_SAL
FROM DEPT d
RIGHT JOIN EMP e
ON E.DEPTNO = D.DEPTNO

LEFT JOIN SALGRADE AS SG
ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL

GROUP BY D.DNAME, SG.GRADE;

-- 49. Department-wise Total Salaries of Employees Across All Grades 
SELECT D.DNAME AS DEPARTMENT,
SG.GRADE AS GRADES,
SUM(E.SAL) AS TOTAL_SALARY
FROM DEPT  D
RIGHT JOIN EMP E 
ON E.DEPTNO = D.DEPTNO

LEFT JOIN SALGRADE AS SG
ON E.SAL BETWEEN SG.LOSAL AND HISAL
GROUP BY D.DNAME , SG.GRADE
ORDER BY D.DNAME;


-- 50. Average Employee Count by Location and Grade  
SELECT D.LOC AS LOCATION,
COUNT(E.EMPNO) AS no_OF_EMP,
SG.GRADE AS SALGRADE
FROM DEPT D
RIGHT JOIN EMP E
ON D.DEPTNO = E.DEPTNO 

LEFT JOIN SALGRADE AS SG
ON E.SAL BETWEEN SG.LOSAL AND SG.HISAL
GROUP BY D.LOC , SG.GRADE
HAVING AVG(E.EMPNO);

-- count of emp with deoart and grade 4
use joindb;
SELECT 
d.dname as department,
count(e.empno) as count_of_emp,
sg.grade as salgrade
from emp e
left join dept d
on e.deptno = d.deptno 

LEFT join salgrade as sg
on e.sal BETWEEN sg.losal and sg.hisal
where sg.grade = 4
GROUP BY d.dname , sg.grade;

