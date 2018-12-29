using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Models
{
    public class ge_DbContext : IdentityDbContext<ge_user>
    {
        public ge_DbContext(DbContextOptions<ge_DbContext> options)
                : base(options)
        {
        }
        public DbSet<ge_office> ge_office{get; set;}
        public DbSet<ge_office_user> ge_office_user { get; set; }
        public DbSet<ge_project> ge_project { get; set; }
        public DbSet<ge_project_user> ge_project_user { get; set; }
        public DbSet<ge_user> ge_user { get; set; }
        public DbSet<ge_data> ge_data{ get;set;}
        public DbSet<ge_data_big> ge_data_big{ get;set;}
        public DbSet<ge_transform> ge_transform { get; set; }
        public DbSet<ge_event> ge_event { get; set; }
        protected override void OnModelCreating(ModelBuilder modelBuilder)  
        {  
        modelBuilder.Entity<ge_data>().HasOne(p => p.data).WithOne(p => p.data).HasForeignKey<ge_data>(p => p.Id);  
        modelBuilder.Entity<ge_data_big>().HasOne(p => p.data).WithOne(p => p.data).HasForeignKey<ge_data_big>(p => p.Id);  
        modelBuilder.Entity<ge_data>().ToTable("ge_data");  
        

  
        modelBuilder.Entity<ge_office_user>()
                    .HasKey(x=>new {x.Id}); 
        modelBuilder.Entity<ge_office_user>()
                    .HasIndex(x=>new {x.userId, x.officeId})
                    .IsUnique();                        
        modelBuilder.Entity<ge_office_user>()
                    .HasOne(x=>x.user)
                    .WithMany(y=>y.offices)
                    .HasForeignKey(y=>y.userId);
        modelBuilder.Entity<ge_office_user>()
                    .HasOne(x=>x.office)
                    .WithMany(y=>y.users)
                    .HasForeignKey(y=>y.officeId);
        modelBuilder.Entity<ge_office_user>()
                    .HasOne(x=>x.created);
        modelBuilder.Entity<ge_office_user>()
                    .HasOne(x=>x.edited);
        
        modelBuilder.Entity<ge_project_user>()
                    .HasKey(x=>new {x.Id});
        modelBuilder.Entity<ge_project_user>()
                    .HasIndex(x=>new {x.userId, x.projectId})
                    .IsUnique();
        modelBuilder.Entity<ge_project_user>()
                    .HasOne(x=>x.user)
                    .WithMany(y=>y.projects)
                    .HasForeignKey(y=>y.userId);
        modelBuilder.Entity<ge_project_user>()
                    .HasOne(x=>x.project)
                    .WithMany(y=>y.users)
                    .HasForeignKey(y=>y.projectId);
        modelBuilder.Entity<ge_project_user>()
                    .HasOne(x=>x.created);
        modelBuilder.Entity<ge_project_user>()
                    .HasOne(x=>x.edited);

/*         modelBuilder.Entity<ClientsJobs>()
        .HasKey(x => new { x.ClientId, x.JobId });

    modelBuilder.Entity<ClientsJobs>()
        .HasOne(x => x.Client)
        .WithMany(y => y.Jobs)
        .HasForeignKey(y => y.JobId);

    modelBuilder.Entity<ClientsJobs>()
        .HasOne(x => x.Job)
        .WithMany(y => y.Clients)
        .HasForeignKey(y => y.ClientId); */
        
        base.OnModelCreating(modelBuilder);   
        }   
        

    }
}
