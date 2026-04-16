EXEC sp_RelatorioDRE @Ano = 2026;
GO

EXEC sp_RelatorioDRE @Ano = 2026, @Mes = 4, @Cenario = 'Realizado';
GO

EXEC sp_RelatorioFluxoCaixa @Ano = 2026;
GO

EXEC sp_ComparativoOrcadoRealizado @Ano = 2026;
GO

EXEC sp_ComparativoOrcadoRealizado @Ano = 2026, @Mes = 3;
GO

EXEC sp_PrevisaoRolling @Ano = 2026, @UltimoMesFechado = 4;
GO
