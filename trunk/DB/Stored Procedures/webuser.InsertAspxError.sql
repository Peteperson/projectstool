SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[InsertAspxError]
    @URL NVARCHAR(250) = '',
    @Exception NVARCHAR(500) = '',
    @UserIP NVARCHAR(15) = '',
    @UserId INT = NULL,
    @ServerName NVARCHAR(64) = ''
AS 
    SET NOCOUNT ON
  
    INSERT  INTO [ErrorLog]
           ([UserId], [ServerName], [IP], [URL], [Error])
    VALUES  (
		@UserId, @ServerName, @UserIP, @URL, @Exception)


GO
