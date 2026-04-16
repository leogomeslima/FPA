using Dapper;
using Fpa.Api.Data;
using Fpa.Api.Models;
using System.Data;

namespace Fpa.Api.Repositories;

public sealed class FpaRepository : IFpaRepository
{
    private readonly SqlConnectionFactory _connectionFactory;

    public FpaRepository(SqlConnectionFactory connectionFactory)
    {
        _connectionFactory = connectionFactory;
    }

    public async Task<IReadOnlyList<DreRow>> ObterDreAsync(
        int ano,
        int? mes,
        string? cenario,
        CancellationToken cancellationToken)
    {
        using var connection = _connectionFactory.CreateConnection();

        var command = new CommandDefinition(
            commandText: "sp_RelatorioDRE",
            parameters: new
            {
                Ano = ano,
                Mes = mes,
                Cenario = cenario
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var result = await connection.QueryAsync<DreRow>(command);
        return result.ToList();
    }

    public async Task<IReadOnlyList<FluxoCaixaRow>> ObterFluxoCaixaAsync(
        int ano,
        int? mes,
        string? cenario,
        CancellationToken cancellationToken)
    {
        using var connection = _connectionFactory.CreateConnection();

        var command = new CommandDefinition(
            commandText: "sp_RelatorioFluxoCaixa",
            parameters: new
            {
                Ano = ano,
                Mes = mes,
                Cenario = cenario
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var result = await connection.QueryAsync<FluxoCaixaRow>(command);
        return result.ToList();
    }

    public async Task<IReadOnlyList<ComparativoRow>> ObterComparativoAsync(
        int ano,
        int? mes,
        CancellationToken cancellationToken)
    {
        using var connection = _connectionFactory.CreateConnection();

        var command = new CommandDefinition(
            commandText: "sp_ComparativoOrcadoRealizado",
            parameters: new
            {
                Ano = ano,
                Mes = mes
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var result = await connection.QueryAsync<ComparativoRow>(command);
        return result.ToList();
    }

    public async Task<IReadOnlyList<PrevisaoRollingRow>> ObterPrevisaoRollingAsync(
        int ano,
        int ultimoMesFechado,
        CancellationToken cancellationToken)
    {
        using var connection = _connectionFactory.CreateConnection();

        var command = new CommandDefinition(
            commandText: "sp_PrevisaoRolling",
            parameters: new
            {
                Ano = ano,
                UltimoMesFechado = ultimoMesFechado
            },
            commandType: CommandType.StoredProcedure,
            cancellationToken: cancellationToken);

        var result = await connection.QueryAsync<PrevisaoRollingRow>(command);
        return result.ToList();
    }
}