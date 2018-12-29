using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.AspNetCore.Mvc;
using ge_repository.Models;
using ge_repository.Extensions;
using ge_repository.Authorization;
using ge_repository.DAL;
using System.Data.Common;
using System.Data.SqlClient;
using Microsoft.EntityFrameworkCore.SqlServer;
using Microsoft.EntityFrameworkCore;
using System.Data;

namespace ge_repository.Controllers 
{

    public class ge_viewController : Controller
    {
       
       	protected string xslfolder = "xsl_stylesheets";
		protected string xslfile = "";
		protected string xml_data = "";
        protected string xsl_stylesheet="";
		public ge_data data;
		public ge_data_big data_big;
		public ge_data stylesheet;
       
	   
				 

       	private readonly ge_DbContext _context;
        public  ge_viewController (ge_DbContext context)
        {
            _context = context;
        }        
	
        public ActionResult Detail(Guid transformId, Guid dataId, Guid styleId, string sp_query)
        {
            
			if (transformId!=null) {
				var ge_transform = _context.ge_transform.
										Where (t=>t.Id == transformId).FirstOrDefault();
				if (ge_transform!=null) {
					if (ge_transform.dataId != null) {
						dataId= ge_transform.dataId.Value;
					}
					if (ge_transform.styleId != null) {
						styleId=ge_transform.styleId.Value;
					}
				}
			}
			
			data = _context.ge_data.
							Where(d=>d.Id == dataId).FirstOrDefault();
			stylesheet = _context.ge_data.
							Where(d=>d.Id == styleId).FirstOrDefault();    
			
			if (data == null || stylesheet == null) {
				return null;
			}
			
			if (data.fileext != Constants.FileExtension.XML && stylesheet.fileext != Constants.FileExtension.XSL)	{
				string msg = "Data file extension and stylesheet file extension not compatible"; 
				ge_eventDAL ged = new ge_eventDAL(_context);
				ge_event ge = ged.addEvent("",msg ,"",logLEVEL.Fatal);
				return RedirectToPage ("/Shared/Message", new {Id=ge.Id});
			}	
			
			var xml_data_big = _context.ge_data_big.SingleOrDefault(m => m.Id == dataId);
			var xsl_data_big = _context.ge_data_big.SingleOrDefault(m => m.Id == styleId);
			
			xml_data = xml_data_big.getString();
			xslfile = xsl_data_big.getString();

			ViewBag.xml_data = xml_data;
			ViewBag.xsl_stylesheet = xslfile;

            return View();
        }

        public ActionResult Index()
        {
            ViewData["Message"] = "Welcome to ASP.NET MVC!";

            return View();
        }

        public ActionResult About()
        {
            return View();
        }
///<Summary>
///https://forums.asp.net/t/2098192.aspx?How+to+call+a+stored+procedure+from+ASP+net+core
///<Summary>

		
   private bool get_borehole( Guid id, string holeid) {
		try {	
			
			SqlConnection con =  (SqlConnection) _context.Database.GetDbConnection();
			SqlCommand cmd = new SqlCommand("sp_getBorehole", con);
			
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add("@data_id", SqlDbType.Int).Value = id;
			cmd.Parameters.Add("@hole_id", SqlDbType.VarChar).Value = holeid;
			
			SqlParameter output_param = cmd.Parameters.Add("@outputXML", SqlDbType.Xml);
			output_param.Direction = ParameterDirection.Output;
			
			con.Open();
			
			cmd.ExecuteNonQuery();
			
			xml_data = Convert.ToString(output_param.Value);
			
			return true;	
		}
		catch (Exception e) {
			 Console.WriteLine (e.Message );
		//	addMessage (ex.ToString() );
			return false;
		}
    }

/*
public void test_stored_procedure () {
var connection = (SqlConnection) context.Database.AsSqlServer().Connection.DbConnection;

var command = connection.CreateCommand();
command.CommandType = CommandType.StoredProcedure;
command.CommandText = "MySproc";
command.Parameters.AddWithValue("@MyParameter", 42);

command.ExecuteNonQuery();

var userType = dbContext.Set().FromSql("dbo.SomeSproc @Id = {0}, @Name = {1}", 45, "Ada");
	

}


   	public async Task<IActionResult> OnGetAsync(Guid? id, string holeId, string view)
        {
		try {
            if (id == null)
            {
                return NotFound();
            }

            var ge_data = await _context.ge_data.
                .Include(g => g.owner)
                .Include(g => g.project).FirstOrDefaultAsync(m => m.Id == id);

            if (ge_data == null)
            {
                return NotFound();
            }
           ViewData["ownerId"] = new SelectList(_context.Set<ge_user>(), "Id", "Id");
           ViewData["projectId"] = new SelectList(_context.ge_project, "Id", "Id");


			addMessage("Parameters passsed (id=[" + id + "];holeid=[" + holeid + "];view=[" + view + "])");
		
			if (get_xslfilename(id, view)) {
				addMessage ("Using xslt data transform stylsheet: " + xslfile);
					if (get_borehole(id, holeId)) {
						addMessage ("xml_data returned: " + xml_data.Length + " char(s)");
							Xml1.DocumentContent = xml_data;
							Xml1.TransformSource = Server.MapPath(xslfolder + "/" + xslfile);
					} else {
						addMessage ("No xml data returned");
					}
				} else {
				addMessage ("No valid stylesheet was found for the selected view type and xml data set; check the version of the ags data and the type of xml data structure");
				}
		}
		catch (Exception ex) {
			addMessage (ex.ToString());
			return Page();
		}
	}

	private bool  get_xslfilename( int id, string stylename) {
			try {	
				
				SqlConnection con = ConnectionManager.GetGroundEngineeringDataConnection();
				SqlCommand cmd = new SqlCommand("sp_getStylesheetFileName", con);
				
				cmd.CommandType = CommandType.StoredProcedure;
				
				cmd.Parameters.Add("@data_id", SqlDbType.Int).Value = id;
				
				if (String.IsNullOrEmpty(stylename) != true) {
					cmd.Parameters.Add("@stylename", SqlDbType.VarChar).Value = stylename;
				}
				
				SqlParameter output_param = cmd.Parameters.Add("@filename", SqlDbType.VarChar, 64);
				output_param.Direction = ParameterDirection.Output;
				
				con.Open();
				
				cmd.ExecuteNonQuery();
				
				xslfile = Convert.ToString(output_param.Value);
				
				return true;
				
			}
			catch (Exception ex) {
				addMessage(ex.ToString());
				return false ;
			}
	}

	private bool get_borehole( Guid id, string holeid) {
		try {	
			
			SqlConnection con = ConnectionManager.GetGroundEngineeringDataConnection();
			SqlCommand cmd = new SqlCommand("sp_getBorehole", con);
			
			cmd.CommandType = CommandType.StoredProcedure;
			cmd.Parameters.Add("@data_id", SqlDbType.Int).Value = id;
			cmd.Parameters.Add("@hole_id", SqlDbType.VarChar).Value = holeid;
			
			SqlParameter output_param = cmd.Parameters.Add("@outputXML", SqlDbType.Xml);
			output_param.Direction = ParameterDirection.Output;
			
			con.Open();
			
			cmd.ExecuteNonQuery();
			
			xml_data = Convert.ToString(output_param.Value);
			
			return true;	
		}
		catch (Exception ex) {
			addMessage (ex.ToString() );
			return false;
		}
    }
	

		
	private void addMessage(string s1) {
			TextBox1.Text += s1 + "\r\n";
	}
	} */
}
}
