using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;

using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.RazorPages;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Identity;

using ge_repository.Models;
using ge_repository.Authorization;
using ge_repository.Pages.Shared;
using ge_repository.Extensions;

namespace ge_repository.Pages.Transform
{
    public class CreateModel : DI_BasePageModel
    {
        [BindProperty]
        public ge_transform ge_transform { get; set; }

       public CreateModel(
            ge_DbContext context,
            IAuthorizationService authorizationService,
            UserManager<ge_user> userManager)
            : base(context, authorizationService, userManager)
        {
           
        }

        public async Task<IActionResult> OnGetAsync(Guid id)
        {
            if (id == null) {
                return NotFound();
            }
        
            var ge_project = await _context.projectFull(id).FirstOrDefaultAsync();

            if (ge_project == null) {
                return NotFound();
            }
            
            var UserId = _userManager.GetUserId(User);
          
            Boolean OperationAllowed = _context.IsProjectOperationAllowed("Create",ge_project, UserId);
            
            if (!OperationAllowed) {
                string context_string = "op=Create;projectId=" + id +";userId=" + UserId;
                return RedirectToPage("OperationNotAllowed?" + context_string );
            }

            var ge_xml_data = ge_project.data.Where(d=>d.fileext == Constants.FileExtension.XML);
            var ge_xlt_data = ge_project.data.Where(d=>d.fileext == Constants.FileExtension.XSL);       
            
            if (!ge_xml_data.Any() || !ge_xlt_data.Any()) {
               /*  string context_string = ge_project.name + " contains no pairable transform data elements, add XML and data XSL stylesheets";
                return RedirectToPageMessage(UserId, context_string,logLEVEL.Error ); */
                return RedirectToPageMessage(msgCODE.TRANSFORM_NO_MATCHING);
            }

            ge_transform =  new ge_transform();

            ge_transform.projectId = id;
            ge_transform.createdId = UserId;
          
          //  ViewData["createdId"] = new SelectList(_context.ge_user, "Id","LastName");
            ViewData["dataId"] = new SelectList(ge_xml_data, "Id","filename");
          //  ViewData["editedId"] = new SelectList(_context.ge_user, "Id", "LastName");
            // ViewData["projectId"] = new SelectList(_context.ge_project, "Id","name");
            ViewData["styleId"] = new SelectList(ge_xlt_data, "Id", "filename");
            
            return Page();
        }

     
        public async Task<IActionResult> OnPostAsync()
        {
            if (!ModelState.IsValid)
            {
                return Page();
            }

            ge_transform.createdDT = DateTime.UtcNow;

            _context.ge_transform.Add(ge_transform);
            await _context.SaveChangesAsync();

            return RedirectToPage("./Index");
        }
    }
}