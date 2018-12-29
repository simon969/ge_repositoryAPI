using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Pages.Transform
{
    public class EditModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public EditModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ge_transform ge_transform { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ge_transform = await _context.ge_transform
                .Include(g => g.created)
                .Include(g => g.data)
                .Include(g => g.edited)
                .Include(g => g.project)
                .Include(g => g.style).FirstOrDefaultAsync(m => m.Id == id);

            if (ge_transform == null)
            {
                return NotFound();
            }
           ViewData["createdId"] = new SelectList(_context.ge_user, "Id", "Id");
           ViewData["dataId"] = new SelectList(_context.ge_data, "Id", "Id");
           ViewData["editedId"] = new SelectList(_context.ge_user, "Id", "Id");
           ViewData["projectId"] = new SelectList(_context.ge_project, "Id", "Id");
           ViewData["styleId"] = new SelectList(_context.ge_data, "Id", "Id");
            return Page();
        }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.Attach(ge_transform).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!ge_transformExists(ge_transform.Id))
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

        private bool ge_transformExists(Guid id)
        {
            return _context.ge_transform.Any(e => e.Id == id);
        }
    }
}
