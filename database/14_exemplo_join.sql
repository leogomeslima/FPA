SELECT
    Empresa,
    Departamento,
    CodigoCentroDeCusto,
    CentroDeCusto,
    CodigoConta,
    NomeConta,
    GrupoDRE,
    GrupoFluxoCaixa,
    Cenario,
    NomeVersaoPrevisao,
    [Ano],
    [Mes],
    NomeMes,
    Valor
FROM vw_AnaliseFinanceira
ORDER BY [Ano], [Mes], Cenario, CodigoConta;
GO
