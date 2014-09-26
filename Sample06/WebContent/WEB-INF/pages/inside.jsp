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

<body>
<div>This is an empty page, suppose to output data</div>
<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
<div>
Deactivate your account? <a href="deactivate.html" class="btn btn-black">Deactivate</a>
</div>
<div>
<a href="cpassword.html" class="btn btn-black">Change Password</a>
</div>
</body>
</html>