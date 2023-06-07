SELECT st.name
, sp.modification_counter AS [Rows Modified]
, sp.rows
, sp.rows_sampled
, sp.last_updated
FROM sys.stats st CROSS APPLY sys.dm_db_stats_properties(st.object_id, st.stats_id) AS sp   
WHERE OBJECTPROPERTY(st.object_id,'IsUserTable')=1 
ORDER BY sp.last_updated ASC