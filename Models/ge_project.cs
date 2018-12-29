using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ge_repository.Authorization;

namespace ge_repository.Models {
    public class ge_project : _ge_location {
        public Guid Id {get;set;}
        [Display(Name = "Project Name")] [StringLength(255)] public string name{get;set;}
        [Display(Name = "Project Description")][StringLength(255)] public string description {get;set;}
        [Display(Name = "Keywords")] [StringLength(255)] public string keywords{get;set;}
        [Display(Name = "Project Start Date")] public DateTime start_date{get;set;}
        [Display(Name = "Project End Date")] public DateTime? end_date {get;set;}
        [Display(Name = "Confidentiality")] public Constants.ConfidentialityStatus cstatus {get;set;}
        [Display(Name = "Publish Status")] public Constants.PublishStatus pstatus {get;set;}
        [Display(Name = "Project Manager")] [StringLength(450)] public string managerId {get;set;}
        public virtual ge_user manager {get;set;}
        [Display(Name = "Office Id")] public Guid officeId {get;set;}
        public virtual ge_office office {get;set;}
        public virtual ICollection<ge_project_user> users {get;set;}
        public virtual ICollection<ge_data> data { get; set; }
        public virtual ICollection<ge_transform> transform {get;set;}
        [Display(Name = "Data and Transform Operations Allowed")] [StringLength(255)] public string data_operations {get;set;}
        
    }
    
    public class ge_project_user : _ge_user_operation {
       [Display(Name="Project Id")] public Guid projectId {get;set;}
       public virtual ge_project project {get;set;}
      
    } 

}
