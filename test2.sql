-- Active: 1735103228111@@127.0.0.1@3306@joindb
SELECT * FROM emp;


-- PERCENT_RANK

SELECT ename, deptno,sal,
ROW_NUMBER() OVER(PARTITION BY deptno ORDER BY sal DESC) as rn,
RANK() OVER (PARTITION BY deptno ORDER BY sal desc) as rank_sak,
DENSE_RANK() OVER (PARTITION BY deptno ORDER BY sal desc) as denserR,
PERCENT_RANK() OVER (PARTITION BY deptno ORDER BY sal desc) as PR
from emp;

-- PERCENT_RANK of(x) = rank(x) -1 / N-1
--  rnak(x) is the rank of the current calue x)the number of rows with value leass than or equal to (x)
--  N is the total numner of rows in the partition set
--  note : os the is only one row in the partition , the resukt of the percent rank will be 8
-- the resukt of percent rank is decimal between 0 and 1, whach can bw interpreted as pwecentage by multiplying by 100.
-- student_id   score
-- 1            90
-- 2            80  
-- 3            85
SELECT student_id,score,
    PERCENT_RANK() OVER(ORDER BY score) as pr 
    from students;


-- cum_dist() : this function returns the cummulative distribution of a row within a result set. it calculates the percentage of rows that have a value less than or equal to the current row's value in the specified order.

-- cume_dist(X) = [RANK(x-1)] /N
-- here ,RANK(x) is the rank of the current value x.
-- N is the total number of rows

SELECT student_id,score,
CUME_DIST() OVER(ORDER BY score) as cd 
from students;


-- -- NTILE ()
-- this window function divedes a result set into a specified NUMBER of roughly equal GROUPs or buckets (alsi called tukes ). it assugns a bucket number to eacg riw based on its position within the irdered result set 
-- NTILE (number of buckets) over (partition by column)

SELECT sale, id, amoubt,
NTILE(3) OVER(ORDER BY anount,) 
from sales;

SELECT emp_id, name, salary,
FIRST_VALUE(salary) OVER(ORDER BY salary DESC ) as highest_salary
from employee;

-- LAG AND LEAD

SELECT months,sales,
LEAD(sales) OVER (ORDER BY MONTH) as next_month_sales
from sales_data;

-- this function allows us to access data from the following(next) row 
-- relattive to the current row in the result set
--  it helps us in comparing a row with future rows

-- syntax : LEAD(column_name, offeset,defualt_value) 
--          over (partion BY expression optional, order by order_list) 

-- OFFSET increment the number of month

-- LAG Functions: it allows us to retrive the value form a row preseding the current row .
-- syntax: LAG(column_name, offeset,defualt_value) 
--          over (partion BY expression optional, order by order_list) 
SELECT months,sales,
LAG(sales) OVER (ORDER BY MONTH) as next_month_sales
from sales_data;

-- Nth_value() this function allows us to retrive the value from a specific row based on it possition.
-- syntax: Nth_value(column_name, N) over([partition by expr_list optional]
-- order by order_list[rows ir range frame_classic optinal])

-- IDENTIFIED the 5 th no. employee hist salary

SELECT empno,ename, sal from
(SELECT empno,ename, sal,
        ROW_NUMBER() OVER(ORDER BY sal DESC) rnk
        from emp ) sub
        WHERE rnk = 5;

-- RANK Employee based on their job and hiredate within thier department
SELECT empno,ename,deptno, job, hiredate,
ROW_NUMBER() OVER(PARTITION BY deptno,job ORDER BY hiredate ASC) as job_rank
FROM emp;

-- find the employee with the third highest salary in each department
SELECT * FROM
(SELECT empno,ename, deptno, sal ,
RANK() OVER(PARTITION BY deptno ORDER BY sal desc) as salary_rank
from emp) sub
WHERE salary_rank =3;

-- rank employee based in their total earnings (salary+cummision) within the company
SELECT * FROM
(SELECT empno,ename, deptno, sal , comm,
RANK() OVER( ORDER BY sal + IFNULL(comm,0) desc) as salary_rank
from emp) sub;


-- identify the top three earning employee without gaps.

SELECT * FROM
(SELECT empno,ename, deptno, sal , comm,
dense_rank() OVER( ORDER BY sal + IFNULL(comm,0) desc) as salary_rank
from emp) sub
WHERE salary_rank <=3;


-- case-statement (if-else in sql)
