namespace Fpa.Api.Models;

public sealed class DreRow
{
    public int Ano { get; init; }
    public int? Mes { get; init; }
    public string? NomeMes { get; init; }
    public string Cenario { get; init; } = string.Empty;
    public string GrupoDRE { get; init; } = string.Empty;
    public decimal ValorTotal { get; init; }
}