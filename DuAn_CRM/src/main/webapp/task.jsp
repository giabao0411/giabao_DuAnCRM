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
    <link rel="stylesheet" href="https://cdn.datatables.net/1.10.19/css/jquery.dataTables.min.css">
    <!-- animation CSS -->
    <link href="LayoutCrm/css/animate.css" rel="stylesheet">
    <!-- Custom CSS -->
    <link href="LayoutCrm/css/style.css" rel="stylesheet">
    <!-- color CSS -->
    <link href="LayoutCrm/css/colors/blue-dark.css" id="theme" rel="stylesheet">
    <link rel="stylesheet" href="LayoutCrm/css/custom.css">
</head>
<body>
	<script>
		function show() {		
			var data = event.target.parentElement.parentElement.children;
			document.getElementById("id").value = data[1].innerHTML;
			document.getElementById("taskname").value = data[2].innerHTML;
		}
	</script>
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
                        <h4 class="page-title">Task List</h4>
                    </div>
                    <div class="col-lg-9 col-sm-8 col-md-8 col-xs-12 text-right">
                        <a href="<%=request.getContextPath() + "/task-add"%>" class="btn btn-sm btn-success">Add New</a>
                    </div>
                    <!-- /.col-lg-12 -->
                </div>
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <div class="table-responsive">
                                <table class="table" id="example">
                                    <thead>
                                        <tr>
                                            <th>STT</th>
                                            <th style="display:none;">id</th>
                                            <th>Task name</th>
                                            <th>Project name</th>
                                            <th>FullName</th>
                                            <th>Start Days</th>
                                            <th>End Days</th>
                                            <th>Action</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                      <c:forEach items="${listtask}" var="item">
                                        <tr id="${item.id}">
                                        	<td>#</td>                          
                                        	<td style="display:none;">${item.id}</td>
											<td class="row">${item.taskname}</td>
											<td class="row" >${item.name}</td>
											<td class="row">${item.fullname}</td>
											<td class="row">${item.start_date}</td>
											<td class="row">${item.end_date}</td>
                                            <td>
												<input type="button" class="btn btn-sm btn-primary" data-toggle="modal" data-target="#modal-edit" value="Update" onclick="show()" />
                                                <form action="<%=request.getContextPath() + "/task-delete" %>" method="get" class="btn">
													<input type="hidden" value="${item.id}" name="delete"/>
													<button type="submit" class="btn btn-sm btn-danger">Delete</button>
												</form>                                               
                                            </td>
                                        </tr>
                                    </c:forEach>  
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- /.container-fluid -->
            <footer class="footer text-center"> 2022 &copy; cybersoft.com </footer>
        </div>
        <!-- /#page-wrapper -->
    </div>
    <div id="modal-edit" class="modal fade" tabindex="-1" role="dialog"
		aria-hidden="true" data-backdrop="false">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-body">
					<div class="px-3">
						<form action="<%=request.getContextPath() + "/task-update" %>" method="post" name="form">
							<div class="form-group">
								
									<input class="form-control" type="hidden" name="id" id="id">
							</div>
							<div class="form-group">
								
									<label for="taskname">Task name</label> <input class="form-control"
										 type="text" name="taskname" id="taskname"/>
							</div>
							<div class="form-group">
                                    <label class="user_id">FullName</label>
                                    <div class="col-md-12">
                                        <select id="user_id" name="user_id" data-toggle="select" class="form-control form-control-line">
                                            <c:forEach items="${listUsers}" var="item">
                                            	<option value="${item.id}">${item.fullname}</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                </div>							
							<div class="form-group">
                                <label class="job_id">Project name</label>
                                    <div class="col-md-12">
	                                   <select id="job_id" name="job_id" data-toggle="select" class="form-control form-control-line">
	                                            <c:forEach items="${listJobs}" var="item">
	                                            	<option value="${item.id}">${item.name}</option>
	                                            </c:forEach>
	                                     </select>
                                    </div>
                                </div>
							<div class="form-group text-center">
								<button class="btn btn-primary" type="submit">Update</button>
								<button type="button" class="btn btn-danger" data-dismiss="modal">Back</button>
							</div>
						</form>
					</div>
				</div>
				<!-- // END .modal-body -->
			</div>
			<!-- // END .modal-content -->
		</div>
		<!-- // END .modal-dialog -->
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
    <script src="https://cdn.datatables.net/1.10.19/js/jquery.dataTables.min.js"></script>
    <!--Wave Effects -->
    <script src="LayoutCrm/js/waves.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="LayoutCrm/js/custom.min.js"></script>
    <script>
        $(document).ready(function () {
            $('#example').DataTable();
        });
    </script>
</body>
</html>