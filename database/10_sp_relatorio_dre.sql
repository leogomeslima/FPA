CREATE OR ALTER PROCEDURE sp_RelatorioDRE
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
        GrupoDRE,
        SUM(Valor) AS ValorTotal
    FROM vw_AnaliseFinanceira
    WHERE [Ano] = @Ano
      AND (@Mes IS NULL OR [Mes] = @Mes)
      AND (@Cenario IS NULL OR Cenario = @Cenario)
      AND TipoConta IN ('Receita', 'Despesa', 'CAPEX')
    GROUP BY
        [Ano],
        [Mes],
        NomeMes,
        Cenario,
        GrupoDRE
    ORDER BY
        [Ano],
        [Mes],
        Cenario,
        GrupoDRE;
END;
GO
