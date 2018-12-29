using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Pages.xData
{
    public class DeleteModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public DeleteModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ge_data ge_data { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            ge_data = await _context.ge_data
                .Include(g => g.edited)
                .Include(g => g.created)
                .Include(g => g.project).FirstOrDefaultAsync(m => m.Id == id);

            if (ge_data == null)
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

            ge_data = await _context.ge_data.FindAsync(id);

            if (ge_data != null)
            {
                _context.ge_data.Remove(ge_data);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}
