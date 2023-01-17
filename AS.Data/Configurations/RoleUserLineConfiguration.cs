using AS.Entities.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AS.Data.Configurations;

/// <inheritdoc />
/// <summary>
/// Veri tabaný RoleUserLine tablosu konfigürasyonu
/// </summary>
internal class RoleUserLineConfiguration : IEntityTypeConfiguration<RoleUserLine>
{
    public void Configure(EntityTypeBuilder<RoleUserLine> builder)
    {
        builder.ToTable("RoleUserLines", "AS");

        builder.HasKey(x => x.Id);
        builder.Property(x => x.Id).IsRequired();
        builder.Property(x => x.CreationTime).IsRequired();
        builder.HasOne(x => x.CreatedBy).WithMany(y => y.RoleUserLinesCreatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.UpdatedTime).IsRequired();
        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.RoleUserLinesUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);


        builder.HasOne(x => x.Role).WithMany(y => y.RoleUserLines).IsRequired().OnDelete(DeleteBehavior.Restrict);
        builder.HasOne(x => x.User).WithMany(y => y.RoleUserLines).IsRequired().OnDelete(DeleteBehavior.Restrict);


    }
}