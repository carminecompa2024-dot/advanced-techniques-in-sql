-- Drop the index if it exists
DROP INDEX IF EXISTS balance_index;

-- Create the index
CREATE INDEX balance_index ON bankaccounts USING BTREE (balance);