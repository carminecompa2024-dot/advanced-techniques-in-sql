SELECT 
    account_holder, 
    balance,
    NTILE(4) OVER (ORDER BY balance DESC) AS class
FROM 
    BankAccounts;