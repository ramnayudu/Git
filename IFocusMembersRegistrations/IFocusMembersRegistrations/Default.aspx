<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs"  Inherits="MastersDataManagement.Login" %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Login</title>
<link href="css/Login.css" rel="stylesheet" type="text/css" media="all"/>
<!-- Custom Theme files -->
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1"/>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="keywords" content="Plans & Pricing Tables Responsive, Login form web template, Sign up Web Templates, Flat Web Templates, Login signup Responsive web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
<!--web-fonts-->
<link href='//fonts.googleapis.com/css?family=PT+Sans+Narrow:400,700' rel='stylesheet' type='text/css'/>
<!--web-fonts-->
</head>
<body>
    <div class="txt-center">
           </div>
    <form id="form1" runat="server">
        
    <div class="main">
        <div align="center" style="vertical-align:top">
						<img src="img/Ifocus.jpg" width="300" height="150" align="middle"/> <br /><br />
					</div>
                   
				<div class="login" style="border: 1px solid #C0C0C0">
					
					<h1>Login</h1>
					<div class="login-bottom">
					<form method="post">
                        <asp:Label ID="lblMsg" runat="server" ForeColor="#CC3300"></asp:Label>
						<input id="UserName" type="text" placeholder="Username" required=" " runat="server"/>					
						<input id="Password" type="password" class="password" placeholder="Password" required=" " runat="server"/>						
						
                        <asp:Button ID="btnsubmit" runat="server" Text="Login" OnClick="btnsubmit_Click" />
					</form>
					
					</div>
				</div>
			</div>
		<div class="footer">
			<p>&copy; 2016 IFocus Mission - All Rights Reserved </p>
		</div>
        </form>
    
</body>
</html>
