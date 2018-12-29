using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ge_repository.Models;

namespace ge_repository.Pages.xData
{
    public class CreateModel : PageModel
    {
        private readonly ge_repository.Models.ge_DbContext _context;

        public CreateModel(ge_repository.Models.ge_DbContext context)
        {
            _context = context;
        }

        public IActionResult OnGet()
        {
        ViewData["editedId"] = new SelectList(_context.ge_user, "Id", "Id");
        ViewData["ownerId"] = new SelectList(_context.ge_user, "Id", "Id");
        ViewData["projectId"] = new SelectList(_context.ge_project, "Id", "Id");
            return Page();
        }

        [BindProperty]
        public ge_data ge_data { get; set; }

        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            _context.ge_data.Add(ge_data);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}