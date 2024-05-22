Declare @EmployeeName nvarchar(100)
Set @EmployeeName = 'Aleksandar'

Select *
From Employees
Where FirstName = @EmployeeName

Declare @FemaleEmployees Table(EmployeeId int, DateOfBirth date)

Insert into @FemaleEmployees
Select Id, DateOfBirth 
From Employees
Where Gender <> 'M'

Create Table #MaleEmployeesTable (LastName nvarchar(100), HireDate date)

Insert into #MaleEmployeesTable
Select LastName, HireDate
From Employees
Where Left(FirstName, 1) = 'A'
	AND Gender = 'M'

Select * From #MaleEmployeesTable

Drop table #MaleEmployeesTable

