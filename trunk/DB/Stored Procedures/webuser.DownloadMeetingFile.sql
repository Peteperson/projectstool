SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[DownloadMeetingFile]
    @FileId AS INT
AS 
    SET NOCOUNT ON

	SELECT * FROM Meetings WHERE id = @FileId


GO
