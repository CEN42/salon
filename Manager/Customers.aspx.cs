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
    public partial class Customers : System.Web.UI.Page
    {
        System.Data.SqlClient.SqlParameter UserID =
            new System.Data.SqlClient.SqlParameter("userid", SqlDbType.Int);
        System.Data.SqlClient.SqlParameter LastName =
            new System.Data.SqlClient.SqlParameter("lastname", SqlDbType.VarChar, 50);
        System.Data.SqlClient.SqlParameter FirstName =
            new System.Data.SqlClient.SqlParameter("firstname", SqlDbType.VarChar, 50);
        System.Data.SqlClient.SqlParameter Email =
            new System.Data.SqlClient.SqlParameter("email", SqlDbType.VarChar, 50);
        System.Data.SqlClient.SqlParameter Rewards =
            new System.Data.SqlClient.SqlParameter("rewards", SqlDbType.Int);
        System.Data.SqlClient.SqlParameter PhoneNumber =
            new System.Data.SqlClient.SqlParameter("phonenumber", SqlDbType.BigInt);

        System.Data.SqlClient.SqlParameter LoginEmail =
            new System.Data.SqlClient.SqlParameter("email", SqlDbType.VarChar, 50);
        System.Data.SqlClient.SqlParameter Password =
            new System.Data.SqlClient.SqlParameter("password", SqlDbType.VarChar, 10);

        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void GridView1_RowCommand(object sender, GridViewCommandEventArgs e)
        {
            if (e.CommandName == "EmptyNew")
            {
                UserID.Direction = ParameterDirection.Input;
                UserID.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtID")).Text;
                LastName.Direction = ParameterDirection.Input;
                LastName.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtLast")).Text;
                FirstName.Direction = ParameterDirection.Input;
                FirstName.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtFirst")).Text;
                Email.Direction = ParameterDirection.Input;
                Email.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtEmail")).Text;
                Rewards.Direction = ParameterDirection.Input;
                Rewards.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtRewards")).Text;
                PhoneNumber.Direction = ParameterDirection.Input;
                PhoneNumber.Value = ((TextBox)GridView1.Controls[0].Controls[0].FindControl("txtPhone")).Text;
                SqlConnection conn = new SqlConnection(LoginTable.ConnectionString);
                string sql = "SELECT [email] FROM [Login.tbl] WHERE [email] = '" + Email.Value + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                    conn.Open();
                    string retVal = (string)cmd.ExecuteScalar();
                    if (retVal == null)
                    {
                        LoginEmail.Direction = ParameterDirection.Input;
                        LoginEmail.Value = Email.Value;
                        Password.Direction = ParameterDirection.Input;
                        Password.Value = "guest";
                        LoginTable.Insert();
                    }
                SqlDataSource1.Insert();
            }

            if (e.CommandName == "New")
            {
                UserID.Direction = ParameterDirection.Input;
                UserID.Value = ((TextBox)GridView1.FooterRow.FindControl("txtID")).Text;
                LastName.Direction = ParameterDirection.Input;
                LastName.Value = ((TextBox)GridView1.FooterRow.FindControl("txtLast")).Text;
                FirstName.Direction = ParameterDirection.Input;
                FirstName.Value = ((TextBox)GridView1.FooterRow.FindControl("txtFirst")).Text;
                Email.Direction = ParameterDirection.Input;
                Email.Value = ((TextBox)GridView1.FooterRow.FindControl("txtEmail")).Text;
                Rewards.Direction = ParameterDirection.Input;
                Rewards.Value = ((TextBox)GridView1.FooterRow.FindControl("txtRewards")).Text;
                PhoneNumber.Direction = ParameterDirection.Input;
                PhoneNumber.Value = ((TextBox)GridView1.FooterRow.FindControl("txtPhone")).Text;
                SqlConnection conn = new SqlConnection(LoginTable.ConnectionString);
                string sql = "SELECT [email] FROM [Login.tbl] WHERE [email] = '" + Email.Value + "'";
                SqlCommand cmd = new SqlCommand(sql, conn);
                conn.Open();
                string retVal = (string)cmd.ExecuteScalar();
                if (retVal == null)
                {
                    LoginEmail.Direction = ParameterDirection.Input;
                    LoginEmail.Value = Email.Value;
                    Password.Direction = ParameterDirection.Input;
                    Password.Value = "guest";
                    LoginTable.Insert();
                }
                SqlDataSource1.Insert();
            }
        }

        protected void SqlDataSource1_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters.Clear();
            e.Command.Parameters.Add(UserID);
            e.Command.Parameters.Add(LastName);
            e.Command.Parameters.Add(FirstName);
            e.Command.Parameters.Add(Email);
            e.Command.Parameters.Add(Rewards);
            e.Command.Parameters.Add(PhoneNumber);
        }

        protected void LoginTable_Inserting(object sender, SqlDataSourceCommandEventArgs e)
        {
            e.Command.Parameters.Clear();
            e.Command.Parameters.Add(LoginEmail);
            e.Command.Parameters.Add(Password);
        }
    }
}