using AS.Business.Interfaces;
using AS.Core.Utilities.IoC;
using Microsoft.Extensions.DependencyInjection;

namespace AS.Business.DependencyResolvers
{
    public class BusinessModule : ICoreModule
    {
        public void Load(IServiceCollection services)
        {
            //Transient her defasında yeni bir instance(örnek) oluşturuyor.
            services.AddTransient<IUserService, UserManager>();
            services.AddTransient<IPermissionService, PermissionManager>();
                  

        }
    }
}
