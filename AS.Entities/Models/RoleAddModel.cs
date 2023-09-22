using AS.Entities.Dtos;

namespace AS.Entities.Entity
{
    public class RoleUpdateModel 
    {
        public List<PermissionModel> PermissionModel { get; set; }

        public RoleDto RoleDto { get; set; }


    }

}
