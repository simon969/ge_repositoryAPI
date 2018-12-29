using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.ComponentModel.DataAnnotations.Schema;
using System.IO;
using ge_repository.Authorization;

namespace ge_repository.Models {

    [Table("ge_data")]
    public partial class ge_data: _ge_location {
       public Guid Id {get;set;}
       [Display(Name = "File Name")] public string filename {get;set;}
       [Display(Name = "File Size (bytes)")]public long filesize {get;set;}
       [Display(Name = "File Extension")][StringLength(4)] public string fileext {get;set;}
       [Display(Name = "File Content Type")][StringLength(64)] public string filetype {get;set;}
       [Display(Name = "Last Modified Date")] public DateTime filedate {get;set;}
        [Display(Name = "Description")][StringLength(255)] public string description {get;set;}
       [Display(Name = "Keywords")] [StringLength(255)] public string keywords{get;set;}
       [Display(Name = "Project Id")]public Guid projectId {get;set;}
     
       virtual public ge_project project {set;get;}
       [Display(Name =" Confidentiality")] public Constants.ConfidentialityStatus cstatus {get;set;}
       [Display(Name =" Publish Status")] public Constants.PublishStatus pstatus {get;set;}
       [Display(Name ="Qualitative Status")] public Constants.QualitativeStatus qstatus {get;set;}
       [Display(Name = "Version")] [StringLength(255)] public string version{get;set;} 
       [Display(Name ="Version Status")] public Constants.VersionStatus vstatus {get;set;}

        
       [ForeignKey("Id")]  
        public virtual ge_data_big data { get; set; }   
        
        public string GetContentType()
        {
            var types = GetMimeTypes();
            var ext = Path.GetExtension(filename).ToLowerInvariant();
            return types[ext];
        }
        public string GetExtention()
        {
            return Path.GetExtension(filename).ToLowerInvariant();
        }
        private Dictionary<string, string> GetMimeTypes()
        {
            return new Dictionary<string, string>
            {
                // Documents'
                {".doc", "application/msword"},
                {".docx", "application/vnd.openxmlformats-officedocument.wordprocessingml.document"},
                {".pdf", "application/pdf"},
                {".dwg","application/autocad"},
                {".dgn","application/microstation"},
                {".dxf","application/dxf"},
                {".gpj","application/gINT"},
                {".glb","application/gINT"},

                //'Slideshows'
                {".ppt", "application/vnd.ms-powerpoint"},
                {".pptx", "application/vnd.openxmlformats-officedocument.presentationml.presentation"},
                
                //'Data'
                {".xlsx", "application/vnd.openxmlformats-officedocument.spreadsheetml.sheet"},
                {".xls", "application/vnd.ms-excel"},
                {".csv", "text/csv"},
                {".xml", "text/xml"},
                {".txt", "text/plain"},
                {".ags", "text/plain"},

                //'Compressed Folders'
                {".zip", "application/zip"},

                //'Audio'
                {".ogg", "application/ogg"},
                {".mp3", "audio/mpeg"},
                {".wma", "audio/x-ms-wma"},
                {".wav", "audio/x-wav"},
                
                //'Video'
                {".wmv", "audio/x-ms-wmv"},
                {".swf", "application/x-shockwave-flash"},
                {".avi", "video/avi"},
                {".mp4", "video/mp4"},
                {".mpeg", "video/mpeg"},
                {".mpg", "video/mpeg"},
                {".qt", "video/quicktime"},

                // 'Images'
                {".bmp", "image/bmp"},
                {".gif", "image/gif"},
                {".jpeg", "image/jpeg"}, 
                {".jpg", "image/jpeg"},
                {".png", "image/png"},
                {".tif", "image/tiff"},
                {".tiff", "image/tiff"},
            };
        }
/*         public override string getUserOperations(string Id) {

        if (project != null) {
            String pu = project.getUserOperations (Id);
                if (pu.Length > 0 ) {
                return pu;
                } 
                if (project.office != null) {
                String ou = project.office.getUserOperations(Id);
                return ou;    
                }
        } 
        return "";
       } */
    }
        
    [Table("ge_data")]
    public partial class ge_data_big {
        public Guid Id {get;set;}
        public Byte[] data_binary {get;set;}
        public string data_string {get;set;}
        public string data_xml {get;set;}
        public ge_data data {get;set;}
    
       public MemoryStream getMemoryStream() {

           if (data_binary != null) {
               return new MemoryStream(data_binary); 
           }

           if (data_string !=null ) {
               return new MemoryStream(System.Text.Encoding.ASCII.GetBytes(data_string)); 
           }

           if (data_xml !=null) {
              return new MemoryStream(System.Text.Encoding.ASCII.GetBytes(data_xml));
           }

           return null;
       }

       public String getString() {
            
            if (data_binary != null) {
               return System.Text.Encoding.ASCII.GetString(data_binary);
            }

           if (data_string !=null ) {
               return data_string; 
           }

           if (data_xml !=null) {
              return data_xml;
           }

           return null;


       }

        
    }

    public class ge_transform : _ge_base {
             public Guid Id {get; set;}
             public Guid? projectId {get;set;}
             public virtual ge_project project {get;set;}
             [Display(Name = "Transform name")]  public string name {get;set;}
             [Display(Name = "Transform description")]  public string description {get;set;}
             [Display(Name = "Xml data")]  public Guid? dataId {get; set;}
             public virtual ge_data data {get;set;}
             [Display(Name = "Xlst transform")]  public Guid? styleId {get; set;}
            public virtual ge_data style {get;set;}

 
             




    }
    
 }


 

