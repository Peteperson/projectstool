CREATE TABLE [webuser].[Meetings]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_Meetings_Datestamp] DEFAULT (getdate()),
[ProjectId] [int] NOT NULL,
[TimeFrom] [datetime] NOT NULL,
[TimeTo] [datetime] NOT NULL,
[Kind] [int] NOT NULL,
[Subject] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Consultant] [int] NOT NULL,
[Comments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[NewBusiness] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttachmentName] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attachment] [varbinary] (max) NULL,
[Status] [int] NOT NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [webuser].[Meetings] ADD CONSTRAINT [PK_Meetings] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Meetings] ADD CONSTRAINT [FK_Meetings_Users] FOREIGN KEY ([Consultant]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Meetings] ADD CONSTRAINT [FK_Meetings_VariousTypes] FOREIGN KEY ([Kind]) REFERENCES [webuser].[VariousTypes] ([id])
GO
ALTER TABLE [webuser].[Meetings] ADD CONSTRAINT [FK_Meetings_Projects] FOREIGN KEY ([ProjectId]) REFERENCES [webuser].[Projects] ([id])
GO
ALTER TABLE [webuser].[Meetings] ADD CONSTRAINT [FK_Meetings_VariousTypes1] FOREIGN KEY ([Status]) REFERENCES [webuser].[VariousTypes] ([id])
GO
