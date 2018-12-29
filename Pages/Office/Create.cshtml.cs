using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using ge_repository.Models;

using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

namespace ge_repository.Pages.Office
{
    public class CreateModel : DI_BasePageModel
    {
        [BindProperty]
        public ge_office office { get; set; }
        
        public CreateModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           
        }
        public IActionResult OnGet()
        {
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

            _context.ge_office.Add(office);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}