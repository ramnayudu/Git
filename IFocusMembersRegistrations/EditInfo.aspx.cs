using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.IO;

namespace IFocusMembersRegistrations
{
    public partial class EditInfo : System.Web.UI.Page
    {
        string strconnection;
        int intid;
        protected void Page_Load(object sender, EventArgs e)
        {
            strconnection = ConfigurationManager.AppSettings["DBString"].ToString();
            if (Session["Role"] != null)
            {
                lblUser.Text = Session["AdminName"].ToString();
               // intid = Convert.ToInt32(Session["EditMemberid"].ToString());
            }
            else
            {
                Response.Redirect("Default.aspx");
            }
            if (!IsPostBack)
            {

                GetMemberInfobyID();
              
            }
        }
        public void GetMemberInfobyID()
        {
            
            SqlConnection con = new SqlConnection(strconnection);
            SqlCommand cmd = new SqlCommand("GetMembersCompleteInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if(MemberId.Value=="")
            {
                MemberId.Value = "0";
            }
            if (Convert.ToInt32(MemberId.Value) >= 1)
            {

                lnkPreview.Visible = true;
            }
            else
            {
                lnkPreview.Visible = false;
            }

            intid = Convert.ToInt32(MemberId.Value) + 1;
            cmd.Parameters.AddWithValue("@MemberId", intid);
            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            Da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Membername.Value = ds.Tables[0].Rows[0]["Name"].ToString();
                MemberId.Value = ds.Tables[0].Rows[0]["MemberId"].ToString();
                Surname.Value = ds.Tables[0].Rows[0]["Surname"].ToString();
                txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                string strGender = ds.Tables[0].Rows[0]["Gender"].ToString();
                if (strGender == "Female" || strGender == "F")
                {
                    FGender.Checked = true;

                }
                else
                {
                    MGender.Checked = true;

                }
                txtBloodGroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                ContactNo.Value = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                Email.Value = ds.Tables[0].Rows[0]["EmailID"].ToString();

                CurrentLocation.Value = ds.Tables[0].Rows[0]["CurrentLocation"].ToString();
                City.Value = ds.Tables[0].Rows[0]["City"].ToString();
                HomeTown.Value = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                District.Value = ds.Tables[0].Rows[0]["District"].ToString();
                State.Value = ds.Tables[0].Rows[0]["State"].ToString();
                Qualification.Value = ds.Tables[0].Rows[0]["DegreeQualification"].ToString();
                PGQualification.Value = ds.Tables[0].Rows[0]["PGQualification"].ToString();
                Specialization.Value = ds.Tables[0].Rows[0]["DegreeSpecialization"].ToString();
                PGSpecialization.Value = ds.Tables[0].Rows[0]["PGSpecialization"].ToString();
                txtIfocusBranch.Text = ds.Tables[0].Rows[0]["ifocusBranch"].ToString();
                ddlRoles.SelectedItem.Text = ds.Tables[0].Rows[0]["RoleinIfocus"].ToString();
                txtDoj.Text = ds.Tables[0].Rows[0]["DateofJoin"].ToString();
                ddlProfession.SelectedItem.Text = ds.Tables[0].Rows[0]["Profession"].ToString();
                ddlCluster.SelectedItem.Text = ds.Tables[0].Rows[0]["Cluster"].ToString();
                AlternateEmail.Value = ds.Tables[0].Rows[0]["AlternateEmail"].ToString();
                AlternatePhone.Value = ds.Tables[0].Rows[0]["AlternatePhoneNo"].ToString();
                txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                string strchk = ds.Tables[0].Rows[0]["Sapthaswa"].ToString();

                SelectCheckBoxList(strchk);

                if (ddlProfession.SelectedItem.Text == "Professional")
                {
                    CompanyName.Value = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    Skills.Value = ds.Tables[0].Rows[0]["Skills"].ToString();
                    txtCompanyAddress.Text = ds.Tables[0].Rows[0]["WorkingPlace"].ToString();
                    Designation.Value = ds.Tables[0].Rows[0]["Designation"].ToString();
                    p5.Visible = false;
                    p6.Visible = false;
                }
                else
                {
                    DegreeCollegeName.Value = ds.Tables[0].Rows[0]["DegreeCollegeName"].ToString();
                    PGCollegeName.Value = ds.Tables[0].Rows[0]["PGCollegeName"].ToString();
                    p1.Visible = false;
                    p2.Visible = false;
                    p3.Visible = false;
                    p4.Visible = false;

                }
                lblPhotoStatus.Text = ds.Tables[0].Rows[0]["PhotoStatus"].ToString();
                string strpath = "ProfilePhotos/" + intid + ".jpg";
                if (File.Exists(Server.MapPath(strpath)))
                {
                    imgprvw.Src = "ProfilePhotos/" + intid + ".jpg";

                }
                else
                {

                    imgprvw.Src = "img/No_Photo_Available.jpg";
                }
            }
        }
        public void UpdateMemberDetais()
        {

            if (MemberId.Value != "")
            {

                SqlConnection con = new SqlConnection(strconnection);
                con.Open();
                SqlCommand cmd = new SqlCommand("UpdateMemberDetails", con);
                cmd.CommandType = CommandType.StoredProcedure;

                //DateTime dt = Convert.ToDateTime(txtDoj.Text);
                //string strdate = dt.ToString();
                intid = Convert.ToInt32(MemberId.Value);
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
                if (lblPhotoStatus.Text == "Y" || filUpload.PostedFile.ContentLength != 0)
                {
                    strphotostatus = "Y";
                }
                else
                {
                    strphotostatus = "N";
                }


                cmd.Parameters.AddWithValue("@MemberId", intid);
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
                cmd.Parameters.AddWithValue("@DateofJoin", txtDoj.Text);

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
               
                cmd.Parameters.AddWithValue("@Sapthaswa", chkSaptaswa.SelectedItem.Value);

                cmd.ExecuteNonQuery();


                con.Close();
                cmd.Dispose();
                lblMsg.Visible = true;
                ClearControls();
                if ((filUpload.PostedFile != null) && (filUpload.PostedFile.ContentLength > 0))
                {
                    string path = Server.MapPath(@"~/ProfilePhotos/" + MemberId.Value + ".jpg");
                    string path1 = Server.MapPath(@"~/ProfilePhotos/" + MemberId.Value + ".jpeg");
                    FileInfo file = new FileInfo(path);
                    FileInfo file1 = new FileInfo(path1);
                    if (file.Exists || file1.Exists) //check file exsit or not  
                    {
                        file.Delete();
                        string fn = System.IO.Path.GetExtension(filUpload.PostedFile.FileName);
                        string SaveLocation = Server.MapPath("ProfilePhotos") + "\\" + MemberId.Value + fn;
                        FileInfo filenew = new FileInfo(SaveLocation);
                        if (filenew.Exists)
                        {

                            filUpload.PostedFile.SaveAs(SaveLocation);
                        }
                        ////else
                        ////{
                        //try
                        //    {
                        //        filUpload.PostedFile.SaveAs(SaveLocation);

                        //    }
                        //    catch (Exception ex)
                        //    {
                        //        Response.Write("Error: " + ex.Message);
                        //        //Note: Exception.Message returns a detailed message that describes the current exception. 
                        //        //For security reasons, we do not recommend that you return Exception.Message to end users in 
                        //        //production environments. It would be better to put a generic error message. 
                        //    }
                        //}
                    }
                    //  MemberId.Value = "";


                }
            }
        }
        private void SelectCheckBoxList(string valueToSelect)
        {
            ListItem listItem = this.chkSaptaswa.Items.FindByValue(valueToSelect);

            if (listItem != null) listItem.Selected = true;
        }
        public void ClearControls()
        {
            Membername.Value = "";
            Surname.Value = "";

            txtIfocusBranch.Text = "";
            CurrentLocation.Value = "";
            MGender.Value = "";
            ContactNo.Value = "";
            Email.Value = "";

            chkSaptaswa.ClearSelection();


            City.Value = "";

            District.Value = "";

            ddlRoles.SelectedItem.Text = "--Select--";

            txtDoj.Text = "";

            ddlProfession.SelectedItem.Text = "--Select--";
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
            ddlCluster.SelectedItem.Text = "--Select--";
            AlternateEmail.Value = "";
            AlternatePhone.Value = "";
            txtRemarks.Text = "";

        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Response.Redirect("Default.aspx");
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


        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            UpdateMemberDetais();
            ClearControls();
            SqlConnection con = new SqlConnection(strconnection);
            SqlCommand cmd = new SqlCommand("GetMembersCompleteInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
           int  intMemberId = Convert.ToInt32(MemberId.Value);
            cmd.Parameters.AddWithValue("@MemberId", intMemberId);
            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            Da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Membername.Value = ds.Tables[0].Rows[0]["Name"].ToString();
                MemberId.Value = ds.Tables[0].Rows[0]["MemberId"].ToString();
                Surname.Value = ds.Tables[0].Rows[0]["Surname"].ToString();
                txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                string strGender = ds.Tables[0].Rows[0]["Gender"].ToString();
                if (strGender == "Female" || strGender == "F")
                {
                    FGender.Checked = true;

                }
                else
                {
                    MGender.Checked = true;

                }
                txtBloodGroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                ContactNo.Value = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                Email.Value = ds.Tables[0].Rows[0]["EmailID"].ToString();

                CurrentLocation.Value = ds.Tables[0].Rows[0]["CurrentLocation"].ToString();
                City.Value = ds.Tables[0].Rows[0]["City"].ToString();
                HomeTown.Value = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                District.Value = ds.Tables[0].Rows[0]["District"].ToString();
                State.Value = ds.Tables[0].Rows[0]["State"].ToString();
                Qualification.Value = ds.Tables[0].Rows[0]["DegreeQualification"].ToString();
                PGQualification.Value = ds.Tables[0].Rows[0]["PGQualification"].ToString();
                Specialization.Value = ds.Tables[0].Rows[0]["DegreeSpecialization"].ToString();
                PGSpecialization.Value = ds.Tables[0].Rows[0]["PGSpecialization"].ToString();
                txtIfocusBranch.Text = ds.Tables[0].Rows[0]["ifocusBranch"].ToString();
                ddlRoles.SelectedItem.Text = ds.Tables[0].Rows[0]["RoleinIfocus"].ToString();
                txtDoj.Text = ds.Tables[0].Rows[0]["DateofJoin"].ToString();
                ddlProfession.SelectedItem.Text = ds.Tables[0].Rows[0]["Profession"].ToString();
                ddlCluster.SelectedItem.Text = ds.Tables[0].Rows[0]["Cluster"].ToString();
                AlternateEmail.Value = ds.Tables[0].Rows[0]["AlternateEmail"].ToString();
                AlternatePhone.Value = ds.Tables[0].Rows[0]["AlternatePhoneNo"].ToString();
                txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                string strchk = ds.Tables[0].Rows[0]["Sapthaswa"].ToString();

                SelectCheckBoxList(strchk);
                if (ddlProfession.SelectedItem.Text == "Professional")
                {
                    CompanyName.Value = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    Skills.Value = ds.Tables[0].Rows[0]["Skills"].ToString();
                    txtCompanyAddress.Text = ds.Tables[0].Rows[0]["WorkingPlace"].ToString();
                    Designation.Value = ds.Tables[0].Rows[0]["Designation"].ToString();
                    p5.Visible = false;
                    p6.Visible = false;
                }
                else
                {
                    DegreeCollegeName.Value = ds.Tables[0].Rows[0]["DegreeCollegeName"].ToString();
                    PGCollegeName.Value = ds.Tables[0].Rows[0]["PGCollegeName"].ToString();
                    p1.Visible = false;
                    p2.Visible = false;
                    p3.Visible = false;
                    p4.Visible = false;

                }
                lblPhotoStatus.Text = ds.Tables[0].Rows[0]["PhotoStatus"].ToString();
                string strpath = "ProfilePhotos/" + intid + ".jpg";
                if (File.Exists(Server.MapPath(strpath)))
                {
                    imgprvw.Src = "ProfilePhotos/" + intid + ".jpg";

                }
                else
                {

                    imgprvw.Src = "img/No_Photo_Available.jpg";
                }
            }
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void lnkPreview_Click(object sender, EventArgs e)
        {
            txtGoto.Text = "";
            SqlConnection con = new SqlConnection(strconnection);
            SqlCommand cmd = new SqlCommand("GetMembersCompleteInfo", con);
            cmd.CommandType = CommandType.StoredProcedure;
           int  intid = Convert.ToInt32(MemberId.Value) - 1;
            cmd.Parameters.AddWithValue("@MemberId", intid);
            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataSet ds = new DataSet();
            Da.Fill(ds);

            if (ds.Tables[0].Rows.Count > 0)
            {
                Membername.Value = ds.Tables[0].Rows[0]["Name"].ToString();
                MemberId.Value = ds.Tables[0].Rows[0]["MemberId"].ToString();
                Surname.Value = ds.Tables[0].Rows[0]["Surname"].ToString();
                txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                string strGender = ds.Tables[0].Rows[0]["Gender"].ToString();
                if (strGender == "Female" || strGender == "F")
                {
                    FGender.Checked = true;

                }
                else
                {
                    MGender.Checked = true;

                }
                txtBloodGroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                ContactNo.Value = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                Email.Value = ds.Tables[0].Rows[0]["EmailID"].ToString();

                CurrentLocation.Value = ds.Tables[0].Rows[0]["CurrentLocation"].ToString();
                City.Value = ds.Tables[0].Rows[0]["City"].ToString();
                HomeTown.Value = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                District.Value = ds.Tables[0].Rows[0]["District"].ToString();
                State.Value = ds.Tables[0].Rows[0]["State"].ToString();
                Qualification.Value = ds.Tables[0].Rows[0]["DegreeQualification"].ToString();
                PGQualification.Value = ds.Tables[0].Rows[0]["PGQualification"].ToString();
                Specialization.Value = ds.Tables[0].Rows[0]["DegreeSpecialization"].ToString();
                PGSpecialization.Value = ds.Tables[0].Rows[0]["PGSpecialization"].ToString();
                txtIfocusBranch.Text = ds.Tables[0].Rows[0]["ifocusBranch"].ToString();
                ddlRoles.SelectedItem.Text = ds.Tables[0].Rows[0]["RoleinIfocus"].ToString();
                txtDoj.Text = ds.Tables[0].Rows[0]["DateofJoin"].ToString();
                ddlProfession.SelectedItem.Text = ds.Tables[0].Rows[0]["Profession"].ToString();
                ddlCluster.SelectedItem.Text = ds.Tables[0].Rows[0]["Cluster"].ToString();
                if (ddlProfession.SelectedItem.Text == "Professional")
                {
                    CompanyName.Value = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                    Skills.Value = ds.Tables[0].Rows[0]["Skills"].ToString();
                    txtCompanyAddress.Text = ds.Tables[0].Rows[0]["WorkingPlace"].ToString();
                    Designation.Value = ds.Tables[0].Rows[0]["Designation"].ToString();
                    p5.Visible = false;
                    p6.Visible = false;
                }
                else
                {
                    DegreeCollegeName.Value = ds.Tables[0].Rows[0]["DegreeCollegeName"].ToString();
                    PGCollegeName.Value = ds.Tables[0].Rows[0]["PGCollegeName"].ToString();
                    p1.Visible = false;
                    p2.Visible = false;
                    p3.Visible = false;
                    p4.Visible = false;

                }
                lblPhotoStatus.Text = ds.Tables[0].Rows[0]["PhotoStatus"].ToString();
                string strpath = "ProfilePhotos/" + intid + ".jpg";
                if (File.Exists(Server.MapPath(strpath)))
                {
                    imgprvw.Src = "ProfilePhotos/" + intid + ".jpg";

                }
                else
                {

                    imgprvw.Src = "img/No_Photo_Available.jpg";
                }
            }
        }

        protected void lnkNext_Click(object sender, EventArgs e)
        {
            txtGoto.Text = "";
            GetMemberInfobyID();
        }

        protected void btnGetRecord_Click(object sender, EventArgs e)
        {
            if (txtGoto.Text != "")
            {
                ClearControls();
                SqlConnection con = new SqlConnection(strconnection);
                SqlCommand cmd = new SqlCommand("GetMembersCompleteInfo", con);
                cmd.CommandType = CommandType.StoredProcedure;
                intid = Convert.ToInt32(txtGoto.Text);
                cmd.Parameters.AddWithValue("@MemberId", intid);
                SqlDataAdapter Da = new SqlDataAdapter();
                Da.SelectCommand = cmd;
                DataSet ds = new DataSet();
                Da.Fill(ds);

                if (ds.Tables[0].Rows.Count > 0)
                {
                    Membername.Value = ds.Tables[0].Rows[0]["Name"].ToString();
                    MemberId.Value = ds.Tables[0].Rows[0]["MemberId"].ToString();
                    Surname.Value = ds.Tables[0].Rows[0]["Surname"].ToString();
                    txtDOB.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
                    string strGender = ds.Tables[0].Rows[0]["Gender"].ToString();
                    if (strGender == "Female" || strGender == "F")
                    {
                        FGender.Checked = true;

                    }
                    else
                    {
                        MGender.Checked = true;

                    }
                    txtBloodGroup.Text = ds.Tables[0].Rows[0]["BloodGroup"].ToString();
                    ContactNo.Value = ds.Tables[0].Rows[0]["ContactNo"].ToString();
                    Email.Value = ds.Tables[0].Rows[0]["EmailID"].ToString();

                    CurrentLocation.Value = ds.Tables[0].Rows[0]["CurrentLocation"].ToString();
                    City.Value = ds.Tables[0].Rows[0]["City"].ToString();
                    HomeTown.Value = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                    District.Value = ds.Tables[0].Rows[0]["District"].ToString();
                    State.Value = ds.Tables[0].Rows[0]["State"].ToString();
                    Qualification.Value = ds.Tables[0].Rows[0]["DegreeQualification"].ToString();
                    PGQualification.Value = ds.Tables[0].Rows[0]["PGQualification"].ToString();
                    Specialization.Value = ds.Tables[0].Rows[0]["DegreeSpecialization"].ToString();
                    PGSpecialization.Value = ds.Tables[0].Rows[0]["PGSpecialization"].ToString();
                    txtIfocusBranch.Text = ds.Tables[0].Rows[0]["ifocusBranch"].ToString();
                    ddlRoles.SelectedItem.Text = ds.Tables[0].Rows[0]["RoleinIfocus"].ToString();
                    txtDoj.Text = ds.Tables[0].Rows[0]["DateofJoin"].ToString();
                    ddlProfession.SelectedItem.Text = ds.Tables[0].Rows[0]["Profession"].ToString();
                    ddlCluster.SelectedItem.Text = ds.Tables[0].Rows[0]["Cluster"].ToString();
                    AlternateEmail.Value = ds.Tables[0].Rows[0]["AlternateEmail"].ToString();
                    AlternatePhone.Value = ds.Tables[0].Rows[0]["AlternatePhoneNo"].ToString();
                    txtRemarks.Text = ds.Tables[0].Rows[0]["Remarks"].ToString();
                    string strchk = ds.Tables[0].Rows[0]["Sapthaswa"].ToString();

                    SelectCheckBoxList(strchk);
                    if (ddlProfession.SelectedItem.Text == "Professional")
                    {
                        CompanyName.Value = ds.Tables[0].Rows[0]["CompanyName"].ToString();
                        Skills.Value = ds.Tables[0].Rows[0]["Skills"].ToString();
                        txtCompanyAddress.Text = ds.Tables[0].Rows[0]["WorkingPlace"].ToString();
                        Designation.Value = ds.Tables[0].Rows[0]["Designation"].ToString();
                        p5.Visible = false;
                        p6.Visible = false;
                    }
                    else
                    {
                        DegreeCollegeName.Value = ds.Tables[0].Rows[0]["DegreeCollegeName"].ToString();
                        PGCollegeName.Value = ds.Tables[0].Rows[0]["PGCollegeName"].ToString();
                        p1.Visible = false;
                        p2.Visible = false;
                        p3.Visible = false;
                        p4.Visible = false;

                    }
                    lblPhotoStatus.Text = ds.Tables[0].Rows[0]["PhotoStatus"].ToString();
                    string strpath = "ProfilePhotos/" + intid + ".jpg";
                    if (File.Exists(Server.MapPath(strpath)))
                    {
                        imgprvw.Src = "ProfilePhotos/" + intid + ".jpg";

                    }
                    else
                    {

                        imgprvw.Src = "img/No_Photo_Available.jpg";
                    }
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }
    }
}