<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="IFocusMembersRegistrations.Search" EnableEventValidation="false" %>


<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajax" %>
<!DOCTYPE  html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
<head runat="server">
    <title>Search Members</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="css/default.css" rel="stylesheet" type="text/css" />

    <link href="css/AdminLTE.min.css" rel="stylesheet" />

    <link href="css/bootstrap.min.css" rel="stylesheet" />
    <%--    <link href="css/select2.min.css" rel="stylesheet" />--%>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" />
    <!-- Ionicons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css" />

    <style type="text/css">
        .auto-style3 {
            width: 100%;
        }
    </style>
    <!-- jQuery 2.2.3 -->
    <script type="text/javascript" src="scripts/jquery-2.2.3.min.js"></script>
    <script type="text/javascript" src="scripts/bootstrap.min.js"></script>
    <script type="text/javascript" src="scripts/app.min.js"></script>
    <%--<script type="text/javascript" src="scripts/select2.full.min.js"></script>--%>
    <!-- Bootstrap 3.3.6 -->




    <script type="text/javascript">
        $(".linkbtn").click(function () {
            $(".linkbtn").removeClass("highlighted");
            $(this).addClass("highlighted");
        });

    </script>
    <link href="css/SearchCSS.css" rel="stylesheet" />


    <script type="text/javascript">
        $(document).ready(function () {
            ShowImagePreview();
        });
        // Configuration of the x and y offsets
        function ShowImagePreview() {
            xOffset = -20;
            yOffset = 40;

            $("a.preview").hover(function (e) {
                this.t = this.title;
                this.title = "";
                var c = (this.t != "") ? "<br/>" + this.t : "";
                $("body").append("<p id='preview'><img src='" + this.href + "' alt='Image preview' />" + c + "</p>");
                $("#preview")
                    .css("top", (e.pageY - xOffset) + "px")
                    .css("left", (e.pageX + yOffset) + "px")
                    .fadeIn("slow");
            },

                function () {
                    this.title = this.t;
                    $("#preview").remove();
                });

            $("a.preview").mousemove(function (e) {
                $("#preview")
                    .css("top", (e.pageY - xOffset) + "px")
                    .css("left", (e.pageX + yOffset) + "px");
            });
        };

        function ConfirmationBox(username) {
            var result = confirm('Are you sure you want to delete ' + username + ' Details');
            if (result) {
                return true;
            }
            else {
                return false;
            }
        }

    </script>
