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
using ge_repository.Extensions;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Pages.xOffice
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
        public ge_office ge_office { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ge_office = await _context.ge_office
                .Include(g => g.created)
                .Include(g => g.edited)
                .Include(g => g.manager).FirstOrDefaultAsync(m => m.Id == id);

            if (ge_office == null)
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

            ge_office = await _context.ge_office.FindAsync(id);

            if (ge_office != null)
            {
                _context.ge_office.Remove(ge_office);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
