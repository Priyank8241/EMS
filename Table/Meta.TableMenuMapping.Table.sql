SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Meta].[TableMenuMapping](
	[TableMenuMappingId] [int] NOT NULL,
	[MenuId] [int] NULL,
	[TableName] [nvarchar](500) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_TableMenuMapping_TableMenuMappingId] PRIMARY KEY CLUSTERED 
(
	[TableMenuMappingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[TableMenuMapping])
)
GO
ALTER TABLE [Meta].[TableMenuMapping]  WITH CHECK ADD  CONSTRAINT [fk_TableMenuMapping_MenuId] FOREIGN KEY([MenuId])
REFERENCES [Users].[Menu] ([MenuId])
GO
ALTER TABLE [Meta].[TableMenuMapping] CHECK CONSTRAINT [fk_TableMenuMapping_MenuId]
GO
