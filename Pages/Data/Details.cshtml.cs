using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

namespace ge_repository.Pages.Data
{
    public class DetailsModel : DI_BasePageModel
    {
        public DetailsModel(

            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           
        }
        public ge_data data { get; set; }

        public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            if (id == null) {
                return NotFound();
            }

            data = await _context.ge_data
                .Include(g => g.edited)
                .Include(g => g.created)
                .Include(g => g.project).FirstOrDefaultAsync(m => m.Id == id);

            if (data == null) {
                return NotFound();
            }

            var userId = _userManager.GetUserId(User);

            bool CanRead =_context.IsDataOperationAllowed("Read",data,data.project,userId);
            if (!CanRead) {
                RedirectToPageMessage (msgCODE.DATA_READ_PROHIBITED);
            }

            return Page();
        }
    }
}
