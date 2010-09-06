SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[ChangePassword]
    @UserId INT,
    @NewPass VARBINARY(16),
    @OldPass VARBINARY(16)
AS 
    SET NOCOUNT ON
	
	DECLARE @usrid AS INT
    SELECT  @usrid = Id
    FROM    Users
    WHERE   id = @UserId AND [Password] = @oldPass
	
    IF @usrid IS NULL 
        BEGIN
            SELECT  2 AS Status -- invalid old password
            RETURN 
        END
	
    UPDATE  Users
    SET     [Password] = @newPass
    WHERE   Id = @UserId
    
    SELECT  1 AS Status


GO
