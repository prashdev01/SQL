use joindb;

use joindb;

-- 1-10: Employee and Salary Aggregations  
-- 1. Total Salary by Job  
SELECT job as job, sum(sal) as total_salary
from emp
GROUP BY job;

-- 2. Average Salary by Department  
SELECT d.dname as department,
avg(e.sal) as avg_salary
from emp e
RIGHT join dept d
on e.deptno = d.deptno
GROUP BY d.dname;

-- 3. Minimum Salary by Manager  
SELECT m.ename as manager,
min(e.sal) as salary
from emp m
join emp e
on  e.mgr = m.empno
GROUP BY m.ename;

-- 4. Maximum Salary by Job
SELECT job as jobs ,
max(sal) as salary  from emp
GROUP BY job;

   
-- 5. Count of Employees by Department  
select d.dname as department,
count(e.empno) as NO_of_emp
from emp e
RIGHT JOIN dept d
on d.deptno = e.deptno
GROUP BY d.dname;


-- 6. Total Commission by Job  
SELECT job as jobs ,
sum(comm) as total_commision
from emp
GROUP BY job;


-- 7. Employee Count by Manager  
SELECT m.ename as manager,
count(e.empno) as count_of_emp
from emp e
join emp m
on e.mgr = m.empno
GROUP BY m.ename;


-- 8. Departments with Total Salary Greater Than 5000  
SELECT d.dname as department,
sum(e.sal) as total_salary
from emp e
RIGHT join dept d
on d.deptno = e.deptno
GROUP BY d.dname;

-- 9. Jobs with Average Salary Between 1000 and 3000  
SELECT job as jobs ,
avg(sal) as avg_sal
FROM emp
GROUP BY job
HAVING avg(sal) BETWEEN 1000 and 3000;


-- 10. Employees with Null Commissions Grouped by Job  
SELECT ename as employee,
job as jobs,
comm as commision
from emp
WHERE comm is null
GROUP BY ename, job, comm;
-- ---

-- 11-20: Employee and Hire Date  
-- 11. Earliest Hire Date by Department 
SELECT d.dname as department,
e.hiredate as hiredate
from emp e
RIGHT JOIN dept d
on d.deptno = e.deptno
ORDER BY hiredate desc; 

-- 12. Latest Hire Date by Job 
SELECT d.dname as department,
e.hiredate as hiredate
from emp e
RIGHT JOIN dept d
ON d.deptno = e.deptno
ORDER BY hiredate desc
LIMIT 1;

-- 13. Total Employees Hired After 1981 Grouped by Manager 
SELECT m.ename as manager,
count(e.empno) as count_of_emp
from emp e
join emp m
on e.mgr = m.empno
WHERE e.hiredate > '1981-01-01'
GROUP BY m.ename;
-- 14. Average Salary of Employees Hired After 1981 
 
-- 15. Number of Employees Hired Per Job  
-- 16. Departments with Maximum Hire Date Before 1983  
-- 17. Managers with Employees Hired After 1982  
-- 18. Jobs with Total Salary Above 10000  
-- 19. Departments with Average Commission Above 500  
-- 20. Jobs with at Least 3 Employees  

-- ---

-- 21-30: Salary Grades and Departments  
-- 21. Salary Grade Distribution  
-- 22. Departments with Employees in Grade 3  
-- 23. Highest Salary in Each Grade  
-- 24. Departments with Grade 1 Employees  
-- 25. Grade-wise Average Salary  
-- 26. Count of Employees Per Department in Grade 4  
-- 27. Departments with Total Salary Above 10000 in Grade 5  
-- 28. Jobs with Employees Only in Grade 1  
-- 29. Departments with Maximum Employee Count in Grade 2  
-- 30. Grades with No Employees in a Specific Department  

-- ---

-- 31-40: Advanced Salary Grade and Department Queries  
-- 31. Highest Grade Reached by Employees in Each Job  
-- 32. Number of Employees in Grade 5 with Commission  
-- 33. Departments with Employees in Multiple Grades  
-- 34. Jobs with Total Commission Above 500 in Grade 3  
-- 35. Grades with Total Salary Above 20000  
-- 36. Jobs with No Employees in Grade 2  
-- 37. Department Locations with Maximum Salary in Grade 3  
-- 38. Number of Jobs in Each Department with Salary Grade 5  
-- 39. Employees in Grade 1 Across Multiple Departments  
-- 40. Locations with Total Employees Greater Than 5  

-- ---

-- 41-50: Miscellaneous and Advanced Queries  
-- 41. Departments with Average Commission Less Than 200  
-- 42. Highest Salary by Location for Grade 4 Employees  
-- 43. Departments with More Than 2 Jobs in Grade 3  
-- 44. Jobs with Employees Across All Grades  
-- 45. Departments with Salaries Exceeding 5000 in Grade 2  
-- 46. Jobs with Maximum Commission in Grade 1  
-- 47. Locations with Highest Employee Count Across Grades  
-- 48. Grades with Minimum Salary Distribution by Department  
-- 49. Department-wise Total Salaries of Employees Across All Grades  
-- 50. Average Employee Count by Location and Grade  