using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
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
    public class DetailsModel : DI_BasePageModel
    {
        public DetailsModel(
        ge_DbContext context,
        IAuthorizationService authorizationService,
        UserManager<ge_user> userManager)
        : base(context, authorizationService, userManager)
        {

        }
    

        public ge_project project { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? Id)
        {
            project = await _context.ge_project.FirstOrDefaultAsync(m => m.Id == Id);

        if (project == null)
        {
            return NotFound();
        }

        var userId = _userManager.GetUserId(User);
        
        if (_context.IsProjectOperationAllowed("Read",project,userId)) {
         return Page();
        } 
        return this.RedirectToPageMessage(msgCODE.PROJECT_READ_PROHIBITED);
    }

    public async Task<IActionResult> OnPostAsync(Guid? id, PublishStatus status)
    {
        var ge_project = await _context.ge_project.FirstOrDefaultAsync(
                                                  m => m.Id == id);

        if (ge_project == null)
        {
            return NotFound();
        }

        var ge_projectOperation = (status == PublishStatus.Approved)
                                                   ? ge_repositoryOperations.Approve
                                                   : ge_repositoryOperations.Reject;

        var isAuthorized = await _authorizationService.AuthorizeAsync(User, ge_project,
                                    ge_projectOperation);
        if (!isAuthorized.Succeeded)
        {
            return new ChallengeResult();
        }
        ge_project.pstatus = status;
        _context.ge_project.Update(ge_project);
        await _context.SaveChangesAsync();

        return RedirectToPage("./Index");
    }
}


}
