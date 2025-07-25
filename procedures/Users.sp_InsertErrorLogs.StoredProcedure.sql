/****** Object:  StoredProcedure [Users].[sp_InsertErrorLogs]    Script Date: 3/18/2025 5:17:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================================
-- Author		: Priyank Panchmiya
-- Create date	: 2025-03-16
-- Description	: User Error logs
-- Version		: 1.00
--===============================================================
/*
EXEC Users.sp_InsertErrorLogs 
@P_ObjectsId = 1
,@P_UsersId = 1
,@P_UsersActivityId = 1
,@P_MenuId = 1
,@P_ErrorNumber = 1 
,@P_ErrorMassage = 'daWEA'
*/
CREATE PROCEDURE [Users].[sp_InsertErrorLogs]
 @P_ObjectsId INT 
,@P_UsersId INT
,@P_UsersActivityId INT
,@P_MenuId INT
,@P_ErrorNumber INT
,@P_ErrorMassage VARCHAR(255)
AS
BEGIN 
    BEGIN TRY
        DECLARE @v_Createdate DATETIME = GETDATE(); -- Initialize Createdate with the current date and time
        INSERT INTO Users.ErrorLogs
        (
            ObjectsId, -- Corrected from ObjectsId to ObjectsNameId
            UsersId,
            UsersActivityId,
            MenuId,
            Createdate,
            ErrorNumber,
            ErrorMassage
        )
        SELECT
            @P_ObjectsId,
            @P_UsersId,
            @P_UsersActivityId,
            @P_MenuId,
            @v_Createdate,
            @P_ErrorNumber,
            @P_ErrorMassage
    END TRY
    BEGIN CATCH 
        THROW;
    END CATCH
END;
GO
