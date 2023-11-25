using AS.Entities.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;
using System.Reflection.Emit;
using System.Reflection.Metadata;

namespace AS.Data.Configurations;

/// <inheritdoc />
/// <summary>
/// Veri tabanı Role tablosu konfigürasyonu
/// </summary>
internal class PersonConfiguration : IEntityTypeConfiguration<Person>
{
    public void Configure(EntityTypeBuilder<Person> builder)
    {
        // Tablo adı
        builder.ToTable("Person", "AS");

        builder.HasKey(p=> p.Id);

        builder.Property(p=> p.Name).IsRequired().HasColumnType("varchar(250)");
        builder.Property(p=> p.Surname).IsRequired().HasColumnType("varchar(250)");
        builder.Property(p => p.IdentityNo).HasMaxLength(11);


        builder.HasOne(f => f.Department).WithMany(y => y.PersonList).HasForeignKey(p => p.DepartmentId).OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.CreationTime);
        builder.Property(p=> p.IsApproved).IsRequired();
        builder.Property(p=> p.CreationTime).IsRequired();
        builder.HasOne(p=> p.CreatedBy).WithMany(p=> p.PersonsCreatedBy).OnDelete(DeleteBehavior.Restrict);
        builder.Property(p=> p.UpdateTime).IsRequired();
        builder.HasOne(p=> p.UpdatedBy).WithMany(y => y.PersonsUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);


        builder.HasOne(e => e.User).WithOne(e => e.Person).HasForeignKey<Person>(e => e.UserId).IsRequired();



    }
}