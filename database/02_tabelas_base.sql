CREATE TABLE Empresas
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(150) NOT NULL
);
GO

CREATE TABLE Departamentos
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    EmpresaId INT NOT NULL,
    Nome NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_Departamentos_Empresas FOREIGN KEY (EmpresaId) REFERENCES Empresas(Id)
);
GO

CREATE TABLE CentrosDeCusto
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    DepartamentoId INT NOT NULL,
    Codigo NVARCHAR(20) NOT NULL,
    Nome NVARCHAR(100) NOT NULL,
    CONSTRAINT FK_CentrosDeCusto_Departamentos FOREIGN KEY (DepartamentoId) REFERENCES Departamentos(Id)
);
GO

CREATE TABLE Contas
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    CodigoConta NVARCHAR(20) NOT NULL,
    NomeConta NVARCHAR(150) NOT NULL,
    TipoConta NVARCHAR(50) NOT NULL,
    GrupoDRE NVARCHAR(100) NOT NULL,
    GrupoFluxoCaixa NVARCHAR(100) NOT NULL
);
GO

CREATE TABLE Cenarios
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    Nome NVARCHAR(50) NOT NULL UNIQUE
);
GO

CREATE TABLE VersoesPrevisao
(
    Id INT PRIMARY KEY IDENTITY(1,1),
    NomeVersao NVARCHAR(100) NOT NULL,
    MesReferencia INT NOT NULL,
    [Ano] INT NOT NULL,
    CriadoEm DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    EstaAtivo BIT NOT NULL DEFAULT 0,
    CONSTRAINT CK_VersoesPrevisao_MesReferencia CHECK (MesReferencia BETWEEN 1 AND 12)
);
GO

CREATE TABLE LancamentosFinanceiros
(
    Id BIGINT PRIMARY KEY IDENTITY(1,1),
    EmpresaId INT NOT NULL,
    CentroDeCustoId INT NOT NULL,
    ContaId INT NOT NULL,
    CenarioId INT NOT NULL,
    VersaoPrevisaoId INT NULL,
    [Ano] INT NOT NULL,
    [Mes] INT NOT NULL,
    Valor DECIMAL(18,2) NOT NULL,
    CriadoEm DATETIME2 NOT NULL DEFAULT SYSUTCDATETIME(),
    CONSTRAINT FK_LancamentosFinanceiros_Empresas FOREIGN KEY (EmpresaId) REFERENCES Empresas(Id),
    CONSTRAINT FK_LancamentosFinanceiros_CentrosDeCusto FOREIGN KEY (CentroDeCustoId) REFERENCES CentrosDeCusto(Id),
    CONSTRAINT FK_LancamentosFinanceiros_Contas FOREIGN KEY (ContaId) REFERENCES Contas(Id),
    CONSTRAINT FK_LancamentosFinanceiros_Cenarios FOREIGN KEY (CenarioId) REFERENCES Cenarios(Id),
    CONSTRAINT FK_LancamentosFinanceiros_VersoesPrevisao FOREIGN KEY (VersaoPrevisaoId) REFERENCES VersoesPrevisao(Id),
    CONSTRAINT CK_LancamentosFinanceiros_Mes CHECK ([Mes] BETWEEN 1 AND 12)
);
GO