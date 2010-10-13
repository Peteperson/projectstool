SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[UserRightsList]
    @UserType INT 
AS 
 
	SELECT up.*, vt.Description AS UserTypeText, pg.Description AS PageText
	FROM webuser.UserPages up
	INNER JOIN webuser.VariousTypes vt ON up.UserType = vt.id
	INNER JOIN webuser.Pages pg ON up.PageId = pg.id
	WHERE ([UserType] = @UserType)
GO
