SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    GrupoDRE,
    SUM(Valor) AS ValorMensal,
    SUM(SUM(Valor)) OVER (
        PARTITION BY [Ano], Cenario, GrupoDRE
        ORDER BY [Mes]
    ) AS ValorAcumuladoAno
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
