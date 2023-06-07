SELECT name, value, value_for_secondary, is_value_default
FROM sys.database_scoped_configurations
WHERE name = 'MAXDOP';

SELECT *
FROM sys.configurations
WHERE name LIKE '%parallelism%';