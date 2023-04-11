using System;
using Microsoft.EntityFrameworkCore.Migrations;

#nullable disable

namespace Coolbooks.Data.Migrations
{
    /// <inheritdoc />
    public partial class Migration3 : Migration
    {
        /// <inheritdoc />
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK__Books__AuthorID__44FF419A",
                table: "Books");

            migrationBuilder.DropForeignKey(
                name: "FK__Books__GenreID__45F365D3",
                table: "Books");

            migrationBuilder.DropForeignKey(
                name: "FK__Books__UserID__440B1D61",
                table: "Books");

            migrationBuilder.DropForeignKey(
                name: "FK__Reviews__BookID__4222D4EF",
                table: "Reviews");

            migrationBuilder.DropForeignKey(
                name: "FK__Reviews__UserID__4316F928",
                table: "Reviews");

            migrationBuilder.DropTable(
                name: "Users");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Userinfo__D07EF2C4D00683BD",
                table: "Userinfo");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Reviews__74BC79AE3238230A",
                table: "Reviews");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Genres__0385055E97CE0777",
                table: "Genres");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Books__3DE0C2274E735BF0",
                table: "Books");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Authors__70DAFC146B7E6384",
                table: "Authors");

            migrationBuilder.RenameTable(
                name: "Reviews",
                newName: "Review");

            migrationBuilder.RenameTable(
                name: "Genres",
                newName: "Genre");

            migrationBuilder.RenameTable(
                name: "Books",
                newName: "Book");

            migrationBuilder.RenameTable(
                name: "Authors",
                newName: "Author");

            migrationBuilder.RenameIndex(
                name: "IX_Reviews_UserID",
                table: "Review",
                newName: "IX_Review_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Reviews_BookID",
                table: "Review",
                newName: "IX_Review_BookID");

            migrationBuilder.RenameIndex(
                name: "IX_Books_UserID",
                table: "Book",
                newName: "IX_Book_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Books_GenreID",
                table: "Book",
                newName: "IX_Book_GenreID");

            migrationBuilder.RenameIndex(
                name: "IX_Books_AuthorID",
                table: "Book",
                newName: "IX_Book_AuthorID");

            migrationBuilder.RenameColumn(
                name: "Efternamn",
                table: "Author",
                newName: "Lastname");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Userinfo",
                type: "date",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UserInfoID",
                table: "Userinfo",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<int>(
                name: "ReviewID",
                table: "Review",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<int>(
                name: "GenreID",
                table: "Genre",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Book",
                type: "date",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BookID",
                table: "Book",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Author",
                type: "date",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "datetime",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AuthorID",
                table: "Author",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .Annotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Userinfo__D07EF2C4A50BDB5F",
                table: "Userinfo",
                column: "UserInfoID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Review__74BC79AE99D4781C",
                table: "Review",
                column: "ReviewID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Genre__0385055E0007A1DD",
                table: "Genre",
                column: "GenreID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Book__3DE0C22748413C10",
                table: "Book",
                column: "BookID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Author__70DAFC14AE91D91A",
                table: "Author",
                column: "AuthorID");

            migrationBuilder.CreateTable(
                name: "SiteUser",
                columns: table => new
                {
                    UserID = table.Column<int>(type: "int", nullable: false)
                        .Annotation("SqlServer:Identity", "1, 1"),
                    UserinfoID = table.Column<int>(type: "int", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    PasswordHash = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__SiteUser__1788CCAC06EA2B9C", x => x.UserID);
                    table.ForeignKey(
                        name: "FK__SiteUser__Userin__2E1BDC42",
                        column: x => x.UserinfoID,
                        principalTable: "Userinfo",
                        principalColumn: "UserInfoID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_SiteUser_UserinfoID",
                table: "SiteUser",
                column: "UserinfoID");

            migrationBuilder.AddForeignKey(
                name: "FK__Book__AuthorID__31EC6D26",
                table: "Book",
                column: "AuthorID",
                principalTable: "Author",
                principalColumn: "AuthorID");

            migrationBuilder.AddForeignKey(
                name: "FK__Book__GenreID__32E0915F",
                table: "Book",
                column: "GenreID",
                principalTable: "Genre",
                principalColumn: "GenreID");

            migrationBuilder.AddForeignKey(
                name: "FK__Book__UserID__30F848ED",
                table: "Book",
                column: "UserID",
                principalTable: "SiteUser",
                principalColumn: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK__Review__BookID__2F10007B",
                table: "Review",
                column: "BookID",
                principalTable: "Book",
                principalColumn: "BookID");

            migrationBuilder.AddForeignKey(
                name: "FK__Review__UserID__300424B4",
                table: "Review",
                column: "UserID",
                principalTable: "SiteUser",
                principalColumn: "UserID");
        }

        /// <inheritdoc />
        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropForeignKey(
                name: "FK__Book__AuthorID__31EC6D26",
                table: "Book");

            migrationBuilder.DropForeignKey(
                name: "FK__Book__GenreID__32E0915F",
                table: "Book");

            migrationBuilder.DropForeignKey(
                name: "FK__Book__UserID__30F848ED",
                table: "Book");

            migrationBuilder.DropForeignKey(
                name: "FK__Review__BookID__2F10007B",
                table: "Review");

            migrationBuilder.DropForeignKey(
                name: "FK__Review__UserID__300424B4",
                table: "Review");

            migrationBuilder.DropTable(
                name: "SiteUser");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Userinfo__D07EF2C4A50BDB5F",
                table: "Userinfo");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Review__74BC79AE99D4781C",
                table: "Review");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Genre__0385055E0007A1DD",
                table: "Genre");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Book__3DE0C22748413C10",
                table: "Book");

            migrationBuilder.DropPrimaryKey(
                name: "PK__Author__70DAFC14AE91D91A",
                table: "Author");

            migrationBuilder.RenameTable(
                name: "Review",
                newName: "Reviews");

            migrationBuilder.RenameTable(
                name: "Genre",
                newName: "Genres");

            migrationBuilder.RenameTable(
                name: "Book",
                newName: "Books");

            migrationBuilder.RenameTable(
                name: "Author",
                newName: "Authors");

            migrationBuilder.RenameIndex(
                name: "IX_Review_UserID",
                table: "Reviews",
                newName: "IX_Reviews_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Review_BookID",
                table: "Reviews",
                newName: "IX_Reviews_BookID");

            migrationBuilder.RenameIndex(
                name: "IX_Book_UserID",
                table: "Books",
                newName: "IX_Books_UserID");

            migrationBuilder.RenameIndex(
                name: "IX_Book_GenreID",
                table: "Books",
                newName: "IX_Books_GenreID");

            migrationBuilder.RenameIndex(
                name: "IX_Book_AuthorID",
                table: "Books",
                newName: "IX_Books_AuthorID");

            migrationBuilder.RenameColumn(
                name: "Lastname",
                table: "Authors",
                newName: "Efternamn");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Userinfo",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "date",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "UserInfoID",
                table: "Userinfo",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<int>(
                name: "ReviewID",
                table: "Reviews",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<int>(
                name: "GenreID",
                table: "Genres",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Books",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "date",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "BookID",
                table: "Books",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AlterColumn<DateTime>(
                name: "Created",
                table: "Authors",
                type: "datetime",
                nullable: true,
                oldClrType: typeof(DateTime),
                oldType: "date",
                oldNullable: true);

            migrationBuilder.AlterColumn<int>(
                name: "AuthorID",
                table: "Authors",
                type: "int",
                nullable: false,
                oldClrType: typeof(int),
                oldType: "int")
                .OldAnnotation("SqlServer:Identity", "1, 1");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Userinfo__D07EF2C4D00683BD",
                table: "Userinfo",
                column: "UserInfoID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Reviews__74BC79AE3238230A",
                table: "Reviews",
                column: "ReviewID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Genres__0385055E97CE0777",
                table: "Genres",
                column: "GenreID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Books__3DE0C2274E735BF0",
                table: "Books",
                column: "BookID");

            migrationBuilder.AddPrimaryKey(
                name: "PK__Authors__70DAFC146B7E6384",
                table: "Authors",
                column: "AuthorID");

            migrationBuilder.CreateTable(
                name: "Users",
                columns: table => new
                {
                    UserID = table.Column<int>(type: "int", nullable: false),
                    UserinfoID = table.Column<int>(type: "int", nullable: true),
                    Email = table.Column<string>(type: "nvarchar(50)", maxLength: 50, nullable: true),
                    PasswordHash = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true),
                    SecurityStamp = table.Column<string>(type: "nvarchar(250)", maxLength: 250, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK__Users__1788CCACA057E8B4", x => x.UserID);
                    table.ForeignKey(
                        name: "FK__Users__UserinfoI__412EB0B6",
                        column: x => x.UserinfoID,
                        principalTable: "Userinfo",
                        principalColumn: "UserInfoID");
                });

            migrationBuilder.CreateIndex(
                name: "IX_Users_UserinfoID",
                table: "Users",
                column: "UserinfoID");

            migrationBuilder.AddForeignKey(
                name: "FK__Books__AuthorID__44FF419A",
                table: "Books",
                column: "AuthorID",
                principalTable: "Authors",
                principalColumn: "AuthorID");

            migrationBuilder.AddForeignKey(
                name: "FK__Books__GenreID__45F365D3",
                table: "Books",
                column: "GenreID",
                principalTable: "Genres",
                principalColumn: "GenreID");

            migrationBuilder.AddForeignKey(
                name: "FK__Books__UserID__440B1D61",
                table: "Books",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID");

            migrationBuilder.AddForeignKey(
                name: "FK__Reviews__BookID__4222D4EF",
                table: "Reviews",
                column: "BookID",
                principalTable: "Books",
                principalColumn: "BookID");

            migrationBuilder.AddForeignKey(
                name: "FK__Reviews__UserID__4316F928",
                table: "Reviews",
                column: "UserID",
                principalTable: "Users",
                principalColumn: "UserID");
        }
    }
}
