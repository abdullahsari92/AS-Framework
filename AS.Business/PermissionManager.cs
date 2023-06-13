using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AutoMapper;
using AutoMapper.QueryableExtensions;

namespace AS.Business
{
    public class PermissionManager :BaseManager<Permission, PermissionDto>, IPermissionService
    {

        private readonly IRepository<RoleUserLine> _repositoryRoleUser;
    

        public PermissionManager(  IMapper mapper, IRepository<Permission> repositoryPermission):base(repositoryPermission,mapper)
        {
         
        }



    }

}
