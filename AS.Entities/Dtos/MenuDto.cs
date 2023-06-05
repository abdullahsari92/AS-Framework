using AS.Entities.Base;
using AS.Entities.Entity;

namespace AS.Entities.Dtos
{
    public class MenuDto: Dto
    {

        public string Name { get; set; }

        /// <summary>
        /// Menunun adresi
        /// </summary>
        public string MenuUrl { get; set; }

        /// <summary>
        /// Menunun ikon bilgisi
        /// </summary>
        public string Icon { get; set; }

        /// <summary>
        /// Menunun açıklaması
        /// </summary>
        public string Description { get; set; }

        /// <summary>
        /// Sıra No
        /// </summary>
        public int DisplayOrder { get; set; }

        /// <summary>
        /// Menunun üst menusu
        /// </summary>
        public virtual Menu ParentMenu { get; set; }


        /// <summary>
        /// Menunun alt menuleri
        /// </summary>
        public virtual ICollection<Menu> ChildMenus { get; set; }

        /// <summary>
        /// Menunun rollerle ilişkileri
        /// </summary>
        public virtual ICollection<PermissionMenuLine> PermissionMenuLines { get; set; }



    }
}
