<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="IFocusMembersRegistrations.Default" %>

<!DOCTYPE  html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title>Registration Form</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
    <form id="form1" runat="server"  class="register">
       <p align="center"> <img src="img/Ifocus.jpg" alt="Ifocus" width="300" height="115" align="middle"/></p> 
        <%--<asp:ImageButton ID="ImageButton1" runat="server" align="right" ImageUrl="~/img/final.gif" Width="55px"/>--%>

     <h1>Registration</h1>
        <p>
           <span   style="text-align:center;font-size:13px;font-weight:bold;padding-left:270px">
            <asp:Label ID="lblMsg" runat="server" Visible="false"  ForeColor="#006600">Data Insertion Success</asp:Label>
               </span>
            <span style="padding-left:441px">
            <asp:LinkButton ID="lnkLogout" runat="server" Font-Bold="True" ForeColor="#0189D1"  OnClick="lnkLogout_Click">Logout</asp:LinkButton>
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
                <asp:RequiredFieldValidator ID="reqname" runat="server" 
                ControlToValidate="Membername" ErrorMessage="RequiredFieldValidator" 
                                SetFocusOnError="True" Display="Dynamic" 
                        ValidationGroup="v">Enter Name</asp:RequiredFieldValidator>&nbsp;
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
                <asp:RequiredFieldValidator ID="reqsur" runat="server" 
                ControlToValidate="Surname" ErrorMessage="Enter Surname" 
                                SetFocusOnError="True" Display="Dynamic"  
                        ValidationGroup="v"></asp:RequiredFieldValidator>&nbsp;
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
                  
                <p>
                    <label>Phone *
                    </label>
                    <input type="text" maxlength="10" runat="server" id="ContactNo" tabindex="5"/>
                </p>
                <p style="color:red;padding-left:110px">
               <asp:RequiredFieldValidator ID="reqPhone" runat="server" 
                                            ControlToValidate="ContactNo"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Contact No</asp:RequiredFieldValidator>&nbsp;
                        <asp:RegularExpressionValidator ID="regphone" runat="server" ErrorMessage="Enter 10 digits Contact No" ControlToValidate="ContactNo" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                 <p>
                    <label>Email *
                    </label>
                    <input type="text" runat="server" id="Email" class="long" tabindex="6" maxlength="60"/>
                    
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="reqEmail" runat="server" 
                                            ControlToValidate="Email" Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Email</asp:RequiredFieldValidator>&nbsp;
                                             <asp:RegularExpressionValidator ID="regemail" runat="server" ErrorMessage="Enter Valid Email" ControlToValidate="Email" Display="Dynamic"  SetFocusOnError="True" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" ValidationGroup="v"></asp:RegularExpressionValidator>
                </p>
                <p>
                    <label>Address *
                    </label>
                   <textarea rows="4" class="long"  runat="server" id="Address" tabindex="7" style="border: 1px solid #E1E1E1; width: 183px;"></textarea>
                    
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="reqAddress" runat="server" 
                                            ControlToValidate="Address"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Address</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label>Current City *
                    </label>
                    <input type="text" class="txt"  runat="server" id="City" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="reqCity" runat="server" 
                                            ControlToValidate="City"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter City</asp:RequiredFieldValidator>
                </p>
                <p>
                    <label>Home Town *
                    </label>
                    <input type="text" class="txt"  runat="server" id="HomeTown" tabindex="8" maxlength="35"/>
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                                            ControlToValidate="HomeTown"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Home Town</asp:RequiredFieldValidator>
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
<asp:RequiredFieldValidator ID="reqDist" runat="server" 
                                            ControlToValidate="District"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v" InitialValue="0" 
                        ForeColor="Red">Select District</asp:RequiredFieldValidator>
               </p>
            </fieldset>
            <fieldset class="row3">
                <legend>IFocus Information
                </legend>
                <p>
                 <label>Role in IFocus *
                    </label>

                   <asp:DropDownList ID="ddlRoles" runat="server"  OnSelectedIndexChanged="ddlProfession_SelectedIndexChanged" TabIndex="10">
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

               

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                                            ControlToValidate="ddlRoles"  Display="Dynamic" 
                                            ErrorMessage="Select Role" 
                        SetFocusOnError="True" ValidationGroup="v"
                        ForeColor="Red" InitialValue="0"></asp:RequiredFieldValidator>
                   
                    </p>
                
                <p>
                    <label>Date&nbsp;of&nbsp;Join&nbsp;*
                    </label>
                    <asp:TextBox id="txtDoj" runat="server" MaxLength="20" TabIndex="11" 
                        CssClass="long"  Width="130px"  BorderWidth="1px" BorderColor="#E1E1E1" BorderStyle="Solid"></asp:TextBox>
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="reqDoj" runat="server" 
                ControlToValidate="txtDoj" ErrorMessage="RequiredFieldValidator" SetFocusOnError="True" 
                                Display="Dynamic" ValidationGroup="v">Enter Date of Join</asp:RequiredFieldValidator>&nbsp;
                            <asp:RegularExpressionValidator ID="regDoj" 
                                runat="server" ErrorMessage="RegularExpressionValidator" 
                                
                                ValidationExpression=" (([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[/ /.]([1-9]|1[0-2]|0[1-9])[/ /.]([1-9][0-9])\d\d)|(([1-9]|[1-2][0-9]|3[0-1]|0[1-9])[- /.](0[1-9]|1[0-2]|[1-9])[- /.]([1-9][0-9])\d\d)" 
                                ControlToValidate="txtDoj"  SetFocusOnError="True" 
                        ValidationGroup="v" Display="Dynamic">DD/MM/YYYY&quot; 
                            Format</asp:RegularExpressionValidator>
                </p>
                 <p>
                   <label>Profession *</label>    
                     <asp:DropDownList ID="ddlProfession" runat="server"  OnSelectedIndexChanged="ddlProfession_SelectedIndexChanged" TabIndex="12" AutoPostBack="True">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem>Student</asp:ListItem>
                         <asp:ListItem>Professional</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                            ControlToValidate="ddlProfession"  Display="Dynamic" 
                                            ErrorMessage="Select Profession" 
                           SetFocusOnError="True" ValidationGroup="v" InitialValue="0"></asp:RequiredFieldValidator>
                </p>
                <p>
                   <label>Cluster *</label>    
                     <asp:DropDownList ID="ddlCluster" runat="server" OnSelectedIndexChanged="ddlProfession_SelectedIndexChanged" TabIndex="13">
                         <asp:ListItem Value="0">--Select--</asp:ListItem>
                         <asp:ListItem>Science & Technology</asp:ListItem>
                         <asp:ListItem>Management & Finance</asp:ListItem>
                         <asp:ListItem>Arts & Literature</asp:ListItem>
                         <asp:ListItem>Life Sciences</asp:ListItem>
                          <asp:ListItem>Other</asp:ListItem>
                     </asp:DropDownList>
                </p>
                <p style="color:red;padding-left:110px">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                            ControlToValidate="ddlCluster"  Display="Dynamic" 
                                            ErrorMessage="Select Cluster" 
                           SetFocusOnError="True" ValidationGroup="v" InitialValue="0"></asp:RequiredFieldValidator>
                </p>
                
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
                    <textarea rows="4" class="long"  runat="server" id="cmnyAddress" tabindex="17" style="border: 1px solid #E1E1E1; width: 183px;"></textarea></p>
                
                
            </fieldset>
        
        <fieldset class="row6">
                <legend>Upload Photo
                </legend>
            <p style="padding-left:100px">
                <img id="imgprvw" height="140px" width="120px" alt="No Photo"/>

            </p>
                <p style="padding-left:109px">
