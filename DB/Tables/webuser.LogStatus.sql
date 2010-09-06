CREATE TABLE [webuser].[LogStatus]
(
[id] [int] NOT NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[LogStatus] ADD CONSTRAINT [PK_LogStatus] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
