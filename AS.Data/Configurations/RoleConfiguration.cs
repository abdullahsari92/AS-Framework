﻿using AS.Entities.Entity;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata.Builders;

namespace AS.Data.Configurations;

/// <inheritdoc />
/// <summary>
/// Veri tabanı Role tablosu konfigürasyonu
/// </summary>
internal class RoleConfiguration : IEntityTypeConfiguration<Role>
{
    public void Configure(EntityTypeBuilder<Role> builder)
    {
        // Tablo adı
        builder.ToTable("Roles", "AS");

        builder.HasKey(x => x.Id);
        //builder.Property(x => x.Id).IsRequired();

        builder.Property(x => x.IsApproved).IsRequired();
        builder.Property(x => x.CreationTime).IsRequired();
        builder.HasOne(x => x.CreatedBy).WithMany(y => y.RolesCreatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);
        builder.Property(x => x.UpdateTime).IsRequired();
        builder.HasOne(x => x.UpdatedBy).WithMany(y => y.RolesUpdatedBy).IsRequired().OnDelete(DeleteBehavior.Restrict);


        builder.Property(x => x.Name).IsRequired().HasColumnType("varchar(512)");
        builder.Property(x => x.Description).HasColumnType("varchar(512)");
        builder.Property(x => x.Level).IsRequired();

    }
}