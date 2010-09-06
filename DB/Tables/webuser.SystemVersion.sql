CREATE TABLE [webuser].[SystemVersion]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_SystemVersion_Datestamp] DEFAULT (getdate()),
[ProjectId] [int] NOT NULL,
[VersionNo] [smallint] NOT NULL,
[Comments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[SystemVersion] ADD CONSTRAINT [PK_SystemVersion] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[SystemVersion] ADD CONSTRAINT [FK_SystemVersion_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [webuser].[Projects] ([id])
GO
