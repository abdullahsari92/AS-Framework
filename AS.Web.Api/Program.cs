using AS.Business;
using AS.Business.AutoMapperProfile;
using AS.Business.DependencyResolvers;
using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Extensions;
using AS.Core.Utilities.IoC;
using AS.Core.ValueObjects;
using AS.Data;
using AS.Data.DependencyResolvers;
using AS.Entities.Entity;
//using AS.Data.Entity;
using AutoMapper;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.EntityFrameworkCore;
using System.Text.Json;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHealthChecks();

builder.Services.AddDependencyResolvers(new ICoreModule[]
{
   // new CoreModule(),
    new DataAccessModule(),
    new BusinessModule(),
});

// Add services to the container.
string configuration = builder.Configuration.GetConnectionString("MsSqlConnection");
builder.Services.AddDbContext<EfDbContext>(options => options.UseSqlServer(configuration));
builder.Services.AddCors(options => options.AddDefaultPolicy(builder => builder.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin()));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddHttpClient();


#region AutoMapper
var mappingConfig = new MapperConfiguration(mc =>
    {
        mc.AddProfile(new BusinessProfile());
    });
    IMapper mapper = mappingConfig.CreateMapper();

    builder.Services.AddSingleton(mapper);
#endregion AutoMapper


builder.Services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
//builder.Services.AddRazorPages().AddJsonOptions(options => options.JsonSerializerOptions.PropertyNamingPolicy = null);
//builder.Services.AddControllers()
//.AddJsonOptions(options => options.JsonSerializerOptions.PropertyNamingPolicy = null); 




//builder.Services.AddDbContext<EfContext>();
var app = builder.Build();


// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHealthChecks("/Healthly", new HealthCheckOptions
{
    ResponseWriter = async (context, report) =>
    {
        context.Response.ContentType = "application/json";
        await context.Response.WriteAsync(JsonSerializer.Serialize(new SuccessResult("Ýþlem Baþarýlý")));
    }
});

builder.Services.AddEndpointsApiExplorer();

app.UseCors();

app.UseRouting();

//app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
