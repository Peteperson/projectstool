
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[InsertActivity]
    @UserId INT = NULL,
    @URL NVARCHAR(250) = '',
    @UserIP NVARCHAR(15) = '',
    @BrowserName NVARCHAR(64) = '',
    @Status INT = 0,
    @ExtraInfo NVARCHAR(100) = ''
AS 
    SET NOCOUNT ON
  
	INSERT INTO [ActivityLog]
           ([UserId], [URL], [IP], [BrowserName], [Status], [ExtraInfo])
    VALUES
           (@UserId, @URL, @UserIP, @BrowserName, @Status, @ExtraInfo)


GO
