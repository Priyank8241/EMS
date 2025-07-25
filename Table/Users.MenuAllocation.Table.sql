SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[MenuAllocation](
	[MenuAllocationId] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[UserAccessId] [int] NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_MenuAllocation_MenuAllocationId] PRIMARY KEY CLUSTERED 
(
	[MenuAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[MenuAllocation])
)
GO
ALTER TABLE [Users].[MenuAllocation]  WITH CHECK ADD  CONSTRAINT [fk_MenuAllocation_UsersId] FOREIGN KEY([UsersId])
REFERENCES [Users].[Users] ([UsersId])
GO
ALTER TABLE [Users].[MenuAllocation] CHECK CONSTRAINT [fk_MenuAllocation_UsersId]
GO
ALTER TABLE [Users].[MenuAllocation]  WITH CHECK ADD  CONSTRAINT [fk_Users_UserAccessId] FOREIGN KEY([UserAccessId])
REFERENCES [Users].[UserAccess] ([UserAccessId])
GO
ALTER TABLE [Users].[MenuAllocation] CHECK CONSTRAINT [fk_Users_UserAccessId]
GO
