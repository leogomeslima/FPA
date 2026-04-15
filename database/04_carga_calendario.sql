DECLARE @DataInicio DATE = '2026-01-01';
DECLARE @DataFim DATE = '2026-12-01';

WHILE @DataInicio <= @DataFim
BEGIN
    INSERT INTO Calendario (ChaveData, [Ano], [Mes], NomeMes, NumeroTrimestre, NomeTrimestre, NumeroSemestre, AnoMes)
    VALUES (
        @DataInicio,
        YEAR(@DataInicio),
        MONTH(@DataInicio),
        DATENAME(MONTH, @DataInicio),
        DATEPART(QUARTER, @DataInicio),
        CONCAT('T', DATEPART(QUARTER, @DataInicio)),
        CASE WHEN MONTH(@DataInicio) <= 6 THEN 1 ELSE 2 END,
        YEAR(@DataInicio) * 100 + MONTH(@DataInicio)
    );
    SET @DataInicio = DATEADD(MONTH, 1, @DataInicio);
END;
GO