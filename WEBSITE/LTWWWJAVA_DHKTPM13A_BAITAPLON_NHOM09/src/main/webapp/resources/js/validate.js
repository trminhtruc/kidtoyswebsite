const fullNameRegex = /^([a-z]*[ ]?)+$/;
const passwordRegex = /^.{8,48}$/;
const phoneRegex = /^0\d{9}$/;
const emailRegex = /^(([^<>()\[\]\.,;:\s@\"]+(\.[^<>()\[\]\.,;:\s@\"]+)*)|(\".+\"))@(([^<>()[\]\.,;:\s@\"]+\.)+[^<>()[\]\.,;:\s@\"]{2,})$/i; //https://stackoverflow.com/questions/46155/how-to-validate-an-email-address-in-javascript
const usernameRegex = /^[a-z]+(_[a-z0-9]+)*$/;
const categoryNameRegex = /^[A-Za-z0-9- ]+$/;

function validateMessage(state, message){
	return {
		state: state,
		message: message
	};
}

function checkUsername(username){
	if(username.trim().length < 6 || username.trim.length > 20){
		return validateMessage(false, "Tên đăng nhập phải từ 6-20 ký tự!");
	}else if(!usernameRegex.test(username)){
		return validateMessage(false, "Tên đăng nhập chỉ bao gồm a-z0-9_");
	}else return validateMessage(true, "");
}

function checkFullName(fullName){
	fullName = nonAccentVietnamese(fullName);
	if(fullName.trim().length == 0){
		return validateMessage(false, "Tên không được rỗng!");
	}else if(!fullNameRegex.test(fullName)){
		return validateMessage(false, "Tên chỉ bao gồm chữ!");
	}else return validateMessage(true, "");
}

function checkPassword(password){
	if(!passwordRegex.test(password)){
		return validateMessage(false, "Mật khẩu phải từ 8-48 ký tự!");
	}else return validateMessage(true, "");
}

function checkPhone(phone){
	if(!phoneRegex.test(phone)){
		return validateMessage(false, "Số điện thoại bao gồm 10 ký số, bắt đầu bằng số 0!");
	}else return validateMessage(true, "");
}

function checkEmail(email){
	if(!emailRegex.test(email)){
		return validateMessage(false, "Email không hợp lệ!");
	}else return validateMessage(true, "");
}

function checkRePassword(password, rePassword){
	if(password!==rePassword){
		return validateMessage(false, "Mật khẩu nhập lại không trùng khớp!");
	}else return validateMessage(true, "");
}

function checkGender(gender){
	if(gender == 0 || gender == 1){
		return validateMessage(true, "");
	}else return validateMessage(false, "Chọn giới tính!");
}

function checkCategoryName(categoryName){
	categoryName = nonAccentVietnamese(categoryName);
	if(categoryName.trim().length<1){
		return validateMessage(false, "Tên danh mục không được trống!");
	}else if(!categoryNameRegex.test(categoryName)){
		return validateMessage(false, "Tên danh mục chỉ bao gồm chữ số và -");	
	}else return validateMessage(true, "");
}