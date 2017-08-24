--###########################################################
--Contributor: Unknown
--Usage:  Replace object_name with the item you wish to investigate. When you have a plan that's inefficient, you can manually remove it by using the handle in the "DBCC FREEPROCCACHE" commented out below.
--Results:  Freed an inefficient cache plan.
--###########################################################
SELECT cp.objtype AS ObjectType,
    OBJECT_NAME(st.objectid,st.dbid) AS ObjectName,
    cp.usecounts AS ExecutionCount,
    st.TEXT AS QueryText,
    qp.query_plan AS QueryPlan,
    plan_handle
FROM sys.dm_exec_cached_plans AS cp
CROSS APPLY sys.dm_exec_query_plan(cp.plan_handle) AS qp
CROSS APPLY sys.dm_exec_sql_text(cp.plan_handle) AS st
WHERE OBJECT_NAME(st.objectid,st.dbid) = 'some_object_name'

--DBCC FREEPROCCACHE (0x0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000)
