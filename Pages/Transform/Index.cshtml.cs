using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using static ge_repository.Authorization.Constants;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

using ge_repository.Authorization;
using ge_repository.Models;
using ge_repository.Pages.Shared;

namespace ge_repository.Pages.Transform
{
    public class IndexModel :  DI_FullPagedModel
    {
        public IndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager, 20)
    {}

        public IList<ge_transform> ge_transform { get;set; }

        public async Task OnGetAsync()
        {
            ge_transform = await _context.ge_transform
                .Include(g => g.created)
                .Include(g => g.data)
                .Include(g => g.edited)
                .Include(g => g.project)
                .Include(g => g.style).ToListAsync();
        }
    }
}
