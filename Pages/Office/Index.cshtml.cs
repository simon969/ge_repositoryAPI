using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using ge_repository.Pages.Shared;
using ge_repository.Models;
using ge_repository.Extensions;
using ge_repository.Authorization;

namespace ge_repository.Pages.Office
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

        public IList<ge_office> ge_office { get;set; }

       public async Task<IActionResult>  OnGetAsync(string pageFilter, string pageSort, int? pageIndex, int? pageSize, Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) 
            {
            base.setPaging(pageFilter, pageSort, pageIndex, pageSize, pageOfficeId, pageProjectId,  pageUserId, pagePublishStatus);

            var isAuthorized = User.IsInRole(Constants.ge_repositoryManagerRole) ||
                        User.IsInRole(Constants.ge_repositoryAdministratorRole);
            var UserId = _userManager.GetUserId(User);
            
            int row_count;
            
         //   if (!isAuthorized) {
            var office = _context.officeSearchByUserOperation (UserId,"Read",pageFilter);
                                                                      
            if (pageProjectId != null) {
     //       office = office.Where(p=>p.projectId == pageProjectId);
            }
            
            if (pageOfficeId != null) {
            office = office.Where(o=>o.Id == pageOfficeId);
            }
            
            if (pageUserId != null) {
            office = office.Where(d=>d.createdId == pageUserId);
            }

            ge_office = await office.PagedResult(pageIndex,pageSize,o=>o.createdDT,true, out row_count).ToListAsync();

                     
            if (ge_office == null) {
                return NotFound();
            }

            return Page();
            }
                    
    }
}

