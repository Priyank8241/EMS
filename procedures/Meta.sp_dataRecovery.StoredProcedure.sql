USE [EMS]
GO
/****** Object:  StoredProcedure [Meta].[sp_dataRecovery]    Script Date: 3/19/2025 11:05:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--===============================================================
-- Author		: Priyank Panchmiya
-- Create date	: 2025-03-16
-- Description	: Data Recovery
-- Version		: 1.00
--===============================================================
/*
EXEC Meta.sp_dataRecovery 
@P_TableName = 'Personal.BloodGroup'
,@P_PK_Id = 1
,@P_ValidTo = '2025-03-19 17:59:21.7586197'
,@P_IsUpdate = 0
,@P_IsInsert = 1
,@P_Createdby = 1
,@P_IPAddress = ''
,@P_MACAddress = ''
,@P_OUT = 1
*/
CREATE PROCEDURE [Meta].[sp_dataRecovery]
 @P_TableName NVARCHAR(128),
 @P_PK_Id INT,
 @P_ValidTo DATETIME2,
 @P_IsUpdate BIT,
 @P_IsInsert BIT,
 @P_Createdby INT,
 @P_IPAddress VARCHAR(16),
 @P_MACAddress VARCHAR(16),
 @P_OUT INT OUTPUT
AS
BEGIN
    SET NOCOUNT ON;
    BEGIN TRY 
        DECLARE @V_sql NVARCHAR(MAX), @V_update NVARCHAR(MAX), @V_Insert NVARCHAR(MAX), @V_InsertColumn NVARCHAR(MAX), @v_PrimaryKey NVARCHAR(128),
                @V_HistoryTable NVARCHAR(MAX), @V_CreateDate DATETIME = GETDATE(), @v_UsersActivityId INT,@V_IsIdentity BIT;

        SELECT @v_PrimaryKey = c.ColumnName 
        FROM Meta.TableColumns c WITH(NOLOCK)
        WHERE c.TableName = @P_TableName AND ISNULL(c.IsPrimaryKey, 0) = 1;

        SELECT @V_HistoryTable = h.HistoryTableName 
        FROM Meta.TableHistory h WITH(NOLOCK)
        WHERE h.TableName = @P_TableName;

		IF EXISTS (SELECT 1
		FROM INFORMATION_SCHEMA.COLUMNS
		WHERE (TABLE_SCHEMA+'.'+TABLE_NAME) = @P_TableName
		AND COLUMNPROPERTY(OBJECT_ID(TABLE_SCHEMA + '.' + TABLE_NAME), COLUMN_NAME, 'IsIdentity') = 1)
		BEGIN
			SET @V_IsIdentity = 1 
		END ;


        IF @P_IsUpdate = 1
        BEGIN
            SELECT @V_update = STRING_AGG(CAST(ColumnUpdate AS NVARCHAR(MAX)), ',') 
            FROM Meta.TableColumns c WITH(NOLOCK)
            WHERE c.TableName = @P_TableName AND ISNULL(c.IsPrimaryKey, 0) = 0 AND IsUpdate = @P_IsUpdate;

            SET @V_sql = 'UPDATE A SET ' + @V_update + '
                FROM ' + @P_TableName + ' A WITH(NOLOCK)
                INNER JOIN ' + @V_HistoryTable + ' B WITH(NOLOCK) ON A.' + @v_PrimaryKey + ' = B.' + @v_PrimaryKey + '
                WHERE A.' + @v_PrimaryKey + ' = ' + CAST(@P_PK_Id AS NVARCHAR) + ' AND B.ValidTo = ' +''''+ FORMAT(@P_ValidTo, 'yyyy-MM-dd HH:mm:ss.fffffff')+'''';

            SET @v_UsersActivityId = 2;
        END
        ELSE IF @P_IsInsert = 1 
        BEGIN
            SELECT @V_InsertColumn = STRING_AGG(CAST(ColumnName AS NVARCHAR(MAX)), ','), 
                   @V_Insert = STRING_AGG(CAST(InsertColumn AS NVARCHAR(MAX)), ',') 
            FROM Meta.TableColumns c WITH(NOLOCK)
            WHERE c.TableName = @P_TableName AND c.IsInsert = @P_IsInsert;
			
            SET @V_sql = CASE WHEN @V_IsIdentity = 1 THEN 'SET IDENTITY_INSERT '+@P_TableName+' ON 'ELSE'' END+'
			INSERT INTO ' + @P_TableName + '(' + @V_InsertColumn + ') 
            SELECT ' + @V_Insert + ' FROM ' + @V_HistoryTable + ' B WITH(NOLOCK)
            WHERE B.' + @v_PrimaryKey + ' = ' + CAST(@P_PK_Id AS NVARCHAR) + ' AND B.ValidTo = ' + ''''+FORMAT(@P_ValidTo, 'yyyy-MM-dd HH:mm:ss.fffffff')+''''+
			CASE WHEN  @V_IsIdentity = 1 THEN ' SET IDENTITY_INSERT '+@P_TableName+' OFF' ELSE '' END;

            SET @v_UsersActivityId = 1;
        END
		print @V_sql
        BEGIN TRANSACTION;
            EXEC sp_executesql @V_sql;

            INSERT INTO Meta.DataRecoveryLog 
            (
                TableName,
                PK_Id,
                Createdby,
                CreateDate,
                IPAddress,
                MACAddress
            )
            SELECT 
                @P_TableName,
                @P_PK_Id,
                @P_Createdby,
                @V_CreateDate,
                @P_IPAddress,
                @P_MACAddress;

        COMMIT TRANSACTION;
        SET @P_OUT = 1;

        EXEC Users.sp_InsertUsersLog 
            @P_ObjectsId = 1,
            @P_UsersId = @P_Createdby,
            @P_UsersActivityId = @v_UsersActivityId,
            @P_MenuId = 1;

        SET @P_OUT = 1;
    END TRY 
    BEGIN CATCH
        IF @@ERROR > 0
            ROLLBACK TRANSACTION;
            SET @P_OUT = -999;

        DECLARE @v_ErrorNumber INT = ERROR_NUMBER(), @v_Error_message VARCHAR(255) = ERROR_MESSAGE();

        EXEC Users.sp_InsertErrorLogs 
            @P_ObjectsId = 1,
            @P_UsersId = @P_Createdby,
            @P_UsersActivityId = @v_UsersActivityId,
            @P_MenuId = 1,
            @P_ErrorNumber = @v_ErrorNumber, 
            @P_ErrorMassage = @v_Error_message;
    END CATCH
END;
