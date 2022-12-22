﻿using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class User : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName => FirstName + " " + LastName;
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }


        public virtual ICollection<User> UsersCreatedBy { get; set; }

        public virtual ICollection<User> UsersUpdatedBy { get; set; }

        public virtual ICollection<Role> RolesCreatedBy { get; set; }

        public virtual ICollection<Menu> MenusUpdatedBy { get; set; }

        public virtual ICollection<Menu> MenusCreatedBy { get; set; }

        public virtual ICollection<Role> RolesUpdatedBy { get; set; }
    }
}
