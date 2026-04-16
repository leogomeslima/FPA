using Fpa.Api.Models;

namespace Fpa.Api.Repositories;

public interface IFpaRepository
{
    Task<IReadOnlyList<DreRow>> ObterDreAsync(int ano, int? mes, string? cenario, CancellationToken cancellationToken);
    Task<IReadOnlyList<FluxoCaixaRow>> ObterFluxoCaixaAsync(int ano, int? mes, string? cenario, CancellationToken cancellationToken);
    Task<IReadOnlyList<ComparativoRow>> ObterComparativoAsync(int ano, int? mes, CancellationToken cancellationToken);
    Task<IReadOnlyList<PrevisaoRollingRow>> ObterPrevisaoRollingAsync(int ano, int ultimoMesFechado, CancellationToken cancellationToken);
}