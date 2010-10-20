
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UsersByType]
    @Function AS NVARCHAR(25),
    @UserType AS NVARCHAR(400) = ''
AS 
    SET NOCOUNT ON

	IF (@Function='allusers')
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM webuser.Users
		WHERE users.IsActive = 1 AND IsUser = 1
		ORDER BY LastName, FirstName
	ELSE IF @Function='include'
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM webuser.Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) > 0 AND users.IsActive = 1 AND IsUser = 1
		ORDER BY LastName, FirstName
	ELSE IF @Function='exclude'
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM webuser.Users
		INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
		WHERE PATINDEX('%' + RTRIM(VariousTypes.[Description]) + '%', @UserType) = 0 AND users.IsActive = 1 AND IsUser = 1
		ORDER BY LastName, FirstName
	ELSE IF @Function='Advent'
		SELECT Users.id, LastName + ' ' + FirstName AS Fullname FROM webuser.Users
		INNER JOIN webuser.UsersCompanies ON Users.id = UsersCompanies.UserId
		INNER JOIN webuser.Companies ON UsersCompanies.CompanyId = Companies.Id
		WHERE webuser.Companies.Name = 'Advent' AND users.IsActive = 1 AND IsUser = 1
		ORDER BY LastName, FirstName
GO
