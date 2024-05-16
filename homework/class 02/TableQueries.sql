Use SEDCACADEMYDB

Create table Students
(
	[ID]int NOT NULL,
	Constraint SEDCACADEMY_Studetns_ID PRIMARY KEY (ID),
	[FirstName] nvarchar(20) NOT NULL,
	[LastName] nvarchar(20)NOT NULL,
	[DateOfBirth] datetime NOT NULl,
	[EnrolledDate] date NOT NULL,
	[Gender] bit NOT NULL,
	[NationalIDNumber] nvarchar(25) NOT NULL,
	[StudentCardNumber] nvarchar(30) NOT NULL
)

Create table Teachers
(
	[ID] int NOT NULL,
	Constraint SEDCACADEMY_Teachers_ID PRIMARY KEY (ID),
	[FirstName] nvarchar(20) NOT NULL,
	[LastName] nvarchar(20)NOT NULL,
	[DateOfBirth] datetime NOT NULl,
	[AcademicRank] nvarchar(15) NOT NULL,
	[HireDate] datetime NOT NULL
)

Create Table Courses 
(
	[ID] int NOT NULL,
	Constraint SEDCACADEMY_Courses_ID PRIMARY KEY (ID),
	[Name] nvarchar(25) NOT NULL,
	[Credit] smallint NOT NULL,
	[AcademicYear] date NOT NULL,
	[Semester] nvarchar(25) NOT NULL
)

Create table Grades
(
	[ID] int NOT NULL,
	Constraint SEDCACADEMY_Grades_ID PRIMARY KEY (ID),
	[StudentID] int NOT NULL,
	[CourseID] int NOT NULL,
	[TeacherID] int NOT NULL,
	[Grade] smallint NOT NULL,
	[Comment] nvarchar(100) NOT NULL,
	[CreatedDate] datetime NOT NULL
)

Create table AchievementTypes
(
	[ID] int NOT NULL,
	Constraint SEDCACADEMY_AvievementTypes_ID PRIMARY KEY (ID),
	[Name] nvarchar(25) NOT NULL,
	[Description] nvarchar(100) NOT NULL,
	[ParticipationRate] nvarchar(20) NOT NULL
)

Create table GradeDetails
(
	[ID] int NOT NULL,
	Constraint SEDCACADEMY_GradeDetails_ID PRIMARY KEY (ID),
	[GradeID] int NOT NULL,
	[AchievementTypeID] int NOT NULL,
	[AchievementPoints] smallint NOT NULL,
	[AchievementMaxPoints] smallint NOT NULL,
	[AchievementDate] datetime NOT NULL
)
