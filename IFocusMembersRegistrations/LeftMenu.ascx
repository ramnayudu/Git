<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="LeftMenu.ascx.cs" Inherits="IFocusMembersRegistrations.LeftMenu" %>

<link href="//maxcdn.bootstrapcdn.com/font-awesome/4.2.0/css/font-awesome.min.css" rel="stylesheet">
<link href="css/LeftmenuCss.css" rel="stylesheet" />
<div class="nav-side-menu">
    <div class="brand"></div>
    <i class="fa fa-bars fa-2x toggle-btn" data-toggle="collapse" data-target="#menu-content"></i>
  
        <div class="menu-list">
  
            <ul id="menu-content" class="menu-content collapse out">
                <li>
                  <a href="#">
                  <i class="fa fa-dashboard fa-lg"></i>Dashboard
                  </a>
                </li>
                <li>
                  <a href="#">
                  <i class="fa fa-users fa-lg"></i> Users
                  </a>
                </li>
                <li  data-toggle="collapse" data-target="#products" class="collapsed active">
                  <a href="#"><i class="fa fa-gift fa-lg"></i>Search By<span class="arrow"></span></a>
                </li>
                <ul class="sub-menu collapse" id="products">
                    <li class="active"><a href="#">Name</a></li>
                    <li><a href="#">Role</a></li>
                    <li><a href="#">Cluster</a></li>
                    <li><a href="#">Contact No</a></li>
                    <li><a href="#">Qualification</a></li>
                    <li><a href="#">Skills</a></li>
                    <li><a href="#">Current City</a></li>
                    <li><a href="#">Home Town</a></li>
                    <li><a href="#">Profession</a></li>
                  
                </ul>


            
              <%--   <li>
                  <a href="#">
                  <i class="fa fa-user fa-lg"></i> Profile
                  </a>
                  </li>--%>

                 
            </ul>
     </div>
</div>
