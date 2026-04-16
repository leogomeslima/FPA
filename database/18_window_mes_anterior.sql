SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    GrupoDRE,
    SUM(Valor) AS ValorMensal,
    LAG(SUM(Valor)) OVER (
        PARTITION BY [Ano], Cenario, GrupoDRE
        ORDER BY [Mes]
    ) AS ValorMesAnterior,
    SUM(Valor) - LAG(SUM(Valor)) OVER (
        PARTITION BY [Ano], Cenario, GrupoDRE
        ORDER BY [Mes]
    ) AS VariancaMesAMes
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
    Cenario,
    GrupoDRE,
    [Mes];
GO
