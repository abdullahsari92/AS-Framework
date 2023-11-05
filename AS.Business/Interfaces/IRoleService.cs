using AS.Core;
using AS.Core.ValueObjects;
using AS.Entities.Dtos;
using AS.Entities.Entity;
using AS.Entities.Models;

namespace AS.Business.Interfaces
{
    public interface IRoleService: IBaseService<Role,RoleDto>
    {
        // Task<ListModel<PermissionDto>> Get(Guid roleId);

        Task<RoleDetailModel> Get(Guid roleId);

        Task<List<PermissionModel>> RolePermissionAdd(RoleDetailModel roleAddModel);

        Task<string> GetPermissionClaims(List<Guid> roleIds);
    }
}
