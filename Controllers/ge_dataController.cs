
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Authorization;
using ge_repository.Models;
using ge_repository.Extensions;
using static ge_repository.Authorization.Constants;

namespace ge_repository.Controllers
{
   [Authorize]
   [Route("api/[controller]")]
   [ApiController]
    public class ge_dataController : ControllerBase
    {
        private readonly ge_DbContext _context;

        public ge_dataController(ge_DbContext context)
        {
            _context = context;
        }

/*     public IEnumerable<ge_project> Projects(Guid Id) {
         
       var ge_projects = _context.ge_project.Where(p => p.pstatus == PublishStatus.ApprovedPublic
                                        && p.officeId == Id);  
       return  ge_projects;
    }
     */
    
  [HttpGet("{id}")]
  [Authorize]
    public ge_data Get (Guid id) {
    
        try {

            if (id == null)
            {
                return null;
            }

            var ge_data =  _context.ge_data.SingleOrDefault(m => m.Id == id);
            
            return  ge_data;

       } catch (Exception e) {
            Console.WriteLine (e.Message );
              return null;
       }

    } 

    [HttpGet]
       public List<ge_data> Get () {
    
        try {

            var url = this.HttpContext.Request.Query;

            string projectid = url["projectid"];
            string id = url["id"];
            string id_name = "id";

            if (projectid != null) {
            id_name ="project_id";
            }

            var ge_data  = _context.ge_data_where(id_name,id).ToList();
           
            return ge_data;

       } catch (Exception e) {
           Console.WriteLine (e.Message );
              return null;
       }

    }

    public void Post(ge_data value) {}
    public void Put(int id, ge_data value) {}

}
}