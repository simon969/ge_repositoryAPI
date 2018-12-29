using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.IO;
using System.Net;
using System.Reflection;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc.ModelBinding;

using System.Linq;
using System.Linq.Expressions; 
using Microsoft.EntityFrameworkCore;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Html;

using System.Web.Http;

using System.Xml.Xsl;
using System.Xml;

using ge_repository.Models;
using ge_repository.Authorization;

namespace  ge_repository.Extensions {

    public static class Extensions
    {
       public static Boolean IsContentTypeBinary(this IFormFile formFile,ModelStateDictionary modelState) {

           switch (formFile.ContentType.ToLower()) {
                        case "text/plain": return false;
                        default: return true;
        }

       }
       public static Boolean IsFileExtensionBinary(this IFormFile formFile,ModelStateDictionary modelState) {
        
        string ext = System.IO.Path.GetExtension(formFile.FileName);
           switch (ext.ToLower()) {
                        case ".ags": return false;
                        case ".txt": return false;
                        default: return true;
            }
       }

        public static string FileExtension(this IFormFile formFile) {
               string ext = System.IO.Path.GetExtension(formFile.FileName);
               return ext.ToLower();
       }
       
        public static async Task<string> ProcessFormFileString(this IFormFile formFile, ModelStateDictionary modelState)
        {
            var fieldDisplayName = string.Empty;

            // Use reflection to obtain the display name for the model 
            // property associated with this IFormFile. If a display
            // name isn't found, error messages simply won't show
            // a display name.
            MemberInfo property = 
                typeof(fileUpload).GetProperty(formFile.Name.Substring(formFile.Name.IndexOf(".") + 1));

            if (property != null)
            {
                var displayAttribute = 
                    property.GetCustomAttribute(typeof(DisplayAttribute)) as DisplayAttribute;

                if (displayAttribute != null)

                if (displayAttribute != null)
                {
                    fieldDisplayName = $"{displayAttribute.Name} ";
                }
            }

            // Use Path.GetFileName to obtain the file name, which will
            // strip any path information passed as part of the
            // FileName property. HtmlEncode the result in case it must 
            // be returned in an error message.
            var fileName = WebUtility.HtmlEncode(Path.GetFileName(formFile.FileName));

            if (formFile.ContentType.ToLower() != "text/plain")
            {
                modelState.AddModelError(formFile.Name, 
                                         $"The {fieldDisplayName}file ({fileName}) must be a text file.");
            }

            // Check the file length and don't bother attempting to
            // read it if the file contains no content. This check
            // doesn't catch files that only have a BOM as their
            // content, so a content length check is made later after 
            // reading the file's content to catch a file that only
            // contains a BOM.
            if (formFile.Length == 0)
            {
                modelState.AddModelError(formFile.Name, $"The {fieldDisplayName}file ({fileName}) is empty.");
            }
            else if (formFile.Length > 10*1024)
            {
                modelState.AddModelError(formFile.Name, $"The {fieldDisplayName}file ({fileName}) exceeds 10 MB.");
            }
            else
            {
                try
                {
                    string fileContents;

                    // The StreamReader is created to read files that are UTF-8 encoded. 
                    // If uploads require some other encoding, provide the encoding in the 
                    // using statement. To change to 32-bit encoding, change 
                    // new UTF8Encoding(...) to new UTF32Encoding().
                    using (
                        var reader = 
                            new StreamReader(
                                formFile.OpenReadStream(), 
                                new UTF8Encoding(encoderShouldEmitUTF8Identifier: false, throwOnInvalidBytes: true), 
                                detectEncodingFromByteOrderMarks: true))
                    {
                        fileContents = await reader.ReadToEndAsync();

                        // Check the content length in case the file's only
                        // content was a BOM and the content is actually
                        // empty after removing the BOM.
                        if (fileContents.Length > 0)
                        {
                            return fileContents;
                        }
                        else
                        {
                            modelState.AddModelError(formFile.Name, 
                                                     $"The {fieldDisplayName}file ({fileName}) is empty.");
                        }
                    }
                }
                catch (Exception ex)
                {
                    modelState.AddModelError(formFile.Name, 
                                             $"The {fieldDisplayName}file ({fileName}) upload failed. " +
                                             $"Please contact the Help Desk for support. Error: {ex.Message}");
                    // Log the exception
                }
            }

            return string.Empty;
        }
        public static async Task<byte[]> ProcessFormFileBinary(this IFormFile formFile, ModelStateDictionary modelState)
            {
            var fieldDisplayName = string.Empty;

            // Use reflection to obtain the display name for the model 
            // property associated with this IFormFile. If a display
            // name isn't found, error messages simply won't show
            // a display name.

            MemberInfo property = 
                typeof(fileUpload).GetProperty(formFile.Name.Substring(formFile.Name.IndexOf(".") + 1));

            if (property != null)
            {
                var displayAttribute = 
                    property.GetCustomAttribute(typeof(DisplayAttribute)) as DisplayAttribute;

                if (displayAttribute != null)

                if (displayAttribute != null)
                {
                    fieldDisplayName = $"{displayAttribute.Name} ";
                }
            }

            // Use Path.GetFileName to obtain the file name, which will
            // strip any path information passed as part of the
            // FileName property. HtmlEncode the result in case it must 
            // be returned in an error message.
            var fileName = WebUtility.HtmlEncode(Path.GetFileName(formFile.FileName));

            // Check the file length and don't bother attempting to
            // read it if the file contains no content. This check
            // doesn't catch files that only have a BOM as their
            // content, so a content length check is made later after 
            // reading the file's content to catch a file that only
            // contains a BOM.
            
            if (formFile.Length == 0)
            {
                modelState.AddModelError(formFile.Name, $"The {fieldDisplayName}file ({fileName}) is empty.");
            }
            else if (formFile.Length > 20*1024*1000)
            {
                modelState.AddModelError(formFile.Name, $"The {fieldDisplayName}file ({fileName}) exceeds 20 MB.");
            }
            else
            {
                try
                {
                        byte[] buffer = new byte[16*1024]; 
                        MemoryStream ms = new MemoryStream();
                        BinaryReader reader = new BinaryReader(formFile.OpenReadStream());
                           int read;
                               while ((read = reader.Read(buffer, 0, buffer.Length)) > 0)
                            {
                            ms.Write(buffer, 0, read);
                        }
                        
                        Byte[] fileContents = ms.ToArray();

                        // Check the content length in case the file's only
                        // content was a BOM and the content is actually
                        // empty after removing the BOM.

                        if (fileContents.Length > 0)
                        {
                            return fileContents;
                        }
                        else
                        {
                            modelState.AddModelError(formFile.Name, 
                                                     $"The {fieldDisplayName}file ({fileName}) is empty.");
                        }
                    
                }
                catch (Exception ex)
                {
                    modelState.AddModelError(formFile.Name, 
                                             $"The {fieldDisplayName}file ({fileName}) upload failed. " +
                                             $"Please contact the Help Desk for support. Error: {ex.Message}");
                    // Log the exception
                }
            }
        return null;
        }
       
/// <summary>
/// Pages the specified query.
// https://www.codeproject.com/Tips/758999/Dynamic-paging-in-Entity-Framework
/// </summary>
/// <typeparam name="T">Generic Type Object</typeparam>
/// <typeparam name="TResult">The type of the result.</typeparam>
/// <param name="query">The Object query where paging needs to be applied.</param>
/// <param name="pageNum">The page number.</param>
/// <param name="pageSize">Size of the page.</param>
/// <param name="orderByProperty">The order by property.</param>
/// <param name="isAscendingOrder">if set to <c>true</c> [is ascending order].</param>
/// <param name="rowsCount">The total rows count.</param>
/// <returns></returns>
public static IQueryable<T> PagedResult<T, TResult>(this IQueryable<T> query, int? pageNum, int? pageSize,
                Expression<Func<T, TResult>> orderByProperty, bool isAscendingOrder, out int rowsCount)
{
    int pNum = 1;
    int pSize = 20;

    if (pageNum != null){
        pNum = pageNum.Value;
    } 

    if (pageSize != null) {
        pSize = pageSize.Value;
    }
    
    if (pSize <= 0) {
        pSize = 20;
    }

    //Total result count
    rowsCount = query.Count();
    
    //If page number should be > 0 else set to first page
    if (rowsCount <= pSize || pNum <= 0) pNum = 1;
    
    //Calculate nunber of rows to skip on pagesize
    int excludedRows = (pNum - 1) * pSize;

    query = isAscendingOrder ? query.OrderBy(orderByProperty) : query.OrderByDescending(orderByProperty);
    
    //Skip the required rows for the current page and take the next records of pagesize count
    return query.Skip(excludedRows).Take(pSize);
}

