using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class User : BaseEntity
    {

        public string Username { get; set; }
        public string Password { get; set; }
        public string Email { get; set; }  
        public int UserType { get; set; }
        public Student? Student { get; set; }
        public Person? Person { get; set; }

        public virtual ICollection<RoleUserLine> RoleUserLines { get; set; }

        public virtual ICollection<User> UsersCreatedBy { get; set; }

        public virtual ICollection<User> UsersUpdatedBy { get; set; }

        public virtual ICollection<Role> RolesCreatedBy { get; set; }

        public virtual ICollection<Student> StudentsCreatedBy { get; set; }
        public virtual ICollection<Student> StudentsUpdatedBy { get; set; }

        public virtual ICollection<Faculty> FacultiesCreatedBy { get; set; }
        public virtual ICollection<Faculty> FacultiesUpdatedBy { get; set; }

        public virtual ICollection<Department> DepartmentsCreatedBy { get; set; }
        public virtual ICollection<Department> DepartmentsUpdatedBy { get; set; }

        public virtual ICollection<Person> PersonsCreatedBy { get; set; }
        public virtual ICollection<Person> PersonsUpdatedBy { get; set; }

        public virtual ICollection<Menu> MenusUpdatedBy { get; set; }

        public virtual ICollection<Menu> MenusCreatedBy { get; set; }

        public virtual ICollection<Role> RolesUpdatedBy { get; set; }

        public virtual ICollection<Language> LanguageCreatedBy { get; set; }
        public virtual ICollection<Language> LanguageUpdatedBy { get; set; }

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
