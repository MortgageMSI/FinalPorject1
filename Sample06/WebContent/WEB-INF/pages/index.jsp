<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<html>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<!-- Styles -->
    <link href="<c:url value='/css/bootstrap.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/bootstrap-3.1.1-dist/css/bootstrap-responsive.min.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/typica-login.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/calculation-form.css'/>" rel="stylesheet"/>
    <link href="<c:url value='/css/popup.css'/>" rel="stylesheet"/>
    <link rel="icon" href="<c:url value='/images/icon.ico'/>" type="icon" />
    
    <script type="text/javascript" src="https://www.google.com/jsapi"></script>
    <script type="text/javascript">
    	google.load("visualization", "1", {packages:["corechart"]});
    	google.load("visualization", "1", {packages:["table"]});
    </script>
    
	<title>Mortgage Calculator</title>
</head>
<body>
	<!-- <div id="loading" class="loadingimg" style="display:none;"><img src="<c:url value='/images/loading.gif'/>"/></div> -->
	
	<div class="navbar navbar-fixed-top">
		<div class="navbar-inner">
			<div class="container">
				<a class="brand" href="main.html"><img src="<c:url value='/images/mortgage-calculator-logo.png'/>" alt="Mortgage Calculator Logo"></a>
				<div class="userWindow">
					<button class="btn btn-primary btn-lg" data-toggle="modal" data-target="#myModal">${username}</button>
					<a class="btn btn-black" href="<c:url value="/j_spring_security_logout" />" > Logout</a>
				</div>
			</div>
		</div>
	</div>
    
    <div class="container" onload="init();">
        <div class="row">
        	<!-- Input part -->
        	<div class="span6">
        		<div class="wrapper" id="literalResultWrapper" style="display:none;">
	        		<h5 style="padding:2px;" id="literalResultText"></h5>
	        	</div>
        		<div class="wrapper"><!-- id="register-wraper" -->
        			<h5 style="padding:2px;"><span class="blue">Estimate your closing costs</span><br/>Our closing costs estimator can help you estimate your total closing expenses. When working with the calculator, please remember the dollar amounts displayed arent guaranteed, and what you actually pay may be different. The estimates you receive are for illustrative and educational purposes only.</h5>
        			<form action="calculate.html" method="post" id="calculateForm" class="form">
	        			<div class="body">
	        				<table class="table table-striped table-hover">
	        					<tr><td colspan="4">* required</td></tr>
	        					<tr align="center">
	        					<!-- class="span2" -->
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(0);">Loan Amount*</label></td>
	        						<td><input id="loan_amount" name="loan_amount" class="input-small" type="text"/></td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(1);">Down Pay*</label></td>
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
	        					<tr><td colspan="4"><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(2);">Loan Term*</label></td></tr>
	        					<tr align="center">
        		        			<td><input name="loanTerm" id="loanTerm_30" type="radio" required="true" checked="checked" value="30">
                						<label>30 years</label></td>
                					<td><input name="loanTerm" id="loanTerm_20" type="radio" value="20">
                						<label>20 years</label></td>
                					<td><input name="loanTerm" id="loanTerm_15" type="radio" value="15">
                						<label>15 years</label></td>
                					<td></td>
	        					</tr>
	        					<tr><td colspan="4"><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(3);">Loan Type*</label></td></tr>
	        					<tr align="center">
	        						<td><input name="loanType" id="loanType_fixed_rate" type="radio"  checked="checked" value="Fixed">
	        							<label>Fixed rate</label></td>
									<td><input name="loanType" id="loanType_5_Year_ARM" type="radio"   value="5/1 ARM">
										<label>5-year ARM</label></td>
									<td><input name="loanType" id="loanType_7_Year_ARM" type="radio"   value="7/1 ARM">
										<label>7-year ARM</label></td>
									<td><input name="loanType" id="loanType_10_Year_ARM" type="radio"   value="10/1 ARM">
										<label>10-year ARM</label></td>
	        					</tr>
	        					<tr id="armTitle"><td colspan="4">Arm Options*</td></tr>
	        					<tr id="armBody">
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(4);">Expected Adjustment</label></td>
	        						<td><input type="text" class="input-small" name="expected_adjustment" id="expected_adjustment"/>%</td>
	        						<td><label class="input-small" onclick="testMessageBox(event);" onmouseover="setMsgAndTitle(5);">Interest Gap</label></td>
	        						<td><input type="text" name="rate_gap" id="rate_gap" class="input-small"/>%</td>
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
        	</div>
        	
        	<!-- Result Part -->
        	<div class="span6">
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
    </div>
	<!-- Modal -->
	<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
		<div class="modal-dialog">
	    	<div class="modal-content">
	      		<div class="modal-header">
	        		<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
	        		<h4 class="modal-title" id="myModalLabel">Change Password</h4>
	      		</div>
	      		<div class="modal-body">
	      			<form action="changepwd.html" method="post" id="changePwdForm" class="form">
	      				<div class="body">
	      					<!-- password -->
        		        	<label>Password</label>
        		        	<input type="password" name="j_rpassword1" id="j_rpassword1" class="input-huge"/>
        		  			<label id="passwordErrorInfo" style="display: none;" class="alert">Password length: 8-20.</label>
        		  			
							<!-- confirm password -->
        		        	<label>Confirm Password</label>
        		        	<input type="password" name="j_rpassword2" id="j_rpassword2" class="input-huge"/>
        		        	<label id="passwordNotMatchErrorInfo" style="display: none;" class="alert">Password does not match.</label>
	      				</div>
	      			</form>
	      		</div>
	      		<div class="modal-footer">
	        		<button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
	        		<button type="button" class="btn btn-primary" id="changepwd">Save changes</button>
	      		</div>
	    	</div>
	  	</div>
	</div>
    <!-- JavaScript files
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    <script src="<c:url value='/js/jquery-1.11.0.js'/>"></script>
    <script src="<c:url value='/bootstrap-3.1.1-dist/js/bootstrap.min.js'/>"></script>
    <script src="<c:url value='/js/backstretch.min.js'/>"></script>
    <script src="<c:url value='/js/typica-login.js'/>"></script>
    <script src="<c:url value='/js/formValidation.js'/>"></script>
    <script src="<c:url value='/js/popup.js'/>"></script>
    <script src="<c:url value='/js/calculation-form.js'/>"></script>
    
</body>
</html>