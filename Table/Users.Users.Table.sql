SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[Users](
	[UsersId] [int] IDENTITY(1,1) NOT NULL,
	[UsersName] [nvarchar](300) NOT NULL,
	[UserTypeId] [int] NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[Passwords] [nvarchar](100) NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_Users_UsersId] PRIMARY KEY CLUSTERED 
(
	[UsersId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[Users])
)
GO
ALTER TABLE [Users].[Users]  WITH CHECK ADD  CONSTRAINT [fk_Users_UserTypeId] FOREIGN KEY([UserTypeId])
REFERENCES [Users].[UserType] ([UserTypeId])
GO
ALTER TABLE [Users].[Users] CHECK CONSTRAINT [fk_Users_UserTypeId]
GO
