CREATE TABLE [webuser].[Projects]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Code] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[SubProject] [nvarchar] (10) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DateStamp] [datetime] NOT NULL CONSTRAINT [DF_Projects_DateStamp] DEFAULT (getdate()),
[Creator] [int] NOT NULL,
[Type] [int] NOT NULL,
[ModificationDate] [datetime] NULL,
[CustomerId] [int] NOT NULL,
[InitialStartDate] [datetime] NULL,
[StartDate] [datetime] NOT NULL,
[InitialEndDate] [datetime] NOT NULL,
[EndDate] [datetime] NULL,
[Title] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ProjectManager] [int] NOT NULL,
[Consultant1] [int] NOT NULL,
[Consultant2] [int] NULL,
[InitialMeetingsNo] [int] NOT NULL,
[CriticalIssues] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DesiredOrganization] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CertificationField] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[CompletionPercentage] [tinyint] NOT NULL,
[Status] [int] NOT NULL CONSTRAINT [DF_Projects_Status] DEFAULT ((0))
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [PK_Projects] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Projects_SubProject] ON [webuser].[Projects] ([SubProject]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_Users2] FOREIGN KEY ([Consultant1]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_Users3] FOREIGN KEY ([Consultant2]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_Users] FOREIGN KEY ([Creator]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_Companies] FOREIGN KEY ([CustomerId]) REFERENCES [webuser].[Companies] ([Id])
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_Users1] FOREIGN KEY ([ProjectManager]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Projects] ADD CONSTRAINT [FK_Projects_VariousTypes] FOREIGN KEY ([Status]) REFERENCES [webuser].[VariousTypes] ([id])
GO
