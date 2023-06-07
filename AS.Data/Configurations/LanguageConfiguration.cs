using AS.Entities.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AS.Data.Configurations;

/// <inheritdoc />
/// <summary>
/// Veri tabanı Menu tablosu konfigürasyonu
/// </summary>
internal class LanguageConfiguration : IEntityTypeConfiguration<Language>
{
    public void Configure(EntityTypeBuilder<Language> builder)
    {

        builder.ToTable("Language", "AS");

        builder.HasKey(x => x.Id);      

        builder.Property(x => x.Keyword).IsRequired();
        builder.Property(x => x.Tr).IsRequired();

        builder.Property(x => x.En).IsRequired();

        builder.Property(x => x.Es).IsRequired(false);
        builder.Property(x => x.Fr).IsRequired(false);

        builder.Property(x => x.De).IsRequired(false);
      




        builder.Property(x => x.CreationTime).IsRequired();

        builder.HasOne(p => p.CreatedBy).WithMany(t => t.LanguageCreatedBy).HasForeignKey(x => x.CreatedById).OnDelete(DeleteBehavior.Restrict);

        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.LanguageUpdatedBy).IsRequired().HasForeignKey(x => x.UpdatedById).OnDelete(DeleteBehavior.Restrict);
            
    }
}