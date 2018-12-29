﻿#define SeedOnly
#if SeedOnly
using static ge_repository.Authorization.Constants;
using ge_repository.Authorization;
using ge_repository.Models;
using ge_repository.DAL;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Linq;
using System.Threading.Tasks;
using System.Collections.Generic;
using System.IO;

namespace ge_repository.Data
{
    public static class SeedData
    {
        #region snippet_Initialize
        public static async Task Initialize(IServiceProvider serviceProvider, string testUserPw)
        {
             
            using (var context = new ge_DbContext(
                serviceProvider.GetRequiredService<DbContextOptions<ge_DbContext>>()))
            {
                // For sample purposes we are seeding 2 users both with the same password.
                // The password is set with the following command:
                // dotnet user-secrets set SeedUserPW <pw>
                // The admin user can do anything

                var a1 = await EnsureUser(serviceProvider, testUserPw, "admin@aecom.com","Administrator","","+442086393568");
                await EnsureRole(serviceProvider, a1, Constants.ge_repositoryAdministratorRole);

                
                var m1 = await EnsureUser(serviceProvider, testUserPw, "tim.m.connolly@aecom.com","Tim","Connolly","+4402086393693");
                await EnsureRole(serviceProvider, m1, Constants.ge_repositoryManagerRole);
              
                var u1 = await EnsureUser(serviceProvider, testUserPw, "simon.thomson@aecom.com","Simon","Thomson","+442086393568");

                
                var m2 = await EnsureUser(serviceProvider, testUserPw, "mitesh.chandegra@aecom.com","Mitesh","Chandegra","+4402077985961");
                await EnsureRole(serviceProvider, m2, Constants.ge_repositoryManagerRole);
              
                var u2 = await EnsureUser(serviceProvider, testUserPw, "david.cheung@aecom.com","David","Cheung","+4402077985046");
                
               
                var m3 = await EnsureUser(serviceProvider, testUserPw, "aristeidis.zourmpakis@aecom.com","Aris","Zourmpakis","+441245771205");
                await EnsureRole(serviceProvider, m3, Constants.ge_repositoryManagerRole);
                                
                var u3 = await EnsureUser(serviceProvider, testUserPw, "lida.krimpeni@aecom.com","Lida","Krimpeni","+441245771210");
               
               
                var m4 = await EnsureUser(serviceProvider, testUserPw, "sarah.dagostino@aecom.com","Sarah","Dagostino","+4401256310515");
                await EnsureRole(serviceProvider, m4, Constants.ge_repositoryManagerRole);
                
                var u4 = await EnsureUser(serviceProvider, testUserPw, "pablo.bernardini@aecom.com","Pablo","Bernardini","+4402078214209");
               
                var m5 = await EnsureUser(serviceProvider, testUserPw, "paul.stewart@aecom.com","Paul","Stewart","+441727535638");
                await EnsureRole(serviceProvider, m3, Constants.ge_repositoryManagerRole);
                
                var u5 = await EnsureUser(serviceProvider, testUserPw, "charlie.chaplin@aecom.com","Charlie","Chaplin","+44208639356");

                SeedDB(context, @"C:\Users\ThomsonSJ\Documents\Visual Studio 2015\Projects\ge_repositoryAPI_SeedData");
            }
        }
        #endregion

