--###########################################################
--Contributor: Unknown
--Usage:  Replace name with object of your choice.
--Results: Translates object type into a human readable format.
--###########################################################
SELECT 
	--[type], 
	CASE [type]
		WHEN 'C' THEN 'CHECK_CONSTRAINT'  
		WHEN 'D' THEN 'DEFAULT_CONSTRAINT'  
		WHEN 'F' THEN 'FOREIGN_KEY_CONSTRAINT'  
		WHEN 'FN' THEN 'SQL_SCALAR_FUNCTION'  
		WHEN 'FS' THEN 'CLR_SCALAR_FUNCTION'  
		WHEN 'IT' THEN 'INTERNAL_TABLE'  
		WHEN 'P' THEN 'SQL_STORED_PROCEDURE'  
		WHEN 'PK' THEN 'PRIMARY_KEY_CONSTRAINT'  
		WHEN 'S' THEN 'SYSTEM_TABLE'  
		WHEN 'SQ' THEN 'SERVICE_QUEUE'  
		WHEN 'TR' THEN 'SQL_TRIGGER'  
		WHEN 'U' THEN 'USER_TABLE'  
		WHEN 'UQ' THEN 'UNIQUE_CONSTRAINT'  
		WHEN 'V' THEN 'VIEW'
		ELSE 'Unknown'
	END AS [Type],
	name, create_date, modify_date
FROM sys.objects
WHERE --CONVERT(DATE,modify_date) >= '6/3/2015'
	name = 'spInsertPartySchemaTables'
	--AND 
	--type = 'P' 
ORDER BY name,modify_date DESC
