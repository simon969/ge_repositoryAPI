using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Authorization.Infrastructure;

namespace ge_repository.Authorization
{

    public static class ge_repositoryOperations
    {
        public static OperationAuthorizationRequirement Create =   
          new OperationAuthorizationRequirement {Name=Constants.CreateOperationName};
        public static OperationAuthorizationRequirement Read = 
          new OperationAuthorizationRequirement {Name=Constants.ReadOperationName};  
        public static OperationAuthorizationRequirement Update = 
          new OperationAuthorizationRequirement {Name=Constants.UpdateOperationName}; 
        public static OperationAuthorizationRequirement Delete = 
          new OperationAuthorizationRequirement {Name=Constants.DeleteOperationName};
        public static OperationAuthorizationRequirement Approve = 
          new OperationAuthorizationRequirement {Name=Constants.ApproveOperationName};
        public static OperationAuthorizationRequirement Reject = 
          new OperationAuthorizationRequirement {Name=Constants.RejectOperationName};
        public static OperationAuthorizationRequirement Download = 
          new OperationAuthorizationRequirement {Name=Constants.DownloadOperationName};  
    }

    public class Constants
    {
        public static readonly string CreateOperationName = "Create";
        public static readonly string ReadOperationName = "Read";
        public static readonly string UpdateOperationName = "Update";
        public static readonly string DeleteOperationName = "Delete";
        public static readonly string ApproveOperationName = "Approve";
        public static readonly string RejectOperationName = "Reject";
        public static readonly string DownloadOperationName = "Download";

        public static readonly string ge_repositoryAdministratorRole = "ge_administrator";
        public static readonly string ge_repositoryManagerRole = "ge_manager";
        public static readonly string ge_repositoryProjectRole = "ge_project";

        
/*         public enum PublishStatus {
        UncontrolledPrivate,
        UncontrolledOffice,
        UncontrolledProject,
        ApprovedOffice,
        ApprovedProject
        } */
        public enum PublishStatus {
        Uncontrolled,
        Approved
        
        }
       
        public enum ConfidentialityStatus {
        Owned,
        RequiresClientApproval,
        ThirdParty,
        ClientApproved
        }
        public enum QualitativeStatus {
        ThirdPartyFactual,
        ThirdPartyInterpretive,
        AECOMInterpretive,
        AECOMFactual
        }

        public enum VersionStatus {
          Final,
          Draft,
          Intermediate
        }
    	  public static class FileExtension {
    		public const string AGS = ".ags";
    		public const string XML = ".xml";
    		public const string XSL = ".xsl";
  		  }

        public static string[] OperationsArray = new string[] {
                                          "Read",
                                          "Read;Download",
                                          "Create;Read;Download",
                                          "Create;Read;Download;Update",
                                          "Create;Read;Download;Update;Delete",
                                          "Create;Read;Download;Update;Delete;Approve",
                                          "Create;Read;Download;Update;Delete;Approve;Admin"
        };

        public enum datumProjection {
       
        // No assigned projectsion system
        NONE = 0, 
        
        // http://spatialreference.org/ref/epsg/osgb-1936-british-national-grid/  
        // OSGB 1936 British National Grid"  
        OSGB36NG = 27700,
        OSGB36NGODN = 7405,
        
        // WGS84 is used by multiple spacial reference systems
        //http://spatialreference.org/ref/?search=WGS84&srtext=Search
         WGS84 = 101,
        
        // GRS80 is used by multiple spacial reference systems
        //http://spatialreference.org/ref/?search=GRS80&srtext=Search
        GRS80 = 102
      }
  }
      public enum logLEVEL {
        Info,
        Warning,
        Error,
        Fatal
      }



      
      public static class msgCODE {
        
        public const int DATA_EDIT_PROHIBITED = 101;
        public const int DATA_CHANGESTATUS_PROHIBITED = 102;
         public const int DATA_CREATE_PROHIBITED = 103;
         public const int DATA_READ_PROHIBITED = 104;
        public const int PROJECT_OPERATION_EDIT_PROHIBITED = 201;
        public const int PROJECT_EDIT_PROHIBITED = 202;
        public const int PROJECT_READ_PROHIBITED = 203;
        public const int PROJECT_APPROVE_PROHIBITED = 204;
        public const int PROJECT_CREATE_PROHIBITED = 205;
        public const int OFFICE_OPERATION_EDIT_PROHIBITED = 301;
        public const int TRANSFORM_NO_MATCHING = 401; 
      }
      
      public class ge_messages:Dictionary<int,string> {

       

      public ge_messages() {
      
      // Data Messages  
         Add(msgCODE.DATA_EDIT_PROHIBITED,
         "The data file is not accessible for editing/deleting please check assigned user operations and data publication status for [CurrentUser]");   
         
         Add(msgCODE.DATA_CHANGESTATUS_PROHIBITED,
         "[CurrentUser] must have project assigned operation 'Approve' to change the publication status to 'ProjectApproved' or 'OfficeApproved'");
         
         Add(msgCODE.DATA_CREATE_PROHIBITED,
         "To upload new data [CurrentUser] must have 'Create' operation assigned at office or project level, please check assigned user operations for [CurrentUser]");   
        
         Add(msgCODE.DATA_READ_PROHIBITED,
         "To view this document [CurrentUser] must have 'Read' operation assigned at office or project level, please check assigned user operations for [CurrentUser]");   
         
      // 'Project Messages'
         Add(msgCODE.PROJECT_OPERATION_EDIT_PROHIBITED,
         "[CurrentUser] cannot edit project member assigned operations without having the 'Admin' attribute in their project operations record");   
         Add(msgCODE.PROJECT_EDIT_PROHIBITED,
         "[CurrentUser] user cannot edit the project details, please check the assigned user operations for this project and its office");   
         Add(msgCODE.PROJECT_READ_PROHIBITED,
         "[CurrentUser] cannot view the project details for [ObjectName], please check that [CurrentUser] has 'Read' assigned user operations for this project and its office");   
         Add(msgCODE.PROJECT_APPROVE_PROHIBITED,
         "[CurrentUser] user cannot Approve the project details, please check the assigned user operations for this project and its office");   
         Add(msgCODE.PROJECT_CREATE_PROHIBITED,
         "[CurrentUser] user cannot create new projects, please check the assigned user operations for this office");   
      
      // Office Messages 
        Add(msgCODE.OFFICE_OPERATION_EDIT_PROHIBITED,
        "[CurrentUser] cannot edit office member assigned operations without having the 'Admin' attribute in their office operations record");
      
      //Transform Messages
        Add(msgCODE.TRANSFORM_NO_MATCHING,
        "[Project] contains no pairable transform data elements, add XML and data XSL stylesheets");

            
      }
   }
}
