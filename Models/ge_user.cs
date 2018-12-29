using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using Microsoft.AspNetCore.Identity.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Models{
    public class ge_user :  IdentityUser {
    public ge_user() : base() { }
       
        [Display(Name = "First Name")] public string FirstName { get; set; }
        [Display(Name = "Last Name")] public string LastName { get; set; }

        [Display(Name = "Last Logged in")] public DateTime LastLoggedIn {get;set;}
        public virtual ICollection<ge_project_user> projects {get;set;} 
        public virtual ICollection<ge_office_user> offices {get;set;} 
   
   public ge_user (string firstName, string lastName, string email, string phoneNumber) {
       
        Email = email.ToLower();
        NormalizedEmail = email.ToUpper();
        FirstName = firstName;
        LastName =lastName;
        PhoneNumber = phoneNumber;
        UserName = Email;
   }
   [Display (Name="Full Name")] public String FullName () {
        return (FirstName + " " + LastName);

    }

 }
 }