using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using ge_repository.Models;
using ge_repository.Extensions;

namespace ge_repository.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class ge_fileController: ControllerBase       
    
    {
    private readonly ge_DbContext _context;

        public ge_fileController(ge_DbContext context)
        {
            _context = context;
        }
       
 [HttpGet("{id}")]
 
    public async Task<IActionResult> Get(Guid id)
        {
            if (id == null)
            {
                return NotFound();
            }

            var _data_big = await _context.ge_data_big.SingleOrDefaultAsync(m => m.Id == id);
            
            if (_data_big == null)
            {
                return NotFound();
            }

            var _data = await _context.ge_data.SingleOrDefaultAsync(m => m.Id == id);

            var ContentType = _data.GetContentType();
            var filename = _data.filename;
            MemoryStream memory = _data_big.getMemoryStream();

            return File(memory, ContentType, filename);

            }
   [HttpPost]

   public async Task<IActionResult> Post([FromForm] fileUpload data) {
          
            if (data.files == null) {
                throw new ArgumentNullException(nameof(data.files));
            }
            if (data.projectId == null) {
                throw new ArgumentNullException(nameof(data.files));
            }

            var ge_project = await _context.ge_project.FindAsync(data.projectId);

            if (ge_project == null) {
                return NotFound();
            } 
            
            long size = data.files.Sum(f => f.Length);

            // full path to file in temp location
            var filePath = Path.GetTempFileName();

            foreach (var uploadFile in data.files) {
                if (uploadFile.Length > 0) {

                    Boolean IsBinary = uploadFile.IsContentTypeBinary(ModelState);
                    var ge_data_big = new ge_data_big();
                    var ge_data = new ge_data ();
    
                    if (IsBinary) { 
                        ge_data_big.data_binary = await uploadFile.ProcessFormFileBinary( ModelState);
                    }  else {
                        ge_data_big.data_string = await uploadFile.ProcessFormFileString( ModelState);
                    }
                    // Perform a second check to catch ProcessFormFile method violations.
                    if (!ModelState.IsValid) {
                        return NotFound();
                    }
                    ge_data.projectId = ge_project.Id;
                    ge_data.locEast = ge_project.locEast;
                    ge_data.locNorth = ge_project.locNorth;
                    // Add deatils of uploaded file to new _ge_data record
                    ge_data.data = ge_data_big;
                    ge_data.filesize = uploadFile.Length; 
                    ge_data.filename = uploadFile.FileName; 
                    ge_data.createdDT = DateTime.UtcNow;
                    // ge_data.ownerId = User.
                    _context.ge_data.Add(ge_data);
                    await _context.SaveChangesAsync();
                }
            }

            // process uploaded files
            // Don't rely on or trust the FileName property without validation.

            return Ok();
        } 
 

    }
}