var fullName;
var gender;
var phone;
var username;
var email;
var password;
var rePassword;

var fullNameNotice;
var genderNotice;
var phoneNotice;
var usernameNotice;
var emailNotice;
var passwordNotice;
var rePasswordNotice;

var alertMsg;

function validateFullName(){
	var res = checkFullName(fullName.val());
	if(!res.state){
		fullNameNotice.text(res.message);
		fullName.focus();
	}else{
		fullNameNotice.text("");
	}
	return res.state;
}

function validateGender(){
	var res = checkGender(gender.val());
	if(!res.state){
		genderNotice.text(res.message);
		gender.focus();
	}else{
		genderNotice.text("");
	}
	return res.state;
}

function validatePhone(){
	var res = checkPhone(phone.val());
	if(!res.state){
		phoneNotice.text(res.message);
		phone.focus();
	}else{
		phoneNotice.text("");
	}
	return res.state;
}

function validateUsername(){
	var res = checkUsername(username.val());
	if(!res.state){
		usernameNotice.text(res.message);
		username.focus();
	}else{
		usernameNotice.text("");
	}
	return res.state;
}

function validateEmail(){
	var res = checkEmail(email.val());
	if(!res.state){
		emailNotice.text(res.message);
		email.focus();
	}else{
		emailNotice.text("");
	}
	return res.state;
}

function validatePassword(){
	var res = checkPassword(password.val());
	if(!res.state){
		passwordNotice.text(res.message);
		password.focus();
	}else{
		passwordNotice.text("");
	}
	return res.state;
}

function validateRePassword(){
	var res = checkRePassword(password.val(), rePassword.val());
	if(!res.state){
		rePasswordNotice.text(res.message);
		rePassword.focus();
	}else{
		rePasswordNotice.text("");
	}
	return res.state;
}

function showWarning(warning){
	alertMsg.html(warning);
	alertMsg.removeClass("d-none alert-success");
	alertMsg.addClass("alert-warning");
}

function showSuccess(message){
	alertMsg.html(message);
	alertMsg.removeClass("d-none alert-warning");
	alertMsg.addClass("alert-success");
}

var ress;

function register(){
	if(!validateFullName() || !validateGender() || !validatePhone() || !validateUsername() || !validateEmail() || !validatePassword() || !validateRePassword()){
		showWarning("Vui lòng kiểm tra lại thông tin!");
	}else{
		$.ajax({
			url: "/KTTKPM_DHKTPM13A_BAITAPLON_03Web/Handle",
			method: "POST",
			data: {
				do: "register",
				fullname: fullName.val(),
				gender: gender.val(),
				phone: phone.val(),
				username: username.val(),
				email: email.val(),
				password: password.val(),
				repassword: rePassword.val()
			},
			success: function(result){
				result = JSON.parse(result);
				console.log(result);
				if(result.state == 0){
					showSuccess(result.message);
					setTimeout(function(){
						location.href = result.redirect;
					}, 3000);
				}else if(result.state == 1){
					usernameNotice.text(result.message);
				}else if(result.state == 2){
					emailNotice.text(result.message);
				}
			}
		});
	}
	return false;
}

$(document).ready(function(){
	fullName = $("#fullname");
	gender = $("#gender");
	phone = $("#phone");
	username = $("#username");
	email = $("#email");
	password = $("#password");
	rePassword = $("#repassword");

	fullNameNotice = $("#fullnamenotice");
	genderNotice = $("#gendernotice");
	phoneNotice = $("#phonenotice");
	usernameNotice = $("#usernamenotice");
	emailNotice = $("#emailnotice");
	passwordNotice = $("#passwordnotice");
	rePasswordNotice = $("#repasswordnotice");

	alertMsg = $("#registeralert");

	fullName.on("keyup", function(){
		validateFullName();
	});

	gender.on("change", function(){
		validateGender();
	});

	phone.on("keyup", function(){
		validatePhone();
	});

	username.on("keyup", function(){
		validateUsername();
	});

	email.on("keyup", function(){
		validateEmail();
	});

	password.on("keyup", function(){
		validatePassword();
	});

	rePassword.on("keyup", function(){
		validateRePassword();
	});
});