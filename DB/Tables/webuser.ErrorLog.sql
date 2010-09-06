CREATE TABLE [webuser].[ErrorLog]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_ErrorLog_Datestamp] DEFAULT (getdate()),
[UserId] [int] NOT NULL,
[ServerName] [nvarchar] (100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[IP] [nvarchar] (15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[URL] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Error] [nvarchar] (1500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[ErrorLog] ADD CONSTRAINT [PK_ErrorLog] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
