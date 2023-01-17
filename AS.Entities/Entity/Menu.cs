namespace AS.Entities.Entity
{
    /// <inheritdoc />
    /// <summary>
    /// AS framework ile geliştirilen sunucuda barındırılan ve yetki sistemine dahil edilen uygulamaların menuleri için sınıf
    /// </summary>
    public class Menu : BaseEntity
    {
        /// <summary>
        /// Menunun görünen adı
        /// </summary>
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