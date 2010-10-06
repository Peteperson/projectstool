CREATE TABLE [webuser].[ProjectFiles]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_ProjectFiles_Datestamp] DEFAULT (getdate()),
[ProjectId] [int] NOT NULL,
[AttachmentName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Attachment] [varbinary] (max) NULL,
[Comments] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_ProjectFiles_Comments] DEFAULT ('')
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
CREATE NONCLUSTERED INDEX [IX_ProjectFiles_ProjectId] ON [webuser].[ProjectFiles] ([ProjectId]) ON [PRIMARY]

GO
ALTER TABLE [webuser].[ProjectFiles] ADD CONSTRAINT [PK_ProjectFiles] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[ProjectFiles] ADD CONSTRAINT [FK_ProjectFiles_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [webuser].[Projects] ([id])
GO
