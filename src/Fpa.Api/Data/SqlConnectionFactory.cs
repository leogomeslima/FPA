using Microsoft.Data.SqlClient;
using System.Data;

namespace Fpa.Api.Data;

public sealed class SqlConnectionFactory
{
    private readonly IConfiguration _configuration;

    public SqlConnectionFactory(IConfiguration configuration)
    {
        _configuration = configuration;
    }

    public IDbConnection CreateConnection()
    {
        var connectionString = _configuration.GetConnectionString("DefaultConnection");

        if (string.IsNullOrWhiteSpace(connectionString))
            throw new InvalidOperationException("A connection string 'DefaultConnection' não foi configurada.");

        return new SqlConnection(connectionString);
    }
}