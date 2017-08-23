--###########################################################
--Contributor: unknown
--Usage:  Find job_id from the first select results.
--Results: Returns some statistics about run length of the job.
--###########################################################
SELECT * FROM MSDB.dbo.sysjobs ORDER BY name --92075450-C65A-4094-8273-76D41FADFCF1

SELECT * FROM MSDB.dbo.sysjobsteps WHERE job_id = '92075450-C65A-4094-8273-76D41FADFCF1'

--SELECT SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -3, 2) + ':' + SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -1, 2) AS [Run Time HH:MM],
--       (60 * SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -3, 2)) + SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -1, 2) AS [Run Time seconds],
--        CONVERT(DATE, CONVERT(CHAR(8), run_date)) AS [Run Date], 
--        * 
--FROM msdb.dbo.sysjobhistory 
--WHERE job_id = '92075450-C65A-4094-8273-76D41FADFCF1' AND step_id = 1

SELECT  AVG([overall].[Run Time seconds]) OVER (PARTITION BY NULL ORDER BY overall.[Run Date] ROWS UNBOUNDED PRECEDING) AS [Moving Average]
        ,*
FROM (
    SELECT SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -3, 2) + ':' + SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -1, 2) AS [Run Time HH:MM],
           (60 * SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -3, 2)) + SUBSTRING( CONVERT(CHAR(6), run_duration), LEN(run_duration) -1, 2) AS [Run Time seconds],
            CONVERT(DATE, CONVERT(CHAR(8), run_date)) AS [Run Date], 
            * 
    FROM msdb.dbo.sysjobhistory 
    WHERE job_id = '92075450-C65A-4094-8273-76D41FADFCF1' AND step_id = 1
) AS overall
