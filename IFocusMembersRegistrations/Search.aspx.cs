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
using System.IO;

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
                lblUser.Text = Session["AdminName"].ToString();
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


        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetUniqueIds(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["DBString"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("GetUniqueIds", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;

            cmd.Parameters.AddWithValue("@UniqueId", prefixText);

            DataTable dt = new DataTable();
            Da.Fill(dt);
            List<string> UniqueIds = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UniqueIds.Add(dt.Rows[i][0].ToString());
            }
            return UniqueIds;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetPhoneNumbers(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["DBString"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("GetPhoneNumbers", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;

            cmd.Parameters.AddWithValue("@PhoneNumber", prefixText);

            DataTable dt = new DataTable();
            Da.Fill(dt);
            List<string> UniqueIds = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UniqueIds.Add(dt.Rows[i][0].ToString());
            }
            return UniqueIds;
        }

        [System.Web.Script.Services.ScriptMethod()]
        [System.Web.Services.WebMethod]
        public static List<string> GetSurnames(string prefixText)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["DBString"].ToString());

            con.Open();
            SqlCommand cmd = new SqlCommand("GetSurnames", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;

            cmd.Parameters.AddWithValue("@Surname", prefixText);

            DataTable dt = new DataTable();
            Da.Fill(dt);
            List<string> UniqueIds = new List<string>();
            for (int i = 0; i < dt.Rows.Count; i++)
            {
                UniqueIds.Add(dt.Rows[i][0].ToString());
            }
            return UniqueIds;
        }
        //private int GetTotalCount()
        //{
        //    SqlConnection con = new SqlConnection(strconnection);
        //    SqlCommand cmd = new SqlCommand("GetMembersCount", con);
        //    cmd.CommandTimeout = Convert.ToInt32(lblConnectiontimeout.Text); ;
        //    cmd.CommandType = CommandType.StoredProcedure;
        //    string strmemberId = "";
        //    if (txtMemberId.Text == "")
        //    {

        //        txtMemberId.Text = "";
        //        strmemberId = "0";


        //    }
        //    else
        //    {
        //        strmemberId = txtMemberId.Text;
        //    }
        //    if (txtname.Text == "")
        //    {
        //        txtname.Text = "";

        //    }
        //    if (txtPhone.Text == "")
        //    {
        //        txtPhone.Text = "";
        //    }

        //    if (ddlCluster.SelectedItem.Text == "--Select--")
        //    {
        //        strcluster = "";
        //    }
        //    else
        //    {
        //        strcluster = ddlCluster.SelectedItem.Text;
        //    }
        //    if (txtCurrentCity.Text == "")
        //    {
        //        txtCurrentCity.Text = "";
        //    }
        //    if (ddlRoles.SelectedItem.Text == "--Select--")
        //    {
        //        strrole = "";
        //    }
        //    else
        //    {
        //        strrole = ddlRoles.SelectedItem.Text;
        //    }
        //    if (txtHomeTown.Text == "")
        //    {
        //        txtHomeTown.Text = "";
        //    }
        //    if (txtQualification.Text == "")
        //    {
        //        txtQualification.Text = "";
        //    }
        //    if (ddlProfession.SelectedItem.Text == "--Select--")
        //    {
        //        strprofession = "";
        //    }
        //    else
        //    {
        //        strprofession = ddlProfession.SelectedItem.Text;
        //    }
        //    if (txtifocusBranch.Text == "")
        //    {
        //        txtifocusBranch.Text = "";
        //    }
        //    //if (txtBloodGroup.Text == "")
        //    //{
        //    //    txtBloodGroup.Text = "";
        //    //}
        //    if (ddlBloodGroup.SelectedItem.Text == "--Select--")
        //    {
        //        strbloodgroup = "";
        //    }
        //    else
        //    {

        //        strbloodgroup = ddlBloodGroup.SelectedItem.Text;
        //    }
        //    if (txtCurrentLocation.Text == "")
        //    {
        //        txtCurrentLocation.Text = "";
        //    }
        //    //if(txtGender.Text=="")
        //    //{
        //    //    txtGender.Text = "";
        //    //}
        //    if (ddlGender.SelectedItem.Text == "--Select--")
        //    {
        //        strgender = "";
        //    }
        //    else if (ddlGender.SelectedItem.Text == "Male")
        //    {
        //        strgender = "M";
        //        // ddlGender.SelectedItem.Text = "M";
        //    }
        //    else
        //    {
        //        strgender = "F";
        //        //ddlGender.SelectedItem.Text = "F";
        //    }

        //    if (ddlYear.SelectedItem.Text == "--Select--")
        //    {
        //        strYear = "";
        //    }
        //    else
        //    {
        //        strYear = ddlYear.SelectedItem.Text;
        //    }
        //    cmd.Parameters.AddWithValue("@MemberId", Convert.ToInt32(strmemberId));
        //    cmd.Parameters.AddWithValue("@Name", txtname.Text);
        //    cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
        //    cmd.Parameters.AddWithValue("@Cluster", strcluster);
        //    cmd.Parameters.AddWithValue("@CurrentCity", txtCurrentCity.Text);
        //    cmd.Parameters.AddWithValue("@Roleinifocus", strrole);
        //    cmd.Parameters.AddWithValue("@HomeTown", txtHomeTown.Text);
        //    cmd.Parameters.AddWithValue("@DegreeQualification", txtQualification.Text);
        //    cmd.Parameters.AddWithValue("@Profession", strprofession);
        //    cmd.Parameters.AddWithValue("@BloodGroup", strbloodgroup);
        //    cmd.Parameters.AddWithValue("@ifocusBranch", txtifocusBranch.Text);
        //    cmd.Parameters.AddWithValue("@CurrentLocation", txtCurrentLocation.Text);
        //    cmd.Parameters.AddWithValue("@Gender", strgender);
        //    cmd.Parameters.AddWithValue("@Year", strYear);
        //    //cmd.Parameters.AddWithValue("@PageIndex", strYear);
        //    //cmd.Parameters.AddWithValue("@PageSize", strYear);

        //    DataTable   dt = new DataTable();
        //    SqlDataAdapter Da = new SqlDataAdapter();
        //    Da.SelectCommand = cmd;
        //    Da.Fill(dt);

        //    return Convert.ToInt32(dt.Rows[0][0].ToString());

        //}



        string strrole, strcluster, strprofession,strgender,strbloodgroup,strYear = "";
        public void GetMemberDetails(int currentPage)
        {
           
            SqlConnection con = new SqlConnection(strconnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetMembersInfo", con);
           cmd.CommandTimeout = Convert.ToInt32(lblConnectiontimeout.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            string strmemberId="";
           // int currentPage = Convert.ToInt32(lblCurrentPageId.Text);
            int pageSize = 30;
            int _TotalRowCount = 0;
            int startRowNumber = ((currentPage - 1) * pageSize) + 1;
            if (txtMemberId.Text == "")
            {

                txtMemberId.Text = "";
                strmemberId = "0";


            }
            else
            {
                strmemberId = txtMemberId.Text;
            }
            if (txtname.Text == "")
            {
                txtname.Text = "";

            }
            if (txtPhone.Text == "")
            {
                txtPhone.Text = "";
            }

            if (ddlCluster.SelectedItem.Text == "--Select--")
            {
                strcluster = "";
            }
            else
            {
                strcluster = ddlCluster.SelectedItem.Text;
            }
            if (txtCurrentCity.Text == "")
            {
                txtCurrentCity.Text = "";
            }
            if (ddlRoles.SelectedItem.Text == "--Select--")
            {
                strrole = "";
            }
            else
            {
                strrole = ddlRoles.SelectedItem.Text;
            }
            if (txtHomeTown.Text == "")
            {
                txtHomeTown.Text = "";
            }
            if (txtQualification.Text == "")
            {
                txtQualification.Text = "";
            }
            if (ddlProfession.SelectedItem.Text == "--Select--")
            {
                strprofession = "";
            }
            else
            {
                strprofession = ddlProfession.SelectedItem.Text;
            }
            if (txtifocusBranch.Text == "")
            {
                txtifocusBranch.Text = "";
            }
            //if (txtBloodGroup.Text == "")
            //{
            //    txtBloodGroup.Text = "";
            //}
            if (ddlBloodGroup.SelectedItem.Text == "--Select--")
            {
                strbloodgroup= "";
            }
            else
            {

                strbloodgroup = ddlBloodGroup.SelectedItem.Text;
            }
            if (txtCurrentLocation.Text == "")
            {
                txtCurrentLocation.Text = "";
            }
            //if(txtGender.Text=="")
            //{
            //    txtGender.Text = "";
            //}
            if (ddlGender.SelectedItem.Text == "--Select--")
            {
               strgender = "";
            }
            else if (ddlGender.SelectedItem.Text == "Male")
            {
                strgender = "M";
               // ddlGender.SelectedItem.Text = "M";
            }
            else
            {
                strgender = "F";
                //ddlGender.SelectedItem.Text = "F";
            }

            if (ddlYear.SelectedItem.Text == "--Select--")
            {
               strYear = "";
            }
            else
            {
                strYear = ddlYear.SelectedItem.Text;
            }
            string strSapthaswa;
            if (ddlSapthaswa.SelectedItem.Text == "--Select--")
            {
                strSapthaswa = "";
            }
            else
            {
                strSapthaswa = ddlSapthaswa.SelectedItem.Value;
            }
            cmd.Parameters.AddWithValue("@MemberId",Convert.ToInt32(strmemberId));
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Cluster", strcluster);
            cmd.Parameters.AddWithValue("@CurrentCity", txtCurrentCity.Text);
            cmd.Parameters.AddWithValue("@Roleinifocus", strrole);
            cmd.Parameters.AddWithValue("@HomeTown", txtHomeTown.Text);
            cmd.Parameters.AddWithValue("@DegreeQualification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@Profession", strprofession);
            cmd.Parameters.AddWithValue("@BloodGroup", strbloodgroup);
            cmd.Parameters.AddWithValue("@ifocusBranch", txtifocusBranch.Text);
            cmd.Parameters.AddWithValue("@CurrentLocation", txtCurrentLocation.Text);
            cmd.Parameters.AddWithValue("@Gender",strgender);
            cmd.Parameters.AddWithValue("@Year", strYear);
            cmd.Parameters.AddWithValue("@Sapthaswa", strSapthaswa);
            cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            cmd.Parameters.AddWithValue("@PageSize", pageSize);
            SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            parTotalCount.Direction = ParameterDirection.Output;
            cmd.Parameters.Add(parTotalCount);

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Da.Fill(Dt);
            _TotalRowCount = Convert.ToInt32(parTotalCount.Value);

            if (Dt.Rows.Count > 0)
            {

                grdMembers.DataSource = Dt;
                grdMembers.DataBind();
                ViewState["grdview"] = Dt;// storing data by search fields in viewstate  
                generatePager(_TotalRowCount, pageSize, currentPage);
                btnExport.Visible =Convert.ToBoolean(lblhiddenExportbtn.Text);
                dlPager.Visible = true;
            }
            else
            {
                grdMembers.DataSource = null;
                grdMembers.DataBind();
                Label lblEmptyMessage = grdMembers.Controls[0].Controls[0].FindControl("lblEmptyMessage") as Label;
                lblEmptyMessage.Text = "No Records Found";
                btnExport.Visible = false;
                dlPager.Visible = false;
            }
            //System.Threading.Thread.Sleep(2000);
            con.Close();
            cmd.Dispose();
        }
        protected void ShowImage(object sender, EventArgs e)
        {
            LinkButton lbtnPhoto = (sender as LinkButton);
            string strpath = "ProfilePhotos/" + lbtnPhoto.Text + ".jpg";
            string strpath1 = "ProfilePhotos/" + lbtnPhoto.Text + ".jpeg";
            if (File.Exists(Server.MapPath(strpath)))
            {
                imgphoto.ImageUrl = strpath;

            }
            else if (File.Exists(Server.MapPath(strpath1)))
                { imgphoto.ImageUrl = strpath1; }
            else
            {

                imgphoto.ImageUrl = "img/No_Photo_Available.jpg";
            }

            imgphoto.Visible = true;
          
        }
        public void generatePager(int totalRowCount, int pageSize, int currentPage)
        {
            int totalLinkInPage = 5;
            int totalPageCount = (int)Math.Ceiling((decimal)totalRowCount / pageSize);

            int startPageLink = Math.Max(currentPage - (int)Math.Floor((decimal)totalLinkInPage / 2), 1);
            int lastPageLink = Math.Min(startPageLink + totalLinkInPage - 1, totalPageCount);

            if ((startPageLink + totalLinkInPage - 1) > totalPageCount)
            {
                lastPageLink = Math.Min(currentPage + (int)Math.Floor((decimal)totalLinkInPage / 2), totalPageCount);
                startPageLink = Math.Max(lastPageLink - totalLinkInPage + 1, 1);
            }

            List<ListItem> pageLinkContainer = new List<ListItem>();

            if (startPageLink != 1)
                pageLinkContainer.Add(new ListItem("First", "1", currentPage != 1));
            for (int i = startPageLink; i <= lastPageLink; i++)
            {
                pageLinkContainer.Add(new ListItem(i.ToString(), i.ToString(), currentPage != i));
            }
            if (lastPageLink != totalPageCount)
                pageLinkContainer.Add(new ListItem("Last", totalPageCount.ToString(), currentPage != totalPageCount));

            dlPager.DataSource = pageLinkContainer;
            dlPager.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            lblMsg.Text = "";
            //int intcount = GetTotalCount();
            // grdMembers.Rows.Count = intcount;
            int intid = 1;
            GetMemberDetails(intid);
           // GetMemberDetails();
            grdMembers.Visible = true;
        }

        protected void lnkBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        protected void lnkLogout_Click(object sender, EventArgs e)
        {
            Session.Abandon();
            Response.Redirect("Default.aspx");
        }
       
        

        protected void lnkEdit_Click(object sender, EventArgs e)
        {

            LinkButton lnkbtn = sender as LinkButton;
            //getting particular row linkbutton
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            //getting userid of particular row
            int userid = Convert.ToInt32(grdMembers.DataKeys[gvrow.RowIndex].Value.ToString());
            Session["EditMemberid"] = userid;
            Response.Redirect("EditProfile.aspx");
        }



        protected void grdMembers_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                DataRowView row = (DataRowView)e.Row.DataItem;

                //Label lblMemberid = (Label)e.Row.FindControl("lblMemberid");
                //lblMemberid.Attributes["Memberid"] = row["Memberid"].ToString();

                //(e.Row.Cells[0].FindControl("imgphoto") as Image).ImageUrl = "~/ProfilePhotos/" + lblMemberid.Text + ".jpg";

                //getting username from particular row
                string strMember = Convert.ToString(DataBinder.Eval(e.Row.DataItem, "Name"));
                //identifying the control in gridview
                LinkButton lnkbtnresult = (LinkButton)e.Row.FindControl("lnkdelete");
                //raising javascript confirmationbox whenver user clicks on link button
                lnkbtnresult.Attributes.Add("onclick", "javascript:return ConfirmationBox('" + strMember + "')");

            }
        }


        protected void lnkViewDetails_Click(object sender, EventArgs e)
        {

            LinkButton lnkbtn = sender as LinkButton;
            //getting particular row linkbutton
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            //getting userid of particular row
            int userid = Convert.ToInt32(grdMembers.DataKeys[gvrow.RowIndex].Value.ToString());
            Session["EditMemberid"] = userid;
            Response.Redirect("ViewDetails.aspx");

        }

        protected void lnkdelete_Click(object sender, EventArgs e)
        {

            LinkButton lnkbtn = sender as LinkButton;
            //getting particular row linkbutton
            GridViewRow gvrow = lnkbtn.NamingContainer as GridViewRow;
            //getting userid of particular row
            int userid = Convert.ToInt32(grdMembers.DataKeys[gvrow.RowIndex].Value.ToString());
            string strMember = gvrow.Cells[1].Text;
            int result;
            SqlConnection con = new SqlConnection(strconnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("DeleteMembersinfobyId", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberId", userid);

            result = cmd.ExecuteNonQuery();
            con.Close();
            cmd.Dispose();
            //string fn = System.IO.Path.GetExtension(filUpload.PostedFile.FileName);
            //string SaveLocation = Server.MapPath("ProfilePhotos") + "\\" + MemberId.Value + fn;
            //FileInfo file = new FileInfo(SaveLocation);
            //if (file.Exists)
            //{
            //    file.Delete();

            //}
            int intid = 1;
            GetMemberDetails(intid);
            //if (result == 1)
            //{

            //    //Displaying alert message after successfully deletion of user
            //    ScriptManager.RegisterStartupScript(this, this.GetType(), "alertmessage", "javascript:alert('" + strMember + " details deleted successfully')", true);
            //}

        }

        protected void btnReset_Click(object sender, EventArgs e)
        {
            txtCurrentCity.Text = "";
            //txtDateofJoinTo.Text = "";
            //txtDateofJoinfrom.Text = "";
            txtHomeTown.Text = "";
            txtname.Text = "";
            txtPhone.Text = "";
            txtQualification.Text = "";
            ddlCluster.SelectedIndex = 0;
            ddlProfession.SelectedIndex = 0;
            ddlRoles.SelectedIndex = 0;
            //txtBloodGroup.Text = "";
            ddlBloodGroup.SelectedIndex=0;
            ddlYear.SelectedIndex = 0;
            ddlGender.SelectedIndex = 0;
            txtCurrentLocation.Text = "";
            txtifocusBranch.Text = "";
            //txtGender.Text = "";
            ddlGender.SelectedIndex = 0;
            txtMemberId.Text = "";
            grdMembers.Visible = false;
            ViewState["grdview"] = null;
            btnExport.Visible = false;
            dlPager.Visible = false;
            ddlSapthaswa.SelectedIndex = 0;
            imgphoto.Visible = false;
        }

        protected void dlPager_ItemCommand(object source, DataListCommandEventArgs e)
        {
            if (e.CommandName == "PageNo")
            {
                //int intCurrentpageId = Convert.ToInt32(e.CommandArgument);
                //lblCurrentPageId.Text = intCurrentpageId.ToString();
                GetMemberDetails(Convert.ToInt32(e.CommandArgument));
                
            }
        }

        protected void btnCorrections_Click(object sender, EventArgs e)
        {
            Response.Redirect("EditInfo.aspx");
        }

        protected void btnRegistration_Click(object sender, EventArgs e)
        {
            Response.Redirect("Registration.aspx");
        }
        protected DataTable GetDatafromDatabase()
        {
            DataTable dt = new DataTable();
            SqlConnection con = new SqlConnection(strconnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetCompleteMembersData", con);
            cmd.CommandTimeout = Convert.ToInt32(lblConnectiontimeout.Text);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            da.Fill(dt);
            con.Close();

            return dt;
        }

        protected void btExcelCompleteData_Click(object sender, EventArgs e)
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

        //protected void grdMembers_PageIndexChanging(object sender, GridViewPageEventArgs e)
        //{
        //    grdMembers.PageIndex = e.NewPageIndex;
        //    GetMemberDetails(e.NewPageIndex, 30);
        //    //if (ViewState["grdview"] != null)
        //    //    {
        //    if (grdMembers.Rows.Count == 0)
        //    {
        //        DataTable Dt = (DataTable)ViewState["grdview"];// retrieving datatable from viewstate 
        //        grdMembers.DataSource = Dt;
        //        grdMembers.DataBind();
        //    }
        //      //  }
           

        //}



        public override void VerifyRenderingInServerForm(Control control)
        {
            /* Verifies that the control is rendered */
        }
        //Method to get all pages data
       
        protected void btnExport_Click(object sender, EventArgs e)
        {



            SqlConnection con = new SqlConnection(strconnection);
            con.Open();
            SqlCommand cmd = new SqlCommand("GetMembersDetails", con);
            cmd.CommandTimeout = Convert.ToInt32(lblConnectiontimeout.Text);
            cmd.CommandType = CommandType.StoredProcedure;
            string strmemberId = "";

            if (txtMemberId.Text == "")
            {

                txtMemberId.Text = "";
                strmemberId = "0";


            }
            else
            {
                strmemberId = txtMemberId.Text;
            }
            if (txtname.Text == "")
            {
                txtname.Text = "";

            }
            if (txtPhone.Text == "")
            {
                txtPhone.Text = "";
            }

            if (ddlCluster.SelectedItem.Text == "--Select--")
            {
                strcluster = "";
            }
            else
            {
                strcluster = ddlCluster.SelectedItem.Text;
            }
            if (txtCurrentCity.Text == "")
            {
                txtCurrentCity.Text = "";
            }
            if (ddlRoles.SelectedItem.Text == "--Select--")
            {
                strrole = "";
            }
            else
            {
                strrole = ddlRoles.SelectedItem.Text;
            }
            if (txtHomeTown.Text == "")
            {
                txtHomeTown.Text = "";
            }
            if (txtQualification.Text == "")
            {
                txtQualification.Text = "";
            }
            if (ddlProfession.SelectedItem.Text == "--Select--")
            {
                strprofession = "";
            }
            else
            {
                strprofession = ddlProfession.SelectedItem.Text;
            }
            if (txtifocusBranch.Text == "")
            {
                txtifocusBranch.Text = "";
            }
            //if (txtBloodGroup.Text == "")
            //{
            //    txtBloodGroup.Text = "";
            //}
            if (ddlBloodGroup.SelectedItem.Text == "--Select--")
            {
                strbloodgroup = "";
            }
            else
            {

                strbloodgroup = ddlBloodGroup.SelectedItem.Text;
            }
            if (txtCurrentLocation.Text == "")
            {
                txtCurrentLocation.Text = "";
            }
            //if(txtGender.Text=="")
            //{
            //    txtGender.Text = "";
            //}
            if (ddlGender.SelectedItem.Text == "--Select--")
            {
                strgender = "";
            }
            else if (ddlGender.SelectedItem.Text == "Male")
            {
                strgender = "M";
                // ddlGender.SelectedItem.Text = "M";
            }
            else
            {
                strgender = "F";
                //ddlGender.SelectedItem.Text = "F";
            }

            if (ddlYear.SelectedItem.Text == "--Select--")
            {
                strYear = "";
            }
            else
            {
                strYear = ddlYear.SelectedItem.Text;
            }
            string strSapthaswa;
            if (ddlSapthaswa.SelectedItem.Text == "--Select--")
            {
                strSapthaswa = "";
            }
            else
            {
                strSapthaswa = ddlSapthaswa.SelectedItem.Value;
            }
            cmd.Parameters.AddWithValue("@MemberId", Convert.ToInt32(strmemberId));
            cmd.Parameters.AddWithValue("@Name", txtname.Text);
            cmd.Parameters.AddWithValue("@PhoneNo", txtPhone.Text);
            cmd.Parameters.AddWithValue("@Cluster", strcluster);
            cmd.Parameters.AddWithValue("@CurrentCity", txtCurrentCity.Text);
            cmd.Parameters.AddWithValue("@Roleinifocus", strrole);
            cmd.Parameters.AddWithValue("@HomeTown", txtHomeTown.Text);
            cmd.Parameters.AddWithValue("@DegreeQualification", txtQualification.Text);
            cmd.Parameters.AddWithValue("@Profession", strprofession);
            cmd.Parameters.AddWithValue("@BloodGroup", strbloodgroup);
            cmd.Parameters.AddWithValue("@ifocusBranch", txtifocusBranch.Text);
            cmd.Parameters.AddWithValue("@CurrentLocation", txtCurrentLocation.Text);
            cmd.Parameters.AddWithValue("@Gender", strgender);
            cmd.Parameters.AddWithValue("@Year", strYear);
            cmd.Parameters.AddWithValue("@Sapthaswa", strSapthaswa);
            //cmd.Parameters.AddWithValue("@StartIndex", startRowNumber);
            //cmd.Parameters.AddWithValue("@PageSize", pageSize);
            //SqlParameter parTotalCount = new SqlParameter("@TotalCount", SqlDbType.Int);
            //parTotalCount.Direction = ParameterDirection.Output;
            //cmd.Parameters.Add(parTotalCount);

            SqlDataAdapter Da = new SqlDataAdapter();
            Da.SelectCommand = cmd;
            DataTable Dt = new DataTable();
            Da.Fill(Dt);
            GridView gRD = new GridView();
            gRD.DataSource = Dt;
            gRD.AllowPaging = false;
            gRD.DataBind();
            if(Dt.Rows.Count>0)
            { 
            string sFileName = "";
                // THE EXCEL FILE.
                if (txtname.Text != "" || txtPhone.Text != "")
                {
                    sFileName = "ifocusMemberData.xls";
                    sFileName = sFileName.Replace("/", "");

                }
                else if (ddlCluster.SelectedIndex != 0)
                {

                    sFileName = "ClusterWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (txtCurrentCity.Text != "")
                {
                    sFileName = "CityWiseMebersList.xls";
                    sFileName = sFileName.Replace("/", "");

                }
                else if (ddlRoles.SelectedIndex != 0)
                {

                    sFileName = "RoleWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (txtHomeTown.Text != "")
                {
                    sFileName = "HomeTownWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");

                }
                else if (txtQualification.Text != "")
                {
                    sFileName = "QuaificationWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");

                }
                else if (ddlProfession.SelectedIndex != 0)
                {
                    sFileName = "ProfessionWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (ddlBloodGroup.SelectedItem.Text != "--Select--")
                {
                    sFileName = "BloodGroupWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (txtifocusBranch.Text != "")
                {
                    sFileName = "ifocusBranchWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (txtCurrentLocation.Text != "")
                {
                    sFileName = "LocationWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (ddlYear.SelectedItem.Text != "--Select--")
                {
                    sFileName = "YearWiseMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                else if (ddlSapthaswa.SelectedItem.Text != "--Select--")
                {
                    sFileName = "SapthaswaMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                //else if (txtDateofJoinfrom.Text != "" && txtDateofJoinTo.Text != "")
                //{
                //    sFileName = "DateWiseMembersList.xls";
                //    sFileName = sFileName.Replace("/", "");
                //}
                else
                {
                    sFileName = "AllMembersList.xls";
                    sFileName = sFileName.Replace("/", "");
                }
                // SEND OUTPUT TO THE CLIENT MACHINE USING "RESPONSE OBJECT".
                Response.ClearContent();
                Response.Buffer = true;
                Response.AddHeader("content-disposition", "attachment; filename=" + sFileName);
                Response.ContentType = "application/vnd.ms-excel";
                //  EnableViewState = false;

                System.IO.StringWriter objSW = new System.IO.StringWriter();
                System.Web.UI.HtmlTextWriter objHTW = new System.Web.UI.HtmlTextWriter(objSW);

                gRD.HeaderStyle.Font.Bold = true;     // SET EXCEL HEADERS AS BOLD.
                gRD.RenderControl(objHTW);

                // STYLE THE SHEET AND WRITE DATA TO IT.
                Response.Write("<style> TABLE { border:dotted 1px #999; } " +
                        "TD { border:solid 1px #D5D5D5; text-align:center } </style>");
                Response.Write(objSW.ToString());

                Response.End();
                gRD = null;
            }
            else
            {
                lblMsg.Visible = true;
            }

        }

    }


}





