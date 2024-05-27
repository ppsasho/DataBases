Create procedure dbo.sp_CreateOrder(
	@BusinessEntityId int
	,@CustomerId int
	,@EmployeeId int
	,@Comment nvarchar(max)
)
As
Begin
	INSERT INTO [dbo].[Orders]
           ([OrderDate]
           ,[Status]
           ,[BusinessEntityId]
           ,[CustomerId]
           ,[EmployeeId]
           ,[TotalPrice]
           ,[Comment])
     VALUES
           (GETDATE()
           ,0
           ,@BusinessEntityId
           ,@CustomerId
           ,@EmployeeId
           ,0
           ,@Comment)

		   Select Count(*) From Orders
		   Where CustomerId = @CustomerId

		   Select Sum(TotalPrice)
		   From Orders
		   Where CustomerId = @CustomerId
		   AND BusinessEntityId = @BusinessEntityId

End