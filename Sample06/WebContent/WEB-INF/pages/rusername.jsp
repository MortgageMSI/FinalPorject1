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
		$("#emailReq").hide();
		var email= $("#j_email").val();
		 if (email.length==0) {
			$("#emailReq").show();
			return false;
		} 
		return true;
	}
</script>
</head>
<body>
<h2><font color="green">Type in the email, your username will be send to your email</font></h2>
<!-- Alerts for missing form info  --> 

<div class="alert" style="display:none;" id="emailReq">
	<p>Email is required</p>
</div>

<!-- Form -->
<form action="rusername.html" method="post" id="loginForm">
	<table>
		<tr>
			<td>Email Address: </td>
			<td><input type="text" name="j_email" id="j_email"/></td>
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
       <a href="login.html" class="btn btn-black">Back</a>
    </div>

</body>
</html>