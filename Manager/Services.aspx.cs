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
    public partial class Services : System.Web.UI.Page
    {
        System.Data.SqlClient.SqlParameter serviceid = new System.Data.SqlClient.SqlParameter("serviceid", SqlDbType.Int);
        System.Data.SqlClient.SqlParameter servicetitle = new System.Data.SqlClient.SqlParameter("servicetitle", SqlDbType.VarChar, 30);
        System.Data.SqlClient.SqlParameter servicedesc = new System.Data.SqlClient.SqlParameter("servicedesc", SqlDbType.VarChar, 1000);
        System.Data.SqlClient.SqlParameter amount = new System.Data.SqlClient.SqlParameter("amount", SqlDbType.Float);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EmptyNew")
            {
                serviceid.Direction = ParameterDirection.Input;
                serviceid.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtID")).Text;
                servicetitle.Direction = ParameterDirection.Input;
                servicetitle.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtTitle")).Text;
                servicedesc.Direction = ParameterDirection.Input;
                servicedesc.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtDescription")).Text;
                amount.Direction = ParameterDirection.Input;
                amount.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtAmount")).Text;
                SqlDataSource1.Insert();
            }

            if (e.CommandName == "New")
            {
                serviceid.Direction = ParameterDirection.Input;
                serviceid.Value = ((TextBox)GridView1.FooterRow.FindControl("txtID")).Text;
                servicetitle.Direction = ParameterDirection.Input;
                servicetitle.Value = ((TextBox)GridView1.FooterRow.FindControl("txtTitle")).Text;
                servicedesc.Direction = ParameterDirection.Input;
                servicedesc.Value = ((TextBox)GridView1.FooterRow.FindControl("txtDescription")).Text;
                amount.Direction = ParameterDirection.Input;
                amount.Value = ((TextBox)GridView1.FooterRow.FindControl("txtAmount")).Text;
                SqlDataSource1.Insert();
            }
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters.Clear();
            e.Command.Parameters.Add(serviceid);
            e.Command.Parameters.Add(servicetitle);
            e.Command.Parameters.Add(servicedesc);
            e.Command.Parameters.Add(amount);
        }
    }
}