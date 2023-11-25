using AS.Entities.Base;

namespace AS.Entities.Entity
{
    public class Department : BaseEntity
    {
        public string Name { get; set; }
        public string Code { get; set; }
        public  Guid FacultyId { get; set; }
        public Faculty Faculty { get; set; }

        public virtual ICollection<Student> StudentList { get; set; }

        public virtual ICollection<Person> PersonList { get; set; }



    }

}
