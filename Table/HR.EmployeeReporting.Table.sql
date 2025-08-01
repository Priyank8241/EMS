SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [HR].[EmployeeReporting](
	[EmployeeReportingId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[MonthsId] [int] NULL,
	[ReportingTypeId] [int] NULL,
	[ReportingDate] [datetime] NULL,
	[ReportingDetails] [nvarchar](500) NULL,
	[UploadFile] [nvarchar](100) NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_EmployeeReporting_EmployeeReportingId] PRIMARY KEY CLUSTERED 
(
	[EmployeeReportingId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[EmployeeReporting])
)
GO
ALTER TABLE [HR].[EmployeeReporting]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeReporting_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [Personal].[Employee] ([EmployeeId])
GO
ALTER TABLE [HR].[EmployeeReporting] CHECK CONSTRAINT [fk_EmployeeReporting_EmployeeId]
GO
ALTER TABLE [HR].[EmployeeReporting]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeReporting_MonthsId] FOREIGN KEY([MonthsId])
REFERENCES [Meta].[Months] ([MonthsId])
GO
ALTER TABLE [HR].[EmployeeReporting] CHECK CONSTRAINT [fk_EmployeeReporting_MonthsId]
GO
ALTER TABLE [HR].[EmployeeReporting]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeReporting_ReportingTypeId] FOREIGN KEY([ReportingTypeId])
REFERENCES [HR].[ReportingType] ([ReportingTypeId])
GO
ALTER TABLE [HR].[EmployeeReporting] CHECK CONSTRAINT [fk_EmployeeReporting_ReportingTypeId]
GO
