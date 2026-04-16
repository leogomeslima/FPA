DECLARE @UltimoMesFechadoRolling INT = 4;
DECLARE @IdVersaoPrevisaoRolling INT;

SELECT TOP 1
    @IdVersaoPrevisaoRolling = Id
FROM VersoesPrevisao
WHERE EstaAtivo = 1
ORDER BY CriadoEm DESC;

WITH DadosRolling AS
(
    SELECT
        af.[Ano],
        af.[Mes],
        af.NomeMes,
        af.GrupoDRE,
        SUM(af.Valor) AS ValorRolling
    FROM vw_AnaliseFinanceira af
    WHERE af.[Ano] = 2026
      AND
      (
          (af.[Mes] <= @UltimoMesFechadoRolling AND af.Cenario = 'Realizado')
          OR
          (
              af.[Mes] > @UltimoMesFechadoRolling
              AND af.Cenario = 'Previsao'
              AND af.VersaoPrevisaoId = @IdVersaoPrevisaoRolling
          )
      )
    GROUP BY
        af.[Ano],
        af.[Mes],
        af.NomeMes,
        af.GrupoDRE
)
SELECT
    [Ano],
    [Mes],
    NomeMes,
    GrupoDRE,
    ValorRolling,
    SUM(ValorRolling) OVER (
        PARTITION BY [Ano], GrupoDRE
        ORDER BY [Mes]
    ) AS YTD_Rolling
FROM DadosRolling
ORDER BY GrupoDRE, [Mes];
GO
