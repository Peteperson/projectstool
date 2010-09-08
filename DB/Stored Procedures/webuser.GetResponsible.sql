
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[GetResponsible]
    @ProjectId AS INT 
AS 
    SET NOCOUNT ON

	SELECT Users.id, Users.LastName + ' ' + Users.FirstName AS FullName FROM Users
	INNER JOIN Companies ON Companies.id = Users.Company
	INNER JOIN VariousTypes ON Users.UserType = VariousTypes.id
	WHERE Company = (SELECT CustomerId FROM Projects WHERE id = @ProjectId) 
		OR VariousTypes.Description NOT IN ('Admin', 'Partner', 'Client')
	UNION ALL 
	SELECT 0, ' ' + [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
	ORDER BY FullName


GO
