-- Beginner Level
-- Retrieve all department names and their budgets.
use school_management;
show TABLES;
SELECT * from attendance;
SELECT * from class_sections;
SELECT * from courses;
SELECT * from departments;
SELECT * from enrollments;
SELECT * from events;
SELECT * from students;
SELECT * from teachers;



-- List all teachers along with their email addresses.
-- Show the first and last names of all students.
-- Display the course names offered in the 'Computer Science' department.
-- Retrieve all students who were enrolled in the year 2022.
-- Find all departments with a budget greater than 400,000.
-- List all courses that offer 3 credits.
-- Retrieve all sections conducted in the 'Fall' semester.
-- Display all events happening in the next month.
-- List all teachers who have been hired before 2021.


-- Intermediate Level
-- Find the total number of students in the database.
-- List all students sorted by their last name.
-- Retrieve the full names and email addresses of students who live in a specific city.
-- Count the number of courses offered by each department.
-- Find the average GPA of all students in the database.
-- Retrieve the total budget allocated across all departments.
-- List all teachers who specialize in 'Data Science.'
-- Display the first and last names of students with a GPA higher than 3.5.
-- Find courses that have prerequisites.
-- Retrieve all events organized by 'John Smith.'
-- Advanced Level
-- Find the teacher who conducts the most sections.
-- Retrieve the top 3 students based on their GPA.
-- Display all students who have not enrolled in any classes.
-- Find the section with the highest number of students enrolled.
-- Calculate the average salary of teachers in each department.
-- Find the course with the highest number of sections.
-- Retrieve all students whose enrollment date is before their 18th birthday.
-- List all students who have never been marked 'Absent' in attendance.
-- Retrieve the grade distribution (count of each grade) for a specific course.
-- List all courses and their prerequisites in a single query.
-- Expert Level
-- Find the department with the highest total teacher salary.
-- Display the average GPA of students grouped by graduation year.
-- Retrieve all students with duplicate email addresses.
-- List all events with a duration of more than 3 hours.
-- Find the top-performing student in each course section.
-- Identify courses where no prerequisites are required.
-- Retrieve teachers who conduct sections in both 'Fall' and 'Spring' semesters.
-- Count the total attendance for each student in all courses.
-- Find the student who has attended the most classes.
-- Retrieve the longest-running event in the database.
-- Joins and Relationships
-- List all students along with the courses they are enrolled in.
-- Retrieve all teachers along with the courses they teach.
-- Display all courses and their respective department names.
-- List all students who attended 'Computer Science 101' in the Fall semester.
-- Find the full names of students enrolled in sections taught by 'Mary Johnson.'
-- Retrieve all courses offered by departments with budgets greater than 450,000.
-- List all events organized by teachers from the 'Mathematics' department.
-- Find all students who have attended events hosted by their teachers.
-- Retrieve the total number of students enrolled in each course.
-- Find all students who have not attended any events.
-- Data Aggregation and Analysis
-- Calculate the total budget per department and sort by the highest.
-- Find the average GPA of students enrolled in each course.
-- Retrieve the maximum and minimum GPA of students grouped by graduation year.
-- Find the average salary of teachers in each department.
-- Retrieve the most common grade awarded in all courses.
-- Display the total number of sections taught by each teacher.
-- List the total number of students enrolled in courses by semester.
-- Calculate the total number of hours each event spans.
-- Retrieve the department with the least number of teachers.
-- Find the total enrollment in courses offered by the 'Physics' department.
-- Performance Optimization
-- Create an index for faster retrieval of courses by course code.
-- Optimize queries that retrieve students by their email.
-- Write a query to find students with high GPA using window functions.
-- Implement a query to fetch teachers who joined in the last 5 years with minimal execution time.
-- Analyze and optimize a query to find the most popular course by enrollment.
-- Complex Queries
-- Find students enrolled in more than 3 courses in a single semester.
-- Identify overlapping event schedules (events held at the same time).
-- Retrieve all sections with less than 50% of their maximum capacity filled.
-- Find students who have enrolled in all courses offered by a specific department.
-- List all courses and their direct and indirect prerequisites.
-- Subqueries
-- Find the course with the highest average GPA.
-- Retrieve all students who have attended more than 80% of their classes.
-- List the events attended by students with a GPA higher than 3.8.
-- Identify teachers who teach only elective courses (no prerequisites).
-- Display the top 5 departments based on total student enrollment.
-- Views and Functions
-- Create a view to show teachers and their department names.
-- Write a stored function to calculate the total credits earned by a student.
-- Implement a stored procedure to retrieve all events within a specific date range.
-- Create a trigger to update the last_updated column in the teachers table on salary change.
-- Write a query to update the student_performance view with GPA data.
-- Real-World Scenarios
-- List all students who have never received an 'F' grade.
-- Find the busiest teacher based on the number of sections they handle.
-- Display all courses that have been conducted every semester for the last 5 years.
-- Identify students with birthdays in the current month.
-- Retrieve the total revenue generated by course enrollment fees (assuming a fee structure).
-- Case Statements and Conditional Queries
-- Display students with a 'Pass' or 'Fail' status based on their GPA.
-- Retrieve all teachers with salaries categorized as 'Low', 'Medium', or 'High.'
-- Show events marked as 'Short' or 'Long' based on their duration.
-- Categorize courses as 'Core' or 'Elective' based on whether they have prerequisites.
-- List attendance with an additional column showing 'On Time' or 'Late.'
-- Miscellaneous
-- Write a query to delete students who graduated before 2010.
-- Retrieve all courses with no enrollments in the last year.
-- List teachers who have never taught a class section.
-- Find students who have attended more than one event in the same day.
-- Write a query to transfer all courses from one department to another.
-- Reporting and Analysis
-- Generate a report of students with their course enrollments and grades.
-- Create a summary of department budgets and average salaries.
-- List the GPA distribution for all students in a specific graduation year.
-- Write a query to retrieve attendance percentages for all students.
-- Generate a detailed report of teacher workloads, including sections taught and courses. 