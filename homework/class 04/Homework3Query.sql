-- Calculate the count of all grades per Teacher in the system
Select t.ID, t.FirstName, t.LastName, t.AcademicRank, Count(g.ID) as Grades
From Grade as g
Inner Join Teacher as t ON t.ID = g.TeacherID
Group by t.ID, t.FirstName, t.LastName, t.AcademicRank

-- Calculate the count of all grades per Teacher in the system for first 100
-- Students (ID < 100)
Select t.ID, t.FirstName, t.LastName, t.AcademicRank, Count(g.ID) as Grades
From Grade as g
Inner Join Teacher as t ON t.ID = g.TeacherID
Where g.StudentID < 100
Group by t.ID, t.FirstName, t.LastName, t.AcademicRank

-- Find the Maximal Grade, and the Average Grade per Student on all grades in
-- the system
Select s.ID, s.FirstName, s.LastName, AVG(g.Grade) as AvarageGrade, MAX(g.Grade) MaximumGrade
From Grade as g
Inner Join Student as s ON g.StudentID = s.ID
Group by s.ID, s.FirstName, s.LastName

-- Calculate the count of all grades per Teacher in the system and filter only
-- grade count greater then 200
Select t.ID, t.FirstName, t.LastName, t.AcademicRank, Count(g.ID) as Grades
From Grade as g
Inner Join Teacher as t ON t.ID = g.TeacherID
Group by t.ID, t.FirstName, t.LastName, t.AcademicRank
Having Count(g.ID) > 200

-- Find the Grade Count, Maximal Grade, and the Average Grade per Student on
-- all grades in the system. Filter only records where Maximal Grade is equal to
-- Average Grade
-- +
-- List Student First Name and Last Name next to the other details from previous
-- query
Select s.ID, s.FirstName, s.LastName, Count(g.Grade), AVG(g.Grade) as AvarageGrade, MAX(g.Grade) MaximumGrade
From Grade as g
Inner Join Student as s ON g.StudentID = s.ID
Group by s.ID, s.FirstName, s.LastName
Having MAX(g.Grade) = AVG(g.Grade)


-- Create new view (vv_StudentGrades) that will List all StudentIds and count of
-- Grades per student
Create view vv_StudentGrades
As
Select g.StudentID, Count(g.Grade) as Grades
From Student as s
Inner Join Grade as g ON g.StudentID = s.ID
Group by g.StudentID

-- Change the view to show Student First and Last Names instead of StudentID
-- List all rows from view ordered by biggest Grade Count
Alter view vv_StudentGrades
As
Select s.FirstName, s.LastName, Count(g.Grade) as Grades
From Student as s
Inner Join Grade as g ON g.StudentID = s.ID
Group by s.FirstName, s.LastName

Select * From vv_StudentGrades
Order by Grades DESC