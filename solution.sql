CREATE VIEW StudentDetails AS
SELECT 
    s.StudentID,
    s.StudentName,
    s.DepartmentID,
    c.CourseID,
    c.CourseName
FROM Student s
JOIN Enrollment e
    ON s.StudentID = e.StudentID
JOIN Course c
    ON e.CourseID = c.CourseID;
