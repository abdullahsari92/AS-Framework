using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace AS.Data.Migrations
{
    /// <inheritdoc />
    public partial class menuparent : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Menus_Menus_ParentMenuId",
                schema: "AS",
                table: "Menus");

            migrationBuilder.RenameColumn(
                name: "ParentMenuId",
                schema: "AS",
                table: "Menus",
                newName: "ParentId");

            migrationBuilder.RenameIndex(
                name: "IX_Menus_ParentMenuId",
                schema: "AS",
                table: "Menus",
                newName: "IX_Menus_ParentId");

            migrationBuilder.AddForeignKey(
                name: "FK_Menus_Menus_ParentId",
                schema: "AS",
                table: "Menus",
                column: "ParentId",
                principalSchema: "AS",
                principalTable: "Menus",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Menus_Menus_ParentId",
                schema: "AS",
                table: "Menus");

            migrationBuilder.RenameColumn(
                name: "ParentId",
                schema: "AS",
                table: "Menus",
                newName: "ParentMenuId");

            migrationBuilder.RenameIndex(
                name: "IX_Menus_ParentId",
                schema: "AS",
                table: "Menus",
                newName: "IX_Menus_ParentMenuId");

            migrationBuilder.AddForeignKey(
                name: "FK_Menus_Menus_ParentMenuId",
                schema: "AS",
                table: "Menus",
                column: "ParentMenuId",
                principalSchema: "AS",
                principalTable: "Menus",
                principalColumn: "Id",
                onDelete: ReferentialAction.Restrict);
        }
    }
}