<input type="file" name="filUpload" id="filUpload" runat="server" accept=".gif,.jpg,.jpeg,.png"  onchange="showimagepreview(this)" tabindex="19" /><br />

            </p>
            <p style="padding-left:109px">
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" 
                                runat="server" ErrorMessage="RegularExpressionValidator" 
                                
                                ValidationExpression="([a-zA-Z0-9\s_\\.\-:])+(.png|.jpg|.jpeg|.gif)$" 
                                ControlToValidate="filUpload"  SetFocusOnError="True" 
                        ValidationGroup="v" ForeColor="Red" Display="Dynamic">accepts gif,jpg,jpeg,png images</asp:RegularExpressionValidator><br />
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
                <asp:RequiredFieldValidator ID="reqQual" runat="server" 
                                            ControlToValidate="Qualification"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v">Enter Qualification</asp:RequiredFieldValidator>
                    <span style="padding-left:180px">
                    <asp:RequiredFieldValidator ID="reqSpec" runat="server" 
                                            ControlToValidate="Specialization"  Display="Dynamic" 
                                            ErrorMessage="RequiredFieldValidator" 
                        SetFocusOnError="True" ValidationGroup="v" ForeColor="Red">Enter Specialization</asp:RequiredFieldValidator>
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
                 
            </fieldset>
          
    <div style="padding-left:300px">
        <asp:Button ID="btnsubmit" runat="server" Text="Submit" CssClass="button" 
            onclick="btnsubmit_Click" ValidationGroup="v" TabIndex="25" />
    </div>
        
    <br /><br />
  <fieldset class="row1">
                <legend>Search
                </legend>
                <p style="padding-left:150px">
                    <asp:Button ID="btnSearch" Text="Search Member"  runat="server" BackColor="#607D8B" 
                          Font-Bold="True" Font-Size="15px" ForeColor="White" 
                        onclick="btnSearch_Click" Height="30px" />
                        
                    <asp:Button ID="btExcel" Text="Download Data to Excel"  onclick="btnExport_Click"  
                        runat="server" BackColor="#607D8B" 
                          Font-Bold="True" Font-Size="15px" ForeColor="White" Width="190px" Height="30px" />
               
                </p>
                
                 
            </fieldset>
        <br />
        <br />
        <br />
        <br />
        <br />
        <br />
         <br />
        <br />
        <br />
         <br />
        <br />
         <br />
        <br />
        <br />
        <hr />
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
