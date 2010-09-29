
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[MyMessages]
    @UserId INT 
AS 
    SELECT [Messages].*, Users.LastName + ' ' + users.FirstName AS Fullname FROM [Messages] 
    INNER JOIN Users ON [Messages].Writer = Users.id
    WHERE Writer = @UserId
    ORDER BY id DESC 
GO
