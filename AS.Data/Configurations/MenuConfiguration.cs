using AS.Entities.Entity;
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

        builder.Property(x => x.Name).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.MenuUrl).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.Icon).HasColumnType("varchar(512)");
        builder.Property(x => x.Description).HasColumnType("varchar(512)");
        builder.Property(x => x.DisplayOrder).IsRequired();
        builder.Property(x => x.IsApproved).IsRequired();
        builder.Property(x => x.CreationTime).IsRequired();

        builder.HasOne(p => p.CreatedBy).WithMany(t => t.MenusCreatedBy).HasForeignKey(x => x.CreatedById).OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.MenusUpdatedBy).IsRequired().HasForeignKey(x => x.UpdatedById).OnDelete(DeleteBehavior.Restrict);

   
        builder.HasOne(x => x.Parent).WithMany(y => y.ChildMenus).HasForeignKey(x => x.ParentId).IsRequired().OnDelete(DeleteBehavior.Restrict);
    }
}