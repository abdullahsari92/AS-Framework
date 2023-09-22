using AS.Core;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;

namespace AS.Business.Interfaces
{
    public interface IRoleService: IBaseService<Role,RoleDto>
    {
        // Task<ListModel<PermissionDto>> Get(Guid roleId);

        Task<ListModel<PermissionModel>> Get(Guid roleId);

        Task<List<PermissionModel>> RolePermissionAdd(RoleUpdateModel roleAddModel);


    }
}
