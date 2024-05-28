-- Create new procedure called CreateGradeDetail;

Create procedure dbo.CreateGradeDetail(@GradeID int, @AchievementTypeID int, @AchievementPoints int, @AchievementMaxPoints int)
As
Begin
-- Procedure should add details for specific Grade (new record for new
-- AchievementTypeID, Points, MaxPoints, Date for specific Grade);
	
	INSERT INTO [dbo].[GradeDetails]
           ([GradeID]
           ,[AchievementTypeID]
           ,[AchievementPoints]
           ,[AchievementMaxPoints]
           ,[AchievementDate])

    VALUES(
		 @GradeID
		,@AchievementTypeID
		,@AchievementPoints
		,@AchievementMaxPoints
		,GETDATE())

-- Output from this procedure should be resultset with SUM of
-- GradePoints calculated with formula
-- AchievementPoints/AchievementMaxPoints*ParticipationRate for
-- specific 
	Declare @GradePoints int
	Select @GradePoints = (@AchievementPoints / @AchievementMaxPoints) * a.ParticipationRate
	From AchievementType as a
	Where a.ID = @AchievementTypeID

	Select @GradePoints as GradePoints

End
