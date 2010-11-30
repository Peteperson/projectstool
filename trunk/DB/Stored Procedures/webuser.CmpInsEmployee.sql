SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[CmpInsEmployee]
	@UserName nvarchar(20), 
	@FirstName NVARCHAR(50),  
	@LastName NVARCHAR(50), 
	@Telephone NVARCHAR(13), 
	@Mobile NVARCHAR(13), 
	@Email NVARCHAR(50), 
	@CompanyId INT,
	@Position INT  
AS 
    SET NOCOUNT ON
  
    INSERT INTO webuser.Users (UserName, UserType, FirstName, LastName, Telephone, Mobile, Email, DefaultPage)
    VALUES (@UserName, 41, @FirstName, @LastName, @Telephone, @Mobile, @Email, 18)

	DECLARE @UserId INT
	SELECT @UserId = SCOPE_IDENTITY()

	IF (@UserId > 0 AND @@ERROR = 0)
		INSERT INTO webuser.UsersCompanies (UserId, CompanyId, Position)
		VALUES (@UserId, @CompanyId, @Position)
	
	
GO
