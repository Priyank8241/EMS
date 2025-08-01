/****** Object:  StoredProcedure [Users].[sp_InsertUsersLog]    Script Date: 3/18/2025 5:17:36 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================================
-- Author		: Priyank Panchmiya
-- Create date	: 2025-03-16
-- Description	: User Activity logs
-- Version		: 1.00
--===============================================================
/*
EXEC Users.sp_InsertUsersLog 
@P_ObjectsId = 1
,@P_UsersId = 1
,@P_UsersActivityId = 1
,@P_MenuId = 1
*/
CREATE PROCEDURE [Users].[sp_InsertUsersLog]
 @P_ObjectsId INT 
,@P_UsersId INT
,@P_UsersActivityId INT
,@P_MenuId INT
AS
BEGIN 
    BEGIN TRY
        DECLARE @v_Createdate DATETIME = GETDATE(); -- Initialize Createdate with the current date and time
        INSERT INTO Users.UsersLog
        (
            ObjectsId, -- Corrected from ObjectsId to ObjectsNameId
            UsersId,
            UsersActivityId,
            MenuId,
            Createdate
        )
        SELECT 
        
            @P_ObjectsId,
            @P_UsersId,
            @P_UsersActivityId,
            @P_MenuId,
            @v_Createdate
    END TRY
    BEGIN CATCH 
        THROW;
    END CATCH
END;
GO
