using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AS.Data.Migrations
{
    /// <inheritdoc />
    public partial class mysql : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "AS");

            migrationBuilder.AlterDatabase()
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "ActionStatus",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("MySql:ValueGenerationStrategy", MySqlValueGenerationStrategy.IdentityColumn),
                    Name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Description = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ActionStatus", x => x.Id);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Users",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Username = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Password = table.Column<string>(type: "char(128)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Email = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    UserType = table.Column<int>(type: "int", maxLength: 1, nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Users", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Users_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Users_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Faculty",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Code = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    EducationTime = table.Column<byte>(type: "tinyint unsigned", maxLength: 2, nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Faculty", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Faculty_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Faculty_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Language",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Keyword = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Tr = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    En = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Fr = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Es = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    De = table.Column<string>(type: "longtext", nullable: true)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Language", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Language_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Language_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Menus",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MenuUrl = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Icon = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DisplayOrder = table.Column<int>(type: "int", nullable: false),
                    ParentId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Menus", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Menus_Menus_ParentId",
                        column: x => x.ParentId,
                        principalSchema: "AS",
                        principalTable: "Menus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Menus_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Menus_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Permissions",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ControllerName = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    ActionName = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    CRUDActionType = table.Column<int>(type: "int", nullable: false),
                    ActionStatusId = table.Column<int>(type: "int", nullable: true),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Permissions", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Permissions_ActionStatus_ActionStatusId",
                        column: x => x.ActionStatusId,
                        principalSchema: "AS",
                        principalTable: "ActionStatus",
                        principalColumn: "Id");
                    table.ForeignKey(
                        name: "FK_Permissions_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Permissions_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Roles",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Level = table.Column<int>(type: "int", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Roles", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Roles_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Roles_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Department",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Code = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    FacultyId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Department", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Department_Faculty_FacultyId",
                        column: x => x.FacultyId,
                        principalSchema: "AS",
                        principalTable: "Faculty",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Department_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Department_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "PermissionMenuLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    PermissionId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    MenuId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_PermissionMenuLines", x => x.Id);
                    table.ForeignKey(
                        name: "FK_PermissionMenuLines_Menus_MenuId",
                        column: x => x.MenuId,
                        principalSchema: "AS",
                        principalTable: "Menus",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PermissionMenuLines_Permissions_PermissionId",
                        column: x => x.PermissionId,
                        principalSchema: "AS",
                        principalTable: "Permissions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PermissionMenuLines_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_PermissionMenuLines_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "RolePermissionLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    RoleId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    PermissionId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RolePermissionLines", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RolePermissionLines_Permissions_PermissionId",
                        column: x => x.PermissionId,
                        principalSchema: "AS",
                        principalTable: "Permissions",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RolePermissionLines_Roles_RoleId",
                        column: x => x.RoleId,
                        principalSchema: "AS",
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RolePermissionLines_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RolePermissionLines_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "RoleUserLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    RoleId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UserId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_RoleUserLines", x => x.Id);
                    table.ForeignKey(
                        name: "FK_RoleUserLines_Roles_RoleId",
                        column: x => x.RoleId,
                        principalSchema: "AS",
                        principalTable: "Roles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RoleUserLines_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RoleUserLines_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_RoleUserLines_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Person",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(250)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Surname = table.Column<string>(type: "varchar(250)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    IdentityNo = table.Column<int>(type: "int", maxLength: 11, nullable: true),
                    Phone = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DepartmentId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UserId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Person", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Person_Department_DepartmentId",
                        column: x => x.DepartmentId,
                        principalSchema: "AS",
                        principalTable: "Department",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Person_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Person_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Person_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Student",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Surname = table.Column<string>(type: "varchar(512)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    FatherName = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    MotherName = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    IdentityNo = table.Column<int>(type: "int", maxLength: 11, nullable: false),
                    PlaceOfBirth = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Phone = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DateOfBirth = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    Gender = table.Column<string>(type: "varchar(1)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    DepartmentId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UserId = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    CreationTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    CreatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    UpdateTime = table.Column<DateTime>(type: "datetime(6)", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "char(36)", nullable: false, collation: "ascii_general_ci"),
                    IsApproved = table.Column<bool>(type: "tinyint(1)", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Student", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Student_Department_DepartmentId",
                        column: x => x.DepartmentId,
                        principalSchema: "AS",
                        principalTable: "Department",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Student_Users_CreatedById",
                        column: x => x.CreatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Student_Users_UpdatedById",
                        column: x => x.UpdatedById,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_Student_Users_UserId",
                        column: x => x.UserId,
                        principalSchema: "AS",
                        principalTable: "Users",
                        principalColumn: "Id");
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateIndex(
                name: "IX_Department_CreatedById",
                schema: "AS",
                table: "Department",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Department_FacultyId",
                schema: "AS",
                table: "Department",
                column: "FacultyId");

            migrationBuilder.CreateIndex(
                name: "IX_Department_UpdatedById",
                schema: "AS",
                table: "Department",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Faculty_CreatedById",
                schema: "AS",
                table: "Faculty",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Faculty_UpdatedById",
                schema: "AS",
                table: "Faculty",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Language_CreatedById",
                schema: "AS",
                table: "Language",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Language_UpdatedById",
                schema: "AS",
                table: "Language",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Menus_CreatedById",
                schema: "AS",
                table: "Menus",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Menus_ParentId",
                schema: "AS",
                table: "Menus",
                column: "ParentId");

            migrationBuilder.CreateIndex(
                name: "IX_Menus_UpdatedById",
                schema: "AS",
                table: "Menus",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionMenuLines_CreatedById",
                schema: "AS",
                table: "PermissionMenuLines",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionMenuLines_MenuId",
                schema: "AS",
                table: "PermissionMenuLines",
                column: "MenuId");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionMenuLines_PermissionId",
                schema: "AS",
                table: "PermissionMenuLines",
                column: "PermissionId");

            migrationBuilder.CreateIndex(
                name: "IX_PermissionMenuLines_UpdatedById",
                schema: "AS",
                table: "PermissionMenuLines",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Permissions_ActionStatusId",
                schema: "AS",
                table: "Permissions",
                column: "ActionStatusId");

            migrationBuilder.CreateIndex(
                name: "IX_Permissions_CreatedById",
                schema: "AS",
                table: "Permissions",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Permissions_UpdatedById",
                schema: "AS",
                table: "Permissions",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Person_CreatedById",
                schema: "AS",
                table: "Person",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Person_DepartmentId",
                schema: "AS",
                table: "Person",
                column: "DepartmentId");

            migrationBuilder.CreateIndex(
                name: "IX_Person_UpdatedById",
                schema: "AS",
                table: "Person",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Person_UserId",
                schema: "AS",
                table: "Person",
                column: "UserId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_RolePermissionLines_CreatedById",
                schema: "AS",
                table: "RolePermissionLines",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_RolePermissionLines_PermissionId",
                schema: "AS",
                table: "RolePermissionLines",
                column: "PermissionId");

            migrationBuilder.CreateIndex(
                name: "IX_RolePermissionLines_RoleId",
                schema: "AS",
                table: "RolePermissionLines",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_RolePermissionLines_UpdatedById",
                schema: "AS",
                table: "RolePermissionLines",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Roles_CreatedById",
                schema: "AS",
                table: "Roles",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Roles_UpdatedById",
                schema: "AS",
                table: "Roles",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_RoleUserLines_CreatedById",
                schema: "AS",
                table: "RoleUserLines",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_RoleUserLines_RoleId",
                schema: "AS",
                table: "RoleUserLines",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "IX_RoleUserLines_UpdatedById",
                schema: "AS",
                table: "RoleUserLines",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_RoleUserLines_UserId",
                schema: "AS",
                table: "RoleUserLines",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_Student_CreatedById",
                schema: "AS",
                table: "Student",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Student_DepartmentId",
                schema: "AS",
                table: "Student",
                column: "DepartmentId");

            migrationBuilder.CreateIndex(
                name: "IX_Student_UpdatedById",
                schema: "AS",
                table: "Student",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Student_UserId",
                schema: "AS",
                table: "Student",
                column: "UserId",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "IX_Users_CreatedById",
                schema: "AS",
                table: "Users",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Users_UpdatedById",
                schema: "AS",
                table: "Users",
                column: "UpdatedById");

            migrationBuilder.CreateIndex(
                name: "UK_UserEmail",
                schema: "AS",
                table: "Users",
                column: "Email",
                unique: true);

            migrationBuilder.CreateIndex(
                name: "UK_UserUsername",
                schema: "AS",
                table: "Users",
                column: "Username",
                unique: true);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Language",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "PermissionMenuLines",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Person",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "RolePermissionLines",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "RoleUserLines",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Student",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Menus",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Permissions",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Roles",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Department",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "ActionStatus",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Faculty",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "Users",
                schema: "AS");
        }
    }
}
