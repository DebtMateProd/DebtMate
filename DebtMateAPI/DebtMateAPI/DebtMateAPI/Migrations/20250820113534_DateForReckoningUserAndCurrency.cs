using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

#pragma warning disable CA1814 // Prefer jagged arrays over multidimensional

namespace DebtMateAPI.Migrations
{
    /// <inheritdoc />
    public partial class DateForReckoningUserAndCurrency : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.AddColumn<DateTime>(
                name: "PaidDate",
                table: "ReckoningUser",
                type: "datetime(6)",
                nullable: true);

            migrationBuilder.AddColumn<string>(
                name: "CurrencyCode",
                table: "Reckonings",
                type: "varchar(255)",
                nullable: false,
                defaultValue: "")
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.CreateTable(
                name: "Currency",
                columns: table => new
                {
                    Code = table.Column<string>(type: "varchar(255)", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Symbol = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4"),
                    Name = table.Column<string>(type: "longtext", nullable: false)
                        .Annotation("MySql:CharSet", "utf8mb4")
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_Currency", x => x.Code);
                })
                .Annotation("MySql:CharSet", "utf8mb4");

            migrationBuilder.InsertData(
                table: "Currency",
                columns: new[] { "Code", "Name", "Symbol" },
                values: new object[,]
                {
                    { "EUR", "Euro", "€" },
                    { "PLN", "Polski Złoty", "zł" }
                });

            migrationBuilder.CreateIndex(
                name: "IX_Reckonings_CurrencyCode",
                table: "Reckonings",
                column: "CurrencyCode");

            migrationBuilder.AddForeignKey(
                name: "FK_Reckonings_Currency_CurrencyCode",
                table: "Reckonings",
                column: "CurrencyCode",
                principalTable: "Currency",
                principalColumn: "Code",
                onDelete: ReferentialAction.Restrict);
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK_Reckonings_Currency_CurrencyCode",
                table: "Reckonings");

            migrationBuilder.DropTable(
                name: "Currency");

            migrationBuilder.DropIndex(
                name: "IX_Reckonings_CurrencyCode",
                table: "Reckonings");

            migrationBuilder.DropColumn(
                name: "PaidDate",
                table: "ReckoningUser");

            migrationBuilder.DropColumn(
                name: "CurrencyCode",
                table: "Reckonings");
        }
    }
}
