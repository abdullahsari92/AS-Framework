﻿using Adfnet.Core;
using AS.Entities.DataEntities;

namespace AS.Entities.BaseEntities
{
    /// <inheritdoc />
    /// <summary>
    /// Veri tabanı nesneleri için temel nesne
    /// </summary>
    public class BaseEntity: IEntity
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

        /// <summary>
        /// Onaylı kayıt mı?
        /// </summary>
        public bool IsApproved { get; set; }


    }

}
