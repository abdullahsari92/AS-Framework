﻿namespace AS.Entities.Entity
{
    public class PermissionMenuLine : LineBaseEntity
    {
        public virtual Permission Permission { get; set; }
        public virtual Menu Menu { get; set; }
    }
}
