<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Category</title>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="../fontawesome/css/solid.css">
	<link rel="stylesheet" href="../fontawesome/css/regular.css">
	<link rel="stylesheet" type="text/css" href="../css/quanly.css">
	<link rel="stylesheet" type="text/css" href="../css/custom.css">
	<link rel="stylesheet" type="text/css" href="../css/500k.css">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous"/>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script type="text/javascript" src="../js/500k.js"></script>
	<script type="text/javascript" src="../js/validate.js"></script>
	<script type="text/javascript" src="../js/register.js"></script>
</head>
<body>
	<nav id="asdfnavbar" class="navbar navbar-default navbav-default-sm"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand"
					href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/ShowProductList"><img
					src="../img/logo.png"></a>
				<!-- chỗ này logo -->
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a
						href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/ShowProductList">Trang
							chủ</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Sản phẩm<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<!--	<li><a href="#">Đồ chơi cho bé gái</a></li>
							<li><a href="#">Đồ chơi cho bé trai</a></li>  -->
							
								<li><a
									href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/ShowProductList?danhmuc=danhmuc1">Đồ chơi cho bé trai</a></li>
							
								<li><a
									href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/ShowProductList?danhmuc=danhmuc2">Đồ chơi cho bé nữ</a></li>
							
								<li><a
									href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/ShowProductList?danhmuc=DM2">Đồ chơi xe điều khiển</a></li>
							
						</ul></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">



					<li class="searchbox"><input style="padding-left: 3px"
						class="search-txt" type="text" name="search"
						placeholder="Search here..."> <a class="search-btn"
						href="#"><i
							class="fa fa-search" aria-hidden="true"></i> </a></li>

					<!--  	<li><a href="view/ShoppingCart.jsp"><i
							style="font-size: 20px;" class="fa fa-shopping-cart"
							aria-hidden="true"></i></a></li>
-->
					

						

							<li><a href="KTTKPM_DHKTPM13A_BAITAPLON_03Web/view/DangNhap.jsp">Đăng Nhập</a></li>
						
						
					

				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<div class="container mt-5 mb-5" style="max-width: 500px">
		<form onsubmit="return register();">
			<div class="alert" id="registeralert" role="alert">
				<span id="registeralerttext"></span>
			</div>
			<div class="form-row">
				<div class="col">
					<label for="fullname">Họ và tên:</label>
					<input type="text" class="form-control" id="fullname" placeholder="Nguyễn Văn A">
					<small class="text-danger" id="fullnamenotice"></small>
				</div>
				<div class="col">
					<label for="gender">Giới tính:</label>
					<select id="gender" class="form-control">
						<option value="-1">--Chọn--</option>
						<option value="0">Nam</option>
						<option value="1">Nữ</option>
					</select>
					<small class="text-danger" id="gendernotice"></small>
				</div>
				<div class="col">
					<label for="phone">Số điện thoại:</label>
					<input type="number" class="form-control" id="phone" placeholder="0393123456">
					<small class="text-danger" id="phonenotice"></small>
				</div>
			</div>
			<fieldset class="form-group">
				<label for="username">Tên đăng nhập:</label>
				<input type="text" class="form-control" id="username" placeholder="user_1">
				<small class="text-danger" id="usernamenotice"></small>
			</fieldset>
			<fieldset class="form-group">
				<label for="email">Email:</label>
				<input type="text" class="form-control" id="email" placeholder="example@email.com">
				<small class="text-danger" id="emailnotice"></small>
			</fieldset>
			<div class="form-row">
				<div class="col">
					<label for="password">Mật khẩu</label>
					<input type="password" class="form-control" id="password" placeholder="asdfrgb@!2019">	
					<small class="text-danger" id="passwordnotice"></small>
				</div>
				<div class="col">
					<label for="repassword">Nhập lại mật khẩu</label>
					<input type="password" class="form-control" id="repassword" placeholder="asdfrgb@!2019">
					<small class="text-danger" id="repasswordnotice"></small>
				</div>
			</div>
			<input type="submit" class="btn btn-block btn-success mt-3" value="Đăng ký">
		</form>
	</div>
	<footer class="footer">
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="footer-logo">
							<img src="../img/logo2.png">
						</div>
					</div>
					<div class="col-sm-4">
						<div class="footer-info">
							<h4 style="font-weight: bold;">KID TOYS SHOP</h4>
							<p>
								<strong>Số điện thoại:</strong> 0367141419 <br> <strong>Emai:
								</strong> trminhtruc99@gmail.com<br> <strong>Địa chỉ: </strong> 12
								Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP.Hồ Chí Minh
							</p>
						</div>
					</div>
					<div class="col-sm-6">
						<h4 style="font-weight: bold">Sinh viên thực hiện</h4>
						<div class="col-ms-3">
							<p>
								<strong>Họ tên: </strong> Trần Minh Trúc <br> <strong>MSSV:
								</strong> 17067021 <br> <strong>Email:</strong>
								trminhtruc99@gmail.com
							</p>
						</div>
						<div class="col-ms-3">
							<p>
								<strong>Họ tên: </strong> Đoàn Kim Định <br> <strong>MSSV:
								</strong> 1706.... <br> <strong>Email:</strong> .......
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>