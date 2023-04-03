using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;
using Microsoft.EntityFrameworkCore;

namespace AS.Business
{
    public class RoleManager : BaseManager<Role,RoleDto>,IRoleService
    {
     
        public RoleManager(IRepository<Role> repositoryRole,IMapper mapper):base(repositoryRole,mapper)
        {
          
        }
              

    }

}
