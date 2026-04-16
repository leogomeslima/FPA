using Fpa.Api.Data;
using Fpa.Api.Repositories;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton<SqlConnectionFactory>();
builder.Services.AddScoped<IFpaRepository, FpaRepository>();

var app = builder.Build();

app.UseSwagger();
app.UseSwaggerUI();

app.MapGet("/", () => Results.Ok(new
{
    nome = "FP&A API",
    endpoints = new[]
    {
        "/api/fpa/dre?ano=2026",
        "/api/fpa/fluxo-caixa?ano=2026",
        "/api/fpa/comparativo?ano=2026",
        "/api/fpa/previsao-rolling?ano=2026&ultimoMesFechado=4"
    }
}));

app.MapGet("/api/fpa/dre",
    async (int ano, int? mes, string? cenario, IFpaRepository repository, CancellationToken cancellationToken) =>
    {
        if (ano <= 0)
            return Results.BadRequest("O parâmetro 'ano' é obrigatório e deve ser maior que zero.");

        var data = await repository.ObterDreAsync(ano, mes, cenario, cancellationToken);
        return Results.Ok(data);
    })
    .WithName("ObterDre");


app.MapGet("/api/fpa/fluxo-caixa",
    async (int ano, int? mes, string? cenario, IFpaRepository repository, CancellationToken cancellationToken) =>
    {
        if (ano <= 0)
            return Results.BadRequest("O parâmetro 'ano' é obrigatório e deve ser maior que zero.");

        var data = await repository.ObterFluxoCaixaAsync(ano, mes, cenario, cancellationToken);
        return Results.Ok(data);
    })
    .WithName("ObterFluxoCaixa");

app.MapGet("/api/fpa/comparativo",
    async (int ano, int? mes, IFpaRepository repository, CancellationToken cancellationToken) =>
    {
        if (ano <= 0)
            return Results.BadRequest("O parâmetro 'ano' é obrigatório e deve ser maior que zero.");

        var data = await repository.ObterComparativoAsync(ano, mes, cancellationToken);
        return Results.Ok(data);
    })
    .WithName("ObterComparativo");

app.MapGet("/api/fpa/previsao-rolling",
    async (int ano, int ultimoMesFechado, IFpaRepository repository, CancellationToken cancellationToken) =>
    {
        if (ano <= 0)
            return Results.BadRequest("O parâmetro 'ano' é obrigatório e deve ser maior que zero.");

        if (ultimoMesFechado is < 1 or > 12)
            return Results.BadRequest("O parâmetro 'ultimoMesFechado' deve estar entre 1 e 12.");

        var data = await repository.ObterPrevisaoRollingAsync(ano, ultimoMesFechado, cancellationToken);
        return Results.Ok(data);
    })
    .WithName("ObterPrevisaoRolling");
    
app.Run();