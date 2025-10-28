-- Create the trigger function
-- This function logs the update action whenever the balance of a bank account is updated.
CREATE OR REPLACE FUNCTION after_update_balance() RETURNS TRIGGER AS $$
BEGIN
    -- Log the update action
    -- Inserts a record into the userLogs table with the new balance information.
    INSERT INTO userLogs (account_number, action)
    VALUES (NEW.account_number, CONCAT('Account balance updated. New balance: ', NEW.balance));
    RETURN NEW; -- Returns the updated row.
END;
$$ LANGUAGE plpgsql;

-- Drop trigger if exists
DROP TRIGGER IF EXISTS after_update_balance_trigger ON BankAccounts;

-- Create the trigger
-- This trigger is set to execute after an update operation on the balance column of the bankaccounts table.
CREATE TRIGGER after_update_balance_trigger
AFTER UPDATE OF balance ON bankaccounts
FOR EACH ROW
EXECUTE PROCEDURE  after_update_balance(); -- Calls the after_update_balance function.

-- Update bank account balance
-- Updates the balance of the bank account with account number 202 to 1000.
UPDATE bankaccounts
SET balance = 1000
WHERE account_number = 202;

-- Retrieve updated userlogs
-- Retrieves the userlogs for the bank account with account number 202 to observe the changes.
SELECT * FROM userlogs
WHERE account_number = 202;