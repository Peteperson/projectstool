SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[CompanyEmployees]
    @CompanyId INT 
AS 
    SET NOCOUNT ON
    SELECT * FROM Users
    WHERE Company = @CompanyId
    ORDER BY LastName, FirstName


GO
