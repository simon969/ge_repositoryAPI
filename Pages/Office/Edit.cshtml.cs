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
namespace ge_repository.Pages.Office
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
        public ge_office office { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            office = await _context.ge_office
                .Include(g => g.created)
                .Include(g => g.edited)
                .Include(g => g.manager).FirstOrDefaultAsync(m => m.Id == id);

            if (office == null)
            {
                return NotFound();
            }
           ViewData["createdId"] = new SelectList(_context.ge_user, "Id", "Id");
           ViewData["editedId"] = new SelectList(_context.ge_user, "Id", "Id");
           ViewData["managerId"] = new SelectList(_context.ge_user, "Id", "Id");
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(office).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!officeExists(office.Id))
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

        private bool officeExists(Guid id)
        {
            return _context.ge_office.Any(e => e.Id == id);
        }
    }
}
