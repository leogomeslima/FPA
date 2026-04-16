namespace Fpa.Api.Models;

public sealed class FluxoCaixaRow
{
    public int Ano { get; init; }

    public int? Mes { get; init; }

    public string? NomeMes { get; init; }

    public string Cenario { get; init; } = string.Empty;

    public string GrupoFluxoCaixa { get; init; } = string.Empty;

    public decimal ValorFluxoCaixa { get; init; }
}