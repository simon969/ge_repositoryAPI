using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using ge_repository.Authorization;

namespace ge_repository.Models {

    public abstract class _ge_base {
    
        public virtual ge_user created {get;set;} 
        [Display(Name = "Created By")] public string createdId {get;set;} 
        [Display(Name = "Created DateTime")] public DateTime createdDT {get;set;}
     
        public virtual ge_user edited {get;set;}
        [Display(Name = "Last Edited By")] public string editedId {get;set;} 
        [Display(Name = "Last Edited DateTime")] public DateTime? editedDT {get;set;}
        [Display(Name = "Record Operations Allowed")] [StringLength(255)] public string operations {get;set;}
    }


public abstract class _ge_user_operation : _ge_base {
    public Guid Id {get;set;}
    [Display(Name="User Id")] public string userId{get;set;} 
    virtual public ge_user user {get;set;}
    [Display(Name ="User Operations Allowed")] public string user_operations {get;set;}
    
        
     public Boolean AddOperations(string operations) {
        string[] ops = operations.Split (";");
        foreach (var op in ops) {
            if (IsValidOperation(op) && !operations.Contains (op)) {
                operations += ";" + op;
            }
        }
        
        return false;
      }

      private Boolean IsValidOperation(string op) {
          
         if (op == Constants.CreateOperationName ||
                op == Constants.ReadOperationName   ||
                op == Constants.UpdateOperationName ||
                op == Constants.DeleteOperationName ||
                op == Constants.DownloadOperationName ||
                op == Constants.RejectOperationName ||
                op == Constants.ApproveOperationName) {
                    return true;
                }
        return false;
     }

       public Boolean HasOperation(string op) {
           return operations.Contains(op);
       } 
       

 }

}  