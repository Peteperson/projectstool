SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[CompaniesPlusNone]

AS 
    SET NOCOUNT ON

	SELECT id, Name FROM Companies
	UNION ALL
	SELECT 0, [Description] AS Name FROM VariousTypes WHERE Category = 'NoResponsibleText'
	ORDER BY NAME 
GO
