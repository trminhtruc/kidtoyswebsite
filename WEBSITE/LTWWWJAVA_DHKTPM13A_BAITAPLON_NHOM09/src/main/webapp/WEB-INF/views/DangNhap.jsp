<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Đăng nhập</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<!-- đặt file css custom phía sau file bootstrap, những thuộc tính mà bootstrap ghi important bắt buộc sửa code bootstrap -->
<link rel="stylesheet"
	href="resources/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="resources/fontawesome/css/solid.css">
<link rel="stylesheet" href="resources/fontawesome/css/regular.css">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/stylelogin.css">

<script type="text/javascript">
	var thongbao;
	function submitForm() {
		$.ajax({
			url : "CheckDangNhap",
			method : "post",
			data : {
				username : $("#user").val(),
				password : $("#password").val()
			},
			success : function(result) {
				if (result == "0") {
					thongbao.text("Dang nhap sai");
					thongbao.removeClass("alert-success");
					thongbao.addClass("alert-danger");

				} else if (result == "1") {

					thongbao.text("Dang nhap thanh cong");
					thongbao.addClass("alert-success");
					thongbao.removeClass("alert-danger");
					setTimeout(function() {
						location.href = "HOME";
					}, 2000);
				}
			}
		});
	}

	function hideAlerts() {
		thongbao.text("");
		thongbao.removeClass("alert-danger alert-success");
	}

	$(document).ready(function() {
		thongbao = $("#thongbaosd");
		$("#form").on("submit", function(e) {
			submitForm(e);
		});
		$("#user").on("keyup", function() {
			hideAlerts();
		});

		$("#password").on("keyup", function() {
			hideAlerts();
		});
	});
</script>
</head>
<body>
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
		<h2 style="font-size: 25px; color: #006699;">Đăng nhập</h2>
		<!--action="${pageContext.request.contextPath}/DangNhapController"-->
		<div class="alert" id="thongbaosd"></div>
		<form onsubmit="return false;" id="form">
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="text" class="form-control" name="tenDangNhap"
						placeholder="Tên đăng nhập" id="user">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="password" placeholder="Mật khẩu" name="matKhau"
						class="form-control" id="password">
				</div>
			</div>
			<div class="row">
				<div class="col-md-12 form-group">
					<input type="submit" class="btn btn-block btn-login"
						value="Đăng nhập">
				</div>
			</div>
		</form>
		<div class="row">
			<div class="col-md-12" style="text-align: center;">
				<a href="DangKy" style="font-size: 14px; color: #ff3333;">Đăng
					ký tài khoản</a>
			</div>
		</div>
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