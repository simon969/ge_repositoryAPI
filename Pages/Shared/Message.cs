using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.EntityFrameworkCore;
using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

namespace ge_repository.Pages.Shared
{
    [ResponseCache(Duration = 0, Location = ResponseCacheLocation.None, NoStore = true)]
    public class MessageModel :  DI_BasePageModel
    {
       public ge_event log {set;get;}
       public ge_messages msg {set;get;}
        public MessageModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           msg = new ge_messages();
        }
        public async Task<IActionResult> OnGetAsync(Guid? Id, int? msgId)
        {
            if (ge_EventExists(Id)) {
            log = _context.ge_event.FirstOrDefault(e => e.Id == Id.Value);
            return Page();   
            }

            if (msgId!=null) {
             ViewData ["Msg"] = msg[msgId.Value];  
             return Page();  
            }

            return NotFound();
        }

         private bool ge_EventExists(Guid? Id)
        {
            if (Id == null) {
                return false;
            } else {
                return _context.ge_event.Any(e => e.Id == Id.Value);
            }
        }
    }
}
