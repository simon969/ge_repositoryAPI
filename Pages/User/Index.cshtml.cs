using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

using ge_repository.Extensions;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;

namespace ge_repository.Pages.User
{
    public class IndexModel : DI_FullPagedModel
    {
        public IndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager, 20)
    {
    }

        public IList<ge_user> users { get;set; }

       public async Task  OnGetAsync(string pageFilter, string pageSort, int? pageIndex, int? pageSize, Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) 
            {
            base.setPaging(pageFilter,pageSort,pageIndex,pageSize,pageOfficeId,pageProjectId, pageUserId, pagePublishStatus);

            users = await _context.ge_user.ToListAsync();
        }
    }
}