</head>
<body>

    <form id="form1" runat="server" class="search" style="        background-color: #FFFFFF">


        <p style="padding-left: 990px; color: #0189D1; font-weight: bold">
            Welcome
            <asp:Label ID="lblUser" runat="server"></asp:Label>
            &nbsp;&nbsp;,
            <asp:LinkButton ID="lnkLogout" runat="server" Font-Bold="True" ForeColor="#0189D1" CssClass="simple" OnClick="lnkLogout_Click">Logout</asp:LinkButton>
        </p>
        <p align="center">

            <img src="img/Ifocus.jpg" alt="Ifocus" width="300" height="180" align="middle" />
        </p>


        <div class="box box-primary">
            <div class="box-header with-border">
                <h3 class="box-title">Select2</h3>

                <div class="box-tools pull-right">
                    <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i></button>

                </div>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
                <div class="row">
                    <div class="col-md-2">
                        <label class="label label-primary  md">Search:</label>
                        
                    </div>
                    <div class="col-md-2">
                        <label>Unique Id</label>   
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtUniqueId" runat="server" CssClass="xs" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                          <ajax:AutoCompleteExtender runat="server" ID="AutoCompleteExtender1" TargetControlID="txtUniqueId" UseContextKey="false"
                                MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="50" ServiceMethod="GetUniqueIds">
                            </ajax:AutoCompleteExtender>
                    </div>
                    <div class="col-md-2">
                       <label>Phone No</label>   
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtPhoneNoevent" runat="server" CssClass="xs" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <ajax:AutoCompleteExtender runat="server" ID="AutoCompleteExtender2" TargetControlID="txtPhoneNoevent" UseContextKey="false"
                                MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="50" ServiceMethod="GetPhoneNumbers">
                            </ajax:AutoCompleteExtender>
                    </div>
                    <div class="col-md-2">
                       <label>Name</label>   
                    </div>
                    <div class="col-md-3">
                        <asp:TextBox ID="txtNameevent" runat="server" CssClass="xs" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <ajax:AutoCompleteExtender runat="server" ID="AutoCompleteExtender3" TargetControlID="txtNameevent" UseContextKey="false"
                                MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="50" ServiceMethod="GetNames">
                            </ajax:AutoCompleteExtender>
                    </div>
                    <div class="col-md-2">
                       <label>Surname</label>   
                    </div>
                    <div class="col-md-3" style="width:11%">
                        <asp:TextBox ID="txtSurnameEvent" runat="server" CssClass="xs" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        <ajax:AutoCompleteExtender runat="server" ID="AutoCompleteExtender4" TargetControlID="txtSurnameEvent" UseContextKey="false"
                                MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="50" ServiceMethod="GetSurnames">
                            </ajax:AutoCompleteExtender>
                    </div>
                    
                    <div class="col-md-2" style="width:200px">
                        <asp:Button runat="server" CssClass="btn btn-primary btn-xs" Text="Search" ID="btnSearchEvent"/>
                        <asp:Button runat="server" CssClass="btn btn-primary btn-xs" Text="Quick Reg" ID="Button2"/>
                          
                    </div>
                                       
                    </div>
                <br />
                <div class="row">
                    <div class="col-md-2">

                        
                    </div>

                    <div class="col-md-2">
                        <label>Event Name</label>  
                    </div>
                    <div class="col-md-3" style="width:11%">
                        <asp:TextBox ID="TextBox3" runat="server" CssClass="xs" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                    </div>
                    <div class="col-md-2">
                        <asp:Button runat="server" CssClass="btn btn-primary btn-xs" Text="Check-in" ID="Button1"/>
                    </div>
    
    

                </div>
         
        </div>


        <div id="divDownload" runat="server">
            <fieldset class="row1">
                <legend>Registration
                </legend>
                <p style="padding-left: 150px">
                    <asp:Button ID="btnRegistration" Text="Registration Form" runat="server" BackColor="#607D8B"
                        Font-Bold="True" Font-Size="15px" ForeColor="White"
                        Height="30px" OnClick="btnRegistration_Click" />

                    <asp:Button ID="btExcelCompleteData" Text="Download All Members Data"
                        runat="server" BackColor="#607D8B" Visible="true"
                        Font-Bold="True" Font-Size="15px" ForeColor="White" Width="200px" Height="30px" OnClick="btExcelCompleteData_Click" />



                    <asp:Button ID="btnCorrections" Text="Corrections"
                        runat="server" BackColor="#607D8B" Visible="true"
                        Font-Bold="True" Font-Size="15px" ForeColor="White" Width="190px" Height="30px" OnClick="btnCorrections_Click" />


                </p>


            </fieldset>
        </div>

        <p style="padding-left: 15px">
            <asp:Label ID="Label1" runat="server" Text="Search Members" Font-Bold="False" Font-Size="20px"></asp:Label>
        </p>




        <fieldset class="row1">

            <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
            <div>


                <table class="auto-style3" style="font-size: 12px">
                    <tr>
                        <td style="padding-left: 15px" class="auto-style5" colspan="4">
                            <span style="text-align: center; font-size: 13px; font-weight: bold; padding-left: 270px">
                                <asp:Label ID="lblMsg" runat="server" Visible="false" ForeColor="red">Select any Search Field</asp:Label>&nbsp;&nbsp;
                <asp:Label ID="lblhiddenExportbtn" runat="server" Text="true" Visible="false"></asp:Label>&nbsp;
                <asp:Label ID="lblConnectiontimeout" runat="server" Text="60" Visible="false"></asp:Label>&nbsp;
                <asp:Label ID="lblPagesize" runat="server" Text="30" Visible="false"></asp:Label>
                                &nbsp;
                                   <asp:Label ID="lblCurrentPageId" runat="server"></asp:Label>
                            </span>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px" class="auto-style5">MemberId</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtMemberId" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" MaxLength="10"></asp:TextBox>


                        </td>
                        <td class="auto-style5">&nbsp;</td>
                        <td class="auto-style5">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px" class="auto-style5">
                            <br />

                            Name 
                    
                        </td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtname" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>

                            <ajax:AutoCompleteExtender runat="server" ID="autocompname" TargetControlID="txtname" UseContextKey="false"
                                MinimumPrefixLength="1" EnableCaching="false" CompletionSetCount="1" CompletionInterval="50" ServiceMethod="GetNames">
                            </ajax:AutoCompleteExtender>

                        </td>
                        <td class="auto-style5">Phone No</td>
                        <td class="auto-style5">
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" MaxLength="10"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="auto-style7"></td>
                        <td class="auto-style9">

                            <asp:RegularExpressionValidator ID="regname"
                                runat="server" ControlToValidate="txtname" Display="Dynamic"
                                ErrorMessage="RegularExpressionValidator" SetFocusOnError="True"
                                ValidationExpression="[a-zA-Z .]{1,50}"
                                ValidationGroup="v" ForeColor="Red" Font-Size="12px">Enter only Characters</asp:RegularExpressionValidator>

                        </td>
                        <td class="auto-style7"></td>
                        <td class="auto-style7">
                            <asp:RegularExpressionValidator ID="regphone" runat="server" ErrorMessage="Enter 10 digits Contact No" ControlToValidate="txtPhone" Display="Dynamic" SetFocusOnError="True" ValidationExpression="[0-9]{10}" ValidationGroup="v" Font-Size="12px" ForeColor="Red"></asp:RegularExpressionValidator>

                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">Cluster</td>
                        <td class="auto-style10">

                            <asp:DropDownList ID="ddlCluster" runat="server" TabIndex="13" Width="250px" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Science & IT Technology</asp:ListItem>
                                <asp:ListItem Value="2">Management & Finance</asp:ListItem>
                                <asp:ListItem Value="3">Arts & Literature</asp:ListItem>
                                <asp:ListItem Value="4">Life Sciences</asp:ListItem>
                                <asp:ListItem Value="5">Other</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td>Current City</td>
                        <td>
                            <asp:TextBox ID="txtCurrentCity" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style10">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">Role in ifocus</td>
                        <td class="auto-style10">

                            <asp:DropDownList ID="ddlRoles" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" TabIndex="10" Width="250px">
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

                        </td>
                        <td>Home Town</td>
                        <td>
                            <asp:TextBox ID="txtHomeTown" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style10">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px" class="auto-style6">Qualification</td>
                        <td class="auto-style8">
                            <asp:TextBox ID="txtQualification" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long"></asp:TextBox>
                        </td>
                        <td class="auto-style6">Profession</td>
                        <td class="auto-style6">
                            <asp:DropDownList ID="ddlProfession" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long" TabIndex="12" Width="250px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Student</asp:ListItem>
                                <asp:ListItem Value="2">Professional</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td>&nbsp;</td>
                        <td class="auto-style10">&nbsp;</td>
                        <td>&nbsp;</td>
                        <td>&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">Current Location</td>
                        <td class="auto-style11">
                            <%--<asp:TextBox ID="txtBloodGroup" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long" MaxLength="5"></asp:TextBox>--%>

                            <asp:TextBox ID="txtCurrentLocation" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long" MaxLength="50"></asp:TextBox>

                        </td>
                        <td class="auto-style4">ifocus Branch</td>
                        <td class="auto-style4">
                            <asp:TextBox ID="txtifocusBranch" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long"></asp:TextBox>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">&nbsp;</td>
                        <td class="auto-style11">

                            <%--<asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ErrorMessage="Enter Correct Format" ControlToValidate="txtBloodGroup" Display="Dynamic" SetFocusOnError="True" ValidationExpression="(A|B|AB|O)[+-]" ValidationGroup="v" ForeColor="Red"></asp:RegularExpressionValidator>--%>
             
                        </td>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">Blood Group</td>
                        <td class="auto-style11">

                            <asp:DropDownList ID="ddlBloodGroup" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">A+</asp:ListItem>
                                <asp:ListItem Value="2">A-</asp:ListItem>
                                <asp:ListItem Value="3">B+</asp:ListItem>
                                <asp:ListItem Value="4">B-</asp:ListItem>
                                <asp:ListItem Value="5">AB+</asp:ListItem>
                                <asp:ListItem Value="6">AB-</asp:ListItem>
                                <asp:ListItem Value="7">O+</asp:ListItem>
                                <asp:ListItem Value="8">O-</asp:ListItem>
                            </asp:DropDownList>

                        </td>
                        <td class="auto-style4">Gender</td>
                        <td class="auto-style4">
                            <%--<asp:TextBox ID="txtGender" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long" MaxLength="6"></asp:TextBox>--%>
                            <asp:DropDownList ID="ddlGender" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">Male</asp:ListItem>
                                <asp:ListItem Value="2">FeMale</asp:ListItem>
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">&nbsp;</td>
                        <td class="auto-style11">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                        <td class="auto-style4">&nbsp;</td>
                    </tr>
                    <tr>
                        <td style="padding-left: 15px">Year</td>
                        <td class="auto-style11">

                            <asp:DropDownList ID="ddlYear" runat="server" CssClass="long" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="1">2000</asp:ListItem>
                                <asp:ListItem Value="2">2001</asp:ListItem>
                                <asp:ListItem Value="3">2002</asp:ListItem>
                                <asp:ListItem Value="4">2003</asp:ListItem>
                                <asp:ListItem Value="5">2004</asp:ListItem>
                                <asp:ListItem Value="6">2005</asp:ListItem>
                                <asp:ListItem Value="7">2006</asp:ListItem>
                                <asp:ListItem Value="8">2007</asp:ListItem>
                                <asp:ListItem Value="9">2008</asp:ListItem>
                                <asp:ListItem Value="10">2009</asp:ListItem>
                                <asp:ListItem Value="11">2010</asp:ListItem>
                                <asp:ListItem Value="12">2011</asp:ListItem>
                                <asp:ListItem Value="13">2012</asp:ListItem>
                                <asp:ListItem Value="14">2013</asp:ListItem>
                                <asp:ListItem Value="15">2014</asp:ListItem>
                                <asp:ListItem Value="16">2015</asp:ListItem>
                                <asp:ListItem Value="17">2016</asp:ListItem>
                                <asp:ListItem Value="18">2017</asp:ListItem>
                                <asp:ListItem Value="19">2018</asp:ListItem>
                                <asp:ListItem Value="20">2019</asp:ListItem>
                                <asp:ListItem Value="21">2020</asp:ListItem>

                            </asp:DropDownList>

                        </td>
                        <td class="auto-style4">Sapthaswa</td>
                        <td class="auto-style4">
                            <asp:DropDownList ID="ddlSapthaswa" runat="server" BorderColor="Gray" BorderStyle="Solid" BorderWidth="1px" CssClass="long" TabIndex="12" Width="250px">
                                <asp:ListItem Value="0">--Select--</asp:ListItem>
                                <asp:ListItem Value="Y">Yes</asp:ListItem>
                                <asp:ListItem Value="N">No</asp:ListItem>
                            </asp:DropDownList></td>
                    </tr>
                </table>


            </div>
            <br />
            <p style="padding-left: 400px">

                <asp:Button ID="btnSearch" runat="server" Text="Search" CssClass="button"
                    ValidationGroup="v" TabIndex="19" OnClick="btnSearch_Click" ForeColor="White" />
                &nbsp;&nbsp;
                    
                  <asp:Button ID="btnReset" runat="server" Text="Reset" CssClass="button" OnClick="btnReset_Click" ForeColor="White" />


            </p>
        </fieldset>



        <table class="auto-style3">
            <tr>
                <td align="right" width="80%"></td>
                <td align="right" width="20%" style="padding-left: 150px">
                    <asp:Button ID="btnExport" runat="server" Text="Export Filtered Data to Excel" OnClick="btnExport_Click" BackColor="#607D8B" Font-Bold="True" ForeColor="White" Visible="false" Height="35px" Width="180px" />
                </td>
            </tr>
            <tr>
                <td style="text-align: center" colspan="2">
                    <asp:UpdatePanel ID="UpdatePanel1" runat="server">

                        <ContentTemplate>
                            <div id="tooltip">
                                <asp:Image ID="imgphoto" runat="server" Width="100px" Height="100px" Visible="false" />
                            </div>
                            <asp:GridView ID="grdMembers" runat="server" AutoGenerateColumns="False" PageSize="30" BackColor="#DEBA84" BorderColor="#DEBA84" BorderStyle="None" BorderWidth="1px" CellPadding="1" CellSpacing="1" Width="100%" DataKeyNames="Memberid" OnRowDataBound="grdMembers_RowDataBound">
                                <Columns>

                                    <asp:TemplateField HeaderText="S.No">
                                        <ItemTemplate>
                                            <%#Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField HeaderText="MemberId">
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lbtnPhotos" runat="server" Text='<%#Eval("MemberId") %>' OnClick="ShowImage" ForeColor="#A0453C" Font-Underline="True"></asp:LinkButton>

                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <%--  <asp:BoundField HeaderText="MemberID" DataField="MemberId">

                        <ControlStyle Width="5%"></ControlStyle>
                    </asp:BoundField>--%>

                                    <asp:BoundField HeaderText="Name" DataField="Name"></asp:BoundField>
                                    <asp:BoundField DataField="RoleinIfocus" HeaderText="Role"></asp:BoundField>
                                    <asp:BoundField DataField="ContactNo" HeaderText="Contact No"></asp:BoundField>
                                    <asp:BoundField DataField="EmailID" HeaderText="Email"></asp:BoundField>

                                    <asp:BoundField DataField="City" HeaderText="City" Visible="false"></asp:BoundField>
                                    <asp:BoundField DataField="DateofJoin" HeaderText="Date of Join"></asp:BoundField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkViewDetails" runat="server" OnClick="lnkViewDetails_Click" Font-Bold="True">View Details</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkEdit" runat="server" OnClick="lnkEdit_Click" Font-Bold="True">Edit</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>

                                    <asp:TemplateField>
                                        <ItemTemplate>
                                            <asp:LinkButton ID="lnkdelete" runat="server" OnClick="lnkdelete_Click">Delete</asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>

                                <EmptyDataTemplate>
                                    <asp:Label ID="lblEmptyMessage" Text="" runat="server" Font-Size="14px" ForeColor="#990000" />

                                </EmptyDataTemplate>

                                <HeaderStyle BackColor="#607D8B" Font-Bold="True" ForeColor="White" Height="25px" Font-Size="12px" />
                                <%--  <PagerSettings Mode="NextPreviousFirstLast" FirstPageText="First" LastPageText="Last" NextPageText="Next" PreviousPageText="Previous" />--%>
                                <%-- <PagerSettings PageButtonCount="10"  FirstPageText="First" LastPageText="Last"/> --%>
                                <PagerStyle ForeColor="#8C4510" HorizontalAlign="Center" Font-Size="14px" />
                                <RowStyle BackColor="#FFF7E7" ForeColor="#8C4510" Height="30px" Font-Size="12px" />
                                <SelectedRowStyle BackColor="#738A9C" Font-Bold="True" ForeColor="White" />
                                <SortedAscendingCellStyle BackColor="#FFF1D4" />
                                <SortedAscendingHeaderStyle BackColor="#B95C30" />
                                <SortedDescendingCellStyle BackColor="#F1E5CE" />
                                <SortedDescendingHeaderStyle BackColor="#93451F" />
                            </asp:GridView>

                            <%-- <div class="pagenavi">--%>
                            <asp:DataList CellPadding="5" RepeatDirection="Horizontal" runat="server" ID="dlPager" CssClass="gridview"
                                OnItemCommand="dlPager_ItemCommand">
                                <ItemTemplate>
                                    <asp:LinkButton Enabled='<%#Eval("Enabled") %>' runat="server" ID="lnkPageNo" Text='<%#Eval("Text") %>' CommandArgument='<%#Eval("Value") %>' CommandName="PageNo" CssClass="linkbtn"></asp:LinkButton>
                                </ItemTemplate>
                            </asp:DataList>
                            <%-- </div>--%>
                        </ContentTemplate>
                    </asp:UpdatePanel>

                </td>
            </tr>

        </table>
        <p style="text-align: center">
        </p>

        <p style="text-align: center; font-size: 13px;">
            &nbsp;
        </p>





    </form>

</body>
</html>
