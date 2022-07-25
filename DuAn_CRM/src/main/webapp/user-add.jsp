<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="LayoutCrm/plugins/images/favicon.png">
    <title>Pixel Admin</title>
    <!-- Bootstrap Core CSS -->
    <link href="LayoutCrm/bootstrap/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Menu CSS -->
    <link href="LayoutCrm/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.css" rel="stylesheet">
    <!-- animation CSS -->
    <link href="LayoutCrm/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="LayoutCrm/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="LayoutCrm/css/colors/blue-dark.css" id="theme" rel="stylesheet">
</head>
<body>
<div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <div id="wrapper">
        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top m-b-0">
                <div class="navbar-header"> 
	                <a class="navbar-toggle hidden-sm hidden-md hidden-lg " href="javascript:void(0)" data-toggle="collapse" data-target=".navbar-collapse">
	                    <i class="fa fa-bars"></i>
	                </a>
	                <div class="top-left-part">
	                    <a class="logo" href="<%=request.getContextPath() + "/home"%>">
	                        <b>
	                            <img src="LayoutCrm/plugins/images/pixeladmin-logo.png" alt="home" />
	                        </b>
	                        <span class="hidden-xs">
	                            <img src="LayoutCrm/plugins/images/pixeladmin-text.png" alt="home" />
	                        </span>
	                    </a>
	                </div>
	                <ul class="nav navbar-top-links navbar-left m-l-20 hidden-xs">
	                    <li>
	                        <form role="search" class="app-search hidden-xs">
	                            <input type="text" placeholder="Search..." class="form-control"> 
	                            <a href="">
	                                <i class="fa fa-search"></i>
	                            </a>
	                        </form>
	                    </li>
	                </ul>
	                <ul class="nav navbar-top-links navbar-right pull-right">
	                    <li>
	                        <div class="dropdown">
	                            <a class="profile-pic dropdown-toggle" data-toggle="dropdown" href="#"> 
	                                <img src="LayoutCrm/plugins/images/users/varun.jpg" alt="user-img" width="36" class="img-circle" />
	                                <b class="hidden-xs">Cybersoft</b> 
	                            </a>
	                            <ul class="dropdown-menu">
	                                <li><a href="<%=request.getContextPath() + "/profile"%>">Personal Information</a></li>
	                                <li class="divider"></li>
	                                <li><a href="<%=request.getContextPath() + "/login"%>">Log Out</a></li>
	                            </ul>
	                        </div>
	                    </li>
	                </ul>
	            </div>
                <!-- /.navbar-header -->
                <!-- /.navbar-top-links -->
                <!-- /.navbar-static-side -->
            </nav>
        <!-- Left navbar-header -->
        <div class="navbar-default sidebar" role="navigation">
            <div class="sidebar-nav navbar-collapse slimscrollsidebar">
                <ul class="nav" id="side-menu">
                    <li style="padding: 10px 0 0;">
                        <a href="<%=request.getContextPath() + "/home"%>" class="waves-effect"><i class="fa fa-clock-o fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">Dashboard</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() + "/user-table"%>" class="waves-effect"><i class="fa fa-user fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">Member</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() + "/jobs-table"%>" class="waves-effect"><i class="fa fa-table fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">Project</span></a>
                    </li>
                    <li>
                        <a href="<%=request.getContextPath() + "/task"%>" class="waves-effect"><i class="fa fa-table fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">The Work</span></a>
                    </li>
                    <li>
                        <a href="blank.jsp" class="waves-effect"><i class="fa fa-columns fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">Blank Page</span></a>
                    </li>
                    <li>
                        <a href="404.jsp" class="waves-effect"><i class="fa fa-info-circle fa-fw"
                                aria-hidden="true"></i><span class="hide-menu">Error 404</span></a>
                    </li>
                </ul>
            </div>
        </div>
        <!-- Left navbar-header end -->
        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row bg-title">
                    <div class="col-lg-3 col-md-4 col-sm-4 col-xs-12">
                        <h4 class="page-title">Add New Member</h4>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-2 col-12"></div>
                    <div class="col-md-8 col-xs-12">
                        <div class="white-box">
                            <form class="form-horizontal form-material" action="<%=request.getContextPath() + "/user-add" %>" method="post">
                                <div class="form-group">
                                    <label class="col-md-12">FullName</label>
                                    <div class="col-md-12">
                                        <input id="fullname" name="fullname" type="text" placeholder="Enter Your FullName"
                                            class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label for="example-email" class="col-md-12">Email</label>
                                    <div class="col-md-12">
                                        <input id="email" name="email" type="email" placeholder="Enter Your Email"
                                            class="form-control form-control-line" name="example-email"
                                            id="example-email"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Password</label>
                                    <div class="col-md-12">
                                        <input id="password" name="password" type="password" value="password" class="form-control form-control-line">
                                    </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Number Phone</label>
                                    <div class="col-md-12">
                                        <input id="phone" name="phone" type="text" placeholder="Enter Your Phone"
                                            class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <label class="col-md-12">Address</label>
                                    <div class="col-md-12">
                                        <input id="address" name="address" type="text" placeholder="Enter Your Address"
                                            class="form-control form-control-line"> </div>
                                </div>
                                <div class="form-group">
                                    <div class="col-sm-12">
                                        <button type="submit" class="btn btn-success">Add User</button>
                                        <a href="<%=request.getContextPath() + "/user-table"%>" class="btn btn-primary" >Back</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                    <div class="col-md-2 col-12"></div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2022 &copy; cybersoft.com </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <!-- /#wrapper -->
    <!-- jQuery -->
    <script src="LayoutCrm/plugins/bower_components/jquery/dist/jquery.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="LayoutCrm/bootstrap/dist/js/bootstrap.min.js"></script>
    <!-- Menu Plugin JavaScript -->
    <script src="LayoutCrm/plugins/bower_components/sidebar-nav/dist/sidebar-nav.min.js"></script>
    <!--slimscroll JavaScript -->
    <script src="LayoutCrm/js/jquery.slimscroll.js"></script>
    <!--Wave Effects -->
    <script src="LayoutCrm/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="LayoutCrm/js/custom.min.js"></script>
</body>
</html>