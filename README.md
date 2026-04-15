# FP&A API com .NET, Dapper e SQL Server

Projeto para demonstrar uma solução de FP&A (Financial Planning & Analysis) utilizando SQL Server no backend analítico e .NET com Dapper na camada de API.

## Objetivo

Expor indicadores financeiros e relatórios gerenciais por meio de uma API REST simples, organizada e pronta para integração com Excel, Power BI ou aplicações web.

## Stack

- .NET 10
- ASP.NET Core Minimal API
- Dapper
- SQL Server
- Swagger / OpenAPI

## Conceitos implementados

- DRE
- Fluxo de Caixa
- Budget
- Actual
- Forecast
- Rolling Forecast
- Calendar Table
- Forecast Versioning
- Stored Procedures
- View Analítica
- Window Functions

## Estrutura do banco

Principais tabelas:

- Companies
- Departments
- CostCenters
- Accounts
- Scenarios
- ForecastVersions
- FinancialEntries
- Calendar

## Endpoints

- `GET /api/fpa/dre?year=2026`
- `GET /api/fpa/cashflow?year=2026`
- `GET /api/fpa/budget-vs-actual?year=2026`
- `GET /api/fpa/rolling-forecast?year=2026&lastClosedMonth=4`

## Como executar o banco

Execute os scripts da pasta `database/` na ordem numérica.

## Como executar a API

```bash
cd src/Fpa.Api
dotnet restore
dotnet run
