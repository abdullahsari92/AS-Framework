using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AS.Data.Migrations
{
    /// <inheritdoc />
    public partial class db4 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropColumn(
                name: "EvAdresi",
                schema: "AS",
                table: "Users");

            migrationBuilder.RenameTable(
                name: "Roles",
                newName: "Roles",
                newSchema: "AS");

            migrationBuilder.RenameTable(
                name: "Menus",
                newName: "Menus",
                newSchema: "AS");

            migrationBuilder.CreateTable(
                name: "Permissions",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    Name = table.Column<string>(type: "varchar(512)", nullable: false),
                    Description = table.Column<string>(type: "varchar(512)", nullable: false),
                    ControllerName = table.Column<string>(type: "varchar(512)", nullable: false),
                    ActionName = table.Column<string>(type: "varchar(512)", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<int>(type: "int", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<int>(type: "int", nullable: false),
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
                name: "RoleUserLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    UserId = table.Column<int>(type: "int", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<int>(type: "int", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<int>(type: "int", nullable: false)
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

            migrationBuilder.CreateTable(
                name: "PermissionMenuLines",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    PermissionId = table.Column<int>(type: "int", nullable: false),
                    MenuId = table.Column<int>(type: "int", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<int>(type: "int", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<int>(type: "int", nullable: false)
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
                    Id = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    RoleId = table.Column<int>(type: "int", nullable: false),
                    PermissionId = table.Column<int>(type: "int", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<int>(type: "int", nullable: false),
                    UpdatedTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<int>(type: "int", nullable: false)
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
                name: "Permissions",
                schema: "AS");

            migrationBuilder.RenameTable(
                name: "Roles",
                schema: "AS",
                newName: "Roles");

            migrationBuilder.RenameTable(
                name: "Menus",
                schema: "AS",
                newName: "Menus");

            migrationBuilder.AddColumn<string>(
                name: "EvAdresi",
                schema: "AS",
                table: "Users",
                type: "nvarchar(max)",
                nullable: false,
                defaultValue: "");
        }
    }
}
