using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class RoleUserLine : LineBaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
