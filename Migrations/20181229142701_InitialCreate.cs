﻿using System;
using Microsoft.EntityFrameworkCore.Metadata;
using Microsoft.EntityFrameworkCore.Migrations;

namespace ge_repository.Migrations
{
    public partial class InitialCreate : Migration
    {
        protected override void Up(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.CreateTable(
                name: "AspNetRoles",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    Name = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedName = table.Column<string>(maxLength: 256, nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoles", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUsers",
                columns: table => new
                {
                    Id = table.Column<string>(nullable: false),
                    UserName = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedUserName = table.Column<string>(maxLength: 256, nullable: true),
                    Email = table.Column<string>(maxLength: 256, nullable: true),
                    NormalizedEmail = table.Column<string>(maxLength: 256, nullable: true),
                    EmailConfirmed = table.Column<bool>(nullable: false),
                    PasswordHash = table.Column<string>(nullable: true),
                    SecurityStamp = table.Column<string>(nullable: true),
                    ConcurrencyStamp = table.Column<string>(nullable: true),
                    PhoneNumber = table.Column<string>(nullable: true),
                    PhoneNumberConfirmed = table.Column<bool>(nullable: false),
                    TwoFactorEnabled = table.Column<bool>(nullable: false),
                    LockoutEnd = table.Column<DateTimeOffset>(nullable: true),
                    LockoutEnabled = table.Column<bool>(nullable: false),
                    AccessFailedCount = table.Column<int>(nullable: false),
                    FirstName = table.Column<string>(nullable: true),
                    LastName = table.Column<string>(nullable: true),
                    LastLoggedIn = table.Column<DateTime>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUsers", x => x.Id);
                });

            migrationBuilder.CreateTable(
                name: "AspNetRoleClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    RoleId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetRoleClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetRoleClaims_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserClaims",
                columns: table => new
                {
                    Id = table.Column<int>(nullable: false)
                        .Annotation("SqlServer:ValueGenerationStrategy", SqlServerValueGenerationStrategy.IdentityColumn),
                    UserId = table.Column<string>(nullable: false),
                    ClaimType = table.Column<string>(nullable: true),
                    ClaimValue = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserClaims", x => x.Id);
                    table.ForeignKey(
                        name: "FK_AspNetUserClaims_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserLogins",
                columns: table => new
                {
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderKey = table.Column<string>(maxLength: 128, nullable: false),
                    ProviderDisplayName = table.Column<string>(nullable: true),
                    UserId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserLogins", x => new { x.LoginProvider, x.ProviderKey });
                    table.ForeignKey(
                        name: "FK_AspNetUserLogins_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserRoles",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    RoleId = table.Column<string>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserRoles", x => new { x.UserId, x.RoleId });
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetRoles_RoleId",
                        column: x => x.RoleId,
                        principalTable: "AspNetRoles",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_AspNetUserRoles_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "AspNetUserTokens",
                columns: table => new
                {
                    UserId = table.Column<string>(nullable: false),
                    LoginProvider = table.Column<string>(maxLength: 128, nullable: false),
                    Name = table.Column<string>(maxLength: 128, nullable: false),
                    Value = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_AspNetUserTokens", x => new { x.UserId, x.LoginProvider, x.Name });
                    table.ForeignKey(
                        name: "FK_AspNetUserTokens_AspNetUsers_UserId",
                        column: x => x.UserId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ge_event",
                columns: table => new
                {
                    Id = table.Column<Guid>(nullable: false),
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    message = table.Column<string>(nullable: true),
                    returnUrl = table.Column<string>(nullable: true),
                    level = table.Column<int>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_event", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_event_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ge_office",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    locName = table.Column<string>(maxLength: 255, nullable: true),
                    locAddress = table.Column<string>(maxLength: 255, nullable: true),
                    locPostcode = table.Column<string>(maxLength: 255, nullable: true),
                    locMapReference = table.Column<string>(maxLength: 255, nullable: true),
                    locEast = table.Column<double>(nullable: true),
                    locNorth = table.Column<double>(nullable: true),
                    locLevel = table.Column<double>(nullable: true),
                    datumProjection = table.Column<int>(nullable: false),
                    locLatitude = table.Column<double>(nullable: true),
                    locLongitude = table.Column<double>(nullable: true),
                    locHeight = table.Column<double>(nullable: true),
                    folder = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    name = table.Column<string>(maxLength: 255, nullable: true),
                    managerId = table.Column<string>(maxLength: 450, nullable: true),
                    project_operations = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_office", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_office_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_office_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_office_AspNetUsers_managerId",
                        column: x => x.managerId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ge_office_user",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    userId = table.Column<string>(nullable: true),
                    user_operations = table.Column<string>(nullable: true),
                    officeId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_office_user", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_office_user_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_office_user_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_office_user_ge_office_officeId",
                        column: x => x.officeId,
                        principalTable: "ge_office",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ge_office_user_AspNetUsers_userId",
                        column: x => x.userId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ge_project",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    locName = table.Column<string>(maxLength: 255, nullable: true),
                    locAddress = table.Column<string>(maxLength: 255, nullable: true),
                    locPostcode = table.Column<string>(maxLength: 255, nullable: true),
                    locMapReference = table.Column<string>(maxLength: 255, nullable: true),
                    locEast = table.Column<double>(nullable: true),
                    locNorth = table.Column<double>(nullable: true),
                    locLevel = table.Column<double>(nullable: true),
                    datumProjection = table.Column<int>(nullable: false),
                    locLatitude = table.Column<double>(nullable: true),
                    locLongitude = table.Column<double>(nullable: true),
                    locHeight = table.Column<double>(nullable: true),
                    folder = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    name = table.Column<string>(maxLength: 255, nullable: true),
                    description = table.Column<string>(maxLength: 255, nullable: true),
                    keywords = table.Column<string>(maxLength: 255, nullable: true),
                    start_date = table.Column<DateTime>(nullable: false),
                    end_date = table.Column<DateTime>(nullable: true),
                    cstatus = table.Column<int>(nullable: false),
                    pstatus = table.Column<int>(nullable: false),
                    managerId = table.Column<string>(maxLength: 450, nullable: true),
                    officeId = table.Column<Guid>(nullable: false),
                    data_operations = table.Column<string>(maxLength: 255, nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_project", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_project_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_project_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_project_AspNetUsers_managerId",
                        column: x => x.managerId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_project_ge_office_officeId",
                        column: x => x.officeId,
                        principalTable: "ge_office",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ge_data",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    locName = table.Column<string>(maxLength: 255, nullable: true),
                    locAddress = table.Column<string>(maxLength: 255, nullable: true),
                    locPostcode = table.Column<string>(maxLength: 255, nullable: true),
                    locMapReference = table.Column<string>(maxLength: 255, nullable: true),
                    locEast = table.Column<double>(nullable: true),
                    locNorth = table.Column<double>(nullable: true),
                    locLevel = table.Column<double>(nullable: true),
                    datumProjection = table.Column<int>(nullable: false),
                    locLatitude = table.Column<double>(nullable: true),
                    locLongitude = table.Column<double>(nullable: true),
                    locHeight = table.Column<double>(nullable: true),
                    folder = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    filename = table.Column<string>(nullable: true),
                    filesize = table.Column<long>(nullable: false),
                    fileext = table.Column<string>(maxLength: 4, nullable: true),
                    filetype = table.Column<string>(maxLength: 64, nullable: true),
                    filedate = table.Column<DateTime>(nullable: false),
                    description = table.Column<string>(maxLength: 255, nullable: true),
                    keywords = table.Column<string>(maxLength: 255, nullable: true),
                    projectId = table.Column<Guid>(nullable: false),
                    cstatus = table.Column<int>(nullable: false),
                    pstatus = table.Column<int>(nullable: false),
                    qstatus = table.Column<int>(nullable: false),
                    version = table.Column<string>(maxLength: 255, nullable: true),
                    vstatus = table.Column<int>(nullable: false),
                    data_binary = table.Column<byte[]>(nullable: true),
                    data_string = table.Column<string>(nullable: true),
                    data_xml = table.Column<string>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_data", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_data_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_data_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_data_ge_project_projectId",
                        column: x => x.projectId,
                        principalTable: "ge_project",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                });

            migrationBuilder.CreateTable(
                name: "ge_project_user",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    userId = table.Column<string>(nullable: true),
                    user_operations = table.Column<string>(nullable: true),
                    projectId = table.Column<Guid>(nullable: false)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_project_user", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_project_user_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_project_user_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_project_user_ge_project_projectId",
                        column: x => x.projectId,
                        principalTable: "ge_project",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Cascade);
                    table.ForeignKey(
                        name: "FK_ge_project_user_AspNetUsers_userId",
                        column: x => x.userId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateTable(
                name: "ge_transform",
                columns: table => new
                {
                    createdId = table.Column<string>(nullable: true),
                    createdDT = table.Column<DateTime>(nullable: false),
                    editedId = table.Column<string>(nullable: true),
                    editedDT = table.Column<DateTime>(nullable: true),
                    operations = table.Column<string>(maxLength: 255, nullable: true),
                    Id = table.Column<Guid>(nullable: false),
                    projectId = table.Column<Guid>(nullable: true),
                    name = table.Column<string>(nullable: true),
                    description = table.Column<string>(nullable: true),
                    dataId = table.Column<Guid>(nullable: true),
                    styleId = table.Column<Guid>(nullable: true)
                },
                constraints: table =>
                {
                    table.PrimaryKey("PK_ge_transform", x => x.Id);
                    table.ForeignKey(
                        name: "FK_ge_transform_AspNetUsers_createdId",
                        column: x => x.createdId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_transform_ge_data_dataId",
                        column: x => x.dataId,
                        principalTable: "ge_data",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_transform_AspNetUsers_editedId",
                        column: x => x.editedId,
                        principalTable: "AspNetUsers",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_transform_ge_project_projectId",
                        column: x => x.projectId,
                        principalTable: "ge_project",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                    table.ForeignKey(
                        name: "FK_ge_transform_ge_data_styleId",
                        column: x => x.styleId,
                        principalTable: "ge_data",
                        principalColumn: "Id",
                        onDelete: ReferentialAction.Restrict);
                });

            migrationBuilder.CreateIndex(
                name: "IX_AspNetRoleClaims_RoleId",
                table: "AspNetRoleClaims",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "RoleNameIndex",
                table: "AspNetRoles",
                column: "NormalizedName",
                unique: true,
                filter: "[NormalizedName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserClaims_UserId",
                table: "AspNetUserClaims",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserLogins_UserId",
                table: "AspNetUserLogins",
                column: "UserId");

            migrationBuilder.CreateIndex(
                name: "IX_AspNetUserRoles_RoleId",
                table: "AspNetUserRoles",
                column: "RoleId");

            migrationBuilder.CreateIndex(
                name: "EmailIndex",
                table: "AspNetUsers",
                column: "NormalizedEmail");

            migrationBuilder.CreateIndex(
                name: "UserNameIndex",
                table: "AspNetUsers",
                column: "NormalizedUserName",
                unique: true,
                filter: "[NormalizedUserName] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_ge_data_createdId",
                table: "ge_data",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_data_editedId",
                table: "ge_data",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_data_projectId",
                table: "ge_data",
                column: "projectId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_event_createdId",
                table: "ge_event",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_createdId",
                table: "ge_office",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_editedId",
                table: "ge_office",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_managerId",
                table: "ge_office",
                column: "managerId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_user_createdId",
                table: "ge_office_user",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_user_editedId",
                table: "ge_office_user",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_user_officeId",
                table: "ge_office_user",
                column: "officeId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_office_user_userId_officeId",
                table: "ge_office_user",
                columns: new[] { "userId", "officeId" },
                unique: true,
                filter: "[userId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_createdId",
                table: "ge_project",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_editedId",
                table: "ge_project",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_managerId",
                table: "ge_project",
                column: "managerId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_officeId",
                table: "ge_project",
                column: "officeId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_user_createdId",
                table: "ge_project_user",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_user_editedId",
                table: "ge_project_user",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_user_projectId",
                table: "ge_project_user",
                column: "projectId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_project_user_userId_projectId",
                table: "ge_project_user",
                columns: new[] { "userId", "projectId" },
                unique: true,
                filter: "[userId] IS NOT NULL");

            migrationBuilder.CreateIndex(
                name: "IX_ge_transform_createdId",
                table: "ge_transform",
                column: "createdId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_transform_dataId",
                table: "ge_transform",
                column: "dataId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_transform_editedId",
                table: "ge_transform",
                column: "editedId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_transform_projectId",
                table: "ge_transform",
                column: "projectId");

            migrationBuilder.CreateIndex(
                name: "IX_ge_transform_styleId",
                table: "ge_transform",
                column: "styleId");
        }

        protected override void Down(MigrationBuilder migrationBuilder)
        {
            migrationBuilder.DropTable(
                name: "AspNetRoleClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserClaims");

            migrationBuilder.DropTable(
                name: "AspNetUserLogins");

            migrationBuilder.DropTable(
                name: "AspNetUserRoles");

            migrationBuilder.DropTable(
                name: "AspNetUserTokens");

            migrationBuilder.DropTable(
                name: "ge_event");

            migrationBuilder.DropTable(
                name: "ge_office_user");

            migrationBuilder.DropTable(
                name: "ge_project_user");

            migrationBuilder.DropTable(
                name: "ge_transform");

            migrationBuilder.DropTable(
                name: "AspNetRoles");

            migrationBuilder.DropTable(
                name: "ge_data");

            migrationBuilder.DropTable(
                name: "ge_project");

            migrationBuilder.DropTable(
                name: "ge_office");

            migrationBuilder.DropTable(
                name: "AspNetUsers");
        }
    }
}
