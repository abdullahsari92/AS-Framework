﻿
using AS.Core;
using AS.Core.Utilities.IoC;
using AS.Entities.Entity;
using Microsoft.Extensions.DependencyInjection;

namespace AS.Data.DependencyResolvers
{
    public class DataAccessModule : ICoreModule
    {
        public void Load(IServiceCollection services)
        {
            //Transient her defasında yeni bir instance(örnek) oluşturuyor.
            
            services.AddScoped<IRepository<User>, Repository<User>>();
            services.AddScoped<IRepository<Permission>, Repository<Permission>>();
            services.AddScoped<IRepository<RolePermissionLine>, Repository<RolePermissionLine>>();


            services.AddScoped<IRepository<RoleUserLine>, Repository<RoleUserLine>>();

            services.AddScoped<IRepository<Role>, Repository<Role>>();

            services.AddScoped<IRepository<Language>, Repository<Language>>();
            services.AddScoped<IRepository<Menu>, Repository<Menu>>();

            services.AddScoped<IRepository<Student>, Repository<Student>>();






        }
    }
}
