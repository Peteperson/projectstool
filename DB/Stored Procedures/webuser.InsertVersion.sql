SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO
CREATE PROCEDURE [webuser].[InsertVersion]
    @VersionId AS INT,
    @ToProjectId AS INT
AS 
    SET NOCOUNT ON
	
	DECLARE @MaxVersion AS INT 
	DECLARE @ProjectId AS INT 
	SET @ProjectId = (SELECT ProjectId FROM SystemVersion WHERE id = @VersionId)
	IF @ToProjectId <> @ProjectId
	BEGIN
		IF (SELECT COUNT(*) FROM Processes 
			INNER JOIN SystemVersion ON Processes.SystemVersionId = SystemVersion.id
			WHERE SystemVersion.ProjectId = @ToProjectId) = 0
			DELETE FROM SystemVersion WHERE ProjectId = @ToProjectId
	END
	
	SELECT @MaxVersion = ISNULL(MAX(VersionNo), 0) FROM SystemVersion WHERE ProjectId = @ToProjectId

	INSERT INTO SystemVersion (ProjectId, VersionNo, Comments)
	VALUES  (@ToProjectId, @MaxVersion+1, '')
		
	DECLARE @NewVersion AS INT 
	DECLARE @Status AS INT 
	SELECT @NewVersion = SCOPE_IDENTITY()
	SELECT @Status = id FROM VariousTypes WHERE Category = 'ProcessStatus' AND [Description] like (N'%Εκκρεμεί')
	INSERT INTO Processes (SystemVersionId, Code, [Description], [Status], StatusDate, Responsible, Comments)
		SELECT @NewVersion, Code, [Description], @Status, GETDATE(), 0, ''
		FROM Processes 
		WHERE SystemVersionId = @VersionId
GO
