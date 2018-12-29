using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Pages.Project
{
    public class DeleteModel : DI_BasePageModel
    {
   

        public DeleteModel(
        ge_DbContext context,
        IAuthorizationService authorizationService,
        UserManager<ge_user> userManager)
        : base(context, authorizationService, userManager)
    {
    }

        [BindProperty]
        public ge_project _ge_project { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            _ge_project = await _context.ge_project
                .Include(g => g.createdId).FirstOrDefaultAsync(m => m.Id == id);

            if (_ge_project == null)
            {
                return NotFound();
            }
            return Page();
        }

        public async Task<IActionResult> OnPostAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            _ge_project = await _context.ge_project.FindAsync(id);

            if (_ge_project != null)
            {
                _context.ge_project.Remove(_ge_project);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
