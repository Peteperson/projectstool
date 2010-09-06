CREATE TABLE [webuser].[VariousTypes]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[Category] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[VariousTypes] ADD CONSTRAINT [PK_UserType] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
