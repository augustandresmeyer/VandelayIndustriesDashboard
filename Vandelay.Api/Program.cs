using Amazon.Lambda.AspNetCoreServer.Hosting;

var builder = WebApplication.CreateBuilder(args);

// Lambda support
builder.Services.AddAWSLambdaHosting(LambdaEventSource.HttpApi);

// Swagger
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

var app = builder.Build();

if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.MapGet("/users", () =>
{
    var users = new List<User>
    {
        new User(Guid.NewGuid(), "Art", "Vandelay", "art@vandelayindustries.com"),
        new User(Guid.NewGuid(), "George", "Costanza", "george@vandelayindustries.com"),
        new User(Guid.NewGuid(), "Jerry", "Seinfeld", "jerry@vandelayindustries.com"),
        new User(Guid.NewGuid(), "Elaine", "Benes", "elaine@vandelayindustries.com"),
        new User(Guid.NewGuid(), "Cosmo", "Kramer", "kramer@vandelayindustries.com")
    };
    return Results.Ok(users);
});

app.Run();
