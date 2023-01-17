using AS.Data.BaseEntities;

namespace AS.Data.Entity
{
    public class User : BaseEntity
    {
        public string FirstName { get; set; }
        public string LastName { get; set; }
        public string DisplayName => FirstName + " " + LastName;
        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }



        public virtual ICollection<RoleUserLine> RoleUserLines { get; set; }

        public virtual ICollection<User> UsersCreatedBy { get; set; }

        public virtual ICollection<User> UsersUpdatedBy { get; set; }

        public virtual ICollection<Role> RolesCreatedBy { get; set; }

        public virtual ICollection<Menu> MenusUpdatedBy { get; set; }

        public virtual ICollection<Menu> MenusCreatedBy { get; set; }

        public virtual ICollection<Role> RolesUpdatedBy { get; set; }

        public virtual ICollection<Permission> PermissionsCreatedBy { get; set; }
        public virtual ICollection<Permission> PermissionsUpdatedBy{ get; set; }

        public virtual ICollection<RolePermissionLine> RolePermissionLinesCreatedBy { get; set; }
        public virtual ICollection<RolePermissionLine> RolePermissionLinesUpdatedBy { get; set; }

        public virtual ICollection<RoleUserLine> RoleUserLinesCreatedBy { get; set; }
        public virtual ICollection<RoleUserLine> RoleUserLinesUpdatedBy { get; set; }

        public virtual ICollection<PermissionMenuLine> PermissionMenuLinesCreatedBy { get; set; }
        public virtual ICollection<PermissionMenuLine> PermissionMenuLinesUpdatedBy { get; set; }


    }
}
