<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="IFocusMembersRegistrations.EditProfile" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Edit Profile</title>
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
    function UncheckOthers(objchkbox) {
        //Get the parent control of checkbox which is the checkbox list
        var objchkList = objchkbox.parentNode.parentNode.parentNode;
        //Get the checkbox controls in checkboxlist
        var chkboxControls = objchkList.getElementsByTagName("input");
        //Loop through each check box controls
        for (var i = 0; i < chkboxControls.length; i++) {
            //Check the current checkbox is not the one user selected
            if (chkboxControls[i] != objchkbox && objchkbox.checked) {
                //Uncheck all other checkboxes
                chkboxControls[i].checked = false;
            }
        }
    }
</script>
</head>
<body>
      <form id="form1" runat="server"  class="register" style="vertical-align:top;">
        <p style="padding-left:600px;color:#0189D1;font-weight:bold">
            <br />Welcome <asp:Label ID="lblUser" runat="server"></asp:Label> &nbsp;&nbsp;, <asp:LinkButton ID="LinkButton1" runat="server" Font-Bold="True" ForeColor="#0189D1" OnClick="lnkLogout_Click">Logout</asp:LinkButton>

        </p>
                      <p align="center"> 
                          <img src="img/Ifocus.jpg" alt="Ifocus" width="300" height="180" align="middle"/>

                      </p> 
                      <span style="padding-left:708px">
            &nbsp;</span><h1>Edit Profile</h1>
        <p>
           <span   style="text-align:center;font-size:13px;font-weight:bold;padding-left:270px">
            <asp:Label ID="lblMsg" runat="server" Visible="false"  ForeColor="#006600">Data Updated Successfully</asp:Label>
               </span>
          
             </p>
        
            <fieldset class="row2">
                
                
                <legend>Personal Details
                </legend>
                  <p>

                    <label>Member Id *
                    </label>
                    <input type="text" class="memid" disabled="disabled" runat="server" id="MemberId"/>
                </p>
                <p>

                    <label>Name *
                    </label>
                    <input type="text" class="long" width="20%" runat="server" id="Membername" tabindex="1" maxlength="50"/>

                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="reqname" runat="server" 
                ControlToValidate="Membername" ErrorMessage="RequiredFieldValidator" 
                                SetFocusOnError="True" Display="Dynamic" 
                        ValidationGroup="v">Enter Name</asp:RequiredFieldValidator>--%>&nbsp;
                            <asp:RegularExpressionValidator ID="regname" 
                                runat="server" ControlToValidate="Membername" Display="Dynamic" 
                                ErrorMessage="RegularExpressionValidator" SetFocusOnError="True" 
                                ValidationExpression="[a-zA-Z .]{1,50}"  
                        ValidationGroup="v">Enter only Characters</asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Surname *
                    </label>
                    <input type="text" class="long" runat="server" id="Surname" tabindex="2" maxlength="30"/>
                </p>
              
                 <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="reqsur" runat="server" 
                ControlToValidate="Surname" ErrorMessage="Enter Surname" 
                                SetFocusOnError="True" Display="Dynamic"  
                        ValidationGroup="v"></asp:RequiredFieldValidator>--%>&nbsp;
                            <asp:RegularExpressionValidator ID="regsur" 
                                runat="server" ControlToValidate="Surname" Display="Dynamic" 
                                ErrorMessage="Enter only Characters" SetFocusOnError="True" 
                                ValidationExpression="[a-zA-Z .]{1,50}"  
                        ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
               
                <p>
                    <label>Gender *</label>
                     

                                         <input type="radio" value="Male" name="gender"  runat="server"  id="MGender" checked tabindex="3"/>
                  
                        Male<br />
                    <input type="radio" value="Female" name="gender" id="FGender" runat="server" tabindex="4"/>Female
                  </p>
                  <p>
                    <label>Date&nbsp;of&nbsp;Birth&nbsp;*
                    </label>
                    <asp:TextBox id="txtDOB" runat="server" MaxLength="20" TabIndex="11" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid"></asp:TextBox>
                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="txtDOB" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" 
                                Display="Dynamic" ValidationGroup="v">Enter Date of Date of Birth</asp:RequiredFieldValidator>&nbsp;
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator2" 
                                runat="server" ErrorMessage="RegularExpressionValidator" 
                                
                                ValidationExpression=" (([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[/ /.]([1-9]|1[0-2]|0[1-9])[/ /.]([1-9][0-9])\d\d)|(([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[- /.](0[1-9]|1[0-2]|[1-9])[- /.]([1-9][0-9])\d\d)" 
                                ControlToValidate="txtDoj"  SetFocusOnError="True" 
                        ValidationGroup="v" Display="Dynamic">DD/MM/YYYY&quot; 
                            Format</asp:RegularExpressionValidator>--%>
                </p>
                <p>
                    <label>Blood&nbsp;Group&nbsp;*
                    </label>
                    <asp:TextBox id="txtBloodGroup" runat="server" MaxLength="20" TabIndex="5" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid"></asp:TextBox>
                </p>
                     <p style="color:red;padding-left:110px">
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Correct Format" ControlToValidate="txtBloodGroup" Display="Dynamic" SetFocusOnError="True" ValidationExpression="(A|B|AB|O)[+-]" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                <p>
                    <label>Phone No *
                    </label>
                    <input type="text" maxlength="10" runat="server" id="ContactNo" tabindex="5"/>
                </p>
                <p style="color:red;padding-left:110px">
             <%--  <asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                                            ControlToValidate="ContactNo"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Contact No</asp:RequiredFieldValidator>--%>&nbsp;
                        <asp:RegularExpressionValidator ID="regphone" runat="server" ErrorMessage="Enter 10 digits Phone No" ControlToValidate="ContactNo" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Alternate&nbsp;Phone No
                    </label>
                    <input type="text" maxlength="10" runat="server" id="AlternatePhone" tabindex="5"/>
                </p>
                <p style="color:red;padding-left:110px">
               <%--<asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                                            ControlToValidate="ContactNo"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Contact No</asp:RequiredFieldValidator>--%>&nbsp;
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ErrorMessage="Enter 10 digits Phone No" ControlToValidate="AlternatePhone" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Email *
                    </label>
                    <input type="text" runat="server" id="Email" class="long" tabindex="6" maxlength="60"/>
                    
                </p>
                <p style="color:red;padding-left:110px">
               <%-- <asp:RequiredFieldValidator ID="reqEmail" runat="server" 
                                            ControlToValidate="Email" Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Email</asp:RequiredFieldValidator>--%>&nbsp;
                                             <asp:RegularExpressionValidator ID="regemail" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="Email" Display="Dynamic"  SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Alternate&nbsp;Email
                    </label>
                    <input type="text" maxlength="60" runat="server" class="long"  id="AlternateEmail" tabindex="5"/>
                </p>
                <p style="color:red;padding-left:110px">
                
                                             <asp:RegularExpressionValidator ID="regemail1" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="AlternateEmail" Display="Dynamic"  SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                
                
                 <p>
                    <label>Current&nbsp;Location *
                    </label>
                    <input type="text" class="txt"  runat="server" id="CurrentLocation" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                                            ControlToValidate="CurrentLocation"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Location</asp:RequiredFieldValidator>--%>
                </p>
                <p>
                    <label>Current City *
                    </label>
                    <input type="text" class="txt"  runat="server" id="City" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="reqCity" runat="server" 
                                            ControlToValidate="City"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter City</asp:RequiredFieldValidator>--%>
                </p>
                <p>
                    <label>Home Town *
                    </label>
                    <input type="text" class="txt"  runat="server" id="HomeTown" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
              <%--  <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="HomeTown"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Home Town</asp:RequiredFieldValidator>--%>
                </p>
                <p>
                    <label>District *
                    </label>
                    <select runat="server" id="District" tabindex="9">
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
<%--<asp:RequiredFieldValidator ID="reqDist" runat="server" 
                                            ControlToValidate="District"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v" InitialValue="0" 
                        ForeColor="Red">Select District</asp:RequiredFieldValidator>--%>
               </p>
                 <p>
                    <label>State *
                    </label>
                    <input type="text" class="txt"  runat="server" id="State" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                                            ControlToValidate="State"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter State</asp:RequiredFieldValidator>--%>
                </p>
            </fieldset>
            <fieldset class="row3">
                <legend>IFocus Information
                </legend>
                <p>
                    <label>ifocus Branch*
                    </label>
                    <asp:TextBox id="txtIfocusBranch" runat="server" MaxLength="50" TabIndex="11" 
                        CssClass="long"  Width="195px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid">Hyderabad</asp:TextBox>
                </p>
                <p></p>
                <p>
                 <label>Role in IFocus *
                    </label>
 <asp:DropDownList ID="ddlRoles" runat="server"  TabIndex="10" Width="200px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem Value="1">L1</asp:ListItem>
                         <asp:ListItem Value="2">L2-Brigadier</asp:ListItem>
			              <asp:ListItem Value="3">L2-Facilitator</asp:ListItem>
                         <asp:ListItem Value="4">L3-Navigator</asp:ListItem>
			            <asp:ListItem Value="5">L3-Joint Secretary</asp:ListItem>
			            <asp:ListItem Value="6">L3-Young Professional</asp:ListItem>
                         <asp:ListItem Value="7">L4-Secretary</asp:ListItem>
                          <asp:ListItem Value="8">L4-Mentor</asp:ListItem>
                          <asp:ListItem Value="9">L4-Premier Member</asp:ListItem>
                     </asp:DropDownList>
                    
                    </p>
                    <p style="color:red;padding-left:110px">

               

                    <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="ddlRoles"  Display="Dynamic" 
                                            ErrorMessage="Select Role" 
                        SetFocusOnError="True" ValidationGroup="v"
                        ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>--%>
                   
                    </p>
                
                <p>
                    <label>Date&nbsp;of&nbsp;Join&nbsp;*
                    </label>
                    <asp:TextBox id="txtDoj" runat="server" MaxLength="20"  TabIndex="11" 
                        CssClass="long"  Width="195px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid"></asp:TextBox>
                </p>
                <p style="color:red;padding-left:110px">
               <%-- <asp:RequiredFieldValidator ID="reqDoj" runat="server" 
                ControlToValidate="txtDoj" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" 
                                Display="Dynamic" ValidationGroup="v">Enter Date of Join</asp:RequiredFieldValidator>&nbsp;
                            <asp:RegularExpressionValidator ID="regDoj" 
                                runat="server" ErrorMessage="RegularExpressionValidator" 
                                
                                ValidationExpression=" (([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[/ /.]([1-9]|1[0-2]|0[1-9])[/ /.]([1-9][0-9])\d\d)|(([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[- /.](0[1-9]|1[0-2]|[1-9])[- /.]([1-9][0-9])\d\d)" 
                                ControlToValidate="txtDoj"  SetFocusOnError="True" 
                        ValidationGroup="v" Display="Dynamic">DD/MM/YYYY&quot; 
                            Format</asp:RegularExpressionValidator>--%>
                </p>
                 <p>
                   <label>Profession *</label>    
                      <asp:DropDownList ID="ddlProfession" runat="server"   Width="200px" OnSelectedIndexChanged="ddlProfession_SelectedIndexChanged" TabIndex="12" AutoPostBack="True">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem Value="1">Student</asp:ListItem>
                         <asp:ListItem Value="2">Professional</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
                <%--<asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="ddlProfession"  Display="Dynamic" 
                                            ErrorMessage="Select Profession" 
                           SetFocusOnError="True" ValidationGroup="v" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </p>
                <p>
                   <label>Cluster *</label>    
                     <asp:DropDownList ID="ddlCluster" runat="server"  TabIndex="13" Width="200px">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem Value="1">Science & IT Technology</asp:ListItem>
                         <asp:ListItem Value="2">Management & Finance</asp:ListItem>
                         <asp:ListItem Value="3">Arts & Literature</asp:ListItem>
                         <asp:ListItem Value="4">Life Sciences</asp:ListItem>
                          <asp:ListItem Value="5">Other</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
               <%-- <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="ddlCluster"  Display="Dynamic" 
                                            ErrorMessage="Select Cluster" 
                           SetFocusOnError="True" ValidationGroup="v" InitialValue="0"></asp:RequiredFieldValidator>--%>
                </p>
                <p  runat="server" id="p5">
                    <label>DegreeCollegeName*
                    </label>
                    <input type="text" class="long"  runat="server" id="DegreeCollegeName"  maxlength="35" tabindex="14"/></p>
                <p  runat="server" id="p6">
                    <label>PGCollegeName&nbsp;*
                    </label>
                    <input type="text" class="long"  runat="server" id="PGCollegeName"  maxlength="35" tabindex="14"/></p>
                <p  runat="server" id="p1">
                    <label>Company&nbsp;Name&nbsp;*
                    </label>
                    <input type="text" class="long"  runat="server" id="CompanyName"  maxlength="35" tabindex="14"/></p>
                <p  runat="server" id="p2">
                    <label>Designation&nbsp;*
                    </label>
                    <input type="text" class="long"  runat="server" id="Designation"  maxlength="35" tabindex="15"/></p>
                <p  runat="server" id="p3">
                    <label>Skills *
                    </label>
                    <input type="text" class="long"  runat="server" id="Skills"  maxlength="35" tabindex="16"/></p>
                <p  runat="server" id="p4">
                    <label>Working&nbsp;Place&nbsp;*
                    </label>
                    <asp:TextBox ID="txtCompanyAddress" runat="server" CssClass="long" Height="60px" style="border: 1px solid #E1E1E1" TextMode="MultiLine"></asp:TextBox>

                </p>
                 <p>
                   <label>Sapthaswa *</label>
                     <asp:CheckBoxList ID="chkSaptaswa" runat="server" RepeatDirection="Horizontal">
                         <asp:ListItem Value="Y" onclick="UncheckOthers(this);">Yes</asp:ListItem>
                         <asp:ListItem Value="N" onclick="UncheckOthers(this);">No</asp:ListItem>
                     </asp:CheckBoxList>
                </p>
               <%-- <p style="color:red;padding-left:110px">
              
                </p>--%>
                
            </fieldset>
        
        <fieldset class="row6">
                <legend>Upload Photo
                </legend>
            <p style="padding-left:100px">
                <img id="imgprvw" height="140" width="120" alt="No Photo" runat="server"/>
                <asp:Label ID="lblPhotoStatus" runat="server" Visible="False"></asp:Label>

            </p>
                <p style="padding-left:109px">
