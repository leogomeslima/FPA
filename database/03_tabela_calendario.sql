CREATE TABLE Calendario
(
    ChaveData DATE PRIMARY KEY,
    [Ano] INT NOT NULL,
    [Mes] INT NOT NULL,
    NomeMes NVARCHAR(20) NOT NULL,
    NumeroTrimestre INT NOT NULL,
    NomeTrimestre NVARCHAR(10) NOT NULL,
    NumeroSemestre INT NOT NULL,
    AnoMes INT NOT NULL
);
GO