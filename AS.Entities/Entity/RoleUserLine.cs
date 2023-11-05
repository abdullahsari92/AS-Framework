using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class RoleUserLine : BaseEntity
    {
        public  Guid RoleId { get; set; }
        public Guid UserId { get; set; }

        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
