CREATE TABLE [webuser].[Progress]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_Progress_Datestamp] DEFAULT (getdate()),
[ProjectId] [int] NOT NULL,
[Writer] [int] NOT NULL,
[Comments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_Progress_ProjectId] ON [webuser].[Progress] ([ProjectId]) ON [PRIMARY]

GO
ALTER TABLE [webuser].[Progress] ADD CONSTRAINT [PK_Progress] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Progress] ADD CONSTRAINT [FK_Progress_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [webuser].[Projects] ([id])
GO
ALTER TABLE [webuser].[Progress] ADD CONSTRAINT [FK_Progress_Users] FOREIGN KEY ([Writer]) REFERENCES [webuser].[Users] ([id])
GO
