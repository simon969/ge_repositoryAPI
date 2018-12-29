using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

using static ge_repository.Authorization.Constants;

namespace ge_repository.Pages.Project
{
    public class EditModel :  DI_BasePageModel
    {
        public EditModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
        }

        [BindProperty]
        public ge_project project { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? Id)
        {

        project = await _context.ge_project.FirstOrDefaultAsync(
                                             m => m.Id == Id);
        if (project == null)
        {
            return NotFound();
        }
            var userId = _userManager.GetUserId(User);
            bool CanApprove =_context.IsProjectOperationAllowed("Approve", project, userId);
            bool CanUpdate = _context.IsProjectOperationAllowed("Update", project, userId);
            
            ViewData["managerId"] = _context.getOfficeUsers(project.officeId);
            ViewData["officeId"] = _context.getUserOffices(userId);

            if (CanUpdate) {
                return Page();
            }  else { 
                if (CanApprove) {
                    return Page();
                } else {
                    return RedirectToPageMessage(msgCODE.PROJECT_EDIT_PROHIBITED);
                }
            }
       }

    public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
            return Page();
        }

            var userId = _userManager.GetUserId(User);
            bool CanApprove = _context.IsProjectOperationAllowed("Approve",project, userId);
            bool CanUpdate = _context.IsProjectOperationAllowed("Update",project, userId);
            
            if (!CanUpdate) {
                return RedirectToPageMessage(msgCODE.PROJECT_EDIT_PROHIBITED);
            }
            
            if (project.pstatus == Constants.PublishStatus.Approved ) {
                if (!CanApprove) {
                    return RedirectToPageMessage(msgCODE.PROJECT_APPROVE_PROHIBITED);
                }
            }

            project.editedId = userId;
            project.editedDT = DateTime.UtcNow;

           _context.Attach(project).State = EntityState.Modified;
           await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }

        private bool ge_projectExists(Guid id)
        {
            return _context.ge_project.Any(e => e.Id == id);
        }


    }
}
