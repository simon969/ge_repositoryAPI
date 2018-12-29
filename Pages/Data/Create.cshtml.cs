using System;
using System.ComponentModel.DataAnnotations;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Http;

using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;
using ge_repository.DAL;

namespace ge_repository.Pages.Data
{
    public class CreateModel : DI_BasePageModel
    {   
              
        [BindProperty]
        public ge_data data {get;set;}
        
        [BindProperty]
        [Required]
        [Display(Name="Upload Files")]

         public IList<IFormFile> uploadFiles { get; set; }
        
        [BindProperty]
        public string LastModifiedDates {get;set;}

        public CreateModel(

            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           
        }

      public async Task<IActionResult> OnGetAsync(Guid projectId)
        {
             if (projectId == null) {
                return NotFound();
            }
        
            var project = await _context.projectFull(projectId).FirstOrDefaultAsync();

            if (project == null) {
                return NotFound();
            }
            
            var UserId = _userManager.GetUserId(User);
          
            Boolean CanCreate = _context.IsProjectOperationAllowed("Create", project, UserId);
            
            if (!CanCreate) {
               return RedirectToPageMessage (msgCODE.DATA_CREATE_PROHIBITED);
            }
            
            ViewData["ProjectName"] =  project.name;
            
            data = new ge_data();
            
            data.locEast=  project.locEast;
            data.locNorth = project.locNorth;
            data.locLevel = project.locLevel;

            data.locName = project.locName;
            data.locAddress = project.locAddress;
            data.locPostcode = project.locPostcode;

            data.locLatitude =project.locLatitude;
            data.locLongitude =project.locLongitude;
            data.locHeight = project.locHeight;

            data.locMapReference = project.locMapReference;
            data.datumProjection=project.datumProjection;

            data.projectId = project.Id;

            return Page();

        } 


    public async Task<IActionResult> OnPostAsync()
    {
        
            if (!ModelState.IsValid) {
               return Page();
            }
            
            var project = await _context.projectFull(data.projectId).FirstOrDefaultAsync();

            var userId = _userManager.GetUserId(User);
          
            Boolean CanCreate = _context.IsProjectOperationAllowed("Create", project, userId);
            
           if (!CanCreate) {
              RedirectToPageMessage(msgCODE.DATA_CREATE_PROHIBITED);
            }

            ProjectionSystem ps = new ProjectionSystem();
            ige_projectionDAL pd = ps.getProjectionDAL(data);
            
            if (!pd.updateAll()) {
                ViewData["CoordinateMessage"] = pd.getMessage();
                return Page();
            }
            
           
            string[] lastmodified = LastModifiedDates.Split(";");
            int i = 0;

            foreach (var formFile in uploadFiles)
                {
                    Boolean IsBinary = formFile.IsContentTypeBinary(ModelState);
                    
                    ge_data_big b = new ge_data_big();
                    ge_data d = new ge_data();

                    d.createdId = _userManager.GetUserId(User);    
                    
                    if (IsBinary) { 
                        b.data_binary = await formFile.ProcessFormFileBinary( ModelState);
                    }  else {
                        b.data_string = await formFile.ProcessFormFileString( ModelState);
                    }

                    // Perform a second check to catch ProcessFormFile method
                    // violations.
                    if (!ModelState.IsValid) {
                    return Page();
                    }
                    
                    d.projectId = project.Id;

                    d.locEast = data.locEast;
                    d.locNorth = data.locNorth;
                    d.locLevel = data.locLevel;

                    d.locLatitude = data.locLatitude;
                    d.locLongitude =data.locLongitude;
                    d.locHeight = data.locHeight;
                    
                    d.locMapReference = data.locMapReference;
                    d.locName = data.locName;
                    d.locAddress = data.locAddress;
                    d.locPostcode = data.locPostcode;
                    
                    d.datumProjection = data.datumProjection ;

                    d.description = data.description;
                    d.keywords = data.keywords;
                    
                    // Add deatils of uploaded file to new _ge_data record
                    d.data = b ;
                    d.filesize = formFile.Length; 
                    d.filename = formFile.FileName;
                    d.fileext = formFile.FileExtension();
                    d.filetype = formFile.ContentType;
                
                    d.filedate = Convert.ToDateTime(lastmodified[i]);
                    d.createdId = userId;
                    d.createdDT = DateTime.UtcNow;
                
                    _context.ge_data.Add(d);
                    
                
            }
   
            await _context.SaveChangesAsync();
            
            return RedirectToPage("./Index",new {pageProjectId=project.Id});
    } 

    }
}