-- Previoulsy the default was 0 (Use all cores)
-- This is now set to 8 by default but really depends on the number of cores available
--
-- https://learn.microsoft.com/en-us/azure/azure-sql/database/configure-max-degree-of-parallelism?view=azuresql
-- 
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 8;