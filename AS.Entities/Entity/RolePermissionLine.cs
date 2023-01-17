namespace AS.Entities.Entity
{
    public class RolePermissionLine : LineBaseEntity
    {
        public virtual Role Role { get; set; }
        public virtual Permission Permission { get; set; }
    }
}
