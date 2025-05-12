# Database Setup Documentation

## Prerequisites
1. SQL Server installed on the local machine
2. .NET SDK 8.0 or later
3. Entity Framework Core tools installed

## Steps Followed to Set Up the Database Connection

### 1. Install or Provision SQL Engine
Option	How
Local SQL Server	Download Developer/Express from Microsoft → run “Basic” install (defaults are fine).
Azure SQL Database	Create a single database in the Azure portal or directly inside ADS’s “Azure” 

### 2. Configure the Connection String
- Modified the connection string in `appsettings.json` to connect to the local SQL Server instance:
```json
"ConnectionStrings": {
 "ConnectionStrings": {
  "BlazorAppContext": "Server=localhost;Database=BlazorAppContext;Trusted_Connection=True;TrustServerCertificate=True;MultipleActiveResultSets=true"
}


- The connection string components:
  - `Server=localhost`: Connects to the local SQL Server instance
  - `Database=BlazorAppContext`: Names the database to be created/used
  - `Trusted_Connection=True`: Uses Windows authentication
  - `TrustServerCertificate=True`: Skips certificate validation (for development)
  - `MultipleActiveResultSets=true`: Allows multiple active result sets
**
### 3. Apply Database Migrations**
Open a terminal at the project root (BlazorApp/).

Run:
dotnet tool update --global dotnet-ef   
dotnet ef database update       

### 4. Database Schema
The database schema includes tables for:
- UserAccount
- BankAccount
- BudgetPlan
- Transaction
- ChatMessages

**## 5. How to Run the Application**
dotnet build     
dotnet run
The Blazor app will read the connection string from appsettings.json (overridden by appsettings.Development.json or environment variables if present) and connect automatically.

**## 6. Troubleshooting**
Cannot open server requested by the login → Add your current IP in ADS: Azure tab → Server → Firewall rules.
Login failed → Reconnect in ADS using the correct auth type (Azure AD).
TLS/SSL handshake error → For Azure SQL keep Encrypt=True;TrustServerCertificate=False; for local dev set TrustServerCertificate=True.

EF migration timeout → Open outbound port 1433 (or use a VPN) and rerun dotnet ef database update.
## Additional Configuration Options
 Enable remote connections on a local SQL Server
ADS doesn’t surface network settings; open SQL Server Configuration Manager (still required) → SQL Server Network Configuration → enable TCP/IP → restart the service.

Switch authentication mode (local engine)
ADS > Object Explorer → right-click server → Manage → Security tab → toggle between Windows Only and Mixed Mode.
