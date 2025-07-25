SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Meta].[TableColumns](
	[TableColumnsId] [int] NOT NULL,
	[TableName] [nvarchar](128) NULL,
	[ColumnName] [nvarchar](128) NULL,
	[ColumnUpdate] [nvarchar](512) NULL,
	[InsertColumn] [nvarchar](512) NULL,
	[IsPrimaryKey] [bit] NULL,
	[IsUpdate] [bit] NULL,
	[IsInsert] [bit] NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_TableColumns_TableColumnsId] PRIMARY KEY CLUSTERED 
(
	[TableColumnsId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[TableColumns])
)
GO
