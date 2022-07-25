<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href='<c:url value="LayoutCrm/plugins/images/favicon.png"></c:url>'>
    <title>403 - Forbidden</title>
    <!-- Bootstrap Core CSS -->
    <link href='LayoutCrm/bootstrap/dist/css/bootstrap.min.css' rel="stylesheet">
    <!-- animation CSS -->
    <link href='LayoutCrm/css/animate.css' rel="stylesheet">
    <!-- Custom CSS -->
    <link href='LayoutCrm/css/style.css' rel="stylesheet">
    <!-- color CSS -->
    <link href='LayoutCrm/css/colors/blue.css' id="theme" rel="stylesheet">
</head>
<body>
	<div class="preloader">
        <div class="cssload-speeding-wheel"></div>
    </div>
    <section id="wrapper" class="error-page">
        <div class="error-box">
            <div class="error-body text-center">
                <h1>403</h1>
                <h3 class="text-uppercase">You do not have access !</h3>
                <p class="text-muted m-t-30 m-b-30">YOU SEEM TO BE TRYING TO FIND HIS WAY HOME</p>
                <a href="<%=request.getContextPath() + "/home"%>" class="btn btn-info btn-rounded waves-effect waves-light m-b-40">On The Homepage</a> </div>
            <footer class="footer text-center">2022 © Pixel Admin.</footer>
        </div>
    </section>
    <!-- jQuery -->
    <script src='LayoutCrm/plugins/bower_components/jquery/dist/jquery.min.js'></script>
    <!-- Bootstrap Core JavaScript -->
    <script src='LayoutCrm/bootstrap/dist/js/bootstrap.min.js'></script>
    <script type="text/javascript">
    $(function() {
        $(".preloader").fadeOut();
    });
    </script>
</body>
</html>