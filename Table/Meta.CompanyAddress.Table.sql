SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Meta].[CompanyAddress](
	[CompanyAddressId] [int] IDENTITY(1,1) NOT NULL,
	[CompanyId] [int] NOT NULL,
	[Street] [nvarchar](250) NOT NULL,
	[LandMark] [nvarchar](250) NULL,
	[CityId] [int] NOT NULL,
	[StateId] [int] NOT NULL,
	[CountryId] [int] NOT NULL,
	[PinZipCode] [nvarchar](10) NOT NULL,
	[Createdby] [int] NOT NULL,
	[CreateDate] [datetime] NOT NULL,
	[Modifiedby] [int] NULL,
	[ModifiedDate] [datetime] NULL,
	[IPAddress] [varchar](16) NOT NULL,
	[MACAddress] [varchar](16) NULL,
	[DBUpdateby] [varchar](200) NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_CompanyAddress_CompanyAddressId] PRIMARY KEY CLUSTERED 
(
	[CompanyAddressId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[CompanyAddress])
)
GO
ALTER TABLE [Meta].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [fk_CompanyAddress_CityId] FOREIGN KEY([CityId])
REFERENCES [Meta].[City] ([CityId])
GO
ALTER TABLE [Meta].[CompanyAddress] CHECK CONSTRAINT [fk_CompanyAddress_CityId]
GO
ALTER TABLE [Meta].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [fk_CompanyAddress_CompanyId] FOREIGN KEY([CompanyId])
REFERENCES [Meta].[Company] ([CompanyId])
GO
ALTER TABLE [Meta].[CompanyAddress] CHECK CONSTRAINT [fk_CompanyAddress_CompanyId]
GO
ALTER TABLE [Meta].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [fk_CompanyAddress_CountryId] FOREIGN KEY([CountryId])
REFERENCES [Meta].[Country] ([CountryId])
GO
ALTER TABLE [Meta].[CompanyAddress] CHECK CONSTRAINT [fk_CompanyAddress_CountryId]
GO
ALTER TABLE [Meta].[CompanyAddress]  WITH CHECK ADD  CONSTRAINT [fk_CompanyAddress_StateId] FOREIGN KEY([StateId])
REFERENCES [Meta].[State] ([StateId])
GO
ALTER TABLE [Meta].[CompanyAddress] CHECK CONSTRAINT [fk_CompanyAddress_StateId]
GO
