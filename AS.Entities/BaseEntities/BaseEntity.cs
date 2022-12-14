

namespace DPU.Entities.BaseEntities
{
    /// <inheritdoc />
    /// <summary>
    /// Veri tabanı nesneleri için temel nesne
    /// </summary>
    public class BaseEntity
    {
        /// <summary>
        /// Birincil anahtar
        /// </summary>
        public int Id { get; set; }
       
        /// <summary>
        /// Oluşturulma zamanı
        /// </summary>
        public DateTime CreationTime { get; set; }


        public int CreatedById { get; set; }
        /// <summary>
        /// Oluşturan kullanıcı
        /// </summary>
        public virtual User CreatedBy { get; set; }




    }

}
