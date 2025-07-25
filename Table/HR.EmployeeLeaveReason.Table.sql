SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[EmployeeLeaveReason](
	[EmployeeLeaveResonId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[LeaveTypeId] [int] NOT NULL,
	[LeaveReasonTypeId] [int] NOT NULL,
	[Reason] [nvarchar](100) NOT NULL,
	[FormDate] [datetime] NOT NULL,
	[ToDate] [datetime] NOT NULL,
	[StatusId] [int] NOT NULL,
	[VerificationData] [datetime] NULL,
	[VerificationBy] [int] NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_EmployeeLeaveReason_EmployeeLeaveResonId] PRIMARY KEY CLUSTERED 
(
	[EmployeeLeaveResonId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[EmployeeLeaveReason])
)
GO
ALTER TABLE [HR].[EmployeeLeaveReason]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeLeaveReason_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [Personal].[Employee] ([EmployeeId])
GO
ALTER TABLE [HR].[EmployeeLeaveReason] CHECK CONSTRAINT [fk_EmployeeLeaveReason_EmployeeId]
GO
ALTER TABLE [HR].[EmployeeLeaveReason]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeLeaveReason_LeaveReasonTypeId] FOREIGN KEY([LeaveReasonTypeId])
REFERENCES [HR].[LeaveReasonType] ([LeaveReasonTypeId])
GO
ALTER TABLE [HR].[EmployeeLeaveReason] CHECK CONSTRAINT [fk_EmployeeLeaveReason_LeaveReasonTypeId]
GO
ALTER TABLE [HR].[EmployeeLeaveReason]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeLeaveReason_LeaveTypeId] FOREIGN KEY([LeaveTypeId])
REFERENCES [HR].[LeaveType] ([LeaveTypeId])
GO
ALTER TABLE [HR].[EmployeeLeaveReason] CHECK CONSTRAINT [fk_EmployeeLeaveReason_LeaveTypeId]
GO
ALTER TABLE [HR].[EmployeeLeaveReason]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeLeaveReason_StatusId] FOREIGN KEY([StatusId])
REFERENCES [Meta].[Status] ([StatusId])
GO
ALTER TABLE [HR].[EmployeeLeaveReason] CHECK CONSTRAINT [fk_EmployeeLeaveReason_StatusId]
GO
