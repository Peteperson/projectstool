SET QUOTED_IDENTIFIER ON
GO
SET ANSI_NULLS ON
GO

CREATE PROCEDURE [webuser].[DeleteVersion]
    @VersionId AS INT
AS 
    SET NOCOUNT ON

	DELETE FROM Processes WHERE SystemVersionId = @VersionId
	DELETE FROM SystemVersion WHERE id = @VersionId
GO
