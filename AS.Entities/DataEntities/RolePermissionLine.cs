using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class RolePermissionLine : LineBaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual Permission Permission { get; set; }
    }
}
