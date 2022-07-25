<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="icon" type="image/png" sizes="16x16" href="LayoutCrm/plugins/images/favicon.png">
<title>CRM_Login</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
	<style>
	body {
		  background-image: url('LayoutCrm/plugins/images/back2.jpg');
		  background-repeat: no-repeat;
		  background-attachment: fixed; 
		  background-size: 100% 100%;
		}
	</style>
</head>
<body>
<div class="container">
  <div class="row mt-5">
    <div class="col-md-5 m-auto mt-5">
      <h3 class="text-center">System Login</h3>
      <div class="p-4 border mt-4">
        <form action="<%=request.getContextPath() + "/home"%>" method="post">
            <div class="form-group">
              <label>Email</label>
              <input type="email" class="form-control" name="email" required="required">
            </div>
            <div class="form-group">
              <label>Password</label>
              <input type="password" class="form-control" name="password" required="required">
            </div>
            <button type="submit" class="btn btn-outline-light">Login</button>
          </form>
      </div>
      </div>
  </div>
</div>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</body>
</html>