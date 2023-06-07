-- NOTE, ROUGH EXAMPLE - MAKE SURE TO FULL TEST FIRST AND JUST USE AS A STARTING POINT
-- Could this be effected by server restart or a DBCC ? Not tested - You've been warned.

SELECT  o.name AS Table_name,
		i.name AS Index_name,
		isu.user_lookups,
		isu.user_seeks,
		isu.user_scans,
		isu.user_updates
FROM    sys.dm_db_index_usage_stats isu
    INNER JOIN sys.objects o ON isu.OBJECT_ID = o.OBJECT_ID
    INNER JOIN sys.indexes i ON i.index_id = isu.index_id AND i.OBJECT_ID = isu.OBJECT_ID
WHERE   i.is_primary_key = 0 --This line excludes primary key constarint
    AND i.is_unique = 0 --This line excludes unique key constarint
    AND isu.user_updates <> 0 -- This line excludes indexes SQL Server hasn’t done any work with
    AND isu.user_lookups = 0
    AND isu.user_seeks = 0
    AND isu.user_scans = 0
ORDER BY  isu.user_updates DESC