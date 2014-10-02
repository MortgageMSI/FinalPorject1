<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html >
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app="MyApp">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Hello Page</title>
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js">
</script>
<script>
angular.module('MyApp', []).
controller('MainCtrl', ['$scope', function($scope) {
  $scope.password;
  $scope.password_confirmation;
}]).
directive('sameAs', function() {
  return {
    require: 'ngModel',
    link: function(scope, elm, attrs, ctrl) {
      ctrl.$parsers.unshift(function(viewValue) {
        if (viewValue === scope[attrs.sameAs]) {
          ctrl.$setValidity('sameAs', true);
          return viewValue;
        } else {
          ctrl.$setValidity('sameAs', false);
          return undefined;
        }
      });
    }
  };
});
</script>
<script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.3/angular.min.js"></script>
<link rel="stylesheet" type="text/css" href="css/main.css"/>


<body ng-app='MyApp' ng-controller='MainCtrl' class='container'>
<div class='row span4'>
  <form name='form' autocomplete='off'>

    <div class='control-group'>
      <label for='password'>
        Password
      </label>
      <div class='controls'>
        <input type='password' id='password' required name='password' ng-model='password'>
        <span class='help-inline' ng-show='form.password.$valid'>
          <i class='icon-ok'></i>
        </span>
      </div>
    </div>

    <div class='control-group'>
      <label for='password_confirmation'>
        Confirm password
      </label>
      <div class='controls'>
        <input type='password' id='password_confirmation' required name='password_confirmation' same-as='password' ng-model='password_confirmation'>
        <span class='help-inline' ng-show='form.password_confirmation.$valid'>
          <i class='icon-ok'></i>
        </span>
      </div>
    </div>

    <div class='form-actions'>
      <button class='btn btn-large btn-primary' ng-disabled='!form.$valid'>Create account</button>
    </div>
  </form>
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