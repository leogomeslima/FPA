WITH AnaliseVarianca AS
(
    SELECT
        af.[Ano],
        af.[Mes],
        af.NomeMes,
        af.CodigoConta,
        af.NomeConta,
        af.GrupoDRE,
        SUM(CASE WHEN af.Cenario = 'Realizado' THEN af.Valor ELSE 0 END) AS ValorRealizado,
        SUM(CASE WHEN af.Cenario = 'Orcado' THEN af.Valor ELSE 0 END) AS ValorOrcado
    FROM vw_AnaliseFinanceira af
    GROUP BY
        af.[Ano],
        af.[Mes],
        af.NomeMes,
        af.CodigoConta,
        af.NomeConta,
        af.GrupoDRE
)
SELECT
    [Ano],
    [Mes],
    NomeMes,
    CodigoConta,
    NomeConta,
    GrupoDRE,
    ValorRealizado,
    ValorOrcado,
    (ValorRealizado - ValorOrcado) AS Varianca,
    RANK() OVER (
        PARTITION BY [Ano], [Mes]
        ORDER BY ABS(ValorRealizado - ValorOrcado) DESC
    ) AS RankingVarianca
FROM AnaliseVarianca
ORDER BY [Ano], [Mes], RankingVarianca;
GO
