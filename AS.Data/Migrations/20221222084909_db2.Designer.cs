﻿// <auto-generated />
using System;
using AS.Data.EntityFramework;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace AS.Data.Migrations
{
    [DbContext(typeof(EfDbContext))]
    [Migration("20221222084909_db2")]
    partial class db2
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("AS.Entities.DataEntities.Menu", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CreatedById")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<int>("DisplayOrder")
                        .HasColumnType("int");

                    b.Property<string>("Icon")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<string>("MenuUrl")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<int>("ParentMenuId")
                        .HasColumnType("int");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("UpdatedById")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("DisplayOrder")
                        .HasDatabaseName("IX_MenuDisplayOrder");

                    b.HasIndex("ParentMenuId");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Menus", (string)null);
                });

            modelBuilder.Entity("AS.Entities.DataEntities.Role", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CreatedById")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<int>("Level")
                        .HasColumnType("int");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("UpdatedById")
                        .HasColumnType("int");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Roles", (string)null);
                });

            modelBuilder.Entity("AS.Entities.DataEntities.User", b =>
                {
                    b.Property<int>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("int");

                    SqlServerPropertyBuilderExtensions.UseIdentityColumn(b.Property<int>("Id"));

                    b.Property<int>("CreatedById")
                        .HasColumnType("int");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("Email")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<string>("FirstName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<string>("LastName")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Password")
                        .IsRequired()
                        .HasColumnType("char(128)");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<int>("UpdatedById")
                        .HasColumnType("int");

                    b.Property<string>("Username")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("Email")
                        .IsUnique()
                        .HasDatabaseName("UK_UserEmail");

                    b.HasIndex("UpdatedById");

                    b.HasIndex("Username")
                        .IsUnique()
                        .HasDatabaseName("UK_UserUsername");

                    b.ToTable("Users", "AS");
                });

            modelBuilder.Entity("AS.Entities.DataEntities.Menu", b =>
                {
                    b.HasOne("AS.Entities.DataEntities.User", "CreatedBy")
                        .WithMany("MenusCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.DataEntities.Menu", "ParentMenu")
                        .WithMany("ChildMenus")
                        .HasForeignKey("ParentMenuId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.DataEntities.User", "UpdatedBy")
                        .WithMany("MenusUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("ParentMenu");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.DataEntities.Role", b =>
                {
                    b.HasOne("AS.Entities.DataEntities.User", "CreatedBy")
                        .WithMany("RolesCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.DataEntities.User", "UpdatedBy")
                        .WithMany("RolesUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.DataEntities.User", b =>
                {
                    b.HasOne("AS.Entities.DataEntities.User", "CreatedBy")
                        .WithMany("UsersCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.DataEntities.User", "UpdatedBy")
                        .WithMany("UsersUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.DataEntities.Menu", b =>
                {
                    b.Navigation("ChildMenus");
                });

            modelBuilder.Entity("AS.Entities.DataEntities.User", b =>
                {
                    b.Navigation("MenusCreatedBy");

                    b.Navigation("MenusUpdatedBy");

                    b.Navigation("RolesCreatedBy");

                    b.Navigation("RolesUpdatedBy");

                    b.Navigation("UsersCreatedBy");

                    b.Navigation("UsersUpdatedBy");
                });
#pragma warning restore 612, 618
        }
    }
}
