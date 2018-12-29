using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using System.Linq.Expressions;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Authorization;

using ge_repository.Models;
using ge_repository.Pages.Shared;
using ge_repository.Authorization;
using ge_repository.Extensions;

namespace ge_repository.Pages.UserOperations
{
    public class IndexModel :  DI_FullPagedModel
    {
        public IndexModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager, 20)
    {}
        public IList<ge_office_user> ge_office_user { get;set; }
        public IList<ge_project_user> ge_project_user { get;set; }
        public async Task<IActionResult>  OnGetAsync(string pageFilter, string pageSort, int? pageIndex, int? pageSize, Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) 
            {
            base.setPaging(pageFilter, pageSort, pageIndex, pageSize, pageOfficeId, pageProjectId,  pageUserId,pagePublishStatus);
            
            var userId = _userManager.GetUserId(User);

                IQueryable<ge_office_user> office_user;

                bool office_admin = _context.IsOfficeOperationAllowed("Admin", pageOfficeId,userId);

                if (office_admin) {
                    office_user = _context.officeuserSearch ("", pageFilter,"", pageOfficeId);
                } else {
                    office_user = _context.officeuserSearch (userId, pageFilter,"", pageOfficeId);
                }
                
                int ou_row_count;
                ge_office_user = await office_user.PagedResult(this.pageIndex,this.pageSize, o=>o.createdDT,true, out ou_row_count).ToListAsync(); 
          
                
                IQueryable<ge_project_user> project_user;
                bool project_admin = _context.IsProjectOperationAllowed("Admin", pageProjectId, userId);
                if (project_admin) {
                    project_user = _context.projectuserSearch ("", pageFilter, "", pageOfficeId, pageProjectId);
                } else {
                    project_user = _context.projectuserSearch (userId, pageFilter,"", pageOfficeId, pageProjectId);
                }
                
                int pu_row_count; 
                ge_project_user = await project_user.PagedResult(this.pageIndex,this.pageSize,o=>o.createdDT,true, out pu_row_count).ToListAsync(); 

            return Page();

            }

            private Task<ge_user> GetCurrentUserAsync() {
            return _userManager.GetUserAsync(HttpContext.User);
            }
        }
    }

