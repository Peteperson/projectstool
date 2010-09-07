
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersByType]
    @Function AS NVARCHAR(25),
    @UserType AS NVARCHAR(200) = ''
AS 
    SET NOCOUNT ON

	IF (@Function='allusers')
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		WHERE users.IsActive = 1 AND IsUser = 1
	ELSE IF @Function='include'
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) > 0 AND users.IsActive = 1 AND IsUser = 1
	ELSE IF @Function='exclude'
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) = 0 AND users.IsActive = 1 AND IsUser = 1
GO
