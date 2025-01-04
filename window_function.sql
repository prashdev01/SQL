-- Active: 1735103228111@@127.0.0.1@3306@school
CREATE DATABASE school;
use school;

CREATE Table students (student_id int PRIMARY KEY, score INT NOT NULL);

INSERT INTO students 
(student_id,score)
VALUES
(1,90),
(2,80),
(3,85),
(4,95);

SELECT * FROM students;

-- percent rank 
SELECT student_id,score ,
PERCENT_RANK() OVER(ORDER BY score ) AS pr 
FROM students;


-- it give us how much data has been coverd in from of percantage

-- cummulative distribution

SELECT student_id, score,
CUME_DIST() OVER(ORDER BY score) as CD 
from students;

-- Ntile
CREATE Table sales(sale_id INT NOT NULL, amount INT );


INSERT INTO sales(sale_id,amount)
VALUES
(1,100),
(2,200),
(3,300),
(4,400),
(5,500),
(6,600),
(7,700);

SELECT * FROM sales;

SELECT sale_id,amount,
NTILE(2) OVER(ORDER BY amount) as ntile_group
from sales;



use joindb;
SELECT * FROM emp;

SELECT * ,
FIRST_VALUE(sal) OVER(ORDER BY sal DESC) highest_salary
from emp;
SELECT * ,
LAST_VALUE(sal) OVER(ORDER BY sal ASC) least_salary
from emp;


-- Nth value
USE school;
SELECT * ,
NTH_VALUE(sale_id,2) OVER(ORDER BY amount DESC) as nth_tile
from sales;


CREATE table monthly_sales(month VARCHAR(50), sale INT);

INSERT INTO monthly_sales (month, sale) VALUES
("january", 1000),
("february", 1200),
("march", 1500),
("april", 1700);

SELECT * FROM monthly_sales;

-- lead() this function allows  us to access data from the following(next) row relative
-- to the current row in the result set

SELECT *, 
LEAD(sale,2) OVER(ORDER BY MONTH) as next_month
from monthly_sales;

SELECT * ,
LAG(sale,2) OVER(ORDER BY MONTH) as prevoise_month
from monthly_sales;

