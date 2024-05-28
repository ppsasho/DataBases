-- Create new procedure called CreateGrade;
-- Procedure should create only Grade header info (not Grade Details);
-- Procedure should return the total number of grades in the system for
-- the Student on input (from the CreateGrade);
-- Procedure should return second resultset with the MAX Grade of all
-- grades for the Student and Teacher on input (regardless the Course).

Create procedure dbo.sp_CreateGrade(
	 @StudentId int
	,@CourseId int
	,@TeacherId int
	,@Grade int
	,@Comment nvarchar(200)
	,@CreatedDate date)

	As

Begin

	INSERT INTO [dbo].[Grade]
           ([StudentID]
           ,[CourseID]
           ,[TeacherID]
           ,[Grade]
           ,[Comment]
           ,[CreatedDate])
     VALUES
           (@StudentId
           ,@CourseId
           ,@TeacherId
           ,@Grade
           ,@Comment
           ,@CreatedDate)

		   
		   Select StudentID, s.[FirstName], s.LastName, Count(Grade) as TotalGrades
		   From Grade as g
		   Inner join Student as s on s.ID = @StudentId
		   Where StudentID = 1
		   group by StudentID, s.[FirstName], s.LastName
		   
		   Select g.StudentID, s.FirstName, s.LastName, t.ID as TeacherID, t.FirstName as TeacherName, Max(Grade) as MaxGrade
		   From Grade as g
		   Inner join Teacher as t ON TeacherID = t.ID
		   Inner join Student as s ON StudentID = s.ID
		   Where StudentID = @StudentId AND
				 TeacherID = @TeacherId
		   Group by g.StudentID, t.FirstName, s.LastName, t.ID, s.FirstName
End