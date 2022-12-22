using AS.Entities.DataEntities;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AS.Data.EntityFramework.Configurations
{

    /// <inheritdoc />
    /// <summary>
    /// Veri taban� User tablosu konfig�rasyonu
    /// </summary>
    internal class UserConfiguration : IEntityTypeConfiguration<User>
    {
        public void Configure(EntityTypeBuilder<User> builder)
        {
            // Tablo ad�
            builder.ToTable("Users","AS");

            builder.HasKey(x => x.Id);
            builder.Property(x => x.Id).IsRequired();
            builder.Property(x => x.IsApproved).IsRequired();
            builder.Property(x => x.CreationTime).IsRequired();
            builder.Property(x => x.UpdateTime).IsRequired();

            builder.HasOne(x => x.CreatedBy).WithMany(y => y.UsersCreatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);
            builder.HasOne(x => x.UpdatedBy).WithMany(y => y.UsersUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);

            builder.Property(x => x.Username).IsRequired().HasColumnType("varchar(512)");
            builder.HasIndex(x => x.Username).IsUnique().HasName("UK_UserUsername");
            builder.Property(x => x.Password).IsRequired().HasColumnType("char(128)");
            builder.Property(x => x.Email).IsRequired().HasColumnType("varchar(512)");
            builder.HasIndex(x => x.Email).IsUnique().HasName("UK_UserEmail");

        }
    }
}