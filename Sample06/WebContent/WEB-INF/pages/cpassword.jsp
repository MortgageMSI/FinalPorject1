<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<script>
	$(document).ready(function() {
		$("#loginForm").on("submit", validateForm);
	});
	function validateForm() {
		$("#usernameReq").hide();
		$("#emailReq").hide();
		$("#firstnameReq").hide();
		$("#lastnameReq").hide();	
		var userid = $("#j_name").val();
		var email= $("#j_email").val();
		var firstname= $("#j_opassword").val();
		var lastname= $("#j_npassword").val();
		 if (username.length==0) {
			$("#nameReq").show();
			return false;
		} else if (firstname.length==0) {
			$("#firstnameReq").show();
			return false;
		} else if (lastname.length==0) {
			$("#lastnameReq").show();
			return false;
		} else if (email.length==0) {
			$("#emailReq").show();
			return false;
		} 
		return true;
	}
</script>
</head>
<body>
<h2><font color="green">Fill in the form below to change password</font></h2>
<!-- Alerts for missing form info  --> 

<div class="alert" style="display:none;" id="usernameReq">
	<p>UserName is required</p>
</div>
<div class="alert" style="display:none;" id="emailReq">
	<p>Email is required</p>
</div>
<div class="alert" style="display:none;" id="firstnameReq">
	<p>Current Password is required</p>
</div>
<div class="alert" style="display:none;" id="lastnameReq">
	<p>New Password is required</p>
</div>

<!-- Form -->
<form action="cpassword.html" method="post" id="loginForm">
	<table>
		<tr>
			<td>UserName: </td>
			<td><input type="text" name="j_name" id="j_name"/></td>
		</tr>
				<tr>
			<td>Email: </td>
			<td><input type="text" name="j_email" id="j_email"/></td>
		</tr>
				<tr>
			<td>Current Password: </td>
			<td><input type="password" name="j_opassword" id="j_opassword"/></td>
		</tr>
				<tr>
			<td>New Password: </td>
			<td><input type="password" name="j_npassword" id="j_npassword"/></td>
		</tr>


		<tr>
			<td></td>
			<td>
				<input type="reset" value="Clear"/>
				<input type="submit" value="Submit"/>
			</td>
		</tr>
	</table>
</form>
    <div>
      <a href="main.html" class="btn btn-black">Go Back</a>
    </div>

</body>
</html>