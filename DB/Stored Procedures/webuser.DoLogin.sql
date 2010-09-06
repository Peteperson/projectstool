SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[DoLogin]
    @UserName VARCHAR(32),
    @Password VARBINARY(16),
    @userIP VARCHAR(40)
AS 
    SET NOCOUNT ON
    DECLARE @UserId AS INT
    DECLARE @LastLogin AS DATETIME
    DECLARE @CurrentPassword AS VARBINARY(16)
    DECLARE @Status AS INT
    DECLARE @Name AS NVARCHAR(35)
    DECLARE @UserType AS NVARCHAR(105)
    DECLARE @DefPage AS NVARCHAR(105)

    SELECT  @UserId = t1.Id,
            @CurrentPassword = [Password],
            @LastLogin = LastLogIn,
            @Name = FirstName + ' ' + LastName,
            @UserType = t3.[Description],
            @DefPage = [Path]
    FROM    Users t1
	INNER JOIN Pages t2 ON t1.DefaultPage = t2.id
	INNER JOIN VariousTypes t3 ON t3.id = t1.UserType
    WHERE   t1.Username = @UserName AND IsActive = 1 and isuser = 1

    SET @Status = 1 --Ok

    IF @UserId IS NULL 
        BEGIN
            SET @Status = 2 --InvalidUser
            SET @UserId = 0
        END

    IF @CurrentPassword <> @Password 
        BEGIN
            SET @Status = 3 --'InvalidPassword'
        END
/*
    IF NOT @Id IS NULL 
        BEGIN
            EXEC LOG_WriteAdminActivity @LogType = @StatusText,
                @ExtraInfo = '', @IP = @userIP, @UserId = @Id
        END
*/

    IF @Status = 1 
        BEGIN
            UPDATE  Users
            SET     LastLogIn = GETDATE()
            WHERE   Username = @UserName
        END

    SELECT  @Status AS Status,
            ISNULL(@UserId, 0) AS UserId,
            ISNULL(@LastLogin, GETDATE()) AS LastLogin,
            ISNULL(@Name, '') AS Name,
            ISNULL(@UserType, '') AS UserType,
            ISNULL(@DefPage, '') AS DefPage


GO
