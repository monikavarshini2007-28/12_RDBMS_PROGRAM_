CREATE DATABASE MANAGEMENT;
USE MANAGEMENT;

CREATE TABLE Student (
StudentID INT,
StudentName VARCHAR(30),
CourseName VARCHAR(30),
FacultyName VARCHAR(30),
DepartmentName VARCHAR(30)
);

INSERT INTO Student VALUES
(1001, 'Arun', 'DBMS', 'Ravi', 'CSE'),
(1002, 'Divya', 'Python', 'Kumar', 'IT'),
(1003, 'Karthik', 'DBMS', 'Ravi', 'CSE');

SELECT * FROM Student;

CREATE TABLE Student_3NF (
StudentID INT PRIMARY KEY,
StudentName VARCHAR(30)
);

CREATE TABLE Department_3NF (
DepartmentID INT PRIMARY KEY,
DepartmentName VARCHAR(30)
);

CREATE TABLE Faculty_3NF (
FacultyID INT PRIMARY KEY,
FacultyName VARCHAR(30),
DepartmentID INT,
FOREIGN KEY (DepartmentID)
REFERENCES Department_3NF(DepartmentID)
);

CREATE TABLE Course_3NF (
CourseID INT PRIMARY KEY,
CourseName VARCHAR(30),
FacultyID INT,
FOREIGN KEY (FacultyID)
REFERENCES Faculty_3NF(FacultyID)
);

CREATE TABLE Enrollment_3NF (
StudentID INT,
CourseID INT,
PRIMARY KEY (StudentID, CourseID),
FOREIGN KEY (StudentID)
REFERENCES Student_3NF(StudentID),
FOREIGN KEY (CourseID)
REFERENCES Course_3NF(CourseID)
);

INSERT INTO Department_3NF VALUES
(101, 'CSE'),
(102, 'IT');

INSERT INTO Faculty_3NF VALUES
(201, 'Ravi', 101),
(202, 'Kumar', 102);

INSERT INTO Student_3NF VALUES
(1001, 'Arun'),
(1002, 'Divya'),
(1003, 'Karthik');

INSERT INTO Course_3NF VALUES
(301, 'DBMS', 201),
(302, 'Python', 202);

INSERT INTO Enrollment_3NF VALUES
(1001, 301),
(1002, 302),
(1003, 301);

SELECT * FROM Student_3NF;
SELECT * FROM Department_3NF;
SELECT * FROM Faculty_3NF;
SELECT * FROM Course_3NF;
SELECT * FROM Enrollment_3NF
