using System;
using System.Collections.Generic;

using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc.RazorPages;

using Microsoft.AspNetCore.Mvc;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.DAL;
namespace ge_repository.Pages.Shared
{
    public class DI_BasePageModel : PageModel
    {
        protected ge_DbContext _context { get; }
        protected IAuthorizationService _authorizationService { get; }
        protected UserManager<ge_user> _userManager { get; }

        public DI_BasePageModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager) : base()
        {
            _context = context;
            _userManager = userManager;
            _authorizationService = authorizationService;
        } 

        public  RedirectToPageResult RedirectToPageMessage(string message, string return_URL, logLEVEL log) {
        // RedirectToAction(string actionName, string ge_message, string fragment);
            ge_eventDAL ged = new ge_eventDAL(_context);
            string userId= _userManager.GetUserId(User);
           	ge_event ge = ged.addEvent(userId,message,return_URL,log);
                          ged.Save();
            return RedirectToPage ("/Shared/Message",new {Id = ge.Id});
           
        }
        public  RedirectToPageResult RedirectToPageMessage(int msgCODE) {
        // RedirectToAction(string actionName, string ge_message, string fragment);
            return RedirectToPage ("/Shared/Message",new {MsgId = msgCODE});
           
        }


    }
    public class DI_BasePagedModel : DI_BasePageModel
    {
        public int pageSize {get;set;}
        public int pageIndex {get;set;}
        public int pageTotal{get;set;}
        public int rowCount {get;set;}
        public string pageSort {get;set;}
        public string pageFilter {get;set;}

        public DI_BasePagedModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager,
            int DefaultPageSize) : base(context, authorizationService, userManager)
        {
         pageSize = DefaultPageSize;
         pageIndex = 1;
         pageTotal = -1;
         rowCount = 0;

        } 
        public bool HasPreviousPage
        {
            get
            {
                return (pageIndex > 1);
            }
        }

        public bool HasNextPage
        {
            get
            {
                if (pageTotal > 0) {
                return (pageIndex < pageTotal);
                }
                return true;
            }
        }

        public void setPaging (string pageFilter, string pageSort, int? pageIndex, int? pageSize) {
        
            this.pageFilter = pageFilter;
            this.pageSort = pageSort;
            
            if (pageIndex != null) {
            this.pageIndex = pageIndex.Value ;
            }

            if (pageSize !=null) {
            this.pageSize = pageSize.Value;    
            }
            
        }
    }

    public class DI_FullPagedModel : DI_BasePagedModel {
        public Guid? pageOfficeId {get;set;}
        public string pageUserId {get;set;}
        public Guid? pageProjectId {get;set;}
        public Constants.PublishStatus pagePublishStatus {get;set;}
    
    public DI_FullPagedModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager,
            int DefaultPageSize) : base(context, authorizationService, userManager, DefaultPageSize)
            {
        pageOfficeId = null;
        pageUserId = null;
        pageProjectId = null;
        pagePublishStatus = Constants.PublishStatus.Uncontrolled;
        } 
    public void setPaging (string pageFilter, string pageSort, int? pageIndex, int? pageSize, Guid? pageOfficeId, Guid? pageProjectId, string pageUserId, Constants.PublishStatus? pagePublishStatus) {
        base.setPaging(pageFilter, pageSort,pageIndex, pageSize);
         
        if (pageOfficeId != null) {
            this.pageOfficeId = pageOfficeId.Value ;
        }

        if (pageProjectId !=null) {
            this.pageProjectId = pageProjectId.Value;    
        }
        
        if (pageUserId !=null) {
            this.pageUserId = pageUserId;    
        }
 
        if (pagePublishStatus != null) {
            this.pagePublishStatus = pagePublishStatus.Value;
        }

    }
}

}


