SELECT scheduler_id, 
       cpu_id, 
       STATUS, 
       is_online
FROM sys.dm_os_schedulers; 