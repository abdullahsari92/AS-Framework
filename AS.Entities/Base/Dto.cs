using AS.Core.ValueObjects;
using AS.Entities.Entity;
using System;

using System.ComponentModel.DataAnnotations;

namespace AS.Entities.Base
{
    public class Dto : IDto
    {
        [Key]
        /// <summary>
        /// Birincil anahtar
        /// </summary>
        public Guid Id { get; set; }

        /// <summary>
        /// Oluşturulma zamanı
        /// </summary>
        public DateTime CreationTime { get; set; }


        //public int CreatedById { get; set; }
        /// <summary>
        /// Oluşturan kullanıcı
        /// </summary>
        public virtual User CreatedBy { get; set; }

        /// <summary>
        /// Son değişiklik zamanı
        /// </summary>
        public DateTime UpdateTime { get; set; }

        /// <summary>
        /// Son değiştiren kullanıcı
        /// </summary>
        public virtual User UpdatedBy { get; set; }

        /// <summary>
        /// Onaylı kayıt mı?
        /// </summary>
        public bool IsApproved { get; set; }
    }
    public interface IDto
    {
        public Guid Id { get; set; }
        public DateTime CreationTime { get; set; }
        public User CreatedBy { get; set; }
        public DateTime UpdateTime { get; set; }
        public User UpdatedBy { get; set; }
        public bool IsApproved { get; set; }
    }
}
