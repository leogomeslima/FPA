CREATE INDEX IX_LancamentosFinanceiros_AnoMesCenario ON LancamentosFinanceiros ([Ano], [Mes], CenarioId);
GO
CREATE INDEX IX_LancamentosFinanceiros_ContaId ON LancamentosFinanceiros (ContaId);
GO
CREATE INDEX IX_LancamentosFinanceiros_CentroDeCustoId ON LancamentosFinanceiros (CentroDeCustoId);
GO
CREATE INDEX IX_LancamentosFinanceiros_VersaoPrevisaoId ON LancamentosFinanceiros (VersaoPrevisaoId);
GO
CREATE INDEX IX_LancamentosFinanceiros_EmpresaId ON LancamentosFinanceiros (EmpresaId);
GO