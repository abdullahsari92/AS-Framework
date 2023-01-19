using AS.Core;
using AS.Entities.Entity;

namespace AS.Entities.Base
{
    /// <inheritdoc />
    /// <summary>
    /// Çoktan çoka ilişkli veri tabanı nesneleri için temel nesne
    /// </summary>
    public class LineBaseEntity : IEntity
    {
        /// <summary>
        /// Birincil anahtar
        /// </summary>
        public int Id { get; set; }


        /// <summary>
        /// Oluşturulma zamanı
        /// </summary>
        public DateTime CreationTime { get; set; }

        /// <summary>
        /// Oluşturan kullanıcı
        /// </summary>
        public virtual User CreatedBy { get; set; }

        /// <summary>
        /// Son değişiklik zamanı
        /// </summary>
        public DateTime UpdatedTime { get; set; }

        /// <summary>
        /// Son değiştiren kullanıcı
        /// </summary>
        public virtual User UpdatedBy { get; set; }

    }

}
