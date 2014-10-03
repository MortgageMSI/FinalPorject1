<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Styles -->
	<!-- 
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"/>
     -->
    <link rel="icon" href="<c:url value='/images/icon.ico'/>" type="icon" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.3/angular.min.js"></script>
    
    <link rel="stylesheet" href="//netdna.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link href="<c:url value='/css/typica-login.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/bootstrap-3.1.1-dist/css/bootstrap-responsive.min.css'/>" rel="stylesheet"/>
    
    
    
</head>
<body>

	<nav class="navbar navbar-inverse navbar-fixed-top">
		<div class="container">
			<div class="navbar-header">
				<button type="button" class="navbar-toggle collapsed"
					data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span> 
						<span class="icon-bar"></span>						
				</button>
				<a class="navbar-brand" href="#">Mortgage Calculator</a>
			</div>

			<div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
				<form class="navbar-form navbar-right" name="f" action="<c:url value='j_spring_security_check'/>" method="POST" id="login-form">
					<div class="form-group">
						<input type="text" class="form-control" placeholder="Username" name="j_username" id="j_username">
						<input type="password" class="form-control" placeholder="Password" name="j_password" id="j_password">
					</div>
					<button type="submit" class="btn btn-success">
						<span class="glyphicon glyphicon-user"></span>
						Sign-In
					</button>
					<!-- 
					<a class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal2">Forget Password?</a>
					
					<button type="submit" class="btn btn-default" data-toggle="modal" data-target="#myModal1">Register</button>
					-->
					<button class="btn btn-default dropdown-toggle" type="button" 
					id="dropdown1" data-toggle="dropdown">
						Account
					<span class="caret"></span></button>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" data-target="#myModal1">Forgot Username?</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal2">Forgot Password?</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal3">Reactivate Account</a></li>
							<li class="divider"></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal4">Register</a></li>
						</ul>
					<label style="color: #FFFFFF;"><input type="checkbox" name="_spring_security_remember_me" class="checkbox" checked="checked"/>	
	                Remember Me</label>			                                        
				</form>
			</div>
		</div>
	</nav>

	<div>
		<span style="display: block !important; width: 290px; text-align: center; font-family: sans-serif; font-size: 15px;">
		<a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:08540.1.99999&bannertypeclick=wu_bluestripes" title="Princeton, New Jersey Weather Forecast" 
		target="_blank">
		<img src="http://weathersticker.wunderground.com/weathersticker/cgi-bin/banner/ban/wxBanner?bannertype=wu_bluestripes&airportcode=KTTN&ForcedCity=Princeton&ForcedState=NJ&zip=08540&language=EN" 
		alt="Find more about Weather in Princeton, NJ" width="200" /></a>
		<br>
		<!-- 
		<a href="http://www.wunderground.com/cgi-bin/findweather/getForecast?query=zmw:08540.1.99999&bannertypeclick=wu_bluestripes" 
		title="Get latest Weather Forecast updates" 
		style="font-family: sans-serif; font-size: 12px" target="_blank">Click for weather forecast</a></span>
		 -->
	</div>
	
	
	
	
	
	<!-- Modal -->
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Retrieval Username</h4>
	      		</div>
	      		<div class="modal-body">
	      			<form action="rusername.html" novalidate name="rusername" method="post" id="retrievalUsernameForm" class="form">
	      				<div class="body">
	      					<!-- Email -->
        		        	<label>Email</label>
        		        	<input type="email" name="j_email" ng-model="user.email" required id="j_email" class="input-huge"/>
        		        	<br />
        		        	<span style="color:red" ng-show="rusername.j_email.$dirty && rusername.j_email.$error.required">Email is required</span>
        		        	<span style="color:red" ng-show="rusername.j_email.$dirty && rusername.j_email.$error.email">Email is not valid</span>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" ng-disabled="rusername.$invalid" class="btn btn-primary" id="retrievalUsername">Retrival Username</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
    
    <div class="modal fade" id="myModal2" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Reset Password</h4>
				</div>

				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form action="forgetpassword.html" novalidate name="forgetpassword" method="post" id="resetPwdForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-md-3 control-label">Username</label>
							<div class="col-md-5">
								<input type="text" name="j_username1" ng-model="user.username1" required ng-minlength="3" ng-maxlength="10" id="j_username1" class="input-huge"/>
							<br />
        		        	<span style="color:red" ng-show="forgetpassword.j_username1.$dirty && forgetpassword.j_username1.$error.required">Username is required</span>
        		        	<span style="color:red" ng-show="forgetpassword.j_username1.$dirty && forgetpassword.j_username1.$error.minlength">Username is too short</span>
        		        	<span style="color:red" ng-show="forgetpassword.j_username1.$dirty && forgetpassword.j_username1.$error.maxlength">Username is too long</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Email</label>
							<div class="col-md-5">
								<input type="email" name="j_email1" ng-model="user.email1" required id="j_email1" class="input-huge"/>
								        		        	<br />
        		        	<span style="color:red" ng-show="forgetpassword.j_email1.$dirty && forgetpassword.j_email1.$error.required">Email is required</span>
        		        	<span style="color:red" ng-show="forgetpassword.j_email1.$dirty && forgetpassword.j_email1.$error.email">Email is not valid</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">First Name</label>
							<div class="col-md-5">
								<input type="text" name="j_firstname1" ng-model="user.firstname1" required id="j_firstname1" class="input-huge"/>
								        		        	<br />
        		        	<span style="color:red" ng-show="forgetpassword.j_firstname1.$dirty && forgetpassword.j_firstname1.$error.required">Firstname is required</span>
        		     
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Last Name</label>
							<div class="col-md-5">
								<input type="text" name="j_lastname1" ng-model="user.lastname1" required id="j_lastname1" class="input-huge"/>
								        		        	<br />
        		        	<span style="color:red" ng-show="forgetpassword.j_lastname1.$dirty && forgetpassword.j_lastname1.$error.required">Firstname is required</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3">
							<button type="button" class="btn btn-default" 
								data-dismiss="modal">Close</button>
	        				<button type="button" ng-disabled="forgetpassword.$invalid" class="btn btn-primary" 
	        					id="resetPwd">Reset Password</button>
	        				</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Reactivate</h4>
				</div>

				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form action="reactivate.html" novalidate name="reactivate" method="post" id="reactivateForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-md-3 control-label">Username</label>
							<div class="col-md-5">
								<input type="text" name="j_username2" ng-model="user.username2" ng-minlength="3" ng-maxlength="10" required id="j_username2" class="input-huge"/>
							<br />
							<span style="color:red" ng-show="reactivate.j_username2.$dirty && reactivate.j_username2.$error.required">Username is required</span>
        		        	<span style="color:red" ng-show="reactivate.j_username2.$dirty && reactivate.j_username2.$error.minlength">Username is too short</span>
        		        	<span style="color:red" ng-show="reactivate.j_username2.$dirty && reactivate.j_username2.$error.maxlength">Username is too long</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Email</label>
							<div class="col-md-5">
								<input type="email" name="j_email2" ng-model="user.email2" required id="j_email2" class="input-huge"/>
							<br />
        		        	<span style="color:red" ng-show="reactivate.j_email2.$dirty && reactivate.j_email2.$error.required">Email is required</span>
        		        	<span style="color:red" ng-show="reactivate.j_email2.$dirty && reactivate.j_email2.$error.email">Email is not valid</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Password</label>
							<div class="col-md-5">
								<input type="password" name="j_password2" ng-model="user.password2" required ng-minlength="3" ng-maxlength="10" id="j_password2" class="input-huge"/>
							<br />	        		        	
							<span style="color:red" ng-show="reactivate.j_password2.$dirty && reactivate.j_password2.$error.required">Password is required</span>
        		        	<span style="color:red" ng-show="reactivate.j_password2.$dirty && reactivate.j_password2.$error.minlength">Password is too short</span>
        		        	<span style="color:red" ng-show="reactivate.j_password2.$dirty && reactivate.j_password2.$error.maxlength">Password is too long</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3">
							<button type="button" class="btn btn-default" 
								data-dismiss="modal">Close</button>
	        				<button type="button"  ng-disabled="reactivate.$invalid" class="btn btn-primary" 
	        					id="reactivate">Reactivate</button>
	        				</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>

	
	<div class="modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Sign Up, it's free and always will be</h4>
	      		</div>
	      		<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form action="signup.html" novalidate name="signup" method="post" id="signupForm" class="form-horizontal">
						<div class="form-group">
							<label class="col-md-3 control-label">Username</label>
							<div class="col-md-5">
								<input type="text" name="j_username3" ng-model="user.username3" ng-minlength="3" ng-maxlength="10" required id="j_username3" class="input-huge"/>															<br />
							<span style="color:red" ng-show="signup.j_username3.$dirty && signup.j_username3.$error.required">Username is required</span>
        		        	<span style="color:red" ng-show="signup.j_username3.$dirty && signup.j_username3.$error.minlength">Username should have length of 3-10</span>
        		        	<span style="color:red" ng-show="signup.j_username3.$dirty && signup.j_username3.$error.maxlength">Username should have length of 3-10</span>
        		        	<span id="errormessage" style="display: none; color:red;">Username already exists</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Email</label>
							<div class="col-md-5">
								<input type="email" name="j_email3" ng-model="user.email3" required id="j_email3" class="input-huge"/>
							<br />
        		        	<span style="color:red" ng-show="signup.j_email3.$dirty && signup.j_email3.$error.required">Email is required</span>
        		        	<span style="color:red" ng-show="signup.j_email3.$dirty && signup.j_email3.$error.email">Email is not valid</span>
        		        	<span id="errormessage1" style="display: none; color:red;">Email already exists</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Password</label>
							<div class="col-md-5">
								<input type="password" name="j_password3" ng-model="user.password3" required ng-minlength="3" ng-maxlength="10" id="j_password3" class="input-huge"/>
															<br />	        		        	
							<span style="color:red" ng-show="signup.j_password3.$dirty && signup.j_password3.$error.required">Password is required</span>
        		        	<span style="color:red" ng-show="signup.j_password3.$dirty && signup.j_password3.$error.minlength">Password should have length of 3-10</span>
        		        	<span style="color:red" ng-show="signup.j_password3.$dirty && signup.j_password3.$error.maxlength">Password should have length of 3-10</span>
							</div>
						</div>
						
						<div class="form-group">
							<label class="col-md-3 control-label">Confirm Password</label>
							<div class="col-md-5">
								<input type="password" name="j_cfpassword" ng-model="user.password4" required ng-minlength="3" ng-maxlength="10" id="j_cfpassword" class="input-huge"/>
							<br />	        		        	
							<span style="color:red" ng-show="signup.j_cfpassword.$dirty && signup.j_cfpassword.$error.required">Password is required</span>
        		        	<span style="color:red" ng-show="signup.j_cfpassword.$dirty && signup.j_cfpassword.$error.minlength">Password should have length of 3-10</span>
        		        	<span style="color:red" ng-show="signup.j_cfpassword.$dirty && signup.j_cfpassword.$error.maxlength">Password should have length of 3-10</span>
							<span id="errormessage2" style="display: none; color:red;">Password does not match</span>
							</div>
						</div>
						
						
						<div class="form-group">
							<label class="col-md-3 control-label">First Name</label>
							<div class="col-md-5">
								<input type="text" name="j_firstname3" ng-model="user.firstname3" required id="j_firstname3" class="input-huge"/>
																        		        	<br />
        		        	<span style="color:red" ng-show="signup.j_firstname3.$dirty && signup.j_firstname3.$error.required">Firstname is required</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Last Name</label>
							<div class="col-md-5">
								<input type="text" name="j_lastname3" ng-model="user.lastname3" required id="j_lastname3" class="input-huge"/>
																        		        	<br />
        		        	<span style="color:red" ng-show="signup.j_lastname3.$dirty && signup.j_lastname3.$error.required">Firstname is required</span>
							</div>
						</div>
						
						<div class="form-group">
							
							<div class="col-md-5">

        		        <span  id="errormessage3" style="display: none; color:red;">                 Please fix</span>

						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3">
							<button type="button" class="btn btn-default" 
								data-dismiss="modal">Close</button>
	        				<button type="button" ng-disabled="signup.$invalid" class="btn btn-success" 
	        					id="signup">Sign-Up</button>
	        				</div>
						</div>
					</form>
				</div>
	    	</div>
	  	</div>
	</div>
	
	
	<!-- 
    <footer class="white navbar-fixed-bottom">
      Don't have an account yet?  <a href="goRegister.html" class="btn btn-black">Register</a>
    </footer>
     -->
    <!-- "<c:url value='/goRegister.html'/>" -->
	<!-- JavaScript files
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/js/jquery-1.11.0.js'/>"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		if ("<c:out value='${param.login_error}'/>" != "") {
			  	alert("Login failed. Please check your username and password.");
			}
    	});
    </script>
    <script src="<c:url value='/js/formValidation.js'/>"></script>
    <script src="<c:url value='/bootstrap-3.1.1-dist/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/backstretch.min.js'/>"></script>
    <script src="<c:url value='/js/typica-login.js'/>"></script>
</body>
</html>