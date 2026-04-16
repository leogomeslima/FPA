CREATE OR ALTER VIEW vw_AnaliseFinanceira
AS
SELECT
    lf.Id,
    emp.Id AS EmpresaId,
    emp.Nome AS Empresa,
    dep.Id AS DepartamentoId,
    dep.Nome AS Departamento,
    cc.Id AS CentroDeCustoId,
    cc.Codigo AS CodigoCentroDeCusto,
    cc.Nome AS CentroDeCusto,
    cont.Id AS ContaId,
    cont.CodigoConta,
    cont.NomeConta,
    cont.TipoConta,
    cont.GrupoDRE,
    cont.GrupoFluxoCaixa,
    cen.Id AS CenarioId,
    cen.Nome AS Cenario,
    lf.VersaoPrevisaoId,
    vp.NomeVersao AS NomeVersaoPrevisao,
    lf.[Ano],
    lf.[Mes],
    cal.NomeMes,
    cal.NumeroTrimestre,
    cal.NomeTrimestre,
    cal.NumeroSemestre,
    cal.AnoMes,
    lf.Valor,
    lf.CriadoEm
FROM LancamentosFinanceiros lf
INNER JOIN Empresas emp
    ON lf.EmpresaId = emp.Id
INNER JOIN CentrosDeCusto cc
    ON lf.CentroDeCustoId = cc.Id
INNER JOIN Departamentos dep
    ON cc.DepartamentoId = dep.Id
INNER JOIN Contas cont
    ON lf.ContaId = cont.Id
INNER JOIN Cenarios cen
    ON lf.CenarioId = cen.Id
LEFT JOIN VersoesPrevisao vp
    ON lf.VersaoPrevisaoId = vp.Id
LEFT JOIN Calendario cal
    ON cal.[Ano] = lf.[Ano]
   AND cal.[Mes] = lf.[Mes];
GO
