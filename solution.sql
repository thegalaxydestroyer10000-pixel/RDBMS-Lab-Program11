CREATE DATABASE CollegeDB;
USE CollegeDB;

CREATE TABLE Department (
    DepartmentID INT PRIMARY KEY,
    DepartmentName VARCHAR(50)
);

CREATE TABLE Student (
    StudentID INT PRIMARY KEY,
    StudentName VARCHAR(50),
    DepartmentID INT,
    FOREIGN KEY (DepartmentID) REFERENCES Department(DepartmentID)
);

CREATE TABLE Course (
    CourseID INT PRIMARY KEY,
    CourseName VARCHAR(50)
);

CREATE TABLE Enrollment (
    EnrollmentID INT PRIMARY KEY,
    StudentID INT,
    CourseID INT,
    FOREIGN KEY (StudentID) REFERENCES Student(StudentID),
    FOREIGN KEY (CourseID) REFERENCES Course(CourseID)
);

INSERT INTO Department VALUES
(1, 'Computer Science'),
(2, 'BCA'),
(3, 'Commerce');

INSERT INTO Student VALUES
(101, 'Mohan', 2),
(102, 'Nitish', 2),
(103, 'Arun', 1);

INSERT INTO Course VALUES
(201, 'Database Management System'),
(202, 'Python Programming'),
(203, 'Web Development');

INSERT INTO Enrollment VALUES
(1, 101, 201),
(2, 101, 202),
(3, 102, 203),
(4, 103, 201);

CREATE VIEW StudentDetails AS
SELECT
    s.StudentName,
    c.CourseName,
    d.DepartmentName
FROM Student s
JOIN Enrollment e ON s.StudentID = e.StudentID
JOIN Course c ON e.CourseID = c.CourseID
JOIN Department d ON s.DepartmentID = d.DepartmentID;

SELECT * FROM StudentDetails;

