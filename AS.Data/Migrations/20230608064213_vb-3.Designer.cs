﻿// <auto-generated />
using System;
using AS.Data;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Infrastructure;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;
using Microsoft.EntityFrameworkCore.Storage.ValueConversion;

#nullable disable

namespace AS.Data.Migrations
{
    [DbContext(typeof(EfDbContext))]
    [Migration("20230608064213_vb-3")]
    partial class vb3
    {
        /// <inheritdoc />
        protected override void BuildTargetModel(ModelBuilder modelBuilder)
        {
#pragma warning disable 612, 618
            modelBuilder
                .HasAnnotation("ProductVersion", "7.0.1")
                .HasAnnotation("Relational:MaxIdentifierLength", 128);

            SqlServerModelBuilderExtensions.UseIdentityColumns(modelBuilder);

            modelBuilder.Entity("AS.Entities.Entity.Language", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("De")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("En")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Es")
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Fr")
                        .HasColumnType("nvarchar(max)");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<string>("Keyword")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<string>("Tr")
                        .IsRequired()
                        .HasColumnType("nvarchar(max)");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Language", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.Menu", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

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

                    b.Property<Guid>("ParentMenuId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("ParentMenuId");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Menus", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.Permission", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<string>("ActionName")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<string>("ControllerName")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<string>("Description")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<string>("Name")
                        .IsRequired()
                        .HasColumnType("varchar(512)");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Permissions", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.PermissionMenuLine", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<Guid>("MenuId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("PermissionId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("MenuId");

                    b.HasIndex("PermissionId");

                    b.HasIndex("UpdatedById");

                    b.ToTable("PermissionMenuLines", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.Role", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

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

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("UpdatedById");

                    b.ToTable("Roles", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.RolePermissionLine", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<Guid>("PermissionId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("RoleId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("PermissionId");

                    b.HasIndex("RoleId");

                    b.HasIndex("UpdatedById");

                    b.ToTable("RolePermissionLines", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.RoleUserLine", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("CreationTime")
                        .HasColumnType("datetime2");

                    b.Property<bool>("IsApproved")
                        .HasColumnType("bit");

                    b.Property<Guid>("RoleId")
                        .HasColumnType("uniqueidentifier");

                    b.Property<DateTime>("UpdateTime")
                        .HasColumnType("datetime2");

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("UserId")
                        .HasColumnType("uniqueidentifier");

                    b.HasKey("Id");

                    b.HasIndex("CreatedById");

                    b.HasIndex("RoleId");

                    b.HasIndex("UpdatedById");

                    b.HasIndex("UserId");

                    b.ToTable("RoleUserLines", "AS");
                });

            modelBuilder.Entity("AS.Entities.Entity.User", b =>
                {
                    b.Property<Guid>("Id")
                        .ValueGeneratedOnAdd()
                        .HasColumnType("uniqueidentifier");

                    b.Property<Guid>("CreatedById")
                        .HasColumnType("uniqueidentifier");

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

                    b.Property<Guid>("UpdatedById")
                        .HasColumnType("uniqueidentifier");

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

            modelBuilder.Entity("AS.Entities.Entity.Language", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("LanguageCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("LanguageUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.Menu", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("MenusCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Menu", "ParentMenu")
                        .WithMany("ChildMenus")
                        .HasForeignKey("ParentMenuId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("MenusUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("ParentMenu");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.Permission", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("PermissionsCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("PermissionsUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.PermissionMenuLine", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("PermissionMenuLinesCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Menu", "Menu")
                        .WithMany("PermissionMenuLines")
                        .HasForeignKey("MenuId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Permission", "Permission")
                        .WithMany("PermissionMenuLines")
                        .HasForeignKey("PermissionId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("PermissionMenuLinesUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("Menu");

                    b.Navigation("Permission");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.Role", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("RolesCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("RolesUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.RolePermissionLine", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("RolePermissionLinesCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Permission", "Permission")
                        .WithMany("RolePermissionLines")
                        .HasForeignKey("PermissionId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Role", "Role")
                        .WithMany("RolePermissionLines")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("RolePermissionLinesUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("Permission");

                    b.Navigation("Role");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.RoleUserLine", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("RoleUserLinesCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.Role", "Role")
                        .WithMany("RoleUserLines")
                        .HasForeignKey("RoleId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("RoleUserLinesUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "User")
                        .WithMany("RoleUserLines")
                        .HasForeignKey("UserId")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("Role");

                    b.Navigation("UpdatedBy");

                    b.Navigation("User");
                });

            modelBuilder.Entity("AS.Entities.Entity.User", b =>
                {
                    b.HasOne("AS.Entities.Entity.User", "CreatedBy")
                        .WithMany("UsersCreatedBy")
                        .HasForeignKey("CreatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.HasOne("AS.Entities.Entity.User", "UpdatedBy")
                        .WithMany("UsersUpdatedBy")
                        .HasForeignKey("UpdatedById")
                        .OnDelete(DeleteBehavior.Restrict)
                        .IsRequired();

                    b.Navigation("CreatedBy");

                    b.Navigation("UpdatedBy");
                });

            modelBuilder.Entity("AS.Entities.Entity.Menu", b =>
                {
                    b.Navigation("ChildMenus");

                    b.Navigation("PermissionMenuLines");
                });

            modelBuilder.Entity("AS.Entities.Entity.Permission", b =>
                {
                    b.Navigation("PermissionMenuLines");

                    b.Navigation("RolePermissionLines");
                });

            modelBuilder.Entity("AS.Entities.Entity.Role", b =>
                {
                    b.Navigation("RolePermissionLines");

                    b.Navigation("RoleUserLines");
                });

            modelBuilder.Entity("AS.Entities.Entity.User", b =>
                {
                    b.Navigation("LanguageCreatedBy");

                    b.Navigation("LanguageUpdatedBy");

                    b.Navigation("MenusCreatedBy");

                    b.Navigation("MenusUpdatedBy");

                    b.Navigation("PermissionMenuLinesCreatedBy");

                    b.Navigation("PermissionMenuLinesUpdatedBy");

                    b.Navigation("PermissionsCreatedBy");

                    b.Navigation("PermissionsUpdatedBy");

                    b.Navigation("RolePermissionLinesCreatedBy");

                    b.Navigation("RolePermissionLinesUpdatedBy");

                    b.Navigation("RoleUserLines");

                    b.Navigation("RoleUserLinesCreatedBy");

                    b.Navigation("RoleUserLinesUpdatedBy");

                    b.Navigation("RolesCreatedBy");

                    b.Navigation("RolesUpdatedBy");

                    b.Navigation("UsersCreatedBy");

                    b.Navigation("UsersUpdatedBy");
                });
#pragma warning restore 612, 618
        }
    }
}