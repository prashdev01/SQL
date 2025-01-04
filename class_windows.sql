create DATABASE class;
use class;
CREATE TABLE Students (
    student_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    subject VARCHAR(100) NOT NULL,
    marks INT NOT NULL,
    grade CHAR(1) NOT NULL
);

INSERT INTO students (name, subject, marks, grade) VALUES
('John Doe', 'Mathematics', 85, 'A'),
('Jane Smith', 'Physics', 90, 'A'),
('Emily Johnson', 'Chemistry', 78, 'B'),
('Michael Brown', 'Biology', 88, 'A'),
('Sarah Davis', 'History', 92, 'A'),
('David Wilson', 'Geography', 70, 'C'),
('Emma Garcia', 'English', 80, 'B'),
('James Martinez', 'Mathematics', 65, 'D'),
('Sophia Anderson', 'Physics', 75, 'B'),
('Liam Thomas', 'Chemistry', 55, 'F'),
('Olivia Lee', 'Biology', 87, 'A'),
('Noah Harris', 'History', 82, 'B'),
('Isabella Clark', 'Geography', 95, 'A'),
('Mason Walker', 'English', 68, 'C'),
('Ava Young', 'Mathematics', 73, 'B'),
('Logan Hernandez', 'Physics', 61, 'D'),
('Ethan King', 'Chemistry', 79, 'B'),
('Mia Wright', 'Biology', 84, 'B'),
('Lucas Scott', 'History', 89, 'A'),
('Charlotte Adams', 'Geography', 77, 'B');

SELECT * from students;

-- calculate the average grade of each student across all student
SELECT student_id,
	name, subject, grade, 
    avg(marks) over(partition by subject) as avg_grade
    from students;
    
USE class;
use window_functions;
-- find the rank of students of  according there marks 
select student_id, name , subject,marks,
RANK () over (PARTITION BY subject ORDER BY marks desc) as marks_ranking
from students;

select student_id, name , subject,marks,
DENSE_RANK () over (PARTITION BY subject ORDER BY marks desc) as marks_ranking
from students;
SELECT * from employees;

-- calculate the minimum and maximum salary by each department
select employee_id as empid,
department_id, salary, 
min(salary) over(PARTITION BY department_id) as min_salary,
max(salary) over(PARTITION BY department_id) as max_salary
from employees;

-- calculate number of employees in each departments
SELECT department_id, employee_id,
count(*) over (PARTITION BY department_id ) as count_of_employee
from employees;

SELECT department_id, count(employee_id)
from employees
GROUP BY department_id;

--  average salary ub each department

SELECT department_id ,
AVG(salary) over(PARTITION BY department_id) as avg_salary
from employees;


select employee_id, name, department_id,salary,
ROW_NUMBER() over (PARTITION BY employee_id ) as rownum
from employees;  
-- find the rank for each department based on salary
SELECT employee_id, 
name, department_id, salary,
rank() over(partition by  department_id order by salary desc) as salary_rank
from employees; 

SELECT employee_id , name, salary from (select employee_id , name,salary, max(salary) over (partition by department_id) as max_salary from employees) as subquery
where salary = max_salary;



