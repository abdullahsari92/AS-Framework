using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class PermissionMenuLine : LineBaseEntity
    {
        public virtual Permission Permission { get; set; }
        public virtual Menu Menu { get; set; }
    }
}
