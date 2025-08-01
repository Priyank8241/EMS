SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[ErrorLogs](
	[ErrorLogsId] [int] IDENTITY(1,1) NOT NULL,
	[ObjectsId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
	[UsersActivityId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[ErrorNumber] [int] NULL,
	[ErrorMassage] [varchar](255) NULL,
	[Createdate] [datetime] NOT NULL,
 CONSTRAINT [pk_ErrorLogs_ErrorLogsId] PRIMARY KEY CLUSTERED 
(
	[ErrorLogsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Users].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogs_MenuId] FOREIGN KEY([MenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Users].[ErrorLogs] CHECK CONSTRAINT [fk_ErrorLogs_MenuId]
GO
ALTER TABLE [Users].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogs_ObjectsId] FOREIGN KEY([ObjectsId])
REFERENCES [Users].[Objects] ([ObjectsId])
GO
ALTER TABLE [Users].[ErrorLogs] CHECK CONSTRAINT [fk_ErrorLogs_ObjectsId]
GO
ALTER TABLE [Users].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogs_UsersActivityId] FOREIGN KEY([UsersActivityId])
REFERENCES [Users].[UsersActivity] ([UsersActivityId])
GO
ALTER TABLE [Users].[ErrorLogs] CHECK CONSTRAINT [fk_ErrorLogs_UsersActivityId]
GO
ALTER TABLE [Users].[ErrorLogs]  WITH CHECK ADD  CONSTRAINT [fk_ErrorLogs_UsersId] FOREIGN KEY([UsersId])
REFERENCES [Users].[Users] ([UsersId])
GO
ALTER TABLE [Users].[ErrorLogs] CHECK CONSTRAINT [fk_ErrorLogs_UsersId]
GO
