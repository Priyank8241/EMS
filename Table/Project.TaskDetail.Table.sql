SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[TaskDetail](
	[TaskDetailId] [int] IDENTITY(1,1) NOT NULL,
	[TaskId] [int] NOT NULL,
	[FieldId] [int] NOT NULL,
	[values] [nvarchar](100) NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_TaskDetail_TaskDetailId] PRIMARY KEY CLUSTERED 
(
	[TaskDetailId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[TaskDetail])
)
GO
ALTER TABLE [Project].[TaskDetail]  WITH CHECK ADD  CONSTRAINT [fk_TaskDetail_FieldId] FOREIGN KEY([FieldId])
REFERENCES [Meta].[Field] ([FieldId])
GO
ALTER TABLE [Project].[TaskDetail] CHECK CONSTRAINT [fk_TaskDetail_FieldId]
GO
ALTER TABLE [Project].[TaskDetail]  WITH CHECK ADD  CONSTRAINT [fk_TaskDetail_TaskId] FOREIGN KEY([TaskId])
REFERENCES [Project].[Task] ([TaskId])
GO
ALTER TABLE [Project].[TaskDetail] CHECK CONSTRAINT [fk_TaskDetail_TaskId]
GO
