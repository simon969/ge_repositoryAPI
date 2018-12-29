using System;
using System.Collections.Generic;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;
using ge_repository.Extensions;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using ge_repository.Pages.Shared;
using ge_repository.Authorization;
using System.Linq;


namespace ge_repository.Pages.Data
{
    public class IndexModel : DI_FullPagedModel
    {
         public IndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager, 10)
    {
    }
        public IList<ge_data> _ge_data { get; private set; }
        
        
        public async Task<IActionResult>  OnGetAsync(string pageFilter, string pageSort, int? pageIndex, int? pageSize, 
                                                    Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) 
            {
            base.setPaging(pageFilter, pageSort, pageIndex, pageSize, pageOfficeId, pageProjectId,  pageUserId, pagePublishStatus);

            var isAuthorized = User.IsInRole(Constants.ge_repositoryManagerRole) ||
                        User.IsInRole(Constants.ge_repositoryAdministratorRole);
            var UserId = _userManager.GetUserId(User);
            
            int row_count;
            
         //   if (!isAuthorized) {
            var data = _context.dataSearchByProjectUserOperation (UserId,"Read",pageFilter);
                                                                      
            if (pageProjectId != null) {
            data = data.Where(p=>p.projectId == pageProjectId);
            }
            
            if (pageOfficeId != null) {
            data = data.Where(p=>p.project.officeId == pageOfficeId);
            }
            
            if (pageUserId != null) {
            data = data.Where(d=>d.createdId == pageUserId);
            }

            if (pagePublishStatus != null) {
            data = data.Where(d=>d.pstatus == pagePublishStatus);
            }
            _ge_data = await data.PagedResult(pageIndex,pageSize,m=>m.filedate,true, out row_count).ToListAsync();

                  
            if (_ge_data == null) {
                return NotFound();
            }

            return Page();
            }
                    
    }

}
