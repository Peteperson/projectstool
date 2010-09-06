CREATE TABLE [webuser].[ActivityLog]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_ActivityLog_Datestamp] DEFAULT (getdate()),
[UserId] [int] NOT NULL,
[URL] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Status] [int] NULL,
[IP] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ServerName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ExtraInfo] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_ActivityLog_ExtraInfo] DEFAULT ('')
) ON [PRIMARY]
GO
