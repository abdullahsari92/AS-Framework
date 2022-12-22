﻿
using System.Reflection;
using AS.Data.EntityFramework.Configurations;
using AS.Entities.DataEntities;
using Microsoft.EntityFrameworkCore;

namespace AS.Data.EntityFramework
{
    public class EfDbContext : DbContext, IDbContext
    {
      //  public new DbSet<TEntity> Set<TEntity>() where TEntity : class => base.Set<TEntity>();


        public DbSet<User> Users { get; set; }

       // public DbSet<Menu> Menus { get; set; }

        public EfDbContext(DbContextOptions options) : base(options)
        {

        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {

            var entityTypeConfigurations = Assembly.GetExecutingAssembly().GetTypes().Where(type => !string.IsNullOrEmpty(type.Namespace) && type.GetInterfaces().Select(x => x.Name).FirstOrDefault() == typeof(IEntityTypeConfiguration<>).Name);

            foreach (var entityTypeConfiguration in entityTypeConfigurations)
            {

                dynamic configurationInstance = Activator.CreateInstance(entityTypeConfiguration);

                modelBuilder.ApplyConfiguration(configurationInstance);

            }
           // modelBuilder.ApplyConfiguration(new UserConfiguration());


            base.OnModelCreating(modelBuilder);
        }

    }
}
