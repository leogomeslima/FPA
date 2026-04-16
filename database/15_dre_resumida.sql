SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    GrupoDRE,
    SUM(Valor) AS ValorTotal
FROM vw_AnaliseFinanceira
WHERE TipoConta IN ('Receita', 'Despesa', 'CAPEX')
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
GO
