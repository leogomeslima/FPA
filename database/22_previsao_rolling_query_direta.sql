DECLARE @UltimoMesFechado INT = 4;
DECLARE @IdVersaoAtiva INT;

SELECT TOP 1
    @IdVersaoAtiva = Id
FROM VersoesPrevisao
WHERE EstaAtivo = 1
ORDER BY CriadoEm DESC;

SELECT
    af.[Ano],
    af.[Mes],
    af.NomeMes,
    af.CodigoConta,
    af.NomeConta,
    af.GrupoDRE,
    SUM(af.Valor) AS ValorRolling
FROM vw_AnaliseFinanceira af
WHERE af.[Ano] = 2026
  AND
  (
      (af.[Mes] <= @UltimoMesFechado AND af.Cenario = 'Realizado')
      OR
      (
          af.[Mes] > @UltimoMesFechado
          AND af.Cenario = 'Previsao'
          AND af.VersaoPrevisaoId = @IdVersaoAtiva
      )
  )
GROUP BY
    af.[Ano],
    af.[Mes],
    af.NomeMes,
    af.CodigoConta,
    af.NomeConta,
    af.GrupoDRE
ORDER BY
    af.[Mes],
    af.CodigoConta;
GO