    public static IQueryable<ge_project> projectFull(this ge_DbContext context)
        {
            if (context == null)
            {
                throw new ArgumentNullException(nameof(context));
            }

            return context.ge_project
                .Include(p => p.users)
                .Include(p =>p.data)
                .Include(p => p.office);

        }

        public static IQueryable<ge_project> projectFull(this ge_DbContext context, Guid Id) {
           if (context == null || Id == null)
            {
                throw new ArgumentNullException(nameof(context));
            }
            return context.ge_project
             .Include(p => p.users)
             .Include(p => p.office)
             .Include("office.users")
             .Include(p =>p.data)
             .Where(p => p.Id == Id);
        }

public static bool IsProjectOperationAllowed2(this ge_DbContext context, string operation, Guid? projectId, string userId) {
          
        if (context == null || projectId == null || operation == "")
            {
                return false;
        }
        
        var project = context.ge_project
                        .Where(p=>p.Id==projectId).FirstOrDefault();

        var user_proj = context.ge_project_user
                        .Where(p => p.userId == userId && p.operations.Contains(operation) && p.projectId==projectId);
        var user_office = context.ge_office_user
                        .Where(u=> u.userId == userId && u.operations.Contains(operation) && u.officeId == project.officeId);
        
        return user_proj.Any() || user_office.Any();
        }

public static bool IsDataOperationAllowed(this ge_DbContext context, string operation, ge_data data, ge_project project, string userId) {
        
        if (context == null || data == null || operation == "" || userId == "") {
                return false;
        }

        if (operation.Contains("Update") || operation.Contains("Delete")) {
            if (data.pstatus == Constants.PublishStatus.Approved || data.pstatus == Constants.PublishStatus.Approved) {
                return false;
            }
        } 
        if (project==null) {
            return false;
        } else {
        return context.IsProjectOperationAllowed(operation, project, userId);
        }
}
public static bool IsProjectOperationAllowed(this ge_DbContext context, string operation, Guid? projectId, string userId) {

    if (context == null || projectId == null || operation == "" || userId == "" ){
            return false;
    }

    var project = context.ge_project
                        .Where(p => p.Id == projectId).FirstOrDefault();
    if (project == null) {
        return false;
    } else {
        return IsProjectOperationAllowed(context, operation, project, userId);
    }
}
 
public static bool IsProjectOperationAllowed(this ge_DbContext context, string operation, ge_project project, string userId) {
       
        
        if (context == null || project == null || operation == "" || userId == "" )
        {
            return false;
        }
       
        var user_proj = context.ge_project_user
                        .Where(p => p.userId == userId && p.projectId==project.Id).FirstOrDefault();
                        
        if (user_proj != null) {
            if (user_proj.user_operations.Contains(operation)) {
            return true;
            } else {
                return false;}
        } 
        else {
            var user_office = context.ge_office_user
                    .Where(u=> u.userId == userId && u.user_operations.Contains(operation) && u.officeId == project.officeId);
                if (user_office.Any()) {
                    return true;    
                } else {
                return false;
                }
         } 
  
}

public static bool IsOfficeOperationAllowed(this ge_DbContext context, string operation, Guid? officeId, string userId) {
          
            if (context == null || officeId == null || operation == "")
            {
                return false;
            }

        var user_office = context.ge_office_user
                        .Where(u=> u.userId == userId && u.user_operations.Contains(operation) && u.officeId == officeId);
        
        return user_office.Any();
        }
  
