namespace Fpa.Api.Models;

public sealed class PrevisaoRollingRow
{
    public int Ano { get; init; }
    public int Mes { get; init; }
    public string NomeMes { get; init; } = string.Empty;
    public string CodigoConta { get; init; } = string.Empty;
    public string NomeConta { get; init; } = string.Empty;
    public string GrupoDRE { get; init; } = string.Empty;
    public decimal ValorRolling { get; init; }
}