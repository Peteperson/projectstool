SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[DownloadFile]
    @FileId AS INT
AS 
    SET NOCOUNT ON

	SELECT * FROM ProjectFiles
	WHERE id = @FileId


GO
