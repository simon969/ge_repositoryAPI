using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;

using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Pages.Project
{
    public class CreateModel : DI_BasePageModel
    {
        [BindProperty]
        public ge_project project { get; set; }
        
        public CreateModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           
        }
        public async Task<IActionResult> OnGetAsync(Guid? officeId)
            {

            var userId = _userManager.GetUserId(User); 
            var offices = await _context.officeSearchByUserOperation(userId,"Create","").ToListAsync(); 
            
            if (offices == null) {
                return RedirectToPageMessage(msgCODE.PROJECT_CREATE_PROHIBITED);
            } 
            
            var officeList = new SelectList(offices, "Id","locName");
            
            if (officeId != null) {
                if (!offices.Where(o=>o.Id == officeId).Any()){
                    return RedirectToPageMessage(msgCODE.PROJECT_CREATE_PROHIBITED);  
                }
             officeList.SelectValue( officeId.Value.ToString());    
            }
            
            ViewData["officeId"] = officeList;
            ViewData["managerId"] = _context.getOfficeUsers(offices.FirstOrDefault().Id);

            project = new ge_project();
            project.createdId = userId;
            
            return Page();
        }



   public async Task<IActionResult> OnPostAsync()
    {
        if (!ModelState.IsValid)
        {
        return Page();
        }
            var userId = _userManager.GetUserId(User); 
            bool CanApprove = _context.IsProjectOperationAllowed("Approve",project, userId);
            bool CanCreate = _context.IsProjectOperationAllowed("Create",project, userId);
            
            if (!CanCreate) {
                return RedirectToPageMessage(msgCODE.PROJECT_EDIT_PROHIBITED);
            }
            
            if (project.pstatus == Constants.PublishStatus.Approved ) {
                if (!CanApprove) {
                    return RedirectToPageMessage(msgCODE.PROJECT_APPROVE_PROHIBITED);
                }
            }
        
        project.createdId = userId;
        project.createdDT = DateTime.UtcNow;
        _context.ge_project.Add(project);
        
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
    
    }
}