USE JOINDB;


SET AUTOCOMMIT = 0;


CREATE TABLE CUSTOMERS
(CUST_ID INT NOT NULL, CUSTOMERS VARCHAR(50), BALANCE INT);

INSERT INTO CUSTOMERS (CUST_ID, customerS, BALANCE) 
VALUES
(101,"PRASHANT",5000),
(102,"HARSH",4000);

UPDATE CUSTOMERS SET CUSTOMERS = "HARSH"
WHERE CUST_ID = 102;

ROLLBACK;
SELECT * FROM CUSTOMERS;

START TRANSACTION ;
INSERT INTO CUSTOMERS 
(CUST_ID, CUSTOMERS, BALANCE)
VALUES
(103, "JAGAT" , 3000);
SELECT * FROM customeRS;

SAVEPOINT SP1;
START TRANSACTION;
UPDATE customers set balance = balance -200
where cust_id = 103;
SAVEPOINT sp2;

SELECT * from customers;
ROLLBACK to sp2;

CREATE VIEW v_dept1020 as
SELECT count(*) as num_of_employee,deptno
from emp
GROUP BY deptno
HAVING deptno in (10,20);

SELECT * from v_dept1020;

-- create a view for employee hired after 1982
CREATE VIEW v_hired_after_1982 as
SELECT empno, ename, deptno , sal,hiredate
from emp
where hiredate > 1982-01-01;

SELECT * from v_hired_after_1982;

drop VIEW v_hired_after_1982;

-- create a view with the case statement sal < 1000 'Low" ,sal between 2000 and 3000, else high
CREATE VIEW v_salary_status as
SELECT empno, ename,sal,
case when sal < 1000 then "low"
when sal BETWEEN 2000 and 3000 then "medium"
ELSE "high"
end as salary_stat
from emp;

SELECT * from v_salary_status;

-- create  a view for employee earning more than average , salary

CREATE view V_sal_more_than_avg as
select empno, ename, sal from emp 
where sal > (SELECT avg(sal) from emp);


select distinct s.submision_date, 
                count(s.hacker_id),
                h.name
from hackers as h  
RIGHT JOIN submissions AS S ON s.hacker_id = h.hacker_id
group by s.submision_date,h.name;

select s.submision_date, 
                count(s.hacker_id),
(select name from hackers) as h_name from submissions as s
group by s.submision_date,h_name;

use joindb;
GRANT SELECT on emp  to 'user_1';
