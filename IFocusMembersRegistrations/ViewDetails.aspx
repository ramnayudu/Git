<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ViewDetails.aspx.cs" Inherits="IFocusMembersRegistrations.ViewDetails" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>View Profile</title>
     <link href="css/default.css" rel="stylesheet" type="text/css" />
     <script type="text/javascript" src="http://code.jquery.com/jquery-1.8.2.js"></script>
<script type="text/javascript">
    function showimagepreview(input) {
        if (input.files && input.files[0]) {
            var filerdr = new FileReader();
            filerdr.onload = function (e) {
                $('#imgprvw').attr('src', e.target.result);
            }
            filerdr.readAsDataURL(input.files[0]);
        }
    }
</script>
</head>
<body>
    <form id="form1" runat="server" align="left" class="register" style="vertical-align:top;">
       <p style="padding-left:600px;color:#0189D1;font-weight:bold">
            <br />Welcome <asp:Label ID="lblUser" runat="server"></asp:Label> &nbsp;&nbsp;, <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" ForeColor="#0189D1" OnClick="lnkLogout_Click">Logout</asp:LinkButton></p>
                      <p align="center"> 
                          <img src="img/Ifocus.jpg" alt="Ifocus" width="300" height="180" align="middle"/>

                      </p> 
        <span style="padding-left:708px">
            <asp:LinkButton ID="lnkBack" runat="server" Font-Bold="True" ForeColor="#0189D1" OnClick="lnkBack_Click" Visible="false">Back</asp:LinkButton>&nbsp;&nbsp;
            </span>
     <h1>View Profile</h1>
        <p>
           <span   style="text-align:center;font-size:13px;font-weight:bold;padding-left:700px">
           <asp:LinkButton ID="lnkEdit" runat="server" Font-Bold="True" ForeColor="#0189D1"  Visible="true" OnClick="lnkEdit_Click">Edit Profile</asp:LinkButton>&nbsp;&nbsp;
               </span>
          
             </p>
        
            <fieldset class="row2">
                
                
                <legend>Personal Details
                </legend>
                  <p>

                    <label>Member Id 
                    </label>
                    <input type="text" class="memid" disabled="disabled" runat="server" id="MemberId"/>
                </p>
                <p>

                    <label>Name 
                    </label>
                    <input type="text" class="long" width="20%" runat="server" id="Membername" tabindex="1" maxlength="50" disabled="disabled"/>
                   </p>
                
                <p>
                  
                            <label>Surname 
                    </label>
                    <input type="text" class="long" runat="server" id="Surname" tabindex="2" maxlength="30" disabled="disabled"/>
                </p>
              
                 <p style="color:red;padding-left:110px">
                   
                            </p>
               
                <p>
                    <label>Gender </label>
                     

                                         <input type="radio" value="Male" name="gender"  runat="server"  id="MGender" checked tabindex="3" disabled="disabled"/>
                  
                        Male<br />
                    <input type="radio" value="Female" name="gender" id="FGender" runat="server" disabled tabindex="4"/>Female
                  </p>
                  <p>
                    <label>Date&nbsp;of&nbsp;Birth&nbsp;
                    </label>
                    <asp:TextBox id="txtDOB" runat="server" MaxLength="20" TabIndex="11" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid" Enabled="False"></asp:TextBox>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;
                            </p>
                <p>
                    <label>Blood&nbsp;Group&nbsp;
                    </label>
                    <asp:TextBox id="txtBloodGroup" runat="server" MaxLength="20" TabIndex="5" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid" Enabled="False"></asp:TextBox>
                </p>
                <p>
                    <label>Phone 
                    </label>
                    <input type="text" maxlength="10" runat="server" id="ContactNo" tabindex="5" disabled="disabled"/>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;
                        </p>
                 <p>
                    <label>Alternate&nbsp;Phone No
                    </label>
                    <input type="text" maxlength="10" runat="server" id="AlternatePhone" tabindex="5"  disabled="disabled"/>
                </p>
                <p style="color:red;padding-left:110px">
               <%--<asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                                            ControlToValidate="ContactNo"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Contact No</asp:RequiredFieldValidator>--%>&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ErrorMessage="Enter 10 digits Phone No" ControlToValidate="AlternatePhone" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Email 
                    </label>
                    <input type="text" runat="server" id="Email" class="long" tabindex="6" maxlength="60" disabled="disabled"/>
                    
                </p>
               
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
                  <p>
                    <label>Alternate&nbsp;Email
                    </label>
                    <input type="text" maxlength="60" runat="server" class="long"  id="AlternateEmail"  disabled="disabled" tabindex="5"/>
                </p>
                <p style="color:red;padding-left:110px">
                
                                             <asp:RegularExpressionValidator ID="regemail1" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="AlternateEmail" Display="Dynamic"  SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                <p>
                    <label>Current&nbsp;Location *
                    </label>
                    <input type="text" class="txt"  runat="server" id="CurrentLocation" tabindex="8" maxlength="35" disabled="disabled"/>
                </p>
                <p>
                    <label>Current City 
                    </label>
                    <input type="text" class="txt"  runat="server" id="City" tabindex="8" maxlength="35" disabled="disabled"/>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
                <p>
                    <label>Home Town 
                    </label>
                    <input type="text" class="txt"  runat="server" id="HomeTown" tabindex="8" maxlength="35" disabled="disabled"/>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
                <p>
                    <label>District 
                    </label>
                    <select runat="server" id="District" tabindex="9" disabled="disabled">
                        <option>
                        </option>
                          <option value="0" selected="selected">--Select-- 
                        </option>
                        <option value="Adilabad">Adilabad 
                        </option>
                        <option value="Hyderabad">Hyderabad
                        </option>
                        <option value="Karimnagar">Karimnagar
                        </option>
                        <option value="Khammam">Khammam
                        </option>
                        <option value="Mahaboobnagar">Mahaboobnagar
                        </option>
                        <option value="Medak">Medak 
                        </option>
                        <option value="Nalgonda">Nalgonda
                        </option>
                         <option value="Nizamabad">Nizamabad
                        </option>
                        <option value="Rangareddy">Rangareddy
                        </option>
                        <option value="Mahaboobnagar">Mahaboobnagar
                        </option>
                        <option value="Warangal">Warangal
                        </option>
                        <option value="Anantapur">Anantapur
                        </option>
                         <option value="Chittoor">Chittoor
                        </option>
                        <option value="EastGodavari">East Godavari
                        </option>
                        <option value="Guntur">Guntur 
                        </option>
                        <option value="Kadapa">Kadapa
                        </option>
                         <option value="Krishna">Krishna
                        </option>
                        <option value="Kurnool">Kurnool
                        </option>
                        <option value="Nellore">Nellore
                        </option>
                        <option value="Prakasam">Prakasam
                        </option>
                        <option value="Srikakulam">Srikakulam
                        </option>
                         <option value="Visakhapatnam">Visakhapatnam
                        </option>
                        <option value="Vizianagaram">Vizianagaram 
                        </option>
                        <option value="WestGodavari">West Godavari
                        </option>
                         <option value="Krishna">Krishna
                        </option>
                        <option value="Kurnool">Kurnool
                        </option>
                        <option value="Nellore">Nellore
                        </option>
                        <option value="Prakasam">Prakasam
                        </option>
                        <option value="Srikakulam">Srikakulam
                        </option>
                    </select>
                    
                   
                </p>
               <p style="color:red;padding-left:110px">
                   &nbsp;</p>
                 <p>
                    <label>State 
                    </label>
                    <input type="text" class="txt"  runat="server" id="State" tabindex="8" maxlength="35" disabled="disabled"/>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
            </fieldset>
            <fieldset class="row3">
                <legend>IFocus Information
                </legend>
                <p>
                    <label>ifocus Branch*
                    </label>
                    <asp:TextBox id="txtIfocusBranch" runat="server" MaxLength="50" TabIndex="11" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid" Enabled="False">Hyderabad</asp:TextBox>
                </p>
                <p></p>
                <p>
                 <label>Role in iFocus 
                    </label>

                   <asp:DropDownList ID="ddlRoles" runat="server"  TabIndex="10" Enabled="False">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem>L1</asp:ListItem>
                         <asp:ListItem>L2-Brigadier</asp:ListItem>
			              <asp:ListItem>L2-Facilitator</asp:ListItem>
                         <asp:ListItem>L3-Navigator</asp:ListItem>
			            <asp:ListItem>L3-Joint Secretary</asp:ListItem>
			            <asp:ListItem>L3-Young Professional</asp:ListItem>
                         <asp:ListItem>L4-Secretary</asp:ListItem>
                          <asp:ListItem>L4-Mentor</asp:ListItem>
                          <asp:ListItem>L4-Premier Member</asp:ListItem>
                     </asp:DropDownList>
                    
                    </p>
                    <p style="color:red;padding-left:110px">

               

                        &nbsp;</p>
                
                <p>
                    <label>Date&nbsp;of&nbsp;Join&nbsp;
                    </label>
                    <asp:TextBox id="txtDoj" runat="server" MaxLength="20" TabIndex="11" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid" Enabled="False"></asp:TextBox>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;
                            </p>
                 <p>
                   <label>Profession </label>    
                     <asp:DropDownList ID="ddlProfession" runat="server" TabIndex="12" AutoPostBack="True" Enabled="False">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem>Student</asp:ListItem>
                         <asp:ListItem>Professional</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
                <p>
                   <label>Cluster </label>    
                     <asp:DropDownList ID="ddlCluster" runat="server"  TabIndex="13" Enabled="False" Width="200px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem>Science & Technology</asp:ListItem>
                         <asp:ListItem>Management & Finance</asp:ListItem>
                         <asp:ListItem>Arts & Literature</asp:ListItem>
                         <asp:ListItem>Life Sciences</asp:ListItem>
                          <asp:ListItem>Other</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
                    &nbsp;</p>
                <p  runat="server" id="p5">
                    <label>DegreeCollegeName&nbsp;
                    </label>
                    <input type="text" class="long"  runat="server" id="DegreeCollegeName"  maxlength="35" tabindex="14" disabled="disabled"/></p>
                <p  runat="server" id="p6">
                    <label>PGCollegeName&nbsp;
                    </label>
                    <input type="text" class="long"  runat="server" id="PGCollegeName"  maxlength="35" tabindex="14" disabled="disabled"/></p>
                <p  runat="server" id="p1">
                    <label>Company&nbsp;Name&nbsp;
                    </label>
                    <input type="text" class="long"  runat="server" id="CompanyName"  maxlength="35" tabindex="14" disabled="disabled"/></p>
                <p  runat="server" id="p2">
                    <label>Designation&nbsp;
                    </label>
                    <input type="text" class="long"  runat="server" id="Designation"  maxlength="35" tabindex="15" disabled="disabled"/></p>
                <p  runat="server" id="p3">
                    <label>Skills 
                    </label>
                    <input type="text" class="long"  runat="server" id="Skills"  maxlength="35" tabindex="16" disabled="disabled"/></p>
                <p  runat="server" id="p4">
                    <label>Working&nbsp;Place&nbsp;
                    </label>
                   <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="long" Height="60px" style="border: 1px solid #E1E1E1" Enabled="False"></asp:TextBox>

                </p>
                
                 <p>
                   <label>Sapthaswa *</label>
                     <asp:CheckBoxList ID="chkSaptaswa" runat="server" RepeatDirection="Horizontal" Enabled="False">
                         <asp:ListItem Value="Y">Yes</asp:ListItem>
                         <asp:ListItem Value="N">No</asp:ListItem>
                     </asp:CheckBoxList>
                </p>
                <%--<p style="color:red;padding-left:110px">
              
                </p>--%>
            </fieldset>
        
        <fieldset class="row6">
                <legend>Photo
                </legend>
            <p style="padding-left:100px">
                <asp:Image ID="imgphoto" runat="server" height="140px"  width="120px"/>
               

            </p>
                <p style="padding-left:109px">
                    <br />

            </p>
            <p style="padding-left:109px">
                <br />
                <%--<asp:CustomValidator ID="CustomValidator1" OnServerValidate="ValidateFileSize" ForeColor="Red" runat="server"/>--%>
            </p>
            </fieldset>
            <fieldset class="row1">
                <legend>Education Details
                </legend>
                <p>
                    <label>Degree Qualification 
                    </label>
                    <input type="text" runat="server" id="Qualification" tabindex="20" maxlength="20" disabled="disabled"/>
                    <label>Degree&nbsp;Specialization
                    </label>
                    <input type="text" runat="server" id="Specialization" tabindex="21" maxlength="40" disabled="disabled"/>
                    
                </p>
                <p style="color:red;padding-left:150px">
                    &nbsp;</p>
                <p>
                    <label>PG Qualification
                    </label>
                    <input type="text" runat="server" id="PGQualification" tabindex="23" maxlength="20" disabled="disabled"/>
                    <label>PG Specialization
                    </label>
                    <input type="text" runat="server" id="PGSpecialization" tabindex="24" maxlength="40" disabled="disabled"/>
                    
                </p>
                  <p style="color:red;padding-left:150px">
                    &nbsp;</p>
                 
                 <p  runat="server">
                 <span style="font-weight:bold;">Admin Remarks
                    </span>
                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="long" Height="280px" Width="650px" Enabled="false" style="border: 1px solid #E1E1E1" TextMode="MultiLine"></asp:TextBox>
                   
                    
                </p>
                <p style="color:red;padding-left:250px;">
                    <br />
                <asp:Button ID="btnBack" runat="server" Text="Go to Search" CssClass="button" 
             ValidationGroup="v" TabIndex="25" OnClientClick="JavaScript:window.history.back(1); return false;" ForeColor="White"/></p>
                 
            </fieldset>
          
   
        <br />
         <br />
        <br />
        <br />
        <footer>
            
     <div class="container" style="text-align:center">
        
        <!-- .row -->

        <!-- Start Copyright -->
        <div class="copyright-section">
          <div class="row">
            <div class="col-md-6">
             <p>&copy; 2016 IFocus Mission - All Rights Reserved </p>
            </div>
            
          </div>
        </div>
        <!-- End Copyright -->
          
      </div>
    </footer>     
               </form>
</body>
</html>
