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
    public partial class ViewDetails : System.Web.UI.Page
    {
        string strconnection;
        int intid;
        protected void Page_Load(object sender, EventArgs e)
        {
            strconnection = ConfigurationManager.AppSettings["DBString"].ToString();
            if (Session["Role"] != null && Session["EditMemberid"] != null)
            {
                lblUser.Text = Session["AdminName"].ToString();
                intid = Convert.ToInt32(Session["EditMemberid"].ToString());
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
                if (strGender == "Female" || strGender=="F" )
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
                
                CurrentLocation.Value= ds.Tables[0].Rows[0]["CurrentLocation"].ToString();
                City.Value = ds.Tables[0].Rows[0]["City"].ToString();
                HomeTown.Value = ds.Tables[0].Rows[0]["HomeTown"].ToString();
                District.Value = ds.Tables[0].Rows[0]["District"].ToString();
                State.Value = ds.Tables[0].Rows[0]["State"].ToString();
                Qualification.Value = ds.Tables[0].Rows[0]["DegreeQualification"].ToString();
                PGQualification.Value = ds.Tables[0].Rows[0]["PGQualification"].ToString();
                Specialization.Value = ds.Tables[0].Rows[0]["DegreeSpecialization"].ToString();
                PGSpecialization.Value = ds.Tables[0].Rows[0]["PGSpecialization"].ToString();
                txtIfocusBranch.Text= ds.Tables[0].Rows[0]["ifocusBranch"].ToString();
               ddlRoles.SelectedValue = ds.Tables[0].Rows[0]["RoleinIfocus"].ToString();
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
                string strpath = "ProfilePhotos/" + intid + ".jpg";
                if (File.Exists(Server.MapPath(strpath)))
                {
                    imgphoto.ImageUrl = "ProfilePhotos/" + intid + ".jpg";

                }
                else
                {

                    imgphoto.ImageUrl = "img/No_Photo_Available.jpg";
                }
            }
        }
        private void SelectCheckBoxList(string valueToSelect)
        {
            ListItem listItem = this.chkSaptaswa.Items.FindByValue(valueToSelect);

            if (listItem != null) listItem.Selected = true;
        }
        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Search.aspx");
        }

        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }

        protected void lnkEdit_Click(object sender, EventArgs e)
        {
            Session["EditMemberid"] = intid;
            Response.Redirect("EditProfile.aspx");

        }
    }
}