INSERT INTO Empresas (Nome) VALUES ('Empresa Leonardo');
GO

INSERT INTO Departamentos (EmpresaId, Nome) VALUES
(1, 'Financeiro'), (1, 'Operações'), (1, 'Comercial');
GO

INSERT INTO CentrosDeCusto (DepartamentoId, Codigo, Nome) VALUES
(1, 'FIN001', 'Controladoria'), (1, 'FIN002', 'Tesouraria'),
(2, 'OPE001', 'Logística'), (2, 'OPE002', 'Produção'),
(3, 'COM001', 'Vendas'), (3, 'COM002', 'Marketing');
GO

INSERT INTO Contas (CodigoConta, NomeConta, TipoConta, GrupoDRE, GrupoFluxoCaixa) VALUES
('4001', 'Receita de Vendas', 'Receita', 'Receita Bruta', 'Operacional'),
('4002', 'Receita de Serviços', 'Receita', 'Receita Bruta', 'Operacional'),
('5001', 'Custo dos Produtos Vendidos', 'Despesa', 'Custos', 'Operacional'),
('5002', 'Fretes e Entregas', 'Despesa', 'Custos', 'Operacional'),
('6001', 'Despesas Administrativas', 'Despesa', 'Despesas Operacionais', 'Operacional'),
('6002', 'Despesas Comerciais', 'Despesa', 'Despesas Operacionais', 'Operacional'),
('7001', 'Compra de Máquinas', 'CAPEX', 'CAPEX', 'Investimento'),
('8001', 'Empréstimos Bancários', 'Passivo', 'Resultado Financeiro', 'Financiamento');
GO

INSERT INTO Cenarios (Nome) VALUES ('Realizado'), ('Orcado'), ('Previsao');
GO