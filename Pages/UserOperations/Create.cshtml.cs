using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;

using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

using ge_repository.Models;
using ge_repository.Pages.Shared;
using ge_repository.Authorization;
using ge_repository.Extensions;

namespace ge_repository.Pages.UserOperations
{
       public class CreateModel :  DI_BasePageModel
        {
        [BindProperty]
        public ge_office_user ge_office_user { get; set; }

        [BindProperty]
        public ge_project_user ge_project_user { get; set; }
        public CreateModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager) : base(context, authorizationService, userManager)
    {}
        
        public async Task<IActionResult> OnGetAsync(Guid? officeId,Guid? projectId)
        {
               var userId = _userManager.GetUserId(User);

               bool IsAdmin = false;
              
               if (officeId !=null) {
                    var office =  _context.ge_office
                                            .Where(o=>o.Id==officeId).FirstOrDefault();
                    if (office!=null) {                        
                        IsAdmin = _context.IsOfficeOperationAllowed("Admin",officeId.Value, userId);
                            if  (IsAdmin) {
                                ge_office_user = new ge_office_user();
                                ge_office_user.officeId = office.Id;
                                ViewData["OfficeName"] = office.locName;
                            }
                              
                    }
               }

                             
               if (projectId !=null) { 
                    var project = _context.ge_project
                                            .Where(p=>p.Id==projectId).FirstOrDefault();
                      if (project!=null) {
                           IsAdmin = _context.IsProjectOperationAllowed("Admin",projectId.Value, userId);
                            if  (IsAdmin) {
                            ge_project_user = new ge_project_user(); 
                            ge_project_user.projectId=project.Id;
                             ViewData["ProjectName"] = project.name;
                      }
                      }
               }                      
                       
               ViewData["userId"] = new SelectList(_context.ge_user, "Id", "name");
           
            return Page();
        }


        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            
            var userId= _userManager.GetUserId(User);
            bool IsAdmin = false;

            if (ge_office_user!=null) {
                if (ge_office_user.officeId!=null) {
                    IsAdmin = _context.IsOfficeOperationAllowed("Admin",ge_office_user.officeId, userId);
                    if (IsAdmin) {
                        ge_office_user.createdId=userId;
                        ge_office_user.createdDT= DateTime.UtcNow;
                        _context.ge_office_user.Add(ge_office_user);
                        await _context.SaveChangesAsync();
                    }
                }    
            }

            if (ge_project_user!=null) {
                if (ge_project_user.projectId!=null) {
                    IsAdmin = _context.IsOfficeOperationAllowed("Admin",ge_project_user.projectId, userId);
                    if (IsAdmin){
                        ge_project_user.createdId=userId;
                        ge_project_user.createdDT= DateTime.UtcNow;
                        _context.ge_project_user.Add(ge_project_user);
                        await _context.SaveChangesAsync();
                    }    
                }
            }

           

            return RedirectToPage("./Index");
        }
    }
}