    public static IQueryable<ge_project> getuserprojects (this ge_DbContext _context, string operation, string userId, string search) {

    var user_projects = _context.ge_project
                                    .Where (p=>p.name.Contains(search) || p.description.Contains(search) || p.keywords.Contains(search))
                                    .Where (p=>p.users.Any(u=>u.userId == userId && u.operations.Contains(operation)));

    var office_project = _context.ge_project
                                    .Where (p=>p.name.Contains(search) || p.description.Contains(search) || p.keywords.Contains(search))
                                    .Where (p=>p.office.users.Any(u=>u.userId == userId && u.user_operations.Contains(operation)));
    
       return user_projects.Union(office_project);
    }
    public static IQueryable<ge_project> getuserprojects (this ge_DbContext _context, string operation, string userId) {

    var user_projects = _context.ge_project
                                    .Where (p=>p.users.Any(u=>u.userId == userId && u.user_operations.Contains(operation)));

    var office_project = _context.ge_project
                                    .Where (p=>p.office.users.Any(u=>u.userId == userId && u.user_operations.Contains(operation)));
    
       return user_projects.Union(office_project);
    }
    

    public static IQueryable<ge_project> projectSearchByUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        IQueryable<ge_project> project;
        
        var user_proj = _context.ge_project_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));
        
        if (!string.IsNullOrEmpty(search)) {
            project = from item in _context.ge_project join t in user_proj on item.Id equals t.projectId 
                     where item.name.Contains(search) || item.description.Contains(search) || item.keywords.Contains(search) 
                      select item;
        } else {
            project = from item in _context.ge_project join t in user_proj on item.Id equals t.projectId 
                       select item;
        }

       return project
                    .Include (p=>p.office);
            
                                       
    }

      public static IQueryable<ge_data> ge_data_where(this ge_DbContext _context,  string ParamName, string ParamValue) { 
      
        if (ParamName.ToLower().Equals("projectid")) {
            Guid Id = Guid.Parse (ParamValue);
                return _context.ge_data
                        .Where (m=>m.projectId == Id);
        }
        if (ParamName.ToLower().Equals("id")) {
            Guid Id = Guid.Parse (ParamValue);
                return _context.ge_data
                        .Where (m=>m.Id == Id);
        }
      

       return _context.ge_data;
      }     
      
      

     public static string getQueryParam(this string s1, string paramName,string returnvalIfAbsent) {
         
         string ret = returnvalIfAbsent;

         if (s1.Contains(paramName)) {
            string[] paramList = s1.Split(";");
                for (int i=0;  i<paramList.Count(); i++) {
                    if (paramList[i].Contains(paramName)) {
                        string[] paramValue = paramList[i].Split("=");
                        ret = paramValue[1];
                        break;
                    }
                }

         } 

        return ret;
    }
    public static IQueryable<ge_data> dataSearch(this ge_DbContext _context, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        if (!string.IsNullOrEmpty(search)) {
        var data = from item in _context.ge_data  
                     where item.description.Contains(search) || item.keywords.Contains(search) || item.filename.Contains(search) || item.filetype.Contains(search)
                      select item;
        return data;
       } else {
        var data2 = from item in _context.ge_data  
                       select item;
        return data2;
       }
    }
     public static IQueryable<ge_data> dataSearchByProjectUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        var user_proj = _context.ge_project_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));

        if (!string.IsNullOrEmpty(search)) {
        var data = from item in _context.ge_data join t in user_proj on item.projectId equals t.projectId 
                     where item.description.Contains(search) || item.keywords.Contains(search) || item.filename.Contains(search) || item.filetype.Contains(search)
                      select item;
        return data;
       } else {
        var data2 = from item in _context.ge_data.Include(d=>d.project) join t in user_proj on item.projectId equals t.projectId 
                       select item;
        return data2;
       }
    }

                       
    public static IQueryable<ge_data> dataSearchByOfficeUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        var user_office = _context.ge_office_user
                            .Where(p => p.userId == userId && p.user_operations.Contains(operation));
        
        var project = from item in _context.ge_project join t in user_office on item.officeId equals t.officeId  
                         select item;
        
        if (!string.IsNullOrEmpty(search)) {
        var data = from item in _context.ge_data join t in project on item.projectId equals t.Id 
                     where item.description.Contains(search) || item.keywords.Contains(search)
                        || t.name.Contains(search) || t.description.Contains(search) || t.keywords.Contains(search)
                      select item;
        return data;
       } else {
        var data2 = from item in _context.ge_data join t in project on item.projectId equals t.Id 
                       select item;
        return data2;
       }
    }

    public static IQueryable<ge_project> projectSearch(this ge_DbContext _context, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        if (!string.IsNullOrEmpty(search)) {
        var project = from item in _context.ge_project  
                      where item.name.Contains(search) || item.description.Contains(search) || item.keywords.Contains(search) 
                      select item;
        return project;
       } else {
        var project2 = from item in _context.ge_project 
                       select item;
        return project2;
       }
            
                                       
    }
    public static IQueryable<ge_project> projectSearchByOfficetUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        var user_office = _context.ge_office_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));

        if (!string.IsNullOrEmpty(search)) {
        var project = from item in _context.ge_project join t in user_office on item.officeId equals t.officeId 
                      where item.name.Contains(search) || item.description.Contains(search) || item.keywords.Contains(search) 
                      select item;
        return project;
       } else {
        var project2 = from item in _context.ge_project join t in user_office on item.officeId equals t.officeId 
                       select item;
        return project2;
       }
            
                                       
    }
    public static IQueryable<IGrouping<System.Guid, ge_project>> projectSearchByUserOperationGrouped(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        var user_office = _context.ge_office_user
                        .Where(o => o.userId == userId && o.user_operations.Contains(operation));

        var user_project = _context.ge_project_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));

        if (!string.IsNullOrEmpty(search)) {
        var project = (from item in _context.ge_project 
                        join o in user_office on  item.officeId equals o.officeId 
                        join p in user_project on item.Id equals p.projectId   
                        where item.name.Contains(search) || item.description.Contains(search) || item.keywords.Contains(search) 
                        select item).GroupBy (g=>g.Id);
        return project;
       } else {
        var project2 = (from item in _context.ge_project 
                        join o in user_office on item.officeId equals o.officeId 
                        join p in user_project on item.Id equals p.projectId  
                        select item).GroupBy (g=>g.Id);
        return project2;
       }
            
                                       
    }

     public static IQueryable<ge_project> SearchByUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
        var user_office = _context.ge_office_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));

        var user_project = _context.ge_project_user
                        .Where(p => p.userId == userId && p.user_operations.Contains(operation));

        if (!string.IsNullOrEmpty(search)) {
        var project = from item in _context.ge_project 
                        join p in user_project on item.Id equals p.projectId 
                        join o in user_office on item.officeId equals o.officeId
                        where item.name.Contains(search) || item.description.Contains(search) || item.keywords.Contains(search) 
                      
                        select item;
        return project;
       } else {
        var project2 = from item in _context.ge_project 
                        join p in user_project on item.Id equals p.projectId  
                        join o in user_office on item.officeId equals o.officeId 
                        select item;
        return project2;
       }
            
                                       
    }
    public static IQueryable<ge_office> officeSearchByUserOperation(this ge_DbContext _context, string userId, string operation, string search) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
        
        var user_office = _context.ge_office_user
                            .Where(p => p.userId == userId && p.user_operations.Contains(operation));
        
        if (!string.IsNullOrEmpty(search)) {
        var office = from item in _context.ge_office join t in user_office on item.Id equals t.officeId 
                     where item.locAddress.Contains(search) || item.locName.Contains(search)
                      select item;
        return office;
       } else {
        var office2 = from item in _context.ge_office join t in user_office on item.Id equals t.officeId 
                       select item;
        return office2;
       }
    }
   
   public static IQueryable<ge_office_user> officeuserSearch(this ge_DbContext _context, string userId, string search, string operation, Guid? officeId) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
      
            if (_context == null) {
                return null;
            }
            
            IQueryable<ge_office_user> user_office;
            
            user_office = _context.ge_office_user
                            .Include(u=>u.user)
                            .Include(u=>u.office);

            if (!string.IsNullOrEmpty(userId)) {
                user_office = user_office
                            .Where (u=>u.userId == userId);

            }
            
            if (!string.IsNullOrEmpty(search)) {
                user_office = user_office
                            .Where(u => u.user.FirstName.Contains(search) || u.user.LastName.Contains(search));
            }
            
            if (!string.IsNullOrEmpty(operation)) {
                user_office = user_office
                            .Where (u=>u.user_operations.Contains(operation));
            }

            if (officeId!=null) {
                user_office = user_office
                            .Where (u=>u.officeId==officeId.Value);
            }

            return user_office;
    }
       public static IQueryable<ge_project_user> projectuserSearch(this ge_DbContext _context, string userId, string search, string operation, Guid? officeId, Guid? projectId) { 
      
      // https://arnhem.luminis.eu/linq-and-entity-framework-some-dos-and-donts/
            
            if (_context == null) {
                return null;
            }
            
            IQueryable<ge_project_user> user_project;
            
            user_project = _context.ge_project_user
                            .Include(u=>u.user)
                            .Include(u=>u.project)
                            .Include(u=>u.project.office);
      
            if (!string.IsNullOrEmpty(userId)) {
                user_project = user_project
                            .Where (u=>u.userId == userId);

            }

            if (!string.IsNullOrEmpty(search)) {
                user_project = user_project
                            .Where(u => u.user.FirstName.Contains(search) || u.user.LastName.Contains(search));
            }
            
            if (!string.IsNullOrEmpty(operation)) {
                user_project = user_project
                            .Where (u=>u.user_operations.Contains(operation));
            }


            if (officeId!=null) {
                user_project = user_project
                            .Where (u=>u.project.officeId==officeId.Value);
            }

            if (projectId!=null) {
                user_project = user_project
                            .Where (u=>u.projectId==projectId.Value);
            }
                       
            return user_project;
        
    }
