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
	WHERE Company = (SELECT CustomerId FROM Projects WHERE id = @ProjectId) OR Companies.Name = 'Advent'
	UNION ALL 
	SELECT 0, ' ' + [Description] FROM VariousTypes WHERE Category = 'NoResponsibleText'
	ORDER BY FullName


GO
