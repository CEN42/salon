using System;
using System.Data;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;

namespace Manager
{
    public partial class Employees : System.Web.UI.Page
    {
        System.Data.SqlClient.SqlParameter Id = new System.Data.SqlClient.SqlParameter("Id", SqlDbType.Int);
        System.Data.SqlClient.SqlParameter FirstName = new System.Data.SqlClient.SqlParameter("FirstName", SqlDbType.NVarChar, 1000);
        System.Data.SqlClient.SqlParameter LastName = new System.Data.SqlClient.SqlParameter("LastName", SqlDbType.NVarChar, 1000);
        System.Data.SqlClient.SqlParameter Email = new System.Data.SqlClient.SqlParameter("Email", SqlDbType.NVarChar, 1000);
        System.Data.SqlClient.SqlParameter PhoneNumber = new System.Data.SqlClient.SqlParameter("PhoneNumber", SqlDbType.NVarChar, 1000);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EmptyNew")
            {
                Id.Direction = ParameterDirection.Input;
                Id.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtID")).Text;
                FirstName.Direction = ParameterDirection.Input;
                FirstName.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtFirst")).Text;
                LastName.Direction = ParameterDirection.Input;
                LastName.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtLast")).Text;
                Email.Direction = ParameterDirection.Input;
                Email.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtEmail")).Text;
                PhoneNumber.Direction = ParameterDirection.Input;
                PhoneNumber.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtPhone")).Text;
                SqlDataSource1.Insert();
            }

            if (e.CommandName == "New")
            {
                Id.Direction = ParameterDirection.Input;
                Id.Value = ((TextBox)GridView1.FooterRow.FindControl("txtID")).Text;
                FirstName.Direction = ParameterDirection.Input;
                FirstName.Value = ((TextBox)GridView1.FooterRow.FindControl("txtFirst")).Text;
                LastName.Direction = ParameterDirection.Input;
                LastName.Value = ((TextBox)GridView1.FooterRow.FindControl("txtLast")).Text;
                Email.Direction = ParameterDirection.Input;
                Email.Value = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text;
                PhoneNumber.Direction = ParameterDirection.Input;
                PhoneNumber.Value = ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text;
                SqlDataSource1.Insert();
            }
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters.Clear();
            e.Command.Parameters.Add(Id);
            e.Command.Parameters.Add(FirstName);
            e.Command.Parameters.Add(LastName);
            e.Command.Parameters.Add(Email);
            e.Command.Parameters.Add(PhoneNumber);
        }
    }
}