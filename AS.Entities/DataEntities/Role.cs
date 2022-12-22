using AS.Entities.BaseEntities;

namespace AS.Entities.DataEntities
{
    public class Role : BaseEntity
    {
        public string Name { get; set; }
        public string Description { get; set; }

        public int Level { get; set; }



    }
}
