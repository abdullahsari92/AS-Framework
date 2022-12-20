using AS.Entities.BaseEntities;

namespace AS.Entities.Dtos
{
    public class User : BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }

    }
}
