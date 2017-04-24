<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="IFocusMembersRegistrations.Search" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE  html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title>Search Members</title>
     <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link href="css/default.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server"  class="register">
         <p align="center"> <img src="img/Ifocus.jpg" alt="Ifocus" width="300" height="110" align="middle"/></p> 
        <br /><br /><br />
     <%--<h1>Search</h1>--%>
        <p>
           
            <span style="padding-left:667px">
            <asp:LinkButton ID="lnkBack" runat="server" Font-Bold="True" ForeColor="#0189D1" OnClick="lnkBack_Click">Back</asp:LinkButton>&nbsp;&nbsp;
                 <asp:LinkButton ID="lnkLogout" runat="server" Font-Bold="True" ForeColor="#0189D1"  OnClick="lnkLogout_Click">Logout</asp:LinkButton>
           </span>
             </p>
            <fieldset class="row1">
                <legend>Search Members
                </legend>
                <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
               
                <p>

                    <label>Name *
                    </label>
                    <asp:TextBox ID="txtname" runat="server" class="long"></asp:TextBox>
                    
                    <ajax:AutoCompleteExtender runat="server" ID="autocompname" TargetControlID="txtname" UseContextKey="false"
                        MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="80" ServiceMethod="GetNames">
                    </ajax:AutoCompleteExtender>

                </p>
                <p style="color:red;padding-left:110px">
                   <asp:RegularExpressionValidator ID="regname" 
                                runat="server" ControlToValidate="txtname" Display="Dynamic" 
                                ErrorMessage="RegularExpressionValidator" SetFocusOnError="True" 
                                ValidationExpression="[a-zA-Z .]{1,50}"  
                        ValidationGroup="v">Enter only Characters</asp:RegularExpressionValidator>
                </p>
                
               <div style="padding-left:145px">
        <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button" 
             ValidationGroup="v" TabIndex="19" OnClick="btnSearch_Click" />
                
    </div>
            </fieldset>
             <div>

                 <p style="text-align:center">
                    <asp:GridView ID="grdMembers" runat="server" AutoGenerateColumns="False"  BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="2px" CellPadding="3" CellSpacing="3" Width="100%">
              <Columns>
               
                  <asp:BoundField HeaderText="MemberID"  DataField="MemberId" ControlStyle-Width="5%" >
                  
<ControlStyle Width="5%"></ControlStyle>
                  </asp:BoundField>
                  
                   <asp:BoundField HeaderText="Name" DataField="Name" ControlStyle-Width="35%" >
<ControlStyle Width="35%"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="RoleinIfocus" HeaderText="Role" ControlStyle-Width="15%" >
<ControlStyle Width="15%"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="ContactNo" HeaderText="Contact No" ControlStyle-Width="10%" >
<ControlStyle Width="10%"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="EmailID" HeaderText="Email" ControlStyle-Width="15%" >
                  
<ControlStyle Width="15%"></ControlStyle>
                  </asp:BoundField>
                  
                  <asp:BoundField DataField="City" HeaderText="City" ControlStyle-Width="10%" >
<ControlStyle Width="10%"></ControlStyle>
                  </asp:BoundField>
                  <asp:BoundField DataField="DateofJoin" HeaderText="Doj" ControlStyle-Width="10%" >
                 
<ControlStyle Width="10%"></ControlStyle>
                  </asp:BoundField>
                 
              </Columns>
             

             
              <HeaderStyle BackColor="#607D8B" Font-Bold="True" ForeColor="White" Height="25px" />
             
              
                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Height="30px" />
              <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
              <SortedAscendingCellStyle BackColor="#FFF1D4" />
              <SortedAscendingHeaderStyle BackColor="#B95C30" />
              <SortedDescendingCellStyle BackColor="#F1E5CE" />
              <SortedDescendingHeaderStyle BackColor="#93451F" />
          </asp:GridView>
                </p>
             </div>  
         
    </form>
</body>
</html>
