using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace DebtMateAPI.Migrations
{
    /// <inheritdoc />
    public partial class Reckoning : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "Reckonings",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    Name = table.Column<string>(type: "nvarchar(max)", nullable: false),
                    Description = table.Column<string>(type: "nvarchar(max)", nullable: true),
                    TotalCost = table.Column<float>(type: "real", nullable: false),
                    PayerId = table.Column<Guid>(type: "uniqueidentifier", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Reckonings", x => x.Id);
                    table.ForeignKey(
                        name: "FK_Reckonings_Users_PayerId",
                        column: x => x.PayerId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ReckoningUser",
                columns: table => new
                {
                    Id = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    ReckoningId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    UserId = table.Column<Guid>(type: "uniqueidentifier", nullable: false),
                    OwedAmount = table.Column<float>(type: "real", nullable: false),
                    IsPaid = table.Column<bool>(type: "bit", nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ReckoningUser", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ReckoningUser_Reckonings_ReckoningId",
                        column: x => x.ReckoningId,
                        principalTable: "Reckonings",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ReckoningUser_Users_UserId",
                        column: x => x.UserId,
                        principalTable: "Users",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateIndex(
                name: "IX_Reckonings_PayerId",
                table: "Reckonings",
                column: "PayerId");

            migrationBuilder.CreateIndex(
                name: "IX_ReckoningUser_ReckoningId",
                table: "ReckoningUser",
                column: "ReckoningId");

            migrationBuilder.CreateIndex(
                name: "IX_ReckoningUser_UserId",
                table: "ReckoningUser",
                column: "UserId");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "ReckoningUser");

            migrationBuilder.DropTable(
                name: "Reckonings");
        }
    }
}
