SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    GrupoFluxoCaixa,
    SUM(Valor) AS ValorFluxoCaixa
FROM vw_AnaliseFinanceira
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
GO
