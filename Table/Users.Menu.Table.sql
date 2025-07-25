SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[Menu](
	[MenuId] [int] NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[MenuName] [nvarchar](30) NOT NULL,
	[link] [nvarchar](100) NOT NULL,
	[SerialNumber] [int] NULL,
	[ParentMenuId] [int] NULL,
	[NextMenuId] [int] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_Menu_MenuId] PRIMARY KEY CLUSTERED 
(
	[MenuId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[Menu])
)
GO
ALTER TABLE [Users].[Menu]  WITH CHECK ADD  CONSTRAINT [fk_Menu_NextMenuId] FOREIGN KEY([NextMenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Users].[Menu] CHECK CONSTRAINT [fk_Menu_NextMenuId]
GO
ALTER TABLE [Users].[Menu]  WITH CHECK ADD  CONSTRAINT [fk_Menu_ParentMenuId] FOREIGN KEY([ParentMenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Users].[Menu] CHECK CONSTRAINT [fk_Menu_ParentMenuId]
GO
ALTER TABLE [Users].[Menu]  WITH CHECK ADD  CONSTRAINT [fk_Menu_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [Users].[UserType] ([UserTypeId])
GO
ALTER TABLE [Users].[Menu] CHECK CONSTRAINT [fk_Menu_UserTypeId]
GO
