SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Personal].[Employee](
	[EmployeeId] [int] IDENTITY(1,1) NOT NULL,
	[UsersId] [int] NULL,
	[CompanyId] [int] NOT NULL,
	[FirstName] [nvarchar](200) NOT NULL,
	[MiddleName] [nvarchar](200) NULL,
	[LastName] [nvarchar](200) NOT NULL,
	[ModileNo] [nvarchar](20) NOT NULL,
	[Email] [nvarchar](100) NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_Employee_EmployeeId] PRIMARY KEY CLUSTERED 
(
	[EmployeeId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[Employee])
)
GO
ALTER TABLE [Personal].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [Meta].[Company] ([CompanyId])
GO
ALTER TABLE [Personal].[Employee] CHECK CONSTRAINT [fk_Employee_CompanyId]
GO
ALTER TABLE [Personal].[Employee]  WITH CHECK ADD  CONSTRAINT [fk_Employee_UsersId] FOREIGN KEY([UsersId])
REFERENCES [Users].[Users] ([UsersId])
GO
ALTER TABLE [Personal].[Employee] CHECK CONSTRAINT [fk_Employee_UsersId]
GO
