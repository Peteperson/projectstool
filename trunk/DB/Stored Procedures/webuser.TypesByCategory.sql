SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[TypesByCategory]
    @Category AS NVARCHAR(35)
AS 
    SET NOCOUNT ON

	SELECT id, [Description] FROM VariousTypes
	WHERE Category = @Category
        ORDER BY [Description]
GO
