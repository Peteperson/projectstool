CREATE TABLE [webuser].[ActionPlans]
(
[id] [int] NOT NULL IDENTITY(1, 1),
[ProjectId] [int] NOT NULL,
[DateStamp] [datetime] NOT NULL CONSTRAINT [DF__ActionPla__DateS__57DD0BE4] DEFAULT (getdate()),
[ActionId] [int] NULL,
[Responsible1] [int] NULL,
[Responsible2] [int] NULL,
[Description] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
[AttachmentName] [nvarchar] (250) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
[Attachment] [image] NULL,
[Deadline] [datetime] NOT NULL,
[Status] [int] NOT NULL,
[Comments] [nvarchar] (500) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL CONSTRAINT [DF__ActionPla__Comme__58D1301D] DEFAULT (''),
[MeetingDate] [datetime] NOT NULL CONSTRAINT [DF__ActionPla__Meeti__625A9A57] DEFAULT (getdate())
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
ALTER TABLE [webuser].[ActionPlans] ADD CONSTRAINT [PK_ActionPlans_Temp] PRIMARY KEY CLUSTERED  ([id]) ON [PRIMARY]
GO
ALTER TABLE [webuser].[ActionPlans] ADD CONSTRAINT [FK_ActionPlans_VariousTypes] FOREIGN KEY ([ActionId]) REFERENCES [webuser].[VariousTypes] ([id])
GO
ALTER TABLE [webuser].[ActionPlans] ADD CONSTRAINT [FK_ActionPlans_Users] FOREIGN KEY ([Responsible1]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[ActionPlans] ADD CONSTRAINT [FK_ActionPlans_Users1] FOREIGN KEY ([Responsible2]) REFERENCES [webuser].[Users] ([id])
GO
ALTER TABLE [webuser].[ActionPlans] ADD CONSTRAINT [FK_ActionPlans_VariousTypes1] FOREIGN KEY ([Status]) REFERENCES [webuser].[VariousTypes] ([id])
GO
