SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Project].[ProjectType](
	[ProjectTypeId] [int] IDENTITY(1,1) NOT NULL,
	[ProjectTypeName] [nvarchar](100) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_ProjectType_ProjectTypeId] PRIMARY KEY CLUSTERED 
(
	[ProjectTypeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[ProjectType])
)
GO
ALTER TABLE [Project].[ProjectType]  WITH CHECK ADD  CONSTRAINT [fk_ProjectType_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [Meta].[Company] ([CompanyId])
GO
ALTER TABLE [Project].[ProjectType] CHECK CONSTRAINT [fk_ProjectType_CompanyId]
GO
