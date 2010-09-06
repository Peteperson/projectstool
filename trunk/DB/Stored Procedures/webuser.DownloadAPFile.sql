SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[DownloadAPFile]
    @FileId AS INT
AS 
    SET NOCOUNT ON

	SELECT * FROM ActionPlans WHERE id = @FileId


GO
