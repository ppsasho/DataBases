-- Find all Students with FirstName = Antonio
Select *
From Student 
Where FirstName = 'Antonio'

-- Find all Students with DateOfBirth greater than ‘01.01.1999’
Select *
From Student
Where DateOfBirth > '1999-01-01'

-- Find all Students with LastName starting With ‘J’ enrolled in January/1998
Select *
From Student
Where LastName LIKE 'J%' 
			   AND EnrolledDate >= '1998-01-01'
			   AND EnrolledDate < '1998-02-01'

-- List all Students ordered by FirstName
Select *
From Student
Order by FirstName

-- List all Teacher Last Names and Student Last Names in single result set.
Select LastName
From Teacher
Union all
Select LastName
From Student

-- Remove duplicates
Select LastName
From Teacher
Union
Select LastName
From Student

-- Create Foreign key constraints from diagram or with script
ALTER TABLE Grade  ADD  CONSTRAINT FK_Grade_Teacher1 FOREIGN KEY(TeacherID)
REFERENCES Teacher (ID)

ALTER TABLE Grade ADD CONSTRAINT FK_Grade_Student1 FOREIGN KEY(StudentID)
REFERENCES Student (ID)

ALTER TABLE Grade ADD CONSTRAINT FK_Grade_Course1 FOREIGN KEY(CourseID)
REFERENCES Course (ID)

-- List all possible combinations of Courses names and AchievementType
-- names that can be passed by student
Select c.[Name], a.[Name] 
From Course as c
Cross Join AchievementType as a

-- List all Teachers without exam Grade
Select t.FirstName, t.LastName, t.AcademicRank, g.TeacherID
From Teacher as t
Left Outer Join Grade as g ON g.TeacherID IS NULL