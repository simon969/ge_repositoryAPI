using System;
using System.Collections.Generic;
using Microsoft.AspNetCore.Http;
using System.ComponentModel.DataAnnotations;
namespace ge_repository.Models
{/* 
public class FileUpload
    {
        [Required]
        [Display(Name="Title")]
        [StringLength(60, MinimumLength = 3)]
        public string Title { get; set; }

        [Required]
        [Display(Name="Public Schedule")]
        public IFormFile UploadPublicSchedule { get; set; }

        [Required]
        [Display(Name="Private Schedule")]
        public IFormFile UploadPrivateSchedule { get; set; }
    } */

public class fileUpload 
    {
        public List<IFormFile> files { get; set; }
      //  public IFormFile[] files { get; set; }
        public Guid projectId { get; set; }

    }
}