public static Boolean SelectValue(this SelectList selectList, string value) {

        foreach (SelectListItem item in selectList.Items)
        {
            if (item.Value == value)
            {
            item.Selected = true;
            return true;
            }
        }
        return false;
}
public static SelectList getOfficeUsers(this ge_DbContext context, Guid? officeId) {
        
    IQueryable<ge_office_user> ou = null;
        
    if (officeId != null) {
        ou = context.ge_office_user
                                .Include(u=>u.user)
                                .Where(u=>u.officeId == officeId);
    } 
    
    List<SelectListItem> list= new List<SelectListItem>();

    foreach (var u in ou) {
            SelectListItem item =  new SelectListItem(u.user.LastName + ","  + u.user.FirstName, u.user.Id);
            list.Add (item);
    }
   
    return new SelectList(list,"Value","Text", null);

}
public static SelectList getUserOffices(this ge_DbContext context, string userId) {
    
    IQueryable<ge_office> offices = null;
        
    if (userId != null) {
        offices = context.ge_office
                            .Where(o=>o.users.Any(ou=>ou.userId == userId));
    } 
     
    List<SelectListItem> list= new List<SelectListItem>();

    foreach (var o in offices) {
            SelectListItem item =  new SelectListItem(o.locName + " ("  + o.locAddress + ")", o.Id.ToString());
            list.Add (item);
    }
   
    return new SelectList(list,"Value","Text", null);

}
public static SelectList getProjectUsers(this ge_DbContext context, Guid? projectId) {
    
    if (projectId == null ) {
        return null;
    }

    IQueryable<ge_project_user> pu = null;
    
    pu = context.ge_project_user
                                .Include(u=>u.user)
                                .Where(u=>u.projectId == projectId);
    
    List<SelectListItem> list= new List<SelectListItem>();

    foreach (var u in pu) {
            SelectListItem item =  new SelectListItem(u.user.LastName + ","  + u.user.FirstName, u.user.Id);
            list.Add (item);
    }
   return new Microsoft.AspNetCore.Mvc.Rendering.SelectList(list,"Value","Text", null);

}

