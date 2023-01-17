using AS.Data.BaseEntities;

namespace AS.Data.Entity
{
    public class RoleUserLine : LineBaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
