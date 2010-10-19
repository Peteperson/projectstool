CREATE TABLE [webuser].[UsersCompanies]
(
[UserId] [int] NOT NULL,
[CompanyId] [int] NOT NULL,
[Position] [int] NOT NULL,
[Telephone] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UsersCompanies_Telephone] DEFAULT (''),
[Mobile] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UsersCompanies_Mobile] DEFAULT (''),
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF_UsersCompanies_Email] DEFAULT ('')
) ON [PRIMARY]
ALTER TABLE [webuser].[UsersCompanies] ADD
CONSTRAINT [FK_UsersCompanies_Users] FOREIGN KEY ([UserId]) REFERENCES [webuser].[Users] ([id]) ON DELETE CASCADE
GO
ALTER TABLE [webuser].[UsersCompanies] ADD CONSTRAINT [PK_UsersCompanies] PRIMARY KEY CLUSTERED  ([UserId], [CompanyId]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[UsersCompanies] ADD CONSTRAINT [FK_UsersCompanies_Companies] FOREIGN KEY ([CompanyId]) REFERENCES [webuser].[Companies] ([Id])
GO
ALTER TABLE [webuser].[UsersCompanies] ADD CONSTRAINT [FK_UsersCompanies_VariousTypes] FOREIGN KEY ([Position]) REFERENCES [webuser].[VariousTypes] ([id])
GO
