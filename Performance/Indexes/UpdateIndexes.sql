-- https://learn.microsoft.com/en-us/sql/relational-databases/indexes/reorganize-and-rebuild-indexes?view=sql-server-ver16

-- Reorganise specific index
ALTER INDEX [Index] ON [table] REORGANIZE;

-- Rebuild specific index
ALTER INDEX [Index] ON [table] REBUILD

-- Reorganise all indexes in a table
ALTER INDEX ALL ON [table] REORGANIZE;

-- Rebuild all indexes in a table
ALTER INDEX ALL ON [table] REBUILD;