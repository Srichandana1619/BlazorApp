INSERT INTO [BlazorAppContext].[dbo].[Transaction]   -- no leading comma
       ([AccountId],
        [TransactionAmount],
        [TransactionDate],
        [Merchant])
VALUES (1,                      -- AccountId
        8500,                   -- Amount (no comma)
        '2025-05-02',           -- ISO-8601 date is safest
        'Chase');               -- Merchant
