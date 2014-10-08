<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    <link href="<c:url value='/css/calculation-form.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link href="<c:url value='/bootstrap-3.2.0-dist/css/bootstrap-responsive.min.css'/>" rel="stylesheet"/>

<title>Result Page</title>
</head>
<body>
<div class="jumbotron" style="opacity: 0.7;">
<h1><font color="green">${userInfo.message}</font></h1>
<h1><font color="green">Below is your information</font></h1>
<table width="200" border="1">
	<tr>
		<th>UserName</th>
		<th>password</th>
		<th>email</th>
		<th>firstname</th>
		<th>lastname</th>
		<th>authority</th>
		<th>enabled</th>
	</tr>
	<c:set var="user" value="${userInfo.user}"/>
		<tr>
			<td>${user.username}</td>
			<td>${user.password}</td>
			<td>${user.email}</td>
			<td>${user.firstname}</td>
			<td>${user.lastname}</td>
			<td>${user.authority}</td>
			<td>${user.enabled}</td>
		</tr>
</table>

    <div>
    	Go back and sign in <a href="main.html" class="btn btn-black">Sign in</a>
    </div>
</div>
    <script src="<c:url value='/js/jquery-1.11.0.js'/>"></script>
    <script src="<c:url value='/js/formValidation.js'/>"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="<c:url value='/js/backstretch.min.js'/>"></script>
    <script src="<c:url value='/js/typica-login.js'/>"></script>
    <script src="<c:url value='/js/popup.js'/>"></script>
</body>
</html>