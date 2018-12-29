using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;

namespace ge_repository.Pages.Office
{
    public class DetailsModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public DetailsModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

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
            return Page();
        }
    }
}
