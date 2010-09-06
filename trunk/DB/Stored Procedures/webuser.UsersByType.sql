SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersByType]
    @UserType AS NVARCHAR(35)
AS 
    SET NOCOUNT ON

	IF (@UserType='*')
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		INNER JOIN webuser.Companies ON users.Company = webuser.Companies.Id	
		WHERE users.IsActive = 1 AND IsUser = 1 AND webuser.Companies.Name = 'Advent' 
			AND webuser.Users.UserType <> (SELECT id FROM webuser.VariousTypes WHERE Category = 'UserType' AND [Description] = 'DataEntry')
	ELSE 
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE VariousTypes.[Description] = @UserType AND users.IsActive = 1 AND IsUser = 1


GO
