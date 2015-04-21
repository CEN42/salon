using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace Manager
{
    /// <summary>
    /// Summary description for CustomersService
    /// </summary>
    [WebService(Namespace = "http://localhost")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    [System.Web.Script.Services.ScriptService]
    public class CustomersService : System.Web.Services.WebService
    {
        [WebMethod]
        public List<string> GetCustomerNames(string searchTerm)
        {
            List<string> customerNames = new List<string>();
            string cs = ConfigurationManager.ConnectionStrings["DefaultConnection"].ConnectionString;
            using (SqlConnection con = new SqlConnection(cs))
            {
                SqlCommand cmd = new SqlCommand("get_suggestionCust_Names", con);
                cmd.CommandType = CommandType.StoredProcedure;

                SqlParameter parameter = new SqlParameter("@searchTerm", searchTerm);
                cmd.Parameters.Add(parameter);
                con.Open();
                SqlDataReader rdr = cmd.ExecuteReader();
                while (rdr.Read())
                {
                    customerNames.Add(rdr["firstname"].ToString()+ " " + rdr["lastname"].ToString() + " " +rdr["phonenumber"].ToString());
                }
            }

            return customerNames;
        }
    }
}
