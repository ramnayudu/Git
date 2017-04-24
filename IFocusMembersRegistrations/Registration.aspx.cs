using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.IO;

namespace IFocusMembersRegistrations
{
    public partial class Default : System.Web.UI.Page
    {
        string strconnection;
        int intid;
       
        protected void Page_Load(object sender, EventArgs e)
        {
            strconnection = ConfigurationManager.AppSettings["DBString"].ToString();
            if (Session["Role"] != null)    
            {
                string strrole = Session["Role"].ToString();
                lblUser.Text = Session["AdminName"].ToString();
                if (strrole == "Admin")
                {
                    divDownload.Visible = true;
                }
                else
                {
                    divDownload.Visible = false;
                }
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {
                //GetRoles();
                GetMaxMemberId();

                p1.Visible = false;
                p2.Visible = false;
                p3.Visible = false;
                p4.Visible = false;
                p5.Visible = false;
                p6.Visible = false;
                
            }
        }
      
        public void GetMaxMemberId()
        {
            SqlConnection con = new SqlConnection(strconnection);
            SqlCommand cmd = new SqlCommand("GetMemberID", con);
            cmd.CommandType = CommandType.StoredProcedure;
            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataSet Ds = new DataSet();
            Da.Fill(Ds);
            if (Ds.Tables[0].Rows.Count > 0)
            {
                MemberId.Value = Ds.Tables[0].Rows[0]["MemberId"].ToString();
            }

        }
        public void InsertMemberDetais()
        {
            
            if (MemberId.Value != "" && Membername.Value != "")
            {

                SqlConnection con = new SqlConnection(strconnection);
                con.Open();
                SqlCommand cmd = new SqlCommand("InesertMemberDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //DateTime dt = Convert.ToDateTime(txtDoj.Text);
                //string strdate = dt.ToString();
                intid =Convert.ToInt32(MemberId.Value);
                string strGender;
                if (MGender.Checked == true)
                {
                    strGender = "M";
                    //strGender = MGender.Value;
                }
                else
                {
                    strGender = "F";
                }

                string strcompanyname = ""; string strdesignation = ""; string strskills = ""; string strLocation = "";


                if (ddlProfession.SelectedItem.Text == "Professional")
                {

                    strcompanyname = CompanyName.Value;
                    strdesignation = Designation.Value;
                    strskills = Skills.Value;
                    strLocation = txtCompanyAddress.Text;

                }
                else
                {

                    CompanyName.Value = "NULL";
                    Designation.Value = "NULL";
                    Skills.Value = "NULL";
                    txtCompanyAddress.Text = "NULL";

                }
                string strphotostatus = "";
                if (filUpload.PostedFile.ContentLength !=0)
                {
                    strphotostatus = "Y";
                }
                else
                {
                    strphotostatus = "N";
                }



                cmd.Parameters.AddWithValue("@MemberId", Convert.ToInt32(MemberId.Value));
                cmd.Parameters.AddWithValue("@Name", Membername.Value);
                cmd.Parameters.AddWithValue("@Surname", Surname.Value);
                cmd.Parameters.AddWithValue("@Gender", strGender);
                cmd.Parameters.AddWithValue("@DOB", txtDOB.Text);
                cmd.Parameters.AddWithValue("@BloodGroup", txtBloodGroup.Text);
                
                cmd.Parameters.AddWithValue("@ContactNo", ContactNo.Value);
                cmd.Parameters.AddWithValue("@EmailID", Email.Value);
                cmd.Parameters.AddWithValue("@DegreeQualification", Qualification.Value);

                cmd.Parameters.AddWithValue("@DegreeSpecialization", Specialization.Value);

                cmd.Parameters.AddWithValue("@PGQualification", PGQualification.Value);

                cmd.Parameters.AddWithValue("@PGSpecialization", PGSpecialization.Value);

               
                cmd.Parameters.AddWithValue("@CurrentLocation", CurrentLocation.Value);
                
                cmd.Parameters.AddWithValue("@City", City.Value);
                cmd.Parameters.AddWithValue("@HomeTown", HomeTown.Value);
                cmd.Parameters.AddWithValue("@District", District.Value);

                cmd.Parameters.AddWithValue("@State", State.Value);
                cmd.Parameters.AddWithValue("@ifocusBranch", txtIfocusBranch.Text);
                cmd.Parameters.AddWithValue("@RoleinIfocus", ddlRoles.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@DateofJoin",txtDoj.Text);

                cmd.Parameters.AddWithValue("@Profession", ddlProfession.SelectedItem.Text);

                cmd.Parameters.AddWithValue("@Cluster", ddlCluster.SelectedItem.Text);
                cmd.Parameters.AddWithValue("@DegreeCollegeName", DegreeCollegeName.Value);
                cmd.Parameters.AddWithValue("@PGCollegeName", PGCollegeName.Value);
                cmd.Parameters.AddWithValue("@CompanyName", strcompanyname);
                cmd.Parameters.AddWithValue("@Designation", strdesignation);
                cmd.Parameters.AddWithValue("@Skills", strskills);
                cmd.Parameters.AddWithValue("@WorkingPlace", strLocation);
                cmd.Parameters.AddWithValue("@PhotoStatus", strphotostatus);
                cmd.Parameters.AddWithValue("@AlternatePhoneNo", AlternatePhone.Value);
                cmd.Parameters.AddWithValue("@AlternateEmail", AlternateEmail.Value);
                cmd.Parameters.AddWithValue("@Remarks", txtRemarks.Text);
                cmd.Parameters.AddWithValue("@Sapthaswa",chkSaptaswa.SelectedItem.Value);


                cmd.ExecuteNonQuery();


                con.Close();
                cmd.Dispose();
                lblMsg.Visible = true;
                ClearControls();
                if ((filUpload.PostedFile != null) && (filUpload.PostedFile.ContentLength > 0))
                {
                    string fn = System.IO.Path.GetExtension(filUpload.PostedFile.FileName);
                    string SaveLocation = Server.MapPath("ProfilePhotos") + "\\" + MemberId.Value + fn;
                    try
                    {
                        filUpload.PostedFile.SaveAs(SaveLocation);

                    }
                    catch (Exception ex)
                    {
                        Response.Write("Error: " + ex.Message);
                        //Note: Exception.Message returns a detailed message that describes the current exception. 
                        //For security reasons, we do not recommend that you return Exception.Message to end users in 
                        //production environments. It would be better to put a generic error message. 
                    }
                }
                MemberId.Value = "";
                GetMaxMemberId();
               
            }
        }
        //protected void ValidateFileSize(object sender, ServerValidateEventArgs e)
        //{
        //    System.Drawing.Image img = System.Drawing.Image.FromStream(filUpload.PostedFile.InputStream);
        //    int height = img.Height;
        //    int width = img.Width;
        //    decimal size = Math.Round(((decimal)filUpload.PostedFile.ContentLength / (decimal)1024), 2);
        //    if (size > 100)
        //    {
        //        CustomValidator1.ErrorMessage = "File size must not exceed 2 KB.";
        //        e.IsValid = false;
        //    }
        //    //if (height > 100 || width > 100)
        //    //{
        //    //    CustomValidator1.ErrorMessage = "Height and Width must not exceed 100px.";
        //    //    e.IsValid = false;
        //    //}
        //}
        public void ClearControls()
        {
            Membername.Value = "";
            Surname.Value = "";
            

            MGender.Value = "";
            ContactNo.Value = "";
            Email.Value = "";


            City.Value = "";

            District.Value = "";

            ddlRoles.SelectedIndex = 0;

            txtDoj.Text = "";

            ddlProfession.SelectedIndex = 0;
            txtBloodGroup.Text = "";
            txtDOB.Text = "";
            State.Value = "";
            DegreeCollegeName.Value = "";
            PGCollegeName.Value = "";

            Qualification.Value = "";
            Specialization.Value = "";
            PGSpecialization.Value = "";
            PGQualification.Value = "";
            HomeTown.Value = "";
            CompanyName.Value = "";
            Designation.Value = "";
            Skills.Value = "";
            txtCompanyAddress.Text = "";
            ddlCluster.SelectedIndex = 0;
            txtIfocusBranch.Text = "";
            CurrentLocation.Value = "";
            AlternateEmail.Value = "";
            AlternatePhone.Value = "";
            txtRemarks.Text = "";
            chkSaptaswa.ClearSelection();
                

        }

        protected void btnsubmit_Click(object sender, EventArgs e)
        {
            
                InsertMemberDetais();
                    
        }

        protected void ddlProfession_SelectedIndexChanged(object sender, EventArgs e)
        {
            if (ddlProfession.SelectedItem.Text == "Student")
            {

                p1.Visible = false;
                p2.Visible = false;
                p3.Visible = false;
                p4.Visible = false;
                p5.Visible = true;
                p6.Visible = true;
            }
            else
            {

                p1.Visible = true;
                p2.Visible = true;
                p3.Visible = true;
                p4.Visible = true;
                p5.Visible = false;
                p6.Visible = false;
            }
            lblMsg.Visible = false;
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

       

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void btnExport_Click(object sender, EventArgs e)
        {
              Response.ClearContent();
            Response.Buffer = true;
            Response.AddHeader("content-disposition", string.Format("attachment; filename={0}", "IfocusMembersData.xls"));
            Response.ContentType = "application/ms-excel";
            DataTable dt = GetDatafromDatabase();
            string str = string.Empty;
            foreach (DataColumn dtcol in dt.Columns)
            {
                Response.Write(str + dtcol.ColumnName);
                str = "\t";
            }
            Response.Write("\n");
            foreach (DataRow dr in dt.Rows)
            {
                str = "";
                for (int j = 0; j < dt.Columns.Count; j++)
                {
                    Response.Write(str + Convert.ToString(dr[j]));
                    str = "\t";
                }
                Response.Write("\n");
            }
            Response.End();
        }
        protected DataTable GetDatafromDatabase()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strconnection);
                con.Open();
                SqlCommand cmd = new SqlCommand("SELECT * FROM MembersRegistration", con);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(dt);
                con.Close();
            
            return dt;
        }

        }
    }


