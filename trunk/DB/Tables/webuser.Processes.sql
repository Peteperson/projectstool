CREATE TABLE [webuser].[Processes]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF__Processes__Dates__6442E2C9] DEFAULT (getdate()),
[SystemVersionId] [int] NOT NULL,
[Code] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [int] NOT NULL,
[StatusDate] [datetime] NOT NULL,
[Responsible] [int] NULL,
[Comments] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
ALTER TABLE [webuser].[Processes] WITH NOCHECK ADD
CONSTRAINT [FK_Processes_VariousTypes] FOREIGN KEY ([Status]) REFERENCES [webuser].[VariousTypes] ([id])
ALTER TABLE [webuser].[Processes] ADD
CONSTRAINT [FK_Processes_Users] FOREIGN KEY ([Responsible]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Processes] ADD CONSTRAINT [PK_Processes_Temp] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO

ALTER TABLE [webuser].[Processes] ADD CONSTRAINT [FK_Processes_SystemVersion] FOREIGN KEY ([SystemVersionId]) REFERENCES [webuser].[SystemVersion] ([id])
GO
