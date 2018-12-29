using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
namespace ge_repository.Pages.Project


{
    public class DetailDataIndexModel : DI_BasePageModel
    {
        public DetailDataIndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
    {
    }
        [BindProperty]
   
        public ge_project _ge_project {get;set;}
        public IList<ge_data> _ge_data { get;set; }


         public async Task<IActionResult> OnGetAsync(Guid? id)
        {
            _ge_project = await _context.ge_project.FirstOrDefaultAsync(m => m.Id == id);

            if (_ge_project == null)
            {
                return NotFound();
            }

            var ge_data = from d in _context.ge_data
                       select d;
            var isAuthorized = User.IsInRole(Constants.ge_repositoryManagerRole) ||
                                User.IsInRole(Constants.ge_repositoryAdministratorRole);

            var currentUserId = _userManager.GetUserId(User);

            // Only approved contacts are shown UNLESS you're authorized to see them
            // or you are the owner.
            
            if (!isAuthorized)
            {
                ge_data = ge_data.Where(d => d.projectId == id);                            
            }

            _ge_data = await ge_data.ToListAsync();

            return Page();
            }
            
    }
}