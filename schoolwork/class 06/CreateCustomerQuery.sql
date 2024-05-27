Create procedure dbo.sp_CreateCustomer(
	@CustomerName nvarchar(100)
	,@AccountNumber nvarchar(100)
	,@RegionName nvarchar(100)
	,@City nvarchar(100)
	,@CustomerSize nvarchar(10)
	,@PhoneNumber nvarchar(20)
	,@IsActive bit
)
As
Begin
	Insert into Customers ([Name], AccountNumber, City, RegionName, CustomerSize, PhoneNumber, IsActive)
	Values(@CustomerName, @AccountNumber, @City, @RegionName, @CustomerSize, @PhoneNumber, @IsActive)

	Select Count(*) as TotalNumberOfCustomersStartingWithSameLetter
	From Customers
	Where Left([Name], 1) = Left(@CustomerName, 1)

	Select *
	From Customers
	Where [RegionName] = @RegionName
End