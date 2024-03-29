﻿using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class RolePermissionLine : BaseEntity
    {
        public  Guid RoleId { get; set; }
        public Guid PermissionId { get; set; }


        public virtual Role Role { get; set; }
        public virtual Permission Permission { get; set; }
    }
}
