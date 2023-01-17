namespace AS.Entities.Entity
{
    public class RoleUserLine : LineBaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual User User { get; set; }
    }
}
