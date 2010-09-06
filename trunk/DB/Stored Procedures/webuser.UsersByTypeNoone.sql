SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersByTypeNoone]
    @UserType AS NVARCHAR(35)
AS 
    SET NOCOUNT ON

	IF (@UserType='*')
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		WHERE users.IsActive = 1 AND IsUser = 1
		UNION ALL
		SELECT 0, [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
		ORDER BY id 
	ELSE 
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE VariousTypes.[Description] = @UserType AND users.IsActive = 1 AND IsUser = 1
		UNION ALL
		SELECT 0, [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
		ORDER BY id


GO
