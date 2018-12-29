using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Pages.Transform
{
    public class DetailsModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public DetailsModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

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
            return Page();
        }
    }
}
