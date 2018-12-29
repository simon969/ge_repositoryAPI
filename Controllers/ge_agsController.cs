using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web.Http;
using Microsoft.AspNetCore.Mvc;
using ge_repository.Models;
using ge_repository.Extensions;

namespace ge_repository.Controllers 
{

    public class ge_agsController : Controller
    {
  	private readonly ge_DbContext _context;
        public  ge_agsController (ge_DbContext context)
        {
            _context = context;
        }        
        public ActionResult Create(Guid ge_data)
        {
            // check connection setting to ags_server

            // get ge_data
            
            // check is ags format

            // initialise and load ags_client
            
            // start ags_client thread to send to ags_server

            // await for completed repsonse?
            

            ViewData["Message"] = "Welcome to ASP.NET MVC!";

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
    }
}