using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class RoleUserLine : BaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
