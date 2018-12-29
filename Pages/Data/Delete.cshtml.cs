using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Pages.Data
{
    public class DeleteModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public DeleteModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

        [BindProperty]
        public ge_data Data { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null)
            {
                return NotFound();
            }

            Data = await _context.ge_data.SingleOrDefaultAsync(m => m.Id == id);

            if (Data == null)
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

            Data = await _context.ge_data.FindAsync(id);

            if (Data != null)
            {
                _context.ge_data.Remove(Data);
                await _context.SaveChangesAsync();
            }

            return RedirectToPage("./Index");
        }
    }
}