 -------------------------------------------------- -- 9.1 Database Creation -------------------------------------------------- 
 
CREATE DATABASE StudentPlacement; 
USE StudentPlacement; 
 -------------------------------------------------- -- 9.2 Table Creation -------------------------------------------------- 
 -- Department Table 
CREATE TABLE Department ( 
    Department_ID INT PRIMARY KEY, 
    Department_Name VARCHAR(50) NOT NULL 
); 
 -- Student Table 
CREATE TABLE Student ( 
    Student_ID INT PRIMARY KEY, 
    Student_Name VARCHAR(50) NOT NULL, 
    Department_ID INT, 
    Course VARCHAR(50), 
    Year_Of_Study INT, 
    CGPA DECIMAL(3,2), 
    FOREIGN KEY (Department_ID) REFERENCES Department(Department_ID) 
); 
 -- Company Table 
CREATE TABLE Company ( 
    Company_ID INT PRIMARY KEY, 
    Company_Name VARCHAR(50) NOT NULL, 
    Industry_Type VARCHAR(50), 
    Location VARCHAR(50) 
); 
 -- Placement Table 
CREATE TABLE Placement ( 
    Placement_ID INT PRIMARY KEY, 
    Student_ID INT, 
    Company_ID INT, 
    Job_Role VARCHAR(50), 
    Salary_Package DECIMAL(10,2), 
    Placement_Date DATE, 
    FOREIGN KEY (Student_ID) REFERENCES Student(Student_ID), 
    FOREIGN KEY (Company_ID) REFERENCES Company(Company_ID) 
); 
-------------------------------------------------- -- 9.3 Data Insertion (5 Records Each) -------------------------------------------------- -- Department Data 
INSERT INTO Department VALUES 
(1, 'Computer Science'), 
(2, 'Information Technology'), 
(3, 'Electronics'), 
(4, 'Mechanical'), 
(5, 'Civil'); -- Student Data 
INSERT INTO Student VALUES 
(101, 'Rahul Sharma', 1, 'B.Tech', 4, 8.20), 
(102, 'Anita Verma', 2, 'B.Tech', 4, 8.70), 
(103, 'Suresh Kumar', 3, 'B.Tech', 4, 7.80), 
(104, 'Neha Singh', 1, 'B.Tech', 4, 9.10), 
(105, 'Amit Patel', 2, 'B.Tech', 4, 8.00); -- Company Data 
INSERT INTO Company VALUES 
(201, 'TCS', 'IT Services', 'Bangalore'), 
(202, 'Infosys', 'IT Services', 'Pune'), 
(203, 'Wipro', 'IT Services', 'Hyderabad'), 
(204, 'Accenture', 'Consulting', 'Mumbai'), 
(205, 'Cognizant', 'IT Services', 'Chennai'); -- Placement Data 
INSERT INTO Placement VALUES 
(301, 101, 201, 'Software Engineer', 450000, '2024-01-10'), 
(302, 102, 202, 'System Analyst', 500000, '2024-01-15'), 
(303, 103, 203, 'Programmer Analyst', 420000, '2024-01-20'), 
(304, 104, 204, 'Associate Developer', 600000, '2024-01-25'), 
(305, 105, 205, 'Junior Engineer', 480000, '2024-01-30'); -------------------------------------------------- -- 9.4 Data Retrieval -------------------------------------------------- 
SELECT Student_Name, Company_Name, Job_Role, Salary_Package 
FROM Student 
JOIN Placement ON Student.Student_ID = Placement.Student_ID 
JOIN Company ON Placement.Company_ID = Company.Company_ID; -------------------------------------------------- -- 9.5 Advanced Queries -------------------------------------------------- 
19 
-- GROUP BY 
SELECT Department_ID, COUNT(Student_ID) AS Total_Students 
FROM Student 
GROUP BY Department_ID; -- HAVING 
SELECT Department_ID, COUNT(Student_ID) AS Total_Students 
FROM Student 
GROUP BY Department_ID 
HAVING COUNT(Student_ID) > 1; -- Subquery 
SELECT Student_Name 
FROM Student 
WHERE Student_ID IN ( 
SELECT Student_ID 
FROM Placement 
WHERE Salary_Package > 450000 
); -------------------------------------------------- -- View Creation -------------------------------------------------- 
CREATE VIEW Placement_View AS 
SELECT Student_Name, Company_Name, Job_Role, Salary_Package 
FROM Student 
JOIN Placement ON Student.Student_ID = Placement.Student_ID 
JOIN Company ON Placement.Company_ID = Company.Company_ID; 