<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<html ng-app>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.16/angular.min.js"></script>
    <link href="<c:url value='/css/calculation-form.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet"/>
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap-theme.min.css">
    <link href="<c:url value='/bootstrap-3.2.0-dist/css/bootstrap-responsive.min.css'/>" rel="stylesheet"/>
       <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    	google.load("visualization", "1", {packages:["corechart"]});
    	google.load("visualization", "1", {packages:["table"]});
    </script>

	<title>Mortgage Calculator</title>

<style>
/*
Back to top button 
*/
#back-top {
	position: fixed;
	bottom: 30px;
	margin-left: 1090px;
}

#back-top a {
	width: 108px;
	display: block;
	text-align: center;
	font: 11px/100% Arial, Helvetica, sans-serif;
	text-transform: uppercase;
	text-decoration: none;
	color: #bbb;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}

#back-top a:hover {
	color: #000;
}
/* arrow icon (span tag) */
#back-top span {
	width: 108px;
	height: 108px;
	display: block;
	margin-bottom: 7px;
	background: #ddd url(up-arrow.png) no-repeat center center;
	/* rounded corners */
	-webkit-border-radius: 15px;
	-moz-border-radius: 15px;
	border-radius: 15px;
	/* background color transition */
	-webkit-transition: 1s;
	-moz-transition: 1s;
	transition: 1s;
}

#back-top a:hover span {
	background-color: #777;
}
</style>


<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.3.0-rc.3/angular.min.js"></script>

<script>
	var username=$(username);
	$(document).ready(function() {

		// hide #back-top first
		$("#back-top").hide();

		// fade in #back-top
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 100) {
					$('#back-top').fadeIn();
				} else {
					$('#back-top').fadeOut();
				}
			});

			// scroll body to 0px on click
			$('#back-top a').click(function() {
				$('body,html').animate({
					scrollTop : 0
				}, 200);
				return false;
			});
		});

	});
</script>
	
</head>
<body>

