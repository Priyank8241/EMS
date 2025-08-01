SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectAllocation](
	[ProjectAllocationId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DepartmentId] [int] NOT NULL,
	[DesignationId] [int] NOT NULL,
	[EmployeeTypeId] [int] NOT NULL,
	[ProjectId] [int] NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_ProjectAllocation_ProjectAllocationId] PRIMARY KEY CLUSTERED 
(
	[ProjectAllocationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[ProjectAllocation])
)
GO
ALTER TABLE [Project].[ProjectAllocation]  WITH CHECK ADD  CONSTRAINT [fk_ProjectAllocation_DepartmentId] FOREIGN KEY([DepartmentId])
REFERENCES [HR].[Department] ([DepartmentId])
GO
ALTER TABLE [Project].[ProjectAllocation] CHECK CONSTRAINT [fk_ProjectAllocation_DepartmentId]
GO
ALTER TABLE [Project].[ProjectAllocation]  WITH CHECK ADD  CONSTRAINT [fk_ProjectAllocation_DesignationId] FOREIGN KEY([DesignationId])
REFERENCES [HR].[Designation] ([DesignationId])
GO
ALTER TABLE [Project].[ProjectAllocation] CHECK CONSTRAINT [fk_ProjectAllocation_DesignationId]
GO
ALTER TABLE [Project].[ProjectAllocation]  WITH CHECK ADD  CONSTRAINT [fk_ProjectAllocation_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [Personal].[Employee] ([EmployeeId])
GO
ALTER TABLE [Project].[ProjectAllocation] CHECK CONSTRAINT [fk_ProjectAllocation_EmployeeId]
GO
ALTER TABLE [Project].[ProjectAllocation]  WITH CHECK ADD  CONSTRAINT [fk_ProjectAllocation_EmployeeTypeId] FOREIGN KEY([EmployeeTypeId])
REFERENCES [HR].[EmployeeType] ([EmployeeTypeId])
GO
ALTER TABLE [Project].[ProjectAllocation] CHECK CONSTRAINT [fk_ProjectAllocation_EmployeeTypeId]
GO
ALTER TABLE [Project].[ProjectAllocation]  WITH CHECK ADD  CONSTRAINT [fk_ProjectAllocation_ProjectId] FOREIGN KEY([ProjectId])
REFERENCES [Project].[Project] ([ProjectId])
GO
ALTER TABLE [Project].[ProjectAllocation] CHECK CONSTRAINT [fk_ProjectAllocation_ProjectId]
GO
