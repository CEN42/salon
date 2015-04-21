using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Optimization;
using System.Web.Routing;
using System.Web.Security;
using System.Web.SessionState;
using System.Globalization;
using System.Web.Mvc;

namespace Manager
{
    public class Global : HttpApplication
    {
       public static void RegisterGlobalFilters(GlobalFilterCollection filters)
        {
            filters.Add(new HandleErrorAttribute());
         
        }

        void Application_Start(object sender, EventArgs e)
        {
          //  AreaRegistration.RegisterAllAreas();

            // Code that runs on application startup
            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }
    }
}