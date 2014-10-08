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

<title>System Message</title>

</head>
<body>
<div class="jumbotron" style="opacity: 0.7;">
<h2><font color="green">${title}</font></h2>


    <div>
      <a href="main.html" class="btn btn-black"  style="font-size: large;">Go back to main page</a>
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