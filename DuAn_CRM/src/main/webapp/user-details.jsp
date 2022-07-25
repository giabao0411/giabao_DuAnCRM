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
                        <h4 class="page-title">Member Details</h4>
                    </div>
                </div>
                <!-- /.row -->
                <!-- .row -->
                <div class="row">
                    <div class="col-md-4 col-xs-12">
                        <div class="white-box">
                            <div class="user-bg"> <img width="100%" alt="user" src="LayoutCrm/plugins/images/large/img1.jpg">
                                <div class="overlay-box">
                                    <div class="user-content">
                                        <a href="javascript:void(0)"><img src="LayoutCrm/plugins/images/users/genu.jpg"
                                                class="thumb-lg img-circle" alt="img"></a>
                                        <h4 class="text-white">Nguyễn Văn Tèo</h4>
                                        <h5 class="text-white">info.teo@gmail.com</h5>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                    </div>
                    <div class="col-md-8 col-xs-12">
                        <!-- BEGIN THỐNG KÊ -->
	<div class="row">
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-danger">20%</h3>
                    </div>
                    <div class="col-xs-12">
						<i data-icon="E" class="linea-icon linea-basic"></i>
						<h5 class="text-muted vb text-center">NOT STARTED</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-danger" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 20%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-megna">50%</h3>
                    </div>
                    <div class="col-xs-12">
						<i class="linea-icon linea-basic" data-icon="&#xe01b;"></i>
						<h5 class="text-muted vb text-center">PROCESSING</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-megna" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 50%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
		<!--col -->
		<div class="col-lg-4 col-md-4 col-sm-12 col-xs-12">
			<div class="white-box">
				<div class="col-in row">
					<div class="col-xs-12">
						<h3 class="counter text-right m-t-15 text-primary">30%</h3>
                    </div>
                    <div class="col-xs-12">
						<i class="linea-icon linea-basic" data-icon="&#xe00b;"></i>
						<h5 class="text-muted vb text-center">COMPLETE</h5>
					</div>
					<div class="col-md-12 col-sm-12 col-xs-12">
						<div class="progress">
							<div class="progress-bar progress-bar-primary" role="progressbar"
								aria-valuenow="40" aria-valuemin="0" aria-valuemax="100"
								style="width: 30%"></div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- /.col -->
	</div>
	<!-- END THỐNG KÊ -->

                    </div>
                </div><br />
                <!-- /.row -->
                <!-- BEGIN DANH SÁCH CÔNG VIỆC -->
                <h4>Job List</h4>
                <div class="row">
                    <div class="col-md-4">
                        <div class="white-box">
                            <h3 class="box-title">Unfulfilled</h3>
                            <div class="message-center">
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>System Analysis</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">End: 17/07/2022</span>
                                    </div>
                                </a> 
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>Design database</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">ENd: 17/07/2022</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="white-box">
                            <h3 class="box-title">Processing</h3>
                            <div class="message-center">
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>System Analysis</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">End: 17/07/2022</span>
                                    </div>
                                </a> 
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>Design database</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">End: 17/07/2022</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-4">
                        <div class="white-box">
                            <h3 class="box-title">Accomplished</h3>
                            <div class="message-center">
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>System Analysis</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">End: 17/07/2022</span>
                                    </div>
                                </a> 
                                <a href="#">
                                    <div class="mail-contnet">
                                        <h5>Design database</h5>
                                        <span class="mail-desc"></span>
                                        <span class="time">Start: 05/07/2022</span>
                                        <span class="time">End: 17/07/2022</span>
                                    </div>
                                </a>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- END DANH SÁCH CÔNG VIỆC -->
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