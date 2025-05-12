SELECT TOP (1000) [BudgetPlanId]
      ,[AccountId]
      ,[BudgetName]
      ,[BudgetAmount]
      ,[BudgetExpenditures]
      ,[StartDate]
      ,[EndDate]
  FROM [BlazorAppContext].[dbo].[BudgetPlan]


  Truncate TABLE [BlazorAppContext].[dbo].[BudgetPlan]