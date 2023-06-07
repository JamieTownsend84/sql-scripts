-- Declare variables
DECLARE @ID INT;
DECLARE @Name NVARCHAR(50);

-- Create a cursor
DECLARE CursorName CURSOR FOR
SELECT ID, Name
FROM YourTableName; -- Replace YourTableName with the actual table name

-- Begin the transaction
BEGIN TRANSACTION;

-- Open the cursor
OPEN CursorName;

-- Fetch the first row
FETCH NEXT FROM CursorName INTO @ID, @Name;

-- Start the loop
WHILE @@FETCH_STATUS = 0
BEGIN
    -- Perform your operations within the transaction
    BEGIN TRY
        -- Your code here

        -- Commit the transaction for the current row
        COMMIT;
    END TRY
    BEGIN CATCH
        -- Rollback the transaction for the current row in case of an error
        ROLLBACK;

        -- Handle the error as needed
        -- You can log the error, raise an exception, or take any appropriate action
        -- PRINT ERROR_MESSAGE();
    END CATCH

    -- Fetch the next row
    FETCH NEXT FROM CursorName INTO @ID, @Name;
END

-- Close and deallocate the cursor
CLOSE CursorName;
DEALLOCATE CursorName;

-- Commit or rollback the overall transaction
IF @@TRANCOUNT > 0
    COMMIT;
ELSE
    ROLLBACK;
