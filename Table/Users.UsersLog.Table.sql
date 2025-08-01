SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[UsersLog](
	[UsersLogId] [int] IDENTITY(1,1) NOT NULL,
	[ObjectsId] [int] NOT NULL,
	[UsersId] [int] NOT NULL,
	[UsersActivityId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[Createdate] [datetime] NOT NULL,
 CONSTRAINT [pk_UsersLog_UsersLogId] PRIMARY KEY CLUSTERED 
(
	[UsersLogId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [Users].[UsersLog]  WITH CHECK ADD  CONSTRAINT [fk_UsersLog_MenuId] FOREIGN KEY([MenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Users].[UsersLog] CHECK CONSTRAINT [fk_UsersLog_MenuId]
GO
ALTER TABLE [Users].[UsersLog]  WITH CHECK ADD  CONSTRAINT [fk_UsersLog_ObjectsNameId] FOREIGN KEY([ObjectsId])
REFERENCES [Users].[Objects] ([ObjectsId])
GO
ALTER TABLE [Users].[UsersLog] CHECK CONSTRAINT [fk_UsersLog_ObjectsNameId]
GO
ALTER TABLE [Users].[UsersLog]  WITH CHECK ADD  CONSTRAINT [fk_UsersLog_UsersActivityId] FOREIGN KEY([UsersActivityId])
REFERENCES [Users].[UsersActivity] ([UsersActivityId])
GO
ALTER TABLE [Users].[UsersLog] CHECK CONSTRAINT [fk_UsersLog_UsersActivityId]
GO
ALTER TABLE [Users].[UsersLog]  WITH CHECK ADD  CONSTRAINT [fk_UsersLog_UsersId] FOREIGN KEY([UsersId])
REFERENCES [Users].[Users] ([UsersId])
GO
ALTER TABLE [Users].[UsersLog] CHECK CONSTRAINT [fk_UsersLog_UsersId]
GO
