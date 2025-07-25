SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Personal].[Citizenship](
	[CitizenshipId] [int] NOT NULL,
	[CitizenshipName] [nvarchar](50) NOT NULL,
	[CountryId] [int] NOT NULL,
	[ValidFrom] [datetime2](7) GENERATED ALWAYS AS ROW START HIDDEN NOT NULL,
	[ValidTo] [datetime2](7) GENERATED ALWAYS AS ROW END HIDDEN NOT NULL,
 CONSTRAINT [pk_Citizenship_CitizenshipId] PRIMARY KEY CLUSTERED 
(
	[CitizenshipId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY],
	PERIOD FOR SYSTEM_TIME ([ValidFrom], [ValidTo])
) ON [PRIMARY]
WITH
(
SYSTEM_VERSIONING = ON (HISTORY_TABLE = [Audits].[Citizenship])
)
GO
ALTER TABLE [Personal].[Citizenship]  WITH CHECK ADD  CONSTRAINT [fk_Citizenship_CountryId] FOREIGN KEY([CountryId])
REFERENCES [Meta].[Country] ([CountryId])
GO
ALTER TABLE [Personal].[Citizenship] CHECK CONSTRAINT [fk_Citizenship_CountryId]
GO
