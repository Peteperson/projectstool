CREATE TABLE [webuser].[Users]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[DateStamp] [datetime] NOT NULL CONSTRAINT [DF__Users_Tem__DateS__671F4F74] DEFAULT (getdate()),
[UserName] [nvarchar] (20) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Password] [varbinary] (50) NULL,
[UserType] [int] NOT NULL,
[FirstName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[LastName] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[Telephone] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Users_Tem__Telep__681373AD] DEFAULT (''),
[Mobile] [nvarchar] (13) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__Users_Tem__Mobil__690797E6] DEFAULT (''),
[Email] [nvarchar] (50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[DefaultPage] [int] NOT NULL,
[LastLogin] [datetime] NULL,
[IsActive] [bit] NOT NULL CONSTRAINT [DF__Users_Tem__IsAct__69FBBC1F] DEFAULT ((1)),
[IsUser] [bit] NULL CONSTRAINT [DF__Users_Tem__IsUse__6AEFE058] DEFAULT ((0))
) ON [PRIMARY]


CREATE UNIQUE NONCLUSTERED INDEX [IX_Users_Username] ON [webuser].[Users] ([UserName]) ON [PRIMARY]

GO
ALTER TABLE [webuser].[Users] ADD CONSTRAINT [PK_Users_Temp] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO

ALTER TABLE [webuser].[Users] ADD CONSTRAINT [FK_Users_Pages] FOREIGN KEY ([DefaultPage]) REFERENCES [webuser].[Pages] ([id])
GO

ALTER TABLE [webuser].[Users] ADD CONSTRAINT [FK_Users_VariousTypes] FOREIGN KEY ([UserType]) REFERENCES [webuser].[VariousTypes] ([id])
GO
