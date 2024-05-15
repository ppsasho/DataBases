--Create Schema [hr]

--Create table [hr].Employees 
--(
--	[EmployeeId] [int] NOT NULL,
--	[Name] [nvarchar] (50) NOT NULL
--)

--Select * From hr.Employees

--ALTER TABLE dbo.Customers
----ADD Email nvarchar (50) NOT NULL
--ALTER COLUMN Email nvarchar(25)

--ALTER TABLE Customers
--RENAME COLUMN Email to EmailAdress
--EXEC sp_rename 'Customers.EmailAddress', 'EmailAddress', 'COLUMN'
--DROP COLUMN EmailAddress

--INSERT INTO Customers (CustomerId, [Name], City)
--Values
--(1, 'Sasho Popovski', 'Skopje')
--(2, 'David Davidsky', 'Prilep')

select * from Customers

--Update Customers
--SET City = 'Skopje' where CustomerId = 1

--delete from Customers 
--where City = 'Prilep'
