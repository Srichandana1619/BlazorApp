# Database Setup Documentation

## Prerequisites
1. SQL Server installed on the local machine
2. .NET SDK 8.0 or later
3. Entity Framework Core tools installed

## Steps Followed to Set Up the Database Connection

### 1. Install SQL Server
- Downloaded and installed SQL Server from the [Microsoft SQL Server website](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- During installation, selected "Basic" installation option which installs SQL Server with default settings
- SQL Server was installed but needed additional configuration

### 2. Configure the Connection String
- Modified the connection string in `appsettings.json` to connect to the local SQL Server instance:
```json
"ConnectionStrings": {
  "BlazorAppContext": "Server=localhost;Database=BlazorAppContext;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true"
}
```

- The connection string components:
  - `Server=localhost`: Connects to the local SQL Server instance
  - `Database=BlazorAppContext`: Names the database to be created/used
  - `Trusted_Connection=True`: Uses Windows authentication
  - `TrustServerCertificate=True`: Skips certificate validation (for development)
  - `MultipleActiveResultSets=true`: Allows multiple active result sets

### 3. Apply Database Migrations
- Used Entity Framework Core migrations to create the database schema
- Navigated to the BlazorApp directory in the terminal
- Ran the command: `dotnet ef database update`
- This command created the database and all tables based on the models defined in the application

### 4. Database Schema
The database schema includes tables for:
- UserAccount
- BankAccount
- BudgetPlan
- Transaction
- ChatMessages

## How to Run the Application
1. Ensure SQL Server is running (can be checked through SQL Server Configuration Manager)
2. Open the project in Visual Studio or your preferred IDE
3. Build the solution using `dotnet build`
4. Run the application using `dotnet run`
5. The application will automatically connect to the database using the connection string in appsettings.json

## Troubleshooting
- If you encounter a "server not found" error, ensure SQL Server is running
- If you get authentication errors, check that you're using the correct authentication method (Windows Authentication in this case)
- For migration errors, ensure Entity Framework Core tools are installed: `dotnet tool install --global dotnet-ef`
- Make sure TrustServerCertificate is set to True for development environments

## Additional Configuration Options
- To enable SQL Server remote connections:
  1. Open SQL Server Configuration Manager
  2. Navigate to SQL Server Network Configuration > Protocols for MSSQLSERVER
  3. Enable TCP/IP protocol
  4. Restart the SQL Server service
  
- To change authentication mode:
  1. Open SQL Server Management Studio
  2. Right-click the server in Object Explorer and select Properties
  3. Go to Security page and select the desired server authentication mode