<div>
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
				<form class="navbar-form navbar-right">
					
					<button type="button" class="btn btn-default dropdown-toggle" 
					id="dropdown1" data-toggle="dropdown">
						<span class="glyphicon glyphicon-user"></span>
						${username}
						<span class="caret"></span>
					</button>
						<ul class="dropdown-menu">
							<li><a href="#" data-toggle="modal" data-target="#myModal1">Change Password</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal2">Deactivate Account</a></li>
							<li><a href="#" data-toggle="modal" data-target="#myModal3">Delete User</a></li>
							<li class="divider"></li>
							<li><a class="btn btn-black" href="<c:url value="/j_spring_security_logout" />">Logout</a></li>
						</ul>
				</form>
			</div>
		</div>
	</nav>
	
	<div class="modal fade" id="myModal1" tabindex="-1" role="dialog"
		aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-hidden="true">&times;</button>
					<h4 class="modal-title">Change Password</h4>
				</div>

				<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form id="cpasswordForm" method="post" novalidate action="cpassword.html" name="cpassword" class="form-horizontal">
						<div class="form-group">
							<label class="col-md-3 control-label">Old Password</label>
							<div class="col-md-5">
								<input type="password" name="j_opassword" ng-model="user.opassword" ng-minlength="3" ng-maxlength="10" required id="j_opassword" class="input-huge"/>
							<span style="color:red" ng-show="cpassword.j_opassword.$dirty && cpassword.j_opassword.$error.required">Password is required</span>
        		        	<span style="color:red" ng-show="cpassword.j_opassword.$dirty && cpassword.j_opassword.$error.minlength">Password should have length of 3-10</span>
        		        	<span style="color:red" ng-show="cpassword.j_opassword.$dirty && cpassword.j_opassword.$error.maxlength">Password should have length of 3-10</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">New Password</label>
							<div class="col-md-5">
								<input type="password" name="j_npassword" ng-model="user.npassword" ng-minlength="3" ng-maxlength="10" required id="j_npassword" class="input-huge"/>
								<span style="color:red" ng-show="cpassword.j_npassword.$dirty && cpassword.j_npassword.$error.required">Password is required</span>
        		        		<span style="color:red" ng-show="cpassword.j_npassword.$dirty && cpassword.j_npassword.$error.minlength">Password should have length of 3-10</span>
        		        		<span style="color:red" ng-show="cpassword.j_npassword.$dirty && cpassword.j_npassword.$error.maxlength">Password should have length of 3-10</span>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Confirm Password</label>
							<div class="col-md-5">								
								<input type="password" name="j_cnpassword" ng-model="user.cnpassword" ng-minlength="3" ng-maxlength="10" required id="j_cnpassword" class="input-huge"/>
							<span style="color:red" ng-show="cpassword.j_cnpassword.$dirty && cpassword.j_cnpassword.$error.required">Password is required</span>
        		        	<span style="color:red" ng-show="cpassword.j_cnpassword.$dirty && cpassword.j_cnpassword.$error.minlength">Password should have length of 3-10</span>
        		        	<span style="color:red" ng-show="cpassword.j_cnpassword.$dirty && cpassword.j_cnpassword.$error.maxlength">Password should have length of 3-10</span>
							<span id="errormessage6" style="display: none; color:red;">Password does not match</span>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3">
							<button type="button" class="btn btn-default" 
								data-dismiss="modal">Close</button>
	        				<button type="button" ng-disabled="cpassword.$invalid" class="btn btn-primary" 
	        					id="cpassword">Confirm</button>
	        				</div>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Deactivate Account, You can always change your mind!</h4>
	      		</div>
	      		<div class="modal-body">
					<!-- The form is placed inside the body of modal -->
					<form id="deactivateForm" method="post" action="deactivate.html" name="deactivate" class="form-horizontal">
						<div class="form-group">
							<label class="col-md-3 control-label">Username</label>
							<div class="col-md-5">
								<input type="text" name="j_dusername" id="j_dusername" class="input-huge"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Email</label>
							<div class="col-md-5">
								<input type="text" name="j_demail" id="j_demail" class="input-huge"/>
							</div>
						</div>
						<div class="form-group">
							<label class="col-md-3 control-label">Password</label>
							<div class="col-md-5">
								<input type="password" name="j_dpassword" id="j_dpassword" class="input-huge"/>
							</div>
						</div>
						<div class="form-group">
							<div class="col-md-5 col-md-offset-3">
							<button type="button" class="btn btn-default" 
								data-dismiss="modal">Close</button>
	        				<button type="button" class="btn btn-primary" 
	        					id="deactivate">Deactivate</button>
	        				</div>
						</div>
					</form>
				</div>
	    	</div>
	  	</div>
	</div>
	
	
	
	<div class="modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Delete User</h4>
	      		</div>
	      		<div class="modal-body">
	      			<form action="delete.html" novalidate name="delete" method="post" id="deleteForm" class="form">
	      				<div class="body">
	      					<!-- Email -->
        		        	<label>Email</label>
        		        	<input type="email" name="j_demail1" ng-model="user.demail1" required id="j_demail1" class="input-huge"/>
	      					<br />
                            	<span style="color:red" ng-show="delete.j_demail1.$dirty && delete.j_demail1.$error.required">Email is required</span>
	                            <span style="color:red" ng-show="delete.j_demail1.$dirty && delete.j_demail1.$error.email">Email is not valid</span>
	                            <span id="errormessage4" style="display: none; color:red;">User cannot find</span>
	                            <span id="errormessage5" style="display: none; color:green;">User deleted</span>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" ng-disabled="delete.$invalid" class="btn btn-primary" id="delete">Confirm Delete</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
	
	
	<!-- Main body -->
	<div class="container" onload="init();" role="main">
		<div class="jumbotron">
			<!-- Add Stock Form -->
			<div class="wrapper"><!-- id="register-wraper" -->
        			<h3>Estimate Closing Costs</h3>
        			<form action="calculate.html" method="post" id="calculateForm" class="form">
	        			<div class="table-responsive">
	        				<table class="table table-striped table-hover">
	        					
	        					<tr>
	        					<!-- class="span2" -->
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(0);">Loan Amount</label></td>
	        						<td><input id="loan_amount" name="loan_amount" class="input-small" type="text"/></td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(1);">Down Pay</label></td>
        		        			<td>
        		        				<select id="down_payment" name="down_payment" class="selectpicker input-medium" data-style="btn-info">
        		        					<option value="0.05">5%</option>
        		        					<option value="0.10">10%</option>
        		        					<option value="0.15">15%</option>
        		        					<option value="0.20">20%</option>
        		        					<option value="0.25">25%</option>
        		        				</select>
        		        			</td>
	        					</tr>
	        					<tr>
	        					<td>
	        					<label class="input-small" onclick="testMessageBox(event);" 
	        					onmouseover="setMsgAndTitle(2);">Loan Term</label>
	        					
	        					</td>
        		        			<td>
        		        				<select id="loanTerm" name="loanTerm" class="selectpicker input-medium" data-style="btn-info">
        		        					<option id="loanTerm_30" value="30">30 Years</option>
        		        					<option id="loanTerm_20" value="20">20 Years</option>
        		        					<option id="loanTerm_15" value="15">15 Years</option>
        		        				</select>
        		        			</td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" 
	        					onmouseover="setMsgAndTitle(3);">Loan Type</label></td>
	        					<td>
        		        				<select id="loanType" name="loanType" class="selectpicker input-medium" data-style="btn-info">
        		        					<option id="loanType_fixed_rate" value="0">Fixed rate</option>
        		        					<option id="loanType_5_Year_ARM" value="-60">5-year ARM</option>
        		        					<option id="loanType_7_Year_ARM" value="-84">7-year ARM</option>
        		        					<option id="loanType_10_Year_ARM" value="-120">10-year ARM</option>
        		        				</select>
        		        			</td>
	        					
	        					</tr>
	        				

										
									

	        					<tr id="armTitle"><td colspan="4">Arm Options</td></tr>
	        					<tr id="armBody">
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(4);">Expected Adjustment</label></td>
	        						<td><input type="text" class="input-small" name="expected_adjustment" id="expected_adjustment"/>%</td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(5);">Interest Gap</label></td>
	        						<td><input type="text" name="rate_gap" id="rate_gap" class="input-small"/>%</td>
	        					</tr>
	        					<tr id="armBody1">
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(0);">Loan Extra</label></td>
	        						<td><input id="loan_extra" name="loan_extra" class="input-small" type="text"/></td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(0);">Term</label></td>
	        						<td><input id="loan_term" name="loan_term" class="input-small" type="text"/></td>
	        					</tr>
	        				</table>
	        			</div>
        		        <div class="footer">
        		        	<p id="loan_amount_error" class="error" style="display: none;"></p>
        		        	<p id="expected_adjustment_error" class="error" style="display: none;"></p>
        		        	<p id="rate_gap_error" class="error" style="display: none;"></p>
        		        	<a class="btn btn-danger" href="main.html">Reset</a>
        		            <a class="btn btn-success" id="calculate">Calculate</a>
        		        </div>
	        		</form>
	        	</div>
			<!-- End of Add Stock Form -->
		</div>
		<div class="jumbotron">
			<!-- Show Stock Information -->
			<h3>Show Result</h3>
			<div class="wrapper"><!-- id="register-wraper" -->
        		<section id="accordion">
        			<a href="#_" class="expandcollapse btn btn-mini btn-primary pull-right" state="0">+ Expand All</a>
        			<ul class="nav nav-tabs" id="tabFAQ">
        				<li class="active"><a href="#GQ" data-toggle="tab" state="0">Detailed Results</a></li>
    				</ul>
    				<div class="tab-content" id="faqContent">
      					<div class="tab-pane active" id="GQ">
        					<div class="accordion" id="generalQuestions">					
          						<div class="accordion-group">
            						<div class="accordion-heading clearfix">          
                						<a class="accordion-toggle category pull-left" data-toggle="collapse" data-parent="#parent" href="#category1">Total Payment</a>
										<div data-toggle="collapse" data-parent="#parent" href="#category1" class="head-height">&nbsp;</div>
            						</div><!--/accordion-heading-->
						            <div id="category1" class="accordion-body collapse">
						              	<div id="total_pie" class="insideDiv"></div>
						            </div><!--/Apparel End-->
          						</div>
					          	<div class="accordion-group">
					            	<div class="accordion-heading clearfix">				                	
					                	<a class="accordion-toggle category pull-left" data-toggle="collapse" data-parent="#parent" href="#category2">Annual Schedule</a>
					                	<div data-toggle="collapse" data-parent="#parent" href="#category2" class="head-height">&nbsp;</div>
					                </div><!--/accordion-heading-->
					             	<div id="category2" class="accordion-body collapse">
					             		<div id="annual_table" class="insideDiv"></div>		              					           
					            	</div>
					          	</div>
					          	<div class="accordion-group">
					          		<div class="accordion-heading clearfix">
					                	<a class="accordion-toggle category pull-left" data-toggle="collapse" data-parent="#parent" href="#category3">Monthly Schedule</a>
					                	<div data-toggle="collapse" data-parent="#parent" href="#category3" class="head-height">&nbsp;</div>
					                </div><!--/accordion-heading-->
					             	<div id="category3" class="accordion-body collapse">
					             		<div id="monthly_table" class="insideDiv"></div>
					             		<div id="monthly_chart" class="insideDiv"></div>
					            	</div>
					          	</div>
        					</div>
      					</div>
    				</div>
				</section>
        	</div>
        	
        	
		</div>
		
		
	</div>
	
	
	<p id="back-top">
		<a href="#top"><span></span>Back to Top</a>
	</p>
</div>	
	
    <script src="<c:url value='/js/jquery-1.11.0.js'/>"></script>
    <script type="text/javascript">
    	$(document).ready(function(){
    		if ("<c:out value='${param.login_error}'/>" != "") {
			  	alert("Login failed. Please check your username and password.");
			}
    	});
    </script>
    <script src="<c:url value='/js/formValidation.js'/>"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
    <script src="<c:url value='/js/backstretch.min.js'/>"></script>
    <script src="<c:url value='/js/typica-login.js'/>"></script>
    <script src="<c:url value='/js/formValidation.js'/>"></script>
    <script src="<c:url value='/js/popup.js'/>"></script>
    <script src="<c:url value='/js/calculation-form.js'/>"></script>
</body>
</html>