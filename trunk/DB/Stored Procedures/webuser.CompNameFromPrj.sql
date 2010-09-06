SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO


CREATE PROCEDURE [webuser].[CompNameFromPrj]
    @ProjectId AS INT
AS 
    SET NOCOUNT ON
	
	SELECT Companies.Name AS CompanyName FROM Companies
	INNER JOIN Projects ON Projects.CustomerId = Companies.id
	WHERE Projects.id = @ProjectId
GO
