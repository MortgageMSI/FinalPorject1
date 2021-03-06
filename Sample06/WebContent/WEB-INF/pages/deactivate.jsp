<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Deactivate Page</title>
<link rel="stylesheet" type="text/css" href="css/main.css"/>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script>
	$(document).ready(function() {
		if ("<c:out value='${param.login_error}'/>" != "") {
		  	$('#wrongCredentials').show();
		}
		$("#deactivate").on("click", loginValidation);	
	});

	function loginValidation() {
		$("#usernameAndPasswordReq").hide();
		$("#usernameReq").hide();
		$("#passwordReq").hide();   
		$("#wrongCredentials").hide();	
	  	if($("#j_username").val().length == 0 && $("#j_password").val().length == 0) {
	  		$("#usernameAndPasswordReq").show();
	  		return false;
	  	} else if ($("#j_username").val().length == 0) {
	  		$('#usernameReq').show();
	  		return false;
	  	} else if ($("#j_password").val().length == 0) {
	  		$("#passwordReq").show();
	  		return false;
	  	} else {
	  		return true;
	  	}
	}
</script>
</head>
<body>
<h1><font color="blue">Deactivate your account</font></h1>
<!-- Alerts for missing form info  --> 
<div class="alert" style="display:none;" id="usernameAndPasswordReq">
	<p>Username and password are required</p>
</div>

<div class="alert" style="display:none;" id="usernameReq">
	<p>Username is required</p>
</div>
<div class="alert" style="display:none;" id="passwordReq">
	<p>Password is required</p>
</div>
<div class="alert" id="wrongCredentials" style="display:none;">
	<p>The username or password supplied is incorrect</p>
</div>	
<!-- Login Form -->	
<form action="deactivate.html" method="POST" id="login-form">
	<table>
		<tr>
			<td>Username: </td>
			<td><input type="text" name="j_username" id="j_username"/></td>
		</tr>
		<tr>
			<td>Password: </td>
			<td><input type="password" name="j_password" id="j_password"/></td>
		</tr>
		<tr>
			<td></td>
			<td>
				<button type="reset">Clear</button>
				<button id="deactivate" type="submit">deactivate</button>
			</td>
		</tr>
	</table>		
</form>
    <div>
      Change your mind? <a href="main.html" class="btn btn-black">Go back</a>
    </div>
</body>
</html>