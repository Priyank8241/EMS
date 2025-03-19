SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================================
-- Author		: Priyank Panchmiya
-- Create date	: 2025-03-19
-- Description	: Auto delete logs
-- Version		: 1.00
--===============================================================
/*
EXEC Users.sp_autodeletelogs
*/
CREATE PROCEDURE Users.sp_autodeletelogs
AS 
	BEGIN
		SET NOCOUNT ON;
		BEGIN TRY
			BEGIN TRANSACTION
				DELETE L FROM Users.UsersLog L WITH(NOLOCK)WHERE DATEDIFF(DAY,L.Createdate,GETDATE()) >= 30
			
				DELETE L FROM Users.ErrorLogs L WITH(NOLOCK)WHERE DATEDIFF(DAY,L.Createdate,GETDATE()) >= 30
			COMMIT TRANSACTION
		END TRY
		BEGIN CATCH
		THROW	
		END CATCH
	END 