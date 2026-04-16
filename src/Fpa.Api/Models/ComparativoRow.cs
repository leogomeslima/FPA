namespace Fpa.Api.Models;

public sealed class ComparativoRow
{
    public int Ano { get; init; }
    public int Mes { get; init; }
    public string NomeMes { get; init; } = string.Empty;
    public string CodigoConta { get; init; } = string.Empty;
    public string NomeConta { get; init; } = string.Empty;
    public string GrupoDRE { get; init; } = string.Empty;
    public decimal ValorRealizado { get; init; }
    public decimal ValorOrcado { get; init; }
    public decimal ValorPrevisao { get; init; }
    public decimal VariancaOrcado { get; init; }
    public decimal VariancaPrevisao { get; init; }
}