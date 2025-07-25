SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Personal].[EmployeeDocument](
	[EmployeeDocumentId] [int] IDENTITY(1,1) NOT NULL,
	[EmployeeId] [int] NOT NULL,
	[DocumentId] [int] NOT NULL,
	[UploadedFile] [nvarchar](100) NULL,
	[UploadedDate] [datetime] NULL,
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
 CONSTRAINT [pk_EmployeeDocument_EmployeeDocumentId] PRIMARY KEY CLUSTERED 
(
	[EmployeeDocumentId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[EmployeeDocument])
)
GO
ALTER TABLE [Personal].[EmployeeDocument]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeDocument_DocumentId] FOREIGN KEY([DocumentId])
REFERENCES [Personal].[Document] ([DocumentId])
GO
ALTER TABLE [Personal].[EmployeeDocument] CHECK CONSTRAINT [fk_EmployeeDocument_DocumentId]
GO
ALTER TABLE [Personal].[EmployeeDocument]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeDocument_EmployeeId] FOREIGN KEY([EmployeeId])
REFERENCES [Personal].[Employee] ([EmployeeId])
GO
ALTER TABLE [Personal].[EmployeeDocument] CHECK CONSTRAINT [fk_EmployeeDocument_EmployeeId]
GO
ALTER TABLE [Personal].[EmployeeDocument]  WITH CHECK ADD  CONSTRAINT [fk_EmployeeDocument_StatusId] FOREIGN KEY([StatusId])
REFERENCES [Meta].[Status] ([StatusId])
GO
ALTER TABLE [Personal].[EmployeeDocument] CHECK CONSTRAINT [fk_EmployeeDocument_StatusId]
GO
