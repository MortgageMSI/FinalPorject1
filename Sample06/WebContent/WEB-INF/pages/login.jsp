<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Styles -->
	<!-- 
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"/>
     -->
    <link rel="icon" href="<c:url value='/images/icon.ico'/>" type="icon" />
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    
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
					<div class="form-group" >
						<input type="text" class="form-control" placeholder="Username" name="j_username" id="j_username">
						<input type="password" class="form-control" placeholder="Password" name="j_password" id="j_password">
					</div>
					<button type="submit" class="btn btn-default">
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
							<li><a href="#" data-toggle="modal" data-target="#myModal4">Sign up</a></li>
						</ul>
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
	
	<div class="container">
        <div class="row">
        	<div class="span6">
        		<div class="register-info-wraper">
        			<div id="register-info">
        				<h1>You are about 30 seconds away from using this awesome Mortgage Calculator. Good choice!</h1>
        				<ul dir="rtl">
        					<li>User Friendly, E-Z to Use, Clean UI</li>
        					<li>That's why this app is so awesome</li>
        					<li>!So register, like, right NOW</li>
        					<li>Or don't, who cares, LOL</li>
        					<li>Anyway, you have to register before use...</li>
        				</ul>
        			</div>
        		</div>
        	</div>

        	<div class="span6">
        		<div id="register-wraper">
        		    <form action="register.html" method="post" id="registerForm" class="form">
        		        <h3>Register to <span class="blue">M.C by Jason</span></h3>
        		    
        		        <div class="body">
        		        	<!-- Username -->
        		        	<label>Username</label>
        		        	<input type="text" name="j_rusername" id="j_rusername" class="input-medium"/>
        		        	<label id="usernameErrorInfo" style="display: none;" class="alert"></label>

        		        	<!-- email -->
        		        	<label>E-mail</label>
        		        	<input type="text" name="j_remail" id="j_remail" class="input-huge"/>
        		        	<label id="emailErrorInfo" style="display: none;" class="alert">Please input a valid email address.</label>
        		        	<br />
        		        	<!-- password -->
        		        	<label>Password</label>
        		        	<input type="password" name="j_rpassword1" id="j_rpassword1" class="input-huge"/>
        		  			<label id="passwordErrorInfo" style="display: none;" class="alert">Password length: 8-20.</label>
        		  			<br />
							<!-- confirm password -->
        		        	<label>Confirm Password</label>
        		        	<input type="password" name="j_rpassword2" id="j_rpassword2" class="input-huge"/>
        		        	<label id="passwordNotMatchErrorInfo" style="display: none;" class="alert">Password does not match.</label>
        		        	<br />
        		        </div>
        		    
        		        <div class="footer">
        		            <label class="checkbox inline">
        		                <input type="checkbox" id="inlineCheckbox1" value="option1"> I agree to something I will never read
        		            </label><br/>
        		            <button type="submit" class="btn btn-success">Register</button>
        		        </div>
        		    </form>
        		</div>
        	</div>
        </div>
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
	      			<form action="rusername.html" method="post" id="retrievalUsernameForm" class="form">
	      				<div class="body">
	      					<!-- Email -->
        		        	<label>Email</label>
        		        	<input type="text" name="j_email" id="j_email" class="input-huge"/>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="retrievalUsername">Retrival Username</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
    	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Reset Password</h4>
	      		</div>
	      		<div class="modal-body">
	      			<form action="forgetpassword.html" method="post" id="resetPwdForm" class="form">
	      				<div class="body">
	      					<!-- Username -->
        		        	<label>Username</label>
        		        	<input type="text" name="j_username1" id="j_username1" class="input-huge"/>
        		        	<label>Email</label>
        		        	<input type="text" name="j_email1" id="j_email1" class="input-huge"/>
        		        	<label>Firstname</label>
        		        	<input type="text" name="j_firstname1" id="j_firstname1" class="input-huge"/>
        		        	<label>Lastname</label>
        		        	<input type="text" name="j_lastname1" id="j_lastname1" class="input-huge"/>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="resetPwd">Reset Password</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	    	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Reactivate</h4>
	      		</div>
	      		<div class="modal-body">
	      			<form action="reactivate.html" method="post" id="reactivateForm" class="form">
	      				<div class="body">
	      					<!-- Username -->
        		        	<label>Username</label>
        		        	<input type="text" name="j_username2" id="j_username2" class="input-huge"/>
        		        	<label>Email</label>
        		        	<input type="text" name="j_email2" id="j_email2" class="input-huge"/>
        		        	<label>Password</label>
        		        	<input type="password" name="j_password2" id="j_password2" class="input-huge"/>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="reactivate">reactivate</button>
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
	      			<form action="signup.html" method="post" id="signupForm" class="form">
	      				<div class="body">
	      					<!-- Username -->
        		        	<label>Username</label>
        		        	<input type="text" name="j_username3" id="j_username3" class="input-huge"/>
        		        	<label>Email</label>
        		        	<input type="text" name="j_email3" id="j_email3" class="input-huge"/>
        		        	<label>Password</label>
        		        	<input type="password" name="j_password3" id="j_password3" class="input-huge"/>
        		        	<label>First Name</label>
        		        	<input type="text" name="j_firstname3" id="j_firstname3" class="input-huge"/>
        		        	<label>Last Name</label>
        		        	<input type="text" name="j_lastname3" id="j_lastname3" class="input-huge"/>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="signup">signup</button>
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