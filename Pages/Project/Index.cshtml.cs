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

using ge_repository.Extensions;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;

namespace ge_repository.Pages.Project {
    public class IndexModel : DI_FullPagedModel
    {
        public IndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager, 20)
    {
    }
        public IList<ge_project> _ge_project {get;set;}
        public IList<ge_project> _ge_office  {get;set;}

      
    public async Task<IActionResult>  OnGetAsync(string pageFilter, string pageSort, int? pageIndex, int? pageSize, Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) 
            {
            base.setPaging(pageFilter,pageSort,pageIndex,pageSize,pageOfficeId,pageProjectId, pageUserId, pagePublishStatus);

            var isAuthorized = User.IsInRole(Constants.ge_repositoryManagerRole) ||
                        User.IsInRole(Constants.ge_repositoryAdministratorRole);
            var UserId = _userManager.GetUserId(User);
            
            int row_count;
            
            IQueryable<ge_project> project = null;

            if (pageFilter !=null) {
            project = _context.getuserprojects("Read", UserId, pageFilter);
            } else {
            project = _context.getuserprojects("Read", UserId);
            } 
            
            if (pageProjectId != null) {
            project.Where(p=>p.Id == pageProjectId);
            }
            
            if (pageOfficeId != null) {
            project.Where(p=>p.officeId == pageOfficeId);
            }
            
            _ge_project = await project.PagedResult(pageIndex,pageSize,m=>m.createdDT,true, out row_count).ToListAsync();
           
            if (_ge_project == null) {
                return NotFound();
            }

            return Page();
            }
                    
    }
}
