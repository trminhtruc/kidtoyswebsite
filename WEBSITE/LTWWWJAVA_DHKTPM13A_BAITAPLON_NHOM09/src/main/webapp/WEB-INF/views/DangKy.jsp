
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng ký sản phẩm</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/myfunction.js"></script>
<link rel="stylesheet"
	href="resources/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href=".resources/fontawesome/css/solid.css">
<link rel="stylesheet" href="resources/fontawesome/css/regular.css">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
</head>
<style>
.simple-login-container {
	background-color: #fff;
	font-size: 14px;
	width: 300px;
	max-width: 100%;
	margin: 50px auto;
}

.simple-login-container h2 {
	text-align: center;
	font-size: 20px;
}

.simple-login-container .btn-login {
	background-color: #FF5964;
	color: #fff;
}
</style>
<body>
	<!-- <a href="ShowProductList">Trang chu</a>
	<form action="DangKyController" method="post">
		Ten khach hang <input type="text" name="tenKhachHang"><br>
		Email <input type="text" name="email"><br>
		So dien thoai <input type="text" name="soDienThoai"><br>
		Gioi Tinh: Nam <input type="radio" value="Nam" name="gioiTinh">
		Nu : <input type="radio" value="Nu" name="gioiTinh"><br>
		Ten dang nhap: <input type="text" name="tenDangNhap"><br>
		Mat khau: <input type="password" name="matKhau">
		<input type="submit" value="Dang Ky">
	</form> -->
	<nav id="asdfnavbar" class="navbar navbar-default navbav-default-sm"
		role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<a class="navbar-brand" href="HOME"><img
					src="resources/img/logo.png"></a>
				<!-- chỗ này logo -->
			</div>

			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="HOME">Trang chủ</a></li>

					<li class="dropdown"><a href="#" class="dropdown-toggle"
						data-toggle="dropdown">Sản phẩm<b class="caret"></b></a>
						<ul class="dropdown-menu">
							<!--	<li><a href="#">Đồ chơi cho bé gái</a></li>
							<li><a href="#">Đồ chơi cho bé trai</a></li>  -->
							<c:forEach var="dmuc" items="${dsDanhMuc}">
								<li><a href="HOMEDANHMUC?danhmuc=${dmuc.maDanhMuc}">${dmuc.tenDanhMuc}</a></li>
							</c:forEach>
						</ul></li>

				</ul>

				<ul class="nav navbar-nav navbar-right">



					<li class="searchbox"><input style="padding-left: 3px"
						class="search-txt" type="text" name="search"
						placeholder="Search here..."> <a class="search-btn"
						href="#"><i class="fa fa-search" aria-hidden="true"></i> </a></li>

					<li><a href="GioHang"><i style="font-size: 20px;"
							class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>

					<c:choose>

						<c:when test="${empty sessionScope.nguoidung}">

							<li><a href="DangNhap">Đăng Nhập</a></li>
						</c:when>
						<c:when test="${!empty sessionScope.nguoidung}">

							<c:if test="${sessionScope.nguoidung.loaiNguoiDung=='quantri'}">
								<li class="dropdown"><a href="#" class="dropdown-toggle"
									data-toggle="dropdown">Quản lý<b class="caret"></b></a>
									<ul class="dropdown-menu">
										<li><a href="QuanLySanPham">Quản lý sản phẩm</a></li>
										<li><a href="ShowThem">Thêm sản phẩm</a></li>
										<li><a href="DanhSachDonHang">Quản Lý Đơn Hàng</a></li>
									</ul></li>

							</c:if>
							<li style="margin-top: -5px;"><a href="#" class="avatar"><img
									src="resources/img/IMG_0269.jpg" class="img-circle"
									alt="avatar" height="100%" width="100%"></a></li>

							<li style="margin-left: -10px;" class="dropdown"><a
								class="dropdown-toggle" data-toggle="dropdown" href="#">Xin
									chào: ${nguoidung.tenNguoiDung}<b class="caret"></b>
							</a>
								<ul class="dropdown-menu">
									<li class="li-infor"><a href="DangXuat">Đăng xuất</a></li>
								</ul></li>
						</c:when>
					</c:choose>

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<div class="simple-login-container">
		<h2 style="font-size: 25px; color: #006699;">Đăng ký</h2>
		<form action="DangKyController" method="POST">
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="text" placeholder="Tên khách hàng"
						class="form-control" name="tenKhachHang" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" placeholder="Tên đăng nhập"
						name="tenDangNhap" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="password" placeholder="Mật khẩu" class="form-control"
						name="matKhau" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="password" placeholder="Nhập lại mật khẩu"
						class="form-control" name="reMatKhau" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="text" placeholder="Số điện thoại" class="form-control"
						name="soDienThoai" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="email" placeholder="Email" class="form-control"
						name="email" required>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12">
					<div class="form-check-inline">
						<label class="form-check-label" for="radio1"> <input
							type="radio" class="form-check-input" id="radio1" name="gioiTinh"
							value="nam" checked>Nam
						</label>
					</div>
					<div class="form-check-inline">
						<label class="form-check-label" for="radio2"> <input
							type="radio" class="form-check-input" id="radio2" name="gioiTinh"
							value="nu">Nữ
						</label>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="submit" class="btn btn-block btn-login"
						value="Đăng ký">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12" style="text-align: center;">
					<a href="DangNhap.jsp" style="font-size: 14px; color: #ff3333;">Đã
						có tài khoản</a>
				</div>
			</div>
		</form>
	</div>
	<footer class="footer">
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-2">
						<div class="footer-logo">
							<img src="resources/img/logo2.png">
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