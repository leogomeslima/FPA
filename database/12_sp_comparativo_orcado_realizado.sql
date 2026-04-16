CREATE OR ALTER PROCEDURE sp_ComparativoOrcadoRealizado
    @Ano INT,
    @Mes INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

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
        SUM(CASE WHEN af.Cenario = 'Realizado' THEN af.Valor ELSE 0 END) AS ValorRealizado,
        SUM(CASE WHEN af.Cenario = 'Orcado' THEN af.Valor ELSE 0 END) AS ValorOrcado,
        SUM(CASE WHEN af.Cenario = 'Previsao'
                  AND af.VersaoPrevisaoId = @IdVersaoAtiva
                 THEN af.Valor ELSE 0 END) AS ValorPrevisao,
        SUM(CASE WHEN af.Cenario = 'Realizado' THEN af.Valor ELSE 0 END)
            - SUM(CASE WHEN af.Cenario = 'Orcado' THEN af.Valor ELSE 0 END) AS VariancaOrcado,
        SUM(CASE WHEN af.Cenario = 'Realizado' THEN af.Valor ELSE 0 END)
            - SUM(CASE WHEN af.Cenario = 'Previsao'
                        AND af.VersaoPrevisaoId = @IdVersaoAtiva
                       THEN af.Valor ELSE 0 END) AS VariancaPrevisao
    FROM vw_AnaliseFinanceira af
    WHERE af.[Ano] = @Ano
      AND (@Mes IS NULL OR af.[Mes] = @Mes)
    GROUP BY
        af.[Ano],
        af.[Mes],
        af.NomeMes,
        af.CodigoConta,
        af.NomeConta,
        af.GrupoDRE
    ORDER BY
        af.[Ano],
        af.[Mes],
        af.CodigoConta;
END;
GO
