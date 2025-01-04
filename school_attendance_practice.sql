-- First, create the database
CREATE DATABASE school_management;
USE school_management;

-- Department table to organize school departments
-- This will help practice basic CRUD operations and serve as a reference table
CREATE TABLE departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,
    department_name VARCHAR(100) NOT NULL,
    budget DECIMAL(12,2),
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    last_updated TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
SELECT * from departments;
-- Teachers table with various data types and constraints
-- Good for practicing data manipulation and joins
CREATE TABLE teachers (
    teacher_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    hire_date DATE NOT NULL,
    salary DECIMAL(10,2),
    specialization VARCHAR(100),
    is_active BOOLEAN DEFAULT true,
    FOREIGN KEY (department_id) REFERENCES departments(department_id)
);
SELECT * from teachers;

-- Students table with academic information
-- Perfect for practicing complex queries and data analysis
CREATE TABLE students (
    student_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(50) NOT NULL,
    last_name VARCHAR(50) NOT NULL,
    date_of_birth DATE NOT NULL,
    enrollment_date DATE NOT NULL,
    graduation_year INT,
    gpa DECIMAL(3,2),
    email VARCHAR(100) UNIQUE NOT NULL,
    phone VARCHAR(20),
    address TEXT
);

-- Courses table with prerequisites
-- Enables practice with self-joins and complex relationships
CREATE TABLE courses (
    course_id INT PRIMARY KEY AUTO_INCREMENT,
    department_id INT,
    course_name VARCHAR(100) NOT NULL,
    course_code VARCHAR(20) UNIQUE NOT NULL,
    credits INT NOT NULL,
    prerequisite_course_id INT,
    description TEXT,
    FOREIGN KEY (department_id) REFERENCES departments(department_id),
    FOREIGN KEY (prerequisite_course_id) REFERENCES courses(course_id)
);
SELECT * from  courses;

-- Class sections for specific course offerings
-- Useful for practicing date/time operations and complex joins
CREATE TABLE class_sections (
    section_id INT PRIMARY KEY AUTO_INCREMENT,
    course_id INT NOT NULL,
    teacher_id INT NOT NULL,
    semester ENUM('Fall', 'Spring', 'Summer') NOT NULL,
    year INT NOT NULL,
    room_number VARCHAR(20),
    max_capacity INT NOT NULL,
    meeting_days VARCHAR(20),
    start_time TIME,
    end_time TIME,
    FOREIGN KEY (course_id) REFERENCES courses(course_id),
    FOREIGN KEY (teacher_id) REFERENCES teachers(teacher_id)
);



-- Enrollments to track student registration in classes
-- Perfect for practicing many-to-many relationships
CREATE TABLE enrollments (
    enrollment_id INT PRIMARY KEY AUTO_INCREMENT,
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    enrollment_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    grade CHAR(2),
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (section_id) REFERENCES class_sections(section_id)
);

-- Attendance tracking
-- Great for practicing date operations and aggregations
CREATE TABLE attendance (
    attendance_id INT PRIMARY KEY AUTO_INCREMENT, 
    student_id INT NOT NULL,
    section_id INT NOT NULL,
    attendance_date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'Late') NOT NULL,
    FOREIGN KEY (student_id) REFERENCES students(student_id),
    FOREIGN KEY (section_id) REFERENCES class_sections(section_id)
);

-- Events table for school activities
-- Useful for practicing temporal queries and full-text search
CREATE TABLE events (
    event_id INT PRIMARY KEY AUTO_INCREMENT,
    event_name VARCHAR(100) NOT NULL,
    description TEXT,
    start_datetime DATETIME NOT NULL,
    end_datetime DATETIME NOT NULL,
    location VARCHAR(100),
    organizer_id INT,
    FOREIGN KEY (organizer_id) REFERENCES teachers(teacher_id)
);

-- Create a view for easy access to student performance
CREATE VIEW student_performance AS
SELECT 
    s.student_id,
    s.first_name,
    s.last_name,
    c.course_name,
    cs.semester,
    cs.year,
    e.grade
FROM students s
JOIN enrollments e ON s.student_id = e.student_id
JOIN class_sections cs ON e.section_id = cs.section_id
JOIN courses c ON cs.course_id = c.course_id;

-- Insert sample data for departments
INSERT INTO departments (department_name, budget) VALUES
('Computer Science', 500000.00),
('Mathematics', 400000.00),
('Physics', 450000.00);

-- Insert sample data for teachers
INSERT INTO teachers (department_id, first_name, last_name, email, hire_date, salary) VALUES
(1, 'John', 'Smith', 'john.smith@school.edu', '2020-08-15', 75000.00),
(2, 'Mary', 'Johnson', 'mary.johnson@school.edu', '2019-06-20', 72000.00);

-- Insert sample data for students
INSERT INTO students (first_name, last_name, date_of_birth, enrollment_date, email) VALUES
('Alice', 'Brown', '2000-03-15', '2022-09-01', 'alice.brown@student.edu'),
('Bob', 'Wilson', '2001-07-22', '2022-09-01', 'bob.wilson@student.edu');

INSERT INTO attendance (student_id, section_id, attendance_date, status) VALUES
(1, 1, '2024-12-01', 'Present'),
(2, 1, '2024-12-01', 'Absent'),
(1, 2, '2024-12-02', 'Late'),
(2, 2, '2024-12-02', 'Present'),
(1, 1, '2024-12-03', 'Present'),
(2, 1, '2024-12-03', 'Late'),
(1, 3, '2024-12-04', 'Absent'),
(2, 3, '2024-12-04', 'Present'),
(1, 2, '2024-12-05', 'Present'),
(2, 2, '2024-12-05', 'Present');
