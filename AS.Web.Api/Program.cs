using AS.Business;
using AS.Business.AutoMapperProfile;
using AS.Business.DependencyResolvers;
using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Extensions;
using AS.Core.Security;
using AS.Core.Utilities.IoC;
using AS.Core.ValueObjects;
using AS.Data;
using AS.Data.DependencyResolvers;
using AS.Entities.Entity;
using AS.Web.Api.Helpers;
//using AS.Data.Entity;
using AutoMapper;
using IDS.WebApi.Infrastructure;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Diagnostics.HealthChecks;
using Microsoft.AspNetCore.Identity;
using Microsoft.EntityFrameworkCore;
using Microsoft.IdentityModel.Tokens;
using Pomelo.EntityFrameworkCore.MySql.Infrastructure;
using System.Security.Claims;
using System.Security.Principal;
using System.Text;
using System.Text.Json;
using System.Text.Json.Serialization;

var builder = WebApplication.CreateBuilder(args);

builder.Services.AddHealthChecks();



builder.Services.AddDependencyResolvers(new ICoreModule[]
{
   // new CoreModule(),
    new DataAccessModule(),
    new BusinessModule(),
});
builder.Services.AddHttpClient();

// Add services to the container.

string configuration = builder.Configuration.GetConnectionString("MySqlConnection");
//builder.Services.AddDbContext<EfDbContext>(options => options.UseSqlServer(configuration));
var serverVersion = new MySqlServerVersion(new Version(8, 0, 33));

builder.Services.AddDbContext<EfDbContext>(options => options.UseMySql(
    configuration,
    serverVersion,
    o => o.SchemaBehavior(MySqlSchemaBehavior.Translate, (schema, table) => $"{schema}_{table}")));





builder.Services.AddCors(options => options.AddDefaultPolicy(builder => builder.AllowAnyHeader().AllowAnyMethod().AllowAnyOrigin()));

//builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();




#region AutoMapper
var mappingConfig = new MapperConfiguration(mc =>
    {
        mc.AddProfile(new BusinessProfile());
    });
    IMapper mapper = mappingConfig.CreateMapper();

    builder.Services.AddSingleton(mapper);
#endregion AutoMapper
builder.Services.AddHttpContextAccessor();
builder.Services.AddTransient<IHttpContextAccessor, HttpContextAccessor>();
builder.Services.AddHttpClient();
ClaimsPrincipal GetPrincipal(IServiceProvider sp) =>
    sp.GetService<IHttpContextAccessor>()?.HttpContext?.User ??
    new ClaimsPrincipal(new ClaimsIdentity("Unknown"));

builder.Services.AddScoped<IPrincipal>(GetPrincipal);


//builder.Services.AddTransient<IPrincipal>(provider => provider.GetService<IHttpContextAccessor>().HttpContext.User);

builder.Services.AddControllers().AddJsonOptions(p => { p.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.IgnoreCycles; });



builder.BuildIdentity().AddDefaultTokenProviders();

//JWT
builder.Services.Configure<JwtSettings>(builder.Configuration.GetSection(nameof(JwtSettings)));
var jwtSettings = builder.Configuration.GetSection(nameof(JwtSettings)).Get<JwtSettings>();
builder.Services.AddTransient<UserManager<UserClient>>();

// Authorization - Authentication
builder.Services.AddAuthorization().AddAuthentication(options =>
{
    options.DefaultAuthenticateScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
    options.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
})
    .AddJwtBearer(options =>
    {
        options.RequireHttpsMetadata = false;
        options.SaveToken = true;
        options.TokenValidationParameters = new Microsoft.IdentityModel.Tokens.TokenValidationParameters
        {
            ValidIssuer = jwtSettings.ValidIssuer,
            ValidateIssuer = jwtSettings.ValidateIssuer,
            ValidateAudience = jwtSettings.ValidateAudience,
            ValidAudience = jwtSettings.ValidAudience,
            ValidateLifetime = jwtSettings.ValidateLifetime,
            ValidateIssuerSigningKey = Convert.ToBoolean(jwtSettings.ValidateIssuerSigningKey),
            IssuerSigningKey = new SymmetricSecurityKey(Encoding.UTF8.GetBytes(jwtSettings.SecretKey)),
            ClockSkew = TimeSpan.Zero
        };
        options.Events = new JwtBearerEvents
        {
            OnTokenValidated = ctx => Task.CompletedTask,
            OnAuthenticationFailed = ctx =>
            {
                Console.WriteLine(@"Exception:{0}", ctx.Exception.Message);
                return Task.CompletedTask;
            }
        };
    });


//JsonSerializerOptions options = new()
//{
//    ReferenceHandler = ReferenceHandler.IgnoreCycles,
//    WriteIndented = true
//};


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

app.UseMiddleware<SecurityMiddleware>();


app.UseCors();

app.UseRouting();

app.UseAuthentication();

app.UseAuthorization();

app.MapControllers();

app.UseStaticFiles();


app.Run();
