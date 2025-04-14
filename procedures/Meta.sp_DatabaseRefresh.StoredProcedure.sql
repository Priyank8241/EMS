--===============================================================
-- Author		: Priyank Panchmiya
-- Create date	: 2025-03-20
-- Description	: Database Refresh
-- Version		: 1.00
--===============================================================
/*
If you don't have Temporal Tables then you use below script of System SP 

EXEC sp_MSforeachtable 'ALTER TABLE ? NOCHECK CONSTRAINT ALL';
EXEC sp_MSforeachtable 'DELETE FROM ?';
EXEC sp_MSforeachtable 'ALTER TABLE ? CHECK CONSTRAINT ALL';

If you have Temporal Tables then you use below this sp

EXEC Meta.sp_DatabaseRefresh
*/
CREATE PROCEDURE Meta.sp_DatabaseRefresh
AS
	BEGIN
		SET NOCOUNT ON 
		BEGIN TRY 
			DROP TABLE IF EXISTS #EXECUTE
	
			CREATE TABLE #EXECUTE (ID INT IDENTITY(1,1), SCRIPT NVARCHAR(MAX))
	
			INSERT INTO #EXECUTE (SCRIPT)
			SELECT  'ALTER TABLE ['+SC.name+'].[' + tp.name + '] DROP CONSTRAINT [' + fkc.name + '];' + CHAR(13) + CHAR(10)
			FROM sys.foreign_keys fkc
			INNER JOIN sys.tables tp ON fkc.parent_object_id = tp.object_id
			INNER JOIN SYS.schemas SC ON SC.schema_id = TP.schema_id
			ORDER BY tp.name, fkc.name;
			INSERT INTO #EXECUTE (SCRIPT)
			SELECT 'DELETE FROM ['+TABLE_SCHEMA+'].[' + TABLE_NAME + '];' + CHAR(13) + CHAR(10)
			FROM INFORMATION_SCHEMA.TABLES
			WHERE TABLE_TYPE = 'BASE TABLE'
			AND TABLE_SCHEMA NOT IN ('Audits');
			INSERT INTO #EXECUTE (SCRIPT)
			SELECT 'ALTER TABLE ['+SC.name+'].[' + tp.name + '] ADD CONSTRAINT ['+SC1.name+'].[' + fkc.name + '] FOREIGN KEY ([' + c.name + ']) ' 
			    + 'REFERENCES [' + tr.name + '] ([' + cr.name + ']);' + CHAR(13) + CHAR(10)
			FROM sys.foreign_keys fkc
			INNER JOIN sys.foreign_key_columns fkc_cols ON fkc.object_id = fkc_cols.constraint_object_id
			INNER JOIN sys.tables tp ON fkc.parent_object_id = tp.object_id
			INNER JOIN SYS.schemas SC ON SC.schema_id = TP.schema_id
			INNER JOIN sys.columns c ON fkc.parent_object_id = c.object_id AND fkc_cols.parent_column_id = c.column_id
			INNER JOIN sys.tables tr ON fkc.referenced_object_id = tr.object_id
			INNER JOIN SYS.schemas SC1 ON SC1.schema_id = TR.schema_id
			INNER JOIN sys.columns cr ON fkc.referenced_object_id = cr.object_id AND fkc_cols.referenced_column_id = cr.column_id
			ORDER BY tp.name, fkc.name;

			DECLARE @V_sql nvarchar(max), @V_max int, @V_count int = 1 

			SET @V_max = (SELECT MAX(ID) FROM #EXECUTE)

			WHILE @V_count <= @V_max 
				BEGIN 
					SELECT @V_sql = SCRIPT FROM #EXECUTE WHERE ID = @V_count
					EXEC SP_EXECUTESQL @V_sql
					SET @V_count = @V_count + 1
				END 

			DROP TABLE #EXECUTE
		END TRY
	BEGIN CATCH
	THROW
	END CATCH
END





