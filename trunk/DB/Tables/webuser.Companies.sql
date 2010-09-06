CREATE TABLE [webuser].[Companies]
(
[Id] [int] NOT NULL IDENTITY(1, 1),
[Datestamp] [datetime] NOT NULL CONSTRAINT [DF_Companies_Datestamp] DEFAULT (getdate()),
[Name] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Description] [nvarchar] (150) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[Companies] ADD CONSTRAINT [PK_Companies] PRIMARY KEY CLUSTERED  ([Id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_Companies_Name] ON [webuser].[Companies] ([Name]) ON [PRIMARY]
GO
