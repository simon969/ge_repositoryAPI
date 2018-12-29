using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ge_repository.Authorization;

namespace ge_repository.Models {

public class ge_office : _ge_location {

        public Guid Id {get;set;}
         [Display(Name = "Office Name")] [StringLength(255)] public string name{get;set;}
        [Display(Name ="Office Manager")] [StringLength(450)] public string managerId {get;set;}
        public virtual ge_user manager {get;set;}
        public virtual ICollection<ge_project> projects {get;set;}
        public virtual ICollection<ge_office_user> users { get; set; }
        [Display(Name = "Project Operations Allowed")] [StringLength(255)] public string project_operations {get;set;}
       

}

public class ge_office_user : _ge_user_operation {
     [Display(Name="Office Id")] public Guid officeId {get;set;} 
      virtual public ge_office office {get;set;}
  


}

}


