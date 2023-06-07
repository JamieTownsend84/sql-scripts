SELECT 
    CASE COUNT(DISTINCT parent_node_id)
       WHEN 1 
           THEN 'NUMA is disabled' 
           ELSE 'NUMA is enabled'
    END AS NumaChecks
   FROM sys.dm_os_schedulers 
  WHERE parent_node_id <> 32

SELECT *
FROM sys.dm_os_performance_counters
WHERE object_name LIKE '%Buffer Node%' AND counter_name = 'Page life expectancy'

SELECT numa_node_count, cpu_count, softnuma_configuration, softnuma_configuration_desc, socket_count, cores_per_socket
FROM sys.dm_os_sys_info