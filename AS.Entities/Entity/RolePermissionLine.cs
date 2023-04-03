using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class RolePermissionLine : BaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual Permission Permission { get; set; }
    }
}
