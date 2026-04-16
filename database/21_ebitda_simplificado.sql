SELECT
    [Ano],
    [Mes],
    NomeMes,
    Cenario,
    SUM(CASE WHEN GrupoDRE = 'Receita Bruta' THEN Valor ELSE 0 END) AS ReceitaBruta,
    SUM(CASE WHEN GrupoDRE = 'Custos' THEN Valor ELSE 0 END) AS Custos,
    SUM(CASE WHEN GrupoDRE = 'Despesas Operacionais' THEN Valor ELSE 0 END) AS DespesasOperacionais,
    SUM(CASE
            WHEN GrupoDRE IN ('Receita Bruta', 'Custos', 'Despesas Operacionais')
            THEN Valor
            ELSE 0
        END) AS EBITDA_Simplificado
FROM vw_AnaliseFinanceira
GROUP BY
    [Ano],
    [Mes],
    NomeMes,
    Cenario
ORDER BY
    [Ano],
    [Mes],
    Cenario;
GO
