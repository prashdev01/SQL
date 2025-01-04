CREATE DATABASE window_functions;
USE window_functions;

CREATE TABLE employees (
    employee_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    department_id INT NOT NULL,
    salary DECIMAL(10, 2) NOT NULL,
    hire_date DATE NOT NULL
);

INSERT INTO employees (name, department_id, salary, hire_date) VALUES
('Alice', 1, 60000, '2020-01-15'),
('Bob', 1, 55000, '2019-03-10'),
('Charlie', 1, 75000, '2021-07-25'),
('David', 2, 50000, '2018-11-05'),
('Eve', 2, 52000, '2017-08-22'),
('Frank', 2, 49000, '2022-06-10'),
('Grace', 3, 67000, '2020-09-30'),
('Hank', 3, 68000, '2021-02-14'),
('Ivy', 3, 70000, '2019-12-18');


CREATE TABLE sales (
    transaction_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    employee_id INT NOT NULL,
    sale_amount DECIMAL(10, 2) NOT NULL,
    sale_date DATE NOT NULL,
    FOREIGN KEY (employee_id) REFERENCES employees(employee_id)
);

INSERT INTO sales (product_name, employee_id, sale_amount, sale_date) VALUES
('Laptop', 1, 1200.00, '2023-01-15'),
('Mouse', 1, 25.00, '2023-02-10'),
('Keyboard', 2, 45.00, '2023-01-22'),
('Monitor', 3, 300.00, '2023-03-01'),
('Headphones', 4, 150.00, '2023-04-05'),
('Desk', 5, 200.00, '2023-04-15'),
('Chair', 6, 450.00, '2023-05-18'),
('Printer', 7, 500.00, '2023-05-20'),
('Laptop', 8, 1300.00, '2023-06-25'),
('Tablet', 9, 600.00, '2023-07-01');

SELECT * from employees;
SELECT * from sales;

-- Aggregate Window Functions
-- Calculate the t,otal salary for each department while retaining each employee's row

SELECT employee_id,name, department_id, 
sum(salary) over(partition by department_id ) as total_salary
from employees;

-- compute the cummulative sales amount for each employee by transaction date
SELECT transaction_id, employee_id, sale_amount, sale_date,
sum(sale_amount) over (PARTITION BY  employee_id ORDER BY sale_date ) as  cummulative_sales
from sales;

-- Ranking Window Functions
-- Rank employees within their department by salary in descending order.
SELECT employee_id, department_id, name,salary, 
RANK() OVER (PARTITION BY department_id ORDER BY salary) as rank_salary
from employees;

-- Assign row numbers to all sales transactions, ordered by sale amount.
SELECT transaction_id, employee_id, sale_amount, sale_date,
ROW_NUMBER() over(ORDER BY sale_amount) as row_numbers
from sales;




