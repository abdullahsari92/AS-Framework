using AS.Business.Interfaces;
using AS.Core;
using AS.Core.Helpers;
using AS.Core.ValueObjects;
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


        public async Task<PermissionDto> Insert(PermissionDto permissionDto)
        {


           var isEntity =  _repository.IsExist(p => p.ControllerName == permissionDto.ControllerName && p.ActionName == permissionDto.ActionName);
            if(!isEntity)
            {
                return await this.BaseInsert(permissionDto);
                
            }

               return null;
        }
       

    }

}
