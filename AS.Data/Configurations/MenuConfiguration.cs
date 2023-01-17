using AS.Data.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AS.Data.Configurations;

/// <inheritdoc />
/// <summary>
/// Veri tabanı Menu tablosu konfigürasyonu
/// </summary>
internal class MenuConfiguration : IEntityTypeConfiguration<Menu>
{
    public void Configure(EntityTypeBuilder<Menu> builder)
    {

        builder.ToTable("Menus", "AS");

        builder.HasKey(x => x.Id);
        builder.Property(x => x.Id).IsRequired();
        builder.Property(x => x.DisplayOrder).IsRequired();
        builder.HasIndex(x => x.DisplayOrder).IsUnique(false).HasName("IX_MenuDisplayOrder");
        builder.Property(x => x.IsApproved).IsRequired();
        builder.Property(x => x.CreationTime).IsRequired();
        builder.HasOne(x => x.CreatedBy).WithMany(y => y.MenusCreatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.UpdateTime).IsRequired();
        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.MenusUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);


        builder.Property(x => x.Name).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.MenuUrl).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.Icon).HasColumnType("varchar(512)");
        builder.Property(x => x.Description).HasColumnType("varchar(512)");
        builder.HasOne(x => x.ParentMenu).WithMany(y => y.ChildMenus).IsRequired().OnDelete(DeleteBehavior.Restrict);
    }
}