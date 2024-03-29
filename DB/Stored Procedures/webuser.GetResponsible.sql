
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[GetResponsible]
    @ProjectId AS INT 
AS 
    SET NOCOUNT ON

	SELECT DISTINCT usr.id, usr.LastName + ' ' + usr.FirstName AS FullName FROM webuser.Users usr
	INNER JOIN webuser.UsersCompanies ucmp ON usr.id = ucmp.UserId
	INNER JOIN VariousTypes ON usr.UserType = VariousTypes.id
	WHERE (ucmp.CompanyId = (SELECT CustomerId FROM Projects WHERE id = @ProjectId) 
		OR VariousTypes.Description NOT IN ('Admin', 'Client')) AND usr.IsActive = 1
	UNION ALL 
	SELECT 0, ' ' + [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
	ORDER BY FullName
GO
