using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Globalization;

namespace Manager
{
    public partial class newReservation : System.Web.UI.Page
    {
        DataTable dtCustomers = new DataTable();
        DataTable dtServices = new DataTable();
        DataTable dtStylists = new DataTable();
        DateTime Start;
        DateTime End;
     
        protected void Page_PreInit(object sender, EventArgs e)
        {
            pnlDropDownList.Width = 300;

            //Create a LinkDynamic Button to Add TextBoxes
            btnAddDdl.Click += new System.EventHandler(btnAddDdl_Click);

            //Recreate Controls
            RecreateControls("ddlDynamic", "DropDownList");

        }
        protected void Page_Load(object sender, EventArgs e)
        {
                if(!IsPostBack)
                {
                    Start = Convert.ToDateTime(Request.QueryString["start"]);
                    End = Convert.ToDateTime(Request.QueryString["end"]);
                    
                    rDate.Text = Start.ToString("yyyy-MM-dd");
                    sTime.Text = Start.ToString("hh:mm tt");
                    eTime.Text = End.ToString("hh:mm tt");

                    hdStart.Value = Start.ToString("s");
                    hdEnd.Value = End.ToString("s");
                    
                   btnAddDdl_Click(sender,e);
                    ddListStylistBind();
                }
            
        }

        protected void ddListStylistBind()
        {
            dtStylists = Manager.EZSnipsAccess.GetStylists();

            DropDownListStylist.DataSource = dtStylists;
            DropDownListStylist.DataTextField = "name";
            DropDownListStylist.DataValueField = "Id";
            DropDownListStylist.DataBind();
        }
        protected void btnAddDdl_Click(object sender, EventArgs e)
        {
            int cnt = FindOccurence("ddlDynamic");
            CreateDropDownList("ddlDynamic-" + Convert.ToString(cnt + 1));
        }

        private int FindOccurence(string substr)
        {
            string reqstr = Request.Form.ToString();
            return ((reqstr.Length - reqstr.Replace(substr, "").Length)
                              / substr.Length);
        }

        private void CreateDropDownList(string ID)
        {
            dtServices = Manager.EZSnipsAccess.GetServices();
            DropDownList ddl = new DropDownList();
            ddl.ID = ID;
            ddl.Items.Add(new ListItem("--Select--", ""));
            ddl.DataSource = dtServices;
            ddl.DataTextField = "servicetitle";
            ddl.DataValueField = "serviceid";
            ddl.AppendDataBoundItems = true;
            ddl.AutoPostBack = true;
            ddl.SelectedIndexChanged += new EventHandler(OnSelectedIndexChanged);
            ddl.DataBind();
            pnlDropDownList.Controls.Add(ddl);

            Literal lt = new Literal();
            lt.Text = "<br />";
            pnlDropDownList.Controls.Add(lt);
        }

        protected void OnSelectedIndexChanged(object sender, EventArgs e)
        {
            DropDownList ddl = (DropDownList)sender;
            string ID = ddl.ID;

            selectedService.Value = ddl.SelectedItem.Text;
        }

        private void RecreateControls(string ctrlPrefix, string ctrlType)
        {
            string[] ctrls = Request.Form.ToString().Split('&');
            int cnt = FindOccurence(ctrlPrefix);
            if (cnt > 0)
            {
                for (int k = 1; k <= cnt; k++)
                {
                    for (int i = 0; i < ctrls.Length; i++)
                    {
                        if (ctrls[i].Contains(ctrlPrefix + "-" + k.ToString())
                            && !ctrls[i].Contains("EVENTTARGET"))
                        {
                            string ctrlID = ctrls[i].Split('=')[0];

                            if (ctrlType == "DropDownList")
                            {
                                CreateDropDownList(ctrlID);
                            }
                            break;
                        }
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Write("<script>window.close();</" + "script>");
            Response.End();
        }

        protected void eTime_TextChanged(object sender, EventArgs e)
        {
            DateTime end = Convert.ToDateTime(rDate.Text + ' ' + eTime.Text);
            hdEnd.Value = end.ToString("s");
        }

        protected void sTime_TextChanged(object sender, EventArgs e)
        {
            DateTime start = Convert.ToDateTime(rDate.Text + ' ' + sTime.Text);
            hdStart.Value = start.ToString("s");
        }

        protected void rDate_TextChanged(object sender, EventArgs e)
        {
            DateTime start = Convert.ToDateTime(rDate.Text + ' ' + sTime.Text);
            DateTime end = Convert.ToDateTime(rDate.Text + ' ' + eTime.Text);
           hdStart.Value = start.ToString("s");
            hdEnd.Value = end.ToString("s");
        }

        protected void fName_TextChanged(object sender, EventArgs e)
        {
            hdCustomer.Value = fName.Text + ' ' + lName.Text;
        }

        protected void lName_TextChanged(object sender, EventArgs e)
        {
            hdCustomer.Value = fName.Text + ' ' + lName.Text;

        }

        protected void btnConfirm_Click(object sender, EventArgs e)
        {
            dtCustomers = Manager.EZSnipsAccess.GetCustomers();
            bool found = false;

            foreach(DataRow dr in dtCustomers.Rows)
            {
                if(hdCustomer.Value == dr["fullname"].ToString())
                {
                    found = true; 
                    CustomerID.Value = dr["userid"].ToString();
                    TempID.Value = "1";
                    break;
                }
            }

            if(found == false)
            {
                CustomerID.Value = "1";
                Manager.EZSnipsAccess.InsertTempCustomers(fName.Text, lName.Text, Phone_Number.Text);
                TempID.Value = Manager.EZSnipsAccess.GetTempID(fName.Text,lName.Text);
            }

            selectedStylist.Value = DropDownListStylist.SelectedItem.Text;
            Page.ClientScript.RegisterStartupScript(this.GetType(), "myScript","create()",true);
        }

    }
}