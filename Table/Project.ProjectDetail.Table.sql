SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectDetail](
	[ProjectDetailId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectId] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[values] [nvarchar](50) NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_ProjectDetail_ProjectDetailId] PRIMARY KEY CLUSTERED 
(
	[ProjectDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[ProjectDetail])
)
GO
ALTER TABLE [Project].[ProjectDetail]  WITH CHECK ADD  CONSTRAINT [fk_ProjectDetail_FieldId] FOREIGN KEY([FieldId])
REFERENCES [Meta].[Field] ([FieldId])
GO
ALTER TABLE [Project].[ProjectDetail] CHECK CONSTRAINT [fk_ProjectDetail_FieldId]
GO
ALTER TABLE [Project].[ProjectDetail]  WITH CHECK ADD  CONSTRAINT [fk_ProjectDetail_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [Project].[Project] ([ProjectId])
GO
ALTER TABLE [Project].[ProjectDetail] CHECK CONSTRAINT [fk_ProjectDetail_ProjectId]
GO