/*   // https://www.codeproject.com/Articles/1056011/Bind-Enum-to-DropdownList-in-ASP-NET-MVC
  
public static string AttributeValue<TEnum,TAttribute>(this TEnum value,Func<TAttribute,string> func) 
    where T : Attribute
{
   FieldInfo field = value.GetType().GetField(value.ToString());

   T attribute = Attribute.GetCustomAttribute(field, typeof(T)) as T;

   return attribute == null ? value.ToString() : func(attribute);

}
 public static Microsoft.AspNetCore.Mvc.Rendering.SelectList ToSelectList<TEnum,TAttribute>
(this TEnum obj,Func<TAttribute,string> func,object selectedValue=null)
  where TEnum : struct, IComparable, IFormattable, IConvertible
  where TAttribute : Attribute
    {
        
        return new SelectList(Enum.GetValues(typeof(TEnum)).OfType<Enum>() 
             .Select(x => 
                 new SelectListItem 
                 { 
                    Text = x.AttributeValue<TEnum,TAttribute>(func), 
                    Value = (Convert.ToInt32(x)).ToString() 
                 }), 
             "Value", 
             "Text",
              selectedValue);
    } */                                      
    

 


/// <summary>  
    /// Applies an XSL transformation to an XML document  
     // https://www.c-sharpcorner.com/article/display-xml-data-as-html-using-xslt-in-asp-net-mvc/ 
    /// </summary>  
    /// <param name="helper"></param>  
    /// <param name="xml"></param>  
    /// <param name="xsltPath"></param> 
    /// <returns></returns>  
    public static HtmlString RenderXml(this IHtmlHelper helper, string xml, string xslt)  
    {  
        XsltArgumentList args = new XsltArgumentList();  
        // Create XslCompiledTransform object to loads and compile XSLT string.  
        XslCompiledTransform tranformObj = new XslCompiledTransform();  
        tranformObj.Load(new XmlTextReader(new StringReader(xslt)));  
  
        // Create XMLReaderSetting object to assign DtdProcessing, Validation type  
        XmlReaderSettings xmlSettings = new XmlReaderSettings();  
        xmlSettings.DtdProcessing = DtdProcessing.Parse;  
        xmlSettings.ValidationType = ValidationType.DTD;  
  
        // Create XMLReader object to Transform xml value with XSLT setting   
        using (XmlReader reader = XmlReader.Create(new StringReader(xml), xmlSettings))  
        {  
            StringWriter writer = new StringWriter();  
            tranformObj.Transform(reader, args, writer);  
  
            // Generate HTML string from StringWriter  
            HtmlString htmlString = new HtmlString(writer.ToString());  
            return htmlString;  
        }  
    }  


 public static string ToString (this double Num,int SagnificantDigits)
{
    var Format = $"{0}{new string('#', SagnificantDigits-1)}";
    var NumAbs = 0 <= Num ? Num : -Num;
    var Power  = 10d;

    for (int p=1; p<= SagnificantDigits; p++) 
        if(NumAbs < Power) return Num.ToString(Format.Insert(p, ".")); 
        else Power *= 10;

    return Num.ToString("0.").Substring(0, SagnificantDigits);
}
}

}
 /* 

/// <summary>
/// Return Partial View.
/// The element naming convention is maintained in the partial view by setting the prefix name from the expression.
/// The name of the view (by default) is the class name of the Property or a UIHint("partial name").
/// @Html.PartialFor(m => m.Address)  - partial view name is the class name of the Address property.
/// </summary>
/// <param name="expression">Model expression for the prefix name (m => m.Address)</param>
/// <returns>Partial View as Mvc string</returns>
public static MvcHtmlString PartialFor<tmodel, tproperty>(this HtmlHelper<tmodel> html,
    Expression<func<TModel, TProperty>> expression)
{
    return html.PartialFor(expression, null);
}

/// <summary>
/// Return Partial View.
/// The element naming convention is maintained in the partial view by setting the prefix name from the expression.
/// </summary>
/// <param name="partialName">Partial View Name</param>
/// <param name="expression">Model expression for the prefix name (m => m.Group[2])</param>
/// <returns>Partial View as Mvc string</returns>
public static MvcHtmlString PartialFor<TModel, TProperty>(this HtmlHelper<TModel> html,
    Expression<Func<TModel, TProperty>> expression,
    string partialName
    )
{
    string name = ExpressionHelper.GetExpressionText(expression);
    string modelName = html.ViewContext.ViewData.TemplateInfo.GetFullHtmlFieldName(name);
    ModelMetadata metaData = ModelMetadata.FromLambdaExpression(expression, html.ViewData);
    object model = metaData.Model;


    if (partialName == null)
    {
        partialName = metaData.TemplateHint == null
            ? typeof(TProperty).Name    // Class name
            : metaData.TemplateHint;    // UIHint("template name")
    }

    // Use a ViewData copy with a new TemplateInfo with the prefix set
    ViewDataDictionary viewData = new ViewDataDictionary(html.ViewData)
    {
        TemplateInfo = new TemplateInfo { HtmlFieldPrefix = modelName }
    };

    // Call standard MVC Partial
    return html.Partial(partialName, model, viewData);
}

    }
    
 */






