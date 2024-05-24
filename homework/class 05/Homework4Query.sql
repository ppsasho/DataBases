--Declare scalar variable for storing FirstName values
Declare @FirstName nvarchar(100)

--Assign value ‘Antonio’ to the FirstName variable
Set @FirstName = 'Antonio'

--Find all Students having FirstName same as the variable
Select * From Student
Where FirstName = @FirstName

--Declare table variable that will contain StudentId, StudentName and DateOfBirth
--Fill the table variable with all Female students
Declare @StudentList table (StudentId int, StudentName nvarchar(100), DateOfBirth date)
Insert into @StudentList
Select s.ID, s.FirstName, s.DateOfBirth
From Student as s
Where Gender <> 'M'
Select * From @StudentList

--Declare temp table that will contain LastName and EnrolledDate columns
--Fill the temp table with all Male students having First Name starting with ‘A’
--Retrieve the students from the table which last name is with 7 characters
Create table #MaleStudentList (LastName nvarchar(150), EnrolledDate date)
Insert into #MaleStudentList
Select s.LastName, s.EnrolledDate From Student as s
Where Gender = 'M' AND FirstName LIKE 'A%'

Select * From #MaleStudentList where LEN(LastName) = 7
Drop table #MaleStudentList

--Find all teachers whose FirstName length is less than 5 and
--the first 3 characters of their FirstName and LastName are the same
Select * from Teacher as t
where LEN(FirstName) < 5 AND
	  SUBSTRING(LastName, 1, 3) = SUBSTRING(FirstName, 1, 3)