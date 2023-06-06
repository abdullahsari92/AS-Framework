using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AS.Data.Migrations
{
    /// <inheritdoc />
    public partial class Vb2 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropIndex(
                name: "IX_MenuDisplayOrder",
                schema: "AS",
                table: "Menus");

            migrationBuilder.RenameColumn(
                name: "UpdatedTime",
                schema: "AS",
                table: "RoleUserLines",
                newName: "UpdateTime");

            migrationBuilder.RenameColumn(
                name: "UpdatedTime",
                schema: "AS",
                table: "RolePermissionLines",
                newName: "UpdateTime");

            migrationBuilder.RenameColumn(
                name: "UpdatedTime",
                schema: "AS",
                table: "PermissionMenuLines",
                newName: "UpdateTime");

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                schema: "AS",
                table: "RoleUserLines",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                schema: "AS",
                table: "RolePermissionLines",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.AddColumn<bool>(
                name: "IsApproved",
                schema: "AS",
                table: "PermissionMenuLines",
                type: "bit",
                nullable: false,
                defaultValue: false);

            migrationBuilder.CreateTable(
                name: "Language",
                schema: "AS",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Keyword = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Tr = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    En = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Fr = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Es = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    De = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    CreationTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    CreatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UpdateTime = table.Column<DateTime>(type: "datetime2", nullable: false),
                    UpdatedById = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    IsApproved = table.Column<bool>(type: "bit", nullable: false)
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
                });

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
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "Language",
                schema: "AS");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                schema: "AS",
                table: "RoleUserLines");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                schema: "AS",
                table: "RolePermissionLines");

            migrationBuilder.DropColumn(
                name: "IsApproved",
                schema: "AS",
                table: "PermissionMenuLines");

            migrationBuilder.RenameColumn(
                name: "UpdateTime",
                schema: "AS",
                table: "RoleUserLines",
                newName: "UpdatedTime");

            migrationBuilder.RenameColumn(
                name: "UpdateTime",
                schema: "AS",
                table: "RolePermissionLines",
                newName: "UpdatedTime");

            migrationBuilder.RenameColumn(
                name: "UpdateTime",
                schema: "AS",
                table: "PermissionMenuLines",
                newName: "UpdatedTime");

            migrationBuilder.CreateIndex(
                name: "IX_MenuDisplayOrder",
                schema: "AS",
                table: "Menus",
                column: "DisplayOrder");
        }
    }
}
