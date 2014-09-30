/**
 * 
 */
$(document).ready(function() {
	var username = $("#j_rusername");
	var email = $("#j_remail");
	var password = $("#j_rpassword1");
	var confirm_password = $("#j_rpassword2");
	var username1= $("#j_username1").val();
	// flag is used when checking whether username & email exists
	var flag = false;
	var flagEmail = false;
	// email validation string
	var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
			
	// on blur
	username.blur(validateUsername);
	email.blur(validateEmail);
	password.blur(validatePassword);
	confirm_password.blur(validateConfirmPassword);
			
	// on keyup
	//username.keyup(validateUsername);
	//email.keyup(validateEmail);
	password.keyup(validatePassword);
	confirm_password.keyup(validateConfirmPassword);
			
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
		if( username.val().length < 3 || username.val().length > 20){
			$("#usernameErrorInfo").html("User name should contain more than 3 letters and up to 20 letters.");
			$("#usernameErrorInfo").show();
			username.removeClass("correct");
			username.addClass("error");
			falg = false;
			return false;
		}
		// if length valid
		else {
			if (!flag){
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
							$("#usernameErrorInfo").html("Username exists!");
							$("#usernameErrorInfo").show();
							username.removeClass("correct");
							username.addClass("error");
							flag = false;
							return false;
						}
						else{
							$("#usernameErrorInfo").hide();
							username.removeClass("error");
							username.addClass("correct");
							flag = true;
							return true;
						}
					},
					error: function(){
						alert("Network Error");
						flag = false;
						return false;
					}
				});
			}
			return true;
		}
	}
			
	function validateEmail(){
		// if invalid
		if(!re.test(email.val())){
			$("#emailErrorInfo").html("Email invalid!");
			$("#emailErrorInfo").show();
			email.removeClass("correct");
			email.addClass("error");
			flagEmail = false;
			return false;
		}
		// if valid
		else {
			if(!flagEmail){
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
							$("#emailErrorInfo").html("Email exists!");
							$("#emailErrorInfo").show();
							email.removeClass("correct");
							email.addClass("error");
							flagEmail = false;
							return false;
						}
						else{
							$("#emailErrorInfo").hide();
							email.removeClass("error");
							email.addClass("correct");
							flagEmail = true;
							return true;
						}
					},
					error: function(){
						alert("Network Error");
						flagEmail = false;
						return false;
					}
				});
			}
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
			$("#passwordNotMatchErrorInfo").show();
			confirm_password.removeClass("correct");
			confirm_password.addClass("error");
			return false;
		}
		// if valid
		else {
			$("#passwordNotMatchErrorInfo").hide();
			confirm_password.removeClass("error");
			confirm_password.addClass("correct");
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
		if(($("#j_username3").val().length)<4){
			alert("Please input valid username!");
		}
		else
			signupForm.submit();
	});
	
	 //reactivate
	var reactivateBtn = $("#reactivate");
	var reactivateForm = $("#reactivateForm");
	reactivateBtn.click(function(){
		if(($("#j_username2").val().length)<4){
			alert("Please input valid username!");
		}
		else
			reactivateForm.submit();
	});
	
	 //reset password
	var resetBtn = $("#resetPwd");
	var resetForm = $("#resetPwdForm");
	resetBtn.click(function(){
		if(($("#j_username1").val().length)<4){
			alert("Please input valid username!");
		}
		else
			resetForm.submit();
	});
	
	
	
	// retrieval username
	var retrievalBtn = $("#retrievalUsername");
	var retrievalForm = $("#retrievalUsernameForm");
	retrievalBtn.click(function(){
		if(!re.test($("#j_email").val())){
			alert("Please input a valid email!");
		}
		else
			retrievalForm.submit();
	});
	
});