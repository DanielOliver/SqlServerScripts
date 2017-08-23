--###########################################################
--Contributor: unknown
--Usage:  Find job_id from the first select results.
--Results: Returns a string containing the Create Temp Table of the SProcs' contents.
--###########################################################
DECLARE @ProcedureName  nvarchar(128) = 'spSomComplianceExport',
        @TableName      nvarchar(128) = '#TempCompliance',
        @SQL            nvarchar(max);


SET @SQL = 'CREATE TABLE ' + @tableName + ' (';

SELECT @SQL = @SQL + '['+name +'] '+ system_type_name +''  + ','
        FROM sys.dm_exec_describe_first_result_set_for_object
        (
          OBJECT_ID(@ProcedureName), 
          NULL
        );

--Remove trailing comma
SET @SQL = SUBSTRING(@SQL,0,LEN(@SQL))    
SET @SQL =  @SQL +')'
SELECT @SQL;

