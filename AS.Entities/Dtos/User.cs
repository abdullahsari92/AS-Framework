using DPU.Entities.BaseEntities;

namespace DPU.Entities
{
    public class User: BaseEntity
    {
        public string Name { get; set; }
        public string Surname { get; set; }

    }
}
