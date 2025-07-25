SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Users].[Objects](
	[ObjectsId] [int] NOT NULL,
	[MenuId] [int] NOT NULL,
	[ObjectsName] [nvarchar](512) NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_Objects_ObjectsId] PRIMARY KEY CLUSTERED 
(
	[ObjectsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[Objects])
)
GO
ALTER TABLE [Users].[Objects]  WITH CHECK ADD  CONSTRAINT [fk_Objects_MenuId] FOREIGN KEY([MenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Users].[Objects] CHECK CONSTRAINT [fk_Objects_MenuId]
GO
