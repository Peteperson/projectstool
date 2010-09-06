CREATE TABLE [webuser].[UserPages]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[UserType] [int] NOT NULL,
[PageId] [int] NOT NULL,
[Description] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Ordering] [int] NOT NULL
) ON [PRIMARY]
GO
ALTER TABLE [webuser].[UserPages] ADD CONSTRAINT [PK_UserPages] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
CREATE UNIQUE NONCLUSTERED INDEX [IX_UserPages_Page_User] ON [webuser].[UserPages] ([PageId], [UserType]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[UserPages] ADD CONSTRAINT [FK_UserPages_Pages] FOREIGN KEY ([PageId]) REFERENCES [webuser].[Pages] ([id])
GO
ALTER TABLE [webuser].[UserPages] ADD CONSTRAINT [FK_UserPages_VariousTypes] FOREIGN KEY ([UserType]) REFERENCES [webuser].[VariousTypes] ([id])
GO
