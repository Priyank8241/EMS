SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[TaskChats](
	[TaskDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
	[Chats] [nvarchar](200) NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_TaskChats_TaskDetailId] PRIMARY KEY CLUSTERED 
(
	[TaskDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[TaskChats])
)
GO
ALTER TABLE [Project].[TaskChats]  WITH CHECK ADD  CONSTRAINT [fk_TaskChats_TaskId] FOREIGN KEY([TaskId])
REFERENCES [Project].[Task] ([TaskId])
GO
ALTER TABLE [Project].[TaskChats] CHECK CONSTRAINT [fk_TaskChats_TaskId]
GO
ALTER TABLE [Project].[TaskChats]  WITH CHECK ADD  CONSTRAINT [fk_TaskChats_UsersId] FOREIGN KEY([UsersId])
REFERENCES [Users].[Users] ([UsersId])
GO
ALTER TABLE [Project].[TaskChats] CHECK CONSTRAINT [fk_TaskChats_UsersId]
GO