<input type="file" name="filUpload" id="filUpload" runat="server" accept=".jpg files"  onchange="showimagepreview(this)" tabindex="19" /><br />

            </p>
            <p style="padding-left:109px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ErrorMessage="RegularExpressionValidator" 
                                
                                ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.jpeg|.gif)$" 
                                ControlToValidate="filUpload"  SetFocusOnError="True" 
                        ValidationGroup="v" ForeColor="Red" Display="Dynamic">Accepts jpg images</asp:RegularExpressionValidator><br />
                <%--<asp:CustomValidator ID="CustomValidator1" OnServerValidate="ValidateFileSize" ForeColor="Red" runat="server"/>--%>
            </p>
            </fieldset>
            <fieldset class="row1">
                <legend>Education Details
                </legend>
                <p>
                    <label>Degree Qualification *
                    </label>
                    <input type="text" runat="server" id="Qualification" tabindex="20" maxlength="20"/>
                    <label>Degree&nbsp;Specialization*
                    </label>
                    <input type="text" runat="server" id="Specialization" tabindex="21" maxlength="40"/>
                    
                </p>
                <p style="color:red;padding-left:150px">
               <%-- <asp:RequiredFieldValidator ID="reqQual" runat="server" 
                                            ControlToValidate="Qualification"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Qualification</asp:RequiredFieldValidator>
                    <span style="padding-left:180px">
                    <asp:RequiredFieldValidator ID="reqSpec" runat="server" 
                                            ControlToValidate="Specialization"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v" ForeColor="Red">Enter Specialization</asp:RequiredFieldValidator>--%>
                    </span>
                </p>
                <p>
                    <label>PG Qualification
                    </label>
                    <input type="text" runat="server" id="PGQualification" tabindex="23" maxlength="20"/>
                    <label>PG Specialization
                    </label>
                    <input type="text" runat="server" id="PGSpecialization" tabindex="24" maxlength="40"/>
                    
                </p>
                <p style="color:red;padding-left:150px">
                    &nbsp;</p>
                
                 <p  runat="server">
                 <span style="font-weight:bold;">Admin Remarks
                    </span>
                    <asp:TextBox ID="txtRemarks" runat="server" CssClass="long" Height="280px" Width="650px" style="border: 1px solid #E1E1E1" TextMode="MultiLine"></asp:TextBox>
                   
                    
                </p>
            </fieldset>
          
    <p style="padding-left:300px">
        <asp:Button ID="btnUpdate" runat="server" Text="Update" CssClass="button" 
             ValidationGroup="v" TabIndex="25" OnClick="btnUpdate_Click" ForeColor="White"/>&nbsp;&nbsp;
                <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="button" 
             ValidationGroup="v" TabIndex="25" OnClientClick="JavaScript:window.history.back(1); return false;" ForeColor="White"/>
    
    </p>
   
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
