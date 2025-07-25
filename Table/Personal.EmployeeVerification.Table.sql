SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Personal].[EmployeeVerification](
	[EmployeeVerificationId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[VerificationTypeId] [int] NOT NULL,
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
 CONSTRAINT [pk_EmployeeVerification_EmployeeDocumentId] PRIMARY KEY CLUSTERED 
(
	[EmployeeVerificationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[EmployeeVerification])
)
GO
ALTER TABLE [Personal].[EmployeeVerification]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeVerification_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [Personal].[Employee] ([EmployeeId])
GO
ALTER TABLE [Personal].[EmployeeVerification] CHECK CONSTRAINT [fk_EmployeeVerification_EmployeeId]
GO
ALTER TABLE [Personal].[EmployeeVerification]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeVerification_StatusId] FOREIGN KEY([StatusId])
REFERENCES [Meta].[Status] ([StatusId])
GO
ALTER TABLE [Personal].[EmployeeVerification] CHECK CONSTRAINT [fk_EmployeeVerification_StatusId]
GO
ALTER TABLE [Personal].[EmployeeVerification]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeVerification_VerificationTypeId] FOREIGN KEY([VerificationTypeId])
REFERENCES [Personal].[VerificationType] ([VerificationTypeId])
GO
ALTER TABLE [Personal].[EmployeeVerification] CHECK CONSTRAINT [fk_EmployeeVerification_VerificationTypeId]
GO
