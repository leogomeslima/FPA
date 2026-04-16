SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    GrupoDRE,
    SUM(Valor) AS ValorGrupo,
    CAST(
        100.0 * SUM(Valor) /
        NULLIF(SUM(SUM(Valor)) OVER (PARTITION BY [Ano], [Mes], Cenario), 0)
        AS DECIMAL(10,2)
    ) AS PercentualDoTotalMes
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
