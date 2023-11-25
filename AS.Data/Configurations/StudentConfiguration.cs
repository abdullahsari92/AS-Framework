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
internal class StudentConfiguration : IEntityTypeConfiguration<Student>
{
    public void Configure(EntityTypeBuilder<Student> builder)
    {
        // Tablo adı
        builder.ToTable("Student", "AS");

        builder.HasKey(x => x.Id);
        //builder.Property(x => x.Id).IsRequired();

        builder.Property(p => p.IdentityNo).HasMaxLength(11);


        builder.Property(x => x.IsApproved).IsRequired();

        builder.HasOne(f => f.Department).WithMany(y => y.StudentList).IsRequired().HasForeignKey(s => s.DepartmentId).OnDelete(DeleteBehavior.Restrict);
        
        builder.Property(x => x.CreationTime);

        builder.HasOne(x => x.CreatedBy).WithMany(y => y.StudentsCreatedBy).OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.UpdateTime).IsRequired();
        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.StudentsUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.Gender).IsRequired();


    builder.Property(x => x.Name).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.Surname).HasColumnType("varchar(512)"); 

        builder.HasOne(e => e.User).WithOne(e => e.Student).HasForeignKey<Student>(e => e.UserId).IsRequired();
    }
}