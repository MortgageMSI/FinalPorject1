<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.3/angular.min.js"></script>

<script>
angular.module('myApp').directive('equals', function() {
	  return {
	    restrict: 'A', // only activate on element attribute
	    require: '?ngModel', // get a hold of NgModelController
	    link: function(scope, elem, attrs, ngModel) {
	      if(!ngModel) return; // do nothing if no ng-model

	      // watch own value and re-validate on change
	      scope.$watch(attrs.ngModel, function() {
	        validate();
	      });

	      // observe the other value and re-validate on change
	      attrs.$observe('equals', function (val) {
	        validate();
	      });

	      var validate = function() {
	        // values
	        var val1 = ngModel.$viewValue;
	        var val2 = attrs.equals;

	        // set validity
	        ngModel.$setValidity('equals', val1 === val2);
	      };
	    }
	  }
	});


</script>

<link rel="stylesheet" type="text/css" href="css/main.css"/>
</head>
<body ng-app>

<div >

<input type="password" ng-model="value1" equals="{{value2}}" required>
<input type="password" ng-model="value2" equals="{{value1}}" required>
</div>




<div>${info}</div>
<a href="<c:url value='/j_spring_security_logout'/>">Logout</a>
<div>
Deactivate your account? <a href="deactivate.html" class="btn btn-black">Deactivate</a>
</div>
<div>
<a href="cpassword.html" class="btn btn-black">Change Password</a>
</div>
</body>
</html>