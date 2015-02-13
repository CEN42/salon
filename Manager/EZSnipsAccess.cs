using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Configuration;
using System.Data.SqlClient;

namespace Manager
{
    public class EZSnipsAccess
    {
        private static SqlConnection NewCon;
        private static string conStr = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
 
        public static SqlConnection getConnection()
        {
            NewCon = new SqlConnection(conStr);
            return NewCon;
 
        }
          public EZSnipsAccess()
          {
 
          }
 
    }
}