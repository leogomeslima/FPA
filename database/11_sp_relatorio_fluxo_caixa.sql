CREATE OR ALTER PROCEDURE sp_RelatorioFluxoCaixa
    @Ano INT,
    @Mes INT = NULL,
    @Cenario NVARCHAR(50) = NULL
AS
BEGIN
    SET NOCOUNT ON;

    SELECT
        [Ano],
        [Mes],
        NomeMes,
        Cenario,
        GrupoFluxoCaixa,
        SUM(Valor) AS ValorFluxoCaixa
    FROM vw_AnaliseFinanceira
    WHERE [Ano] = @Ano
      AND (@Mes IS NULL OR [Mes] = @Mes)
      AND (@Cenario IS NULL OR Cenario = @Cenario)
    GROUP BY
        [Ano],
        [Mes],
        NomeMes,
        Cenario,
        GrupoFluxoCaixa
    ORDER BY
        [Ano],
        [Mes],
        Cenario,
        GrupoFluxoCaixa;
END;
GO
