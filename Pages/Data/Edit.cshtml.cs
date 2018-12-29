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
using Microsoft.AspNetCore.Http.Extensions;

using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

namespace ge_repository.Pages.Data
{
    public class EditModel : DI_BasePagedModel
    {
        public EditModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager,20)
        { }

        [BindProperty]
        public ge_data data { get; set; }
     
        public async Task<IActionResult> OnGetAsync(Guid? Id)
        {
            if (Id == null)
            {
                return NotFound();
            }

            data = await _context.ge_data
                .Include(g => g.edited)
                .Include(g => g.created)
                .Include(g => g.project).FirstOrDefaultAsync(m => m.Id == Id);

            if (data == null)
            {
                return NotFound();
            }
            
            ViewData["pstatus"] = new SelectList(Enum.GetValues(typeof(Constants.PublishStatus))); 
        
            var userId = _userManager.GetUserId(User);
            
            if (_context.IsDataOperationAllowed("Update",data, data.project,userId)) {
                return Page();
            }  else { 
                if (_context.IsDataOperationAllowed("Approve",data, data.project, userId)) {
                    return Page();
                } else {
                    return RedirectToPageMessage(msgCODE.DATA_EDIT_PROHIBITED);
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
            var project = await _context.ge_project
                                    .FirstOrDefaultAsync(m => m.Id == data.Id);

            if (data.pstatus == Constants.PublishStatus.Approved)
                if (_context.IsDataOperationAllowed("Approve", data, project, userId) == false) {
                    return RedirectToPageMessage(msgCODE.DATA_EDIT_PROHIBITED);
            }
            
            data.editedId =_userManager.GetUserId(User);
            data.editedDT = DateTime.UtcNow;

            _context.Attach(data).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ge_dataExists(data.Id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return RedirectToPage("./Index");
        }

        private bool ge_dataExists(Guid id)
        {
            return _context.ge_data.Any(e => e.Id == id);
        }
    }
}
