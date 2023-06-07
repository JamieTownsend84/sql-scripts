-- https://learn.microsoft.com/en-us/sql/t-sql/statements/update-statistics-transact-sql?view=sql-server-ver15

EXEC sp_updatestats;

-- update all on a table
UPDATE STATISTICS [table]; 

-- update all on a table with full row counts
UPDATE STATISTICS [table] WITH FULLSCAN; 