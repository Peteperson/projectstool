CREATE TABLE [webuser].[Messages]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[datestamp] [datetime] NOT NULL CONSTRAINT [DF_Messages_datestamp] DEFAULT (getdate()),
[Writer] [int] NOT NULL,
[Message] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[ToUserId] [int] NULL,
[ToCompanyId] [int] NULL,
[ToEveryone] [bit] NOT NULL CONSTRAINT [DF_Messages_Everyone] DEFAULT ((0))
) ON [PRIMARY]
ALTER TABLE [webuser].[Messages] ADD
CONSTRAINT [FK_Messages_Users] FOREIGN KEY ([Writer]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[Messages] ADD CONSTRAINT [PK_Messages] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
