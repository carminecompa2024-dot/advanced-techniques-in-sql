SELECT account_number
FROM BankAccounts INNER JOIN Transactions on BankAccounts.account_number=Transactions.account_from
ORDER BY account_number ASC;
