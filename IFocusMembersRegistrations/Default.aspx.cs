using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace MastersDataManagement
{
    public partial class Login : System.Web.UI.Page
    {
        string strconnection;
        SqlConnection con;
        SqlCommand cmd;
        SqlDataAdapter Da;
        DataSet Ds;
        protected void Page_Load(object sender, EventArgs e)
        {
            strconnection = ConfigurationManager.AppSettings["DBString"].ToString();
            //if (!IsPostBack)
            //{
               
            //}
        }

      
        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            try
            {
                if (UserName.Value != "" && Password.Value != "")
                {
                    con = new SqlConnection(strconnection);
                    con.Open();
                    cmd = new SqlCommand("GetAdminLoginDetails", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.AddWithValue("@Name", UserName.Value);
                    cmd.Parameters.AddWithValue("@Password", Password.Value);

                    Da = new SqlDataAdapter();
                    Da.SelectCommand = cmd;
                    Ds = new DataSet();
                    Da.Fill(Ds);

                    con.Close();
                    cmd.Dispose();
                    if (Ds.Tables[0].Rows.Count > 0)
                    {
                        Session["AdminID"] = Ds.Tables[0].Rows[0]["UserID"].ToString();

                        Session["AdminName"] = Ds.Tables[0].Rows[0]["UserName"].ToString();

                        Session["Role"] = Ds.Tables[0].Rows[0]["Roles"].ToString();
                        string strRole = Session["Role"].ToString();
                        if (strRole == "Admin")
                        {
                            Response.Redirect("Search.aspx");
                        }
                        else
                        {
                            Response.Redirect("Registration.aspx");
                        }
                      
                    }
                    else
                    {
                        lblMsg.Text = "Invalid Username or Password";

                    }


                }

            }
            catch (Exception ex)
            {

                lblMsg.Text = ex.Message;
            }
        }
    }
}