        #region snippet_CreateRoles        
        private static async Task<string> getUserId (IServiceProvider serviceProvider, 
                                                    string UserName)
                                                    {
            var userManager = serviceProvider.GetService<UserManager<ge_user>>();

            var user = await userManager.FindByNameAsync(UserName);
            
            return user.Id;
            }
        private static async Task<string> EnsureUser(IServiceProvider serviceProvider, 
                                                    string testUserPw, 
                                                    string email,
                                                    string firstname,
                                                    string lastname,
                                                    string phonenumber
                                                    )
        {
            var userManager = serviceProvider.GetService<UserManager<ge_user>>();

            var user = await userManager.FindByNameAsync(email);
            if (user == null)
            {
                user = new ge_user(firstname,lastname,email,phonenumber);
                await userManager.CreateAsync(user, testUserPw);

            }

            return user.Id;
        }
        private static async Task<IdentityResult> EnsureRole(IServiceProvider serviceProvider,
                                                                      string uid, string role)
        {
            IdentityResult IR = null;
            var roleManager = serviceProvider.GetService<RoleManager<IdentityRole>>();

            if (!await roleManager.RoleExistsAsync(role))
            {
                IR = await roleManager.CreateAsync(new IdentityRole(role));
            }

            var userManager = serviceProvider.GetService<UserManager<ge_user>>();

            var user = await userManager.FindByIdAsync(uid);

            IR = await userManager.AddToRoleAsync(user, role);

            return IR;
        }        
        #endregion
        public static void SeedDB(ge_DbContext context, string source)
        {
            if (context.ge_project.Any() && context.ge_data.Any())
            {
                 return;   // DB has been seeded
            } 
            
         try {          
            #region snippit_CreateOffices
            var manager1 = context.Users.Where(user => user.UserName =="tim.m.connolly@aecom.com").Single();
            var user1 = context.Users.Where(user => user.UserName=="simon.thomson@aecom.com").Single();
            
            var o1 = new ge_office {
                Id = Guid.NewGuid(),
                locName= "Croydon",
                createdDT =DateTime.Now,
                locAddress = "Sunley House, 4 Bedford Park, Surrey, Croydon",
                locPostcode = "CR0 2AP",
                datumProjection =  datumProjection.OSGB36NG,
                managerId = manager1.Id,
                operations ="Read;Update;Delete",
                project_operations = "Create;Read;Update;Delete",
                projects = new List<ge_project>(), 
                users = new List<ge_office_user>()
                };
            
            o1.users.Add(new ge_office_user {officeId= o1.Id,
                                             userId = manager1.Id,
                                             operations = "Read;Download;Create;Update;Delete;Approve;Admin"});
            o1.users.Add(new ge_office_user {officeId=o1.Id,
                                             userId = user1.Id,
                                             operations = "Read;Download;Create;Update;Delete"});
            var manager2 = context.Users.Where(a => a.UserName=="mitesh.chandegra@aecom.com").Single();      
            var manager22 = context.Users.Where(a => a.UserName=="paul.stewart@aecom.com").Single(); 
            var user2 = context.Users.Where(a => a.UserName=="david.cheung@aecom.com").Single();

           var o2 = new ge_office {
                Id =  Guid.NewGuid(),
                locName= "Aldgate",
                createdDT =DateTime.Now,
                locAddress = "2 Leman Street, London",
                locPostcode = "E1 8FA",
                manager = manager2,
                datumProjection =  datumProjection.OSGB36NG,
                operations ="Read;Update;Delete",
                project_operations = "Create;Read;Update;Delete",
                projects = new List<ge_project>(), 
                users = new List<ge_office_user>()
            };
            
            o2.users.Add(new ge_office_user {officeId= o2.Id,
                                             userId = manager2.Id,
                                             operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            o2.users.Add(new ge_office_user {officeId = o2.Id,
                                             userId = user2.Id,
                                             operations = "Create;Read;Update;Delete"});
            o2.users.Add(new ge_office_user {officeId = o2.Id,
                                             userId = manager22.Id,
                                             operations = "Create;Read;Update;Delete;Admin"});
        
           
            var manager3 = context.Users.Where(a => a.UserName=="aristeidis.zourmpakis@aecom.com").Single();
            var user3 = context.Users.Where(a => a.UserName=="lida.krimpeni@aecom.com").Single();
            
            var o3 = new ge_office {
                Id = Guid.NewGuid(),
                locName= "Chelmsford",
                createdDT =DateTime.Now,
                locAddress = "Saxon House, 27 Duke Street, Chelmsford",
                locPostcode = "CM1 1HT",
                managerId = manager3.Id,
                datumProjection =  datumProjection.OSGB36NG,
                operations ="Read;Update;Delete",
                project_operations = "Create;Read;Update;Delete",
                projects = new List<ge_project>(), 
                users = new List<ge_office_user>()
            };
            
            o3.users.Add(new ge_office_user {officeId= o3.Id,
                                             userId = manager3.Id,
                                             operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            o3.users.Add(new ge_office_user {officeId = o3.Id,
                                             userId = user3.Id,
                                             operations = "Create;Read;Update;Delete"});
 
            
            var manager4 = context.Users.Where(a => a.UserName=="sarah.dagostino@aecom.com").Single();;  
            var user4 = context.Users.Where(a => a.UserName=="pablo.bernardini@aecom.com").Single();;
            
            var o4 = new ge_office {
                Id = Guid.NewGuid(),
                locName= "Basingstoke",
                createdDT =DateTime.Now,
                locAddress = "Midpoint, Alencon Link, Hampshire, Basingstoke, ",
                locPostcode = "RG21 7PP",
                datumProjection =  datumProjection.OSGB36NG,
                managerId = manager4.Id,
                operations ="Read;Update;Delete",
                project_operations = "Read;Update;Delete",
                projects = new List<ge_project>(), 
                users = new List<ge_office_user>()
            };

            o4.users.Add(new ge_office_user {officeId= o4.Id,
                                             userId = manager4.Id,
                                             operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            o4.users.Add(new ge_office_user {officeId = o4.Id,
                                             userId = user4.Id,
                                             operations = "Create;Read;Update;Delete"});
            #endregion
            #region CreateProjects
            var p1 = new ge_project{
                    Id = Guid.NewGuid(),
                    locName = "Burton Upon Trent SWWM Appraisal",
                    locAddress = "Meadowside Drive, Burton, East Staffordshire, Staffordshire, West",
                    locPostcode = "DE14 1LD",
                    description = "Ground Investigation Data for Burton SWWM",
                    createdId = user1.Id,
                    keywords =" ",
                    start_date = new DateTime(2017,11,15),
                    createdDT = DateTime.Now,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    locEast = 425388,
                    locNorth= 323033,
                    datumProjection =  datumProjection.OSGB36NG,
                    officeId = o1.Id,
                    managerId = manager1.Id,
                    operations ="Read;Update;Delete",
                    data_operations = "Read;Create;Update;Delete",
                    data = new List<ge_data>(),
                    users = new List<ge_project_user>()
            };

            p1.users.Add(new ge_project_user {projectId=p1.Id,
                                             userId = manager1.Id,
                                             user_operations = "Create;Read;Update;Delete;Approve;Admin"});
            p1.users.Add(new ge_project_user {projectId = p1.Id,
                                            userId = user1.Id,
                                            user_operations = "Create;Read;Update;Delete"});       

            p1.data.Add (new ge_data 
                {
                    createdId = user1.Id,
                    createdDT = DateTime.Now,
                    filename = "E7037A_Burton SWWM_Final Factual Report AGS4.ags",
                    fileext = ".ags", 
                    filetype ="text/plain",
                    filesize =948423,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="AGS data downloaded from BGS website",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_string = File.ReadAllText(source + @"\E7037A_Burton SWWM\E7037A_Burton SWWM_Final Factual Report AGS4.ags")
                    }
                }
            );
            
          var p11 = new ge_project{
                    Id = Guid.NewGuid(),
                    name = "AGS Dictionary",
                    description = "Developement of AGS Reference Dictionary for converting from AGS to XML and SQL data formats",
                    createdId = user1.Id,
                    keywords ="ags, xml ",
                    start_date = new DateTime(2017,11,15),
                    createdDT = DateTime.Now,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.Owned,
                    locEast = 529565,
                    locNorth= 177615,
                    datumProjection =  datumProjection.OSGB36NG,
                    officeId = o1.Id,
                    managerId = manager1.Id,
                    operations ="Read;Update;Delete",
                    data_operations = "Read;Update;Delete",
                    data = new List<ge_data>(),
                    users = new List<ge_project_user>()
            };

            p11.users.Add(new ge_project_user {projectId=p1.Id,
                                             userId = manager1.Id,
                                             user_operations= "Create;Read;Update;Delete;Approve;Admin"});
            p11.users.Add(new ge_project_user {projectId = p1.Id,
                                            userId = user1.Id,
                                            user_operations = "Create;Read;Update;Delete"});       

            p11.data.Add (new ge_data 
                {
                    createdId = user1.Id,
                    createdDT = DateTime.Now,
                    filename = "DictionaryAgsml_0.0.14.xml",
                    fileext = ".xml", 
                    filetype ="text/plain",
                    filesize =948423,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.Owned,
                    version= "P01.1",
                    vstatus= VersionStatus.Final,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="AGS data dictionary",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_string = File.ReadAllText(source + @"\AGS Dictionary\DictionaryAgsml_0.0.14.xml")
                    }
                }
            );
             p11.data.Add (new ge_data 
                {
                    createdId = user1.Id,
                    createdDT = DateTime.Now,
                    filename = "DictionaryAgsml.xsl",
                    fileext = ".xsl", 
                    filetype ="text/plain",
                    filesize =2582,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.Owned,
                    version= "P01.1",
                    vstatus= VersionStatus.Final,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="AGS xml data template",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_string = File.ReadAllText(source + @"\AGS Dictionary\DictionaryAgsml.xsl")
                    }
                }
            );

            var p2 = new ge_project{
                name = "Tideway C410 HEAPS",
                description = "Ground Invetsigation Data close to the CSO shaft HEAPS",
                createdId = user2.Id,
                keywords ="London Clay;London Basin;Lambeth Group;Pressuremeter;Small Strain",
                start_date = new DateTime(2017,11,15),
                createdDT = DateTime.Now,
                pstatus = PublishStatus.Uncontrolled,
                cstatus = ConfidentialityStatus.ClientApproved,
                locEast = 529565,
                locNorth= 177615,
                officeId = o2.Id,
                managerId = manager2.Id,
                operations ="Read;Update;Delete",
                data_operations = "Read;Update;Delete",
                data = new List<ge_data>(),
                users = new List<ge_project_user>()
                };
            
            p2.users.Add(new ge_project_user {projectId = p2.Id,
                                             userId = manager2.Id,
                                             user_operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            p2.users.Add(new ge_project_user {projectId = p2.Id,
                                             userId = user2.Id,
                                             user_operations = "Create;Read;Update;Delete"});
            p2.users.Add(new ge_project_user {projectId = p2.Id,
                                             userId = manager22.Id,
                                             user_operations = "Create;Read;Update;Delete;Approve;Admin"});                                 
            
            p2.data.Add (new ge_data 
                    {
                    createdId = user2.Id,
                    createdDT = DateTime.Now,
                    filename = "heaps_boreholes_3d_03-Geological Plan2.pdf",
                    fileext = ".pdf", 
                    filetype = "application/pdf",
                    filesize = 2177973,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="Surfaces created from gINT Civil Tools for HEAPS",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Tideway HEAPS\heaps_boreholes_3d_03-Geological Plan.pdf")
                    }
                    }
                );

             p2.data.Add (new ge_data 
                    {
                    createdId = user2.Id,
                    createdDT = DateTime.Now,
                    filename = "4602-FLOJV-HEAPS-180-GG-MD-900001.gpj",
                    fileext = ".gpj",
                    filetype = "application/gINT", 
                    filesize = 19427328,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="Tideway database exports of gINT database for HEAPS local GI data",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Tideway HEAPS\4602-FLOJV-HEAPS-180-GG-MD-900001.gpj")
                    }
                    }
                );
            
       
            var p3 = new ge_project {
                locName = "Ryhad Metro",
                name ="Ryad Metro",
                description = "Bridge 1-5 1A1P30",
                createdId = user3.Id,
                keywords ="Rock sockets",
                start_date = new DateTime(2018,06,15),
                createdDT = DateTime.Now,
                pstatus = PublishStatus.Uncontrolled,
                cstatus = ConfidentialityStatus.ClientApproved,
                datumProjection =  datumProjection.OSGB36NG,
                officeId = o3.Id,
                operations ="Read;Update;Delete",
                data_operations = "Read;Update;Delete",
                data = new List<ge_data>(),
                users = new List<ge_project_user>()
            };
            
            p3.users.Add(new ge_project_user {projectId = p3.Id,
                                             userId = manager3.Id,
                                             user_operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            p3.users.Add(new ge_project_user {projectId = p3.Id,
                                             userId = user3.Id,
                                             user_operations = "Create;Read;Update;Delete"});
            p3.data.Add (new ge_data 
                    {
                    createdId = user3.Id,
                    createdDT = DateTime.Now,
                    filename="M-BD4-1A1VDA-CSVD-EDR-100532_Updated with Orientation.dwg",
                    fileext = ".dwg", 
                    filetype = "application/autocad",
                    filesize = 19427328,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="Tideway database exports of gINT database for HEAPS local GI data",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Ryhad Metro\M-BD4-1A1VDA-CSVD-EDR-100532_Updated with Orientation.dwg")
                    }
            });
            p3.data.Add (new ge_data 
                    {
                    createdId = user3.Id,
                    createdDT = DateTime.Now,
                    filename="1A1P30 and 1A1P31 Plaxis Embedded Pile Results 2017-03-09.xlsx",
                    fileext = ".xls", 
                    filetype = "application/excel",
                    filesize = 19427328,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Uncontrolled,
                    cstatus = ConfidentialityStatus.ClientApproved,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.AECOMFactual,
                    description="Results from Plaxis Analysis",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Ryhad Metro\1A1P30 and 1A1P31 Plaxis Embedded Pile Results 2017-03-09.xlsx")
                    }
            }
            );

            var p31 = new ge_project {
                locName = "Silvertown Tunnel",
                name ="Silvertown Tunnel Development Tender Phase",
                description = "Tender design for Silvertown Tunnel",
                createdId = user3.Id,
                keywords ="Road Tunnel;Lambeth Group;London;Infrastructure;",
                start_date = new DateTime(2018,06,15),
                createdDT = DateTime.Now,
                pstatus = PublishStatus.Uncontrolled,
                cstatus = ConfidentialityStatus.ClientApproved,
                officeId = o3.Id,
                operations ="Read;Update;Delete",
                data_operations = "Read;Update;Delete",
                data = new List<ge_data>(),
                users = new List<ge_project_user>()
            };
            
            p31.users.Add(new ge_project_user {projectId = p3.Id,
                                             userId = manager3.Id,
                                             user_operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            p31.users.Add(new ge_project_user {projectId = p3.Id,
                                             userId = user3.Id,
                                             user_operations = "Create;Read;Update;Delete"});
            
            p31.data.Add (new ge_data 
                    {
                    createdId = user3.Id,
                    createdDT = DateTime.Now,
                    filename="20110770 - 2016-03-03 1540 - Final - 2.ags",
                    fileext = ".ags", 
                    filetype = "text/plain",
                    filesize = 19787,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.RequiresClientApproval,
                    version= "P01.1",
                    folder= "tender-data",
                    vstatus= VersionStatus.Final,
                    qstatus = QualitativeStatus.ThirdPartyFactual,
                    description="Silvertown AGS data recieved at tender",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Silvertown Tunnel\20110770 - 2016-03-03 1540 - Final - 2.ags")
                    }
            }
            );
            p31.data.Add (new ge_data 
                    {
                    createdId = user3.Id,
                    createdDT = DateTime.Now,
                    filename="TA7510F17.ags",
                    fileext = ".ags", 
                    filetype = "text/plain",
                    filesize = 8479000,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.RequiresClientApproval,
                    version= "P01.1",
                    folder= "tender_data",
                    vstatus= VersionStatus.Final,
                    qstatus = QualitativeStatus.ThirdPartyFactual,
                    description="Silvertown additional AGS data recieved at tender",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Silvertown Tunnel\TA7510F17.ags")
                    }
            }
            );      
            p31.data.Add (new ge_data 
                    {
                    createdId = user3.Id,
                    createdDT = DateTime.Now,
                    filename="SilvertownGI.xml",
                    fileext = ".xml", 
                    filetype = "text/plain",
                    filesize = 5653000,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.RequiresClientApproval,
                    version= "P01.1",
                    folder= "tender_data",
                    vstatus= VersionStatus.Final,
                    qstatus = QualitativeStatus.ThirdPartyFactual,
                    description="Silvertown additional AGS data recieved at tender",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\Silvertown Tunnel\SilvertownGI.xml")
                    }
            }
            );

            var p4 = new ge_project {
                locName = "West Midlands to Crewe",
                name = "High Speed 2 Package 2A",
                description = "Historic Ground Investigation Data fro HS2 Package 2A",
                createdId = user4.Id,
                keywords ="Mercia Mudstone;Earthworks;Monitoring",
                start_date = new DateTime(2018,06,15),
                createdDT = DateTime.Now,
                pstatus = PublishStatus.Uncontrolled,
                cstatus = ConfidentialityStatus.ClientApproved,
                data = new List<ge_data>(),
                users = new List<ge_project_user>(),
                operations ="Read;Update;Delete",
                data_operations = "Read;Update;Delete"
            };
            
            p4.users.Add(new ge_project_user {projectId = p4.Id,
                                             userId = manager4.Id,
                                             user_operations = "Create;Read;Update;Delete;Reject;Approve;Admin"});
            p4.users.Add(new ge_project_user {projectId = p4.Id,
                                             userId = user4.Id,
                                             user_operations = "Create;Read;Update;Delete"});

            p4.data.Add (new ge_data 
                    {
                    filename="HS2 PH2B AGS EXPORT 2018-12-18.ags",
                    fileext = ".ags",
                    filetype = "text/plain",
                    createdId =user4.Id,
                    createdDT = DateTime.Now,  
                    filesize = 2183000,
                    filedate = new DateTime(2018,06,28),
                    locEast = 425388.43,
                    locNorth = 323032.67,
                    pstatus = PublishStatus.Approved,
                    cstatus = ConfidentialityStatus.RequiresClientApproval,
                    version= "P01.1",
                    vstatus= VersionStatus.Intermediate,
                    qstatus = QualitativeStatus.ThirdPartyFactual,
                    description="Routewide historical borehole data compiled from BGS",
                    operations ="Read;Update;Delete",
                    data = new ge_data_big {
                        data_binary = File.ReadAllBytes(source + @"\HS2\HS2 PH2B AGS EXPORT 2018-12-18.ags")
                    }
            }
            );

            #endregion
            #region AddProjectsToOffices

            o1.projects.Add (p1);
            o1.projects.Add (p11);

            o2.projects.Add (p2);
            
            o3.projects.Add (p3);
            o3.projects.Add (p31);
            
            o4.projects.Add (p4);

            context.ge_office.Add (o1);
            context.ge_office.Add (o2);
            context.ge_office.Add (o3);
            context.ge_office.Add (o4);

//            var user5 = context.Users.Where(a => a.UserName=="charlie.chaplin@aecom.com").Single();
//            var admin = context.Users.Where(a => a.UserName=="admin@contoso.com").Single();       

            context.SaveChanges();
            #endregion

            }   catch (Exception e) {
              Console.WriteLine(e.Message); 
         }
        } 

           
    }
}
#endif