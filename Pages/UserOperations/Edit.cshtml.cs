using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

using ge_repository.Models;
using ge_repository.Pages.Shared;
using ge_repository.Authorization;
using ge_repository.Extensions;

namespace ge_repository.Pages.UserOperations
{
   public class EditModel :  DI_BasePageModel
        {
        [BindProperty]
        public ge_office_user ge_office_user { get; set; }

        [BindProperty]
        public ge_project_user ge_project_user { get; set; }
        
        [BindProperty]
        public string userType {get;set;} 
        public EditModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager) : base(context, authorizationService, userManager)
    {}
        
        public async Task<IActionResult> OnGetAsync(Guid? Id)
        {
            if (Id == null)
            {
                return NotFound();
            }
            
            var userId = _userManager.GetUserId(User);
            
             
            var office_user = await _context.ge_office_user
                                        .Include(g => g.created)
                                        .Include(g => g.edited)
                                        .Include(g => g.office)
                                        .Include(g => g.user).FirstOrDefaultAsync(m => m.Id == Id);
            
            if (office_user != null) {
                if (_context.IsOfficeOperationAllowed("Admin",office_user.officeId,userId)) {
                ge_office_user = office_user;
                userType="office";
                ViewData["selectOperations"]= Constants.OperationsArray.Select(x => new SelectListItem() { Text = x, Value = x, Selected = x == ge_office_user.operations });
                return Page();    
                } else {
                     return RedirectToPageMessage(msgCODE.OFFICE_OPERATION_EDIT_PROHIBITED);
                } 
            }
            
            var project_user = await _context.ge_project_user
                                        .Include(g => g.created)
                                        .Include(g => g.edited)
                                        .Include(g => g.project)
                                        .Include(g => g.user).FirstOrDefaultAsync(m => m.Id == Id);
            
            if (project_user != null) {
                if (_context.IsProjectOperationAllowed("Admin",project_user.projectId,userId)) {
                ge_project_user = project_user;
                userType="project";
                ViewData["selectOperations"]= Constants.OperationsArray.Select(x => new SelectListItem() { Text = x, Value = x, Selected = x == ge_project_user.operations });
                return Page();
                } else {
                     return RedirectToPageMessage(msgCODE.PROJECT_OPERATION_EDIT_PROHIBITED);
                } 
            } 
 
            return NotFound();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }
            
            var userId= _userManager.GetUserId(User);

            if (userType == "office" ) {
                ge_office_user.editedId = userId;
                ge_office_user.editedDT = DateTime.UtcNow;
              
                _context.Attach(ge_office_user).State = EntityState.Modified;
                
                await _context.SaveChangesAsync();
                
                return RedirectToPage("./Index",  new {pageOfficeId= ge_office_user.officeId}); 
              }

            if (userType == "project" ){
                ge_project_user.editedId = userId;
                ge_project_user.editedDT = DateTime.UtcNow;
              
                _context.Attach(ge_project_user).State = EntityState.Modified;
              
                await _context.SaveChangesAsync();
                
                return RedirectToPage("./Index",  new {pageProjectId= ge_project_user.projectId}); 
            }

            return NotFound();

        }

        private bool ge_office_userExists(Guid id)
        {
            return _context.ge_office_user.Any(e => e.Id == id);
        }
        private bool ge_project_userExists(Guid id)
        {
            return _context.ge_project_user.Any(e => e.Id == id);
        }
    }
}
