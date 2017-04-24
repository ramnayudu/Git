using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.Services;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

namespace IFocusMembersRegistrations
{
    public partial class Search : System.Web.UI.Page
    {
        string strconnection;
        protected void Page_Load(object sender, EventArgs e)
        {
            strconnection = ConfigurationManager.AppSettings["DBString"].ToString();
            if (Session["Role"] != null)
            {

            }
            else
            {
                Response.Redirect("Default.aspx");
            }
        }


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetNames(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["DBString"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("GetNamesList", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;

            cmd.Parameters.AddWithValue("@Name", prefixText);

            DataTable dt = new DataTable();
            Da.Fill(dt);
            List<string> Names = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                Names.Add(dt.Rows[i][0].ToString());
            }
            return Names;
        }
        public void GetMemberDetails()
        {
           SqlConnection con = new SqlConnection(strconnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetMembersDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            
            SqlDataAdapter  Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataSet  Ds = new DataSet();
            Da.Fill(Ds);
            grdMembers.DataSource = Ds;
            grdMembers.DataBind();
            con.Close();
            cmd.Dispose();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            GetMemberDetails();
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
        }
    }
}