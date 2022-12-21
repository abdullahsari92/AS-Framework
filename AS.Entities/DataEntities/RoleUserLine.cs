using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class RoleUserLine : LineBaseEntity
    {
        public int RoleId { get; set; }
        public int UserId { get; set; }
        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
