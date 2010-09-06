SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[SubProjectsPlusEmpty]
    @UserId INT 
AS 
    SET NOCOUNT ON
	
	DECLARE @tmp TABLE (
		id int,
		SubProject NVARCHAR(15)
	)

	INSERT INTO @tmp
	exec Projectlist @UserId
	
	SELECT Projects.id, Projects.SubProject FROM Projects 
	INNER JOIN @tmp t1 ON t1.id = Projects.id
	UNION ALL
	SELECT 0, ''
	ORDER BY Projects.SubProject


GO
