
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersByTypeNoone]
    @Function AS NVARCHAR(25),
    @UserType AS NVARCHAR(200) = ''
AS 
    SET NOCOUNT ON

	IF (@Function='allusers')
		BEGIN 
			SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
			WHERE users.IsActive = 1 AND IsUser = 1
			UNION ALL
			SELECT 0, [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
			ORDER BY Fullname
		END 
	ELSE IF @Function='include'
		BEGIN 
			SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
			INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
			WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) > 0 AND users.IsActive = 1 AND IsUser = 1
			UNION ALL
			SELECT 0, [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
			ORDER BY Fullname
		END 
	ELSE IF @Function='exclude'
		BEGIN
			SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
			INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
			WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) = 0 AND users.IsActive = 1 AND IsUser = 1
			UNION ALL
			SELECT 0, [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
			ORDER BY Fullname
		END
GO
