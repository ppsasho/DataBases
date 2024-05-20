Select Sum(TotalPrice)
From Orders

--Commented queries are additional

--Select Count(*)
--From Customers

--Select STRING_AGG([Name], ' ,')
--From Customers

Select b.Id, b.[Name], Sum(o.TotalPrice)
From Orders as o
Inner Join BusinessEntities as b ON o.BusinessEntityId = b.Id
Group by b.Id, b.[Name]

Select b.Id
	,b.[Name]
	,Sum(o.TotalPrice)
From Orders as o
Inner Join BusinessEntities as b ON o.BusinessEntityId = b.Id
Group by b.Id
		,b.Name

Select b.Id, b.[Name], Max(o.TotalPrice) as MaxPrice, AVG(TotalPrice) as AvgPrice
From Orders as o
Inner Join BusinessEntities as b ON o.BusinessEntityId = b.Id
Group by b.Id, b.Name

Select c.Id, c.[Name], STRING_AGG(e.FirstName + ' ' + e.LastName, ' ,')
From Orders as o
Inner Join Customers as c ON o.CustomerId = c.Id
Inner Join Employees as e ON o.CustomerId = e.Id
Group by c.Id, c.[Name]