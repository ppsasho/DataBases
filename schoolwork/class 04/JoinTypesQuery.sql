Select c.[Name], p.[Name]
From Customers as c
Cross Join Products as p
Order by c.[Name]

Select Distinct b.[Name]
From BusinessEntities as b
Inner Join Orders as o ON o.BusinessEntityId = b.Id

Select *
From BusinessEntities as b
Left Outer Join Orders as o ON b.Id = o.BusinessEntityId
Where o.Id IS NULL

Select *
From Customers as c
Left Outer Join Orders as o ON c.Id = o.CustomerId
Where o.Id IS NULL

Select *
From Orders as o
Right Outer Join Customers as c ON o.CustomerId = c.Id
Where o.CustomerId IS NULL