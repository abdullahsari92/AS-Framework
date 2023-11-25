using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class Person : BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }
        public int?  IdentityNo { get; set; } // tckimlik
        public string Phone { get; set; }

        public Guid? DepartmentId { get; set; } // zorunlu değil
        public Department Department { get; set; }
        public  Guid UserId { get; set; }
        public User User { get; set; }

    }

}
