/**
 * 
 */
$(document).ready(function() {
	var username = $("#j_username3");
	var email = $("#j_email3");
	var password = $("#j_password3");
	var confirm_password = $("#j_cfpassword");
	var username1= $("#j_username1").val();
	// flag is used when checking whether username & email exists
	var flag = false;
	var flagEmail = false;
	// email validation string
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			
	// on blur
	username.blur(validateUsername);
	email.blur(validateEmail);
	//password.blur(validatePassword);
	confirm_password.blur(validateConfirmPassword);
			
	// on keyup
	//username.keyup(validateUsername);
	//email.keyup(validateEmail);
	//password.keyup(validatePassword);
	//confirm_password.keyup(validateConfirmPassword);
			
	$("#registerForm").submit(function(){
		if( validateUsername() && validateEmail() && validatePassword() && validateConfirmPassword() ){
			var r = confirm("Username and Email cannot be changed after registration. Do you want to continue?");
			return r;
		}		
		else
			return false;
	});
			
	function validateUsername(){
		// if length invalid
		if( username.val().length < 2 || username.val().length > 8){
//			$("#usernameErrorInfo").html("User name should contain more than 3 letters and up to 20 letters.");
//			$("#usernameErrorInfo").show();
//			username.removeClass("correct");
//			username.addClass("error");
			$("#errormessage").hide();
			falg = false;
			return false;
		}
		// if length valid
		else {
			//if (!flag){
				$.ajax({
					url: "checkExist.html",
					data: {
						username: username.val()
					},
					type: "get",
					async: false,
					timeout: 5000,
					success: function(msg){
						if(msg=="exist"){
//							$("#usernameErrorInfo").html("Username exists!");
//							$("#usernameErrorInfo").show();
//							username.removeClass("correct");
//							username.addClass("error");
							$("#errormessage").show();
							flag = false;
							return false;
						}
						else{
//							$("#usernameErrorInfo").hide();
//							username.removeClass("error");
//							username.addClass("correct");
							$("#errormessage").hide();
							flag = true;
							return true;
						}
					},
					error: function(){
						alert("Not able to connect to server");
						flag = false;
						return false;
					}
				});
			//}
			return true;
		}
	}
			
	function validateEmail(){
		if(!re.test(email.val())){
			$("#errormessage1").hide();
			flagEmail = false;
			return false;
		}
		else {
				$.ajax({
					url: "checkEmailExist.html",
					data: {
						email: email.val()
					},
					type: "get",
					async: false,
					timeout: 5000,
					success: function(msg){
						if(msg=="exist"){
							$("#errormessage1").show();
							flagEmail = false;
							return false;
						}
						else{
							$("#errormessage1").hide();
							flagEmail = true;
							return true;
						}
					},
					error: function(){
						alert("Not able to connect to server");
						flagEmail = false;
						return false;
					}
				});
			return true;
		}
	}
			
	function validatePassword(){
		// if invalid
		if(password.val().length<8 || password.val().length>20){
			$("#passwordErrorInfo").show();
			password.removeClass("correct");
			password.addClass("error");
			return false;
		}
		// if valid
		else {
			$("#passwordErrorInfo").hide();
			password.removeClass("error");
			password.addClass("correct");
			return true;
		}
	}
	
	function validateConfirmPassword(){
		// if invalid
		if(password.val()!=confirm_password.val()){
			$("#errormessage2").show();
			//confirm_password.removeClass("correct");
			//confirm_password.addClass("error");
			return false;
		}
		// if valid
		else {
			$("#errormessage2").hide();
			//confirm_password.removeClass("error");
			//confirm_password.addClass("correct");
			return true;
		}
	}
	
	
	// change password
	var changeBtn = $("#changepwd");
	var changeForm = $("#changePwdForm");
	changeBtn.click(function(){
		if (validatePassword() && validateConfirmPassword())
			changeForm.submit();
		else{
			alert("Password invalid!");
		}
	});
	
	
	

	
	
	
	
	 //signup
	var signupBtn = $("#signup");
	var signupForm = $("#signupForm");
	signupBtn.click(function(){
		if( validateUsername() && validateEmail() && validateConfirmPassword() ){
			$("#errormessage3").hide();
		//if(($("#j_username3").val().length)<4){
		//	alert("Please input valid username!");
		//}
		//else
			signupForm.submit();
		}
			else
				{$("#errormessage3").show();}
	});
	
	 //reactivate
	var reactivateBtn = $("#reactivate");
	var reactivateForm = $("#reactivateForm");
	reactivateBtn.click(function(){
		//if(($("#j_username2").val().length)<4){
		//	alert("Please input valid username!");
		//}
		//else
			reactivateForm.submit();
	});
	
	 //reset password
	var resetBtn = $("#resetPwd");
	var resetForm = $("#resetPwdForm");
	resetBtn.click(function(){
		//if(($("#j_username1").val().length)<4){
		//	alert("Please input valid username!");
		//}
		//else
			resetForm.submit();
	});
	
	
	
	// retrieval username
	var retrievalBtn = $("#retrievalUsername");
	var retrievalForm = $("#retrievalUsernameForm");
	retrievalBtn.click(function(){
		//if(!re.test($("#j_email").val())){
		//	alert("Please input a valid email!");
		//}
		//else
			retrievalForm.submit();
	});
	
});