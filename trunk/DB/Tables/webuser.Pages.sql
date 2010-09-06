CREATE TABLE [webuser].[Pages]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Path] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Image] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Pages] ADD CONSTRAINT [PK_Pages] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
