using AS.Business;
using AS.Business.DependencyResolvers;
using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Extensions;
using AS.Core.Utilities.IoC;
using AS.Data.EntityFramework;
using AS.Entities.DataEntities;
using Microsoft.EntityFrameworkCore;


var builder = WebApplication.CreateBuilder(args);


builder.Services.AddTransient<IUserService, UserManager>();
// Add services to the container.
string configuration = builder.Configuration.GetConnectionString("MsSqlConnection");
builder.Services.AddDbContext<EfDbContext>(options => options.UseSqlServer(configuration));

builder.Services.AddControllers();
// Learn more about configuring Swagger/OpenAPI at https://aka.ms/aspnetcore/swashbuckle
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

//builder.Services.AddDependencyResolvers(new ICoreModule[]
//{
//    new BusinessModule(),
//});


builder.Services.AddTransient<IUserService, UserManager>();
builder.Services.AddScoped<IRepository<User>, Repository<User>>();
builder.Services.AddScoped<IRepository<RoleUserLine>, Repository<RoleUserLine>>();


//builder.Services.AddDbContext<EfContext>();
var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}


app.UseHttpsRedirection();

app.UseAuthorization();

app.MapControllers();

app.Run();
