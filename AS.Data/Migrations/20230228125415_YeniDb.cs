using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AS.Data.Migrations
{
    /// <inheritdoc />
    public partial class YeniDb : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.EnsureSchema(
                name: "AS");

            migrationBuilder.CreateTable(
                name: "Users",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    FirstName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    LastName = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Username = table.Column<string>(type: "varchar(512)", nullable: false),
                    Password = table.Column<string>(type: "char(128)", nullable: false),
                    Email = table.Column<string>(type: "varchar(512)", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
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
                });

            migrationBuilder.CreateTable(
                name: "Menus",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false),
                    MenuUrl = table.Column<string>(type: "varchar(512)", nullable: false),
                    Icon = table.Column<string>(type: "varchar(512)", nullable: false),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false),
                    DisplayOrder = table.Column<int>(type: "int", nullable: false),
                    ParentMenuId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Menus", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Menus_Menus_ParentMenuId",
                        column: x => x.ParentMenuId,
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
                });

            migrationBuilder.CreateTable(
                name: "Permissions",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false),
                    ControllerName = table.Column<string>(type: "varchar(512)", nullable: false),
                    ActionName = table.Column<string>(type: "varchar(512)", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Permissions", x => x.Id);
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
                });

            migrationBuilder.CreateTable(
                name: "Roles",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false),
                    Level = table.Column<int>(type: "int", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
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
                });

            migrationBuilder.CreateTable(
                name: "PermissionMenuLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PermissionId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    MenuId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
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
                });

            migrationBuilder.CreateTable(
                name: "RolePermissionLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    PermissionId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
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
                });

            migrationBuilder.CreateTable(
                name: "RoleUserLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    RoleId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
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
                });

            migrationBuilder.CreateIndex(
                name: "IX_MenuDisplayOrder",
                schema: "AS",
                table: "Menus",
                column: "DisplayOrder");

            migrationBuilder.CreateIndex(
                name: "IX_Menus_CreatedById",
                schema: "AS",
                table: "Menus",
                column: "CreatedById");

            migrationBuilder.CreateIndex(
                name: "IX_Menus_ParentMenuId",
                schema: "AS",
                table: "Menus",
                column: "ParentMenuId");

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
                name: "PermissionMenuLines",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "RolePermissionLines",
                schema: "AS");

            migrationBuilder.DropTable(
                name: "RoleUserLines",
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
                name: "Users",
                schema: "AS");
        }
    }
}
