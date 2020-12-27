
<%@page import="javax.sound.midi.SysexMessage"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>

<title>Home</title>
<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"> -->
<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css"> -->
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/myfunction.js"></script>

<!-- ca -->
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<!-- Äáº·t file css custom phÃ­a sau file bootstrap, nhá»¯ng thuá»c tÃ­nh mÃ  bootstrap ghi important báº¯t buá»c sá»­a code bootstrap -->
<link rel="stylesheet"
	href="resources/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="resources/fontawesome/css/solid.css">
<link rel="stylesheet" href="resources/fontawesome/css/regular.css">
<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
<!-- mÃ y dáº«n link cá»§a cdn nÃ³ táº£i cÃ¡i pre processor vá» luÃ´n khong sá»­a dc -->
<!-- transsssssss x10000 -->
</head>
<body>
	<nav class="navbar navbar-default navbav-default-sm" role="navigation">
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
										<li><a
											href="DanhSachDonHang">Quản
												Lý Đơn Hàng</a></li>
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
									<li class="li-infor"><a
										href="DangXuat">Đăng
											xuất</a></li>
								</ul></li>
						</c:when>
					</c:choose>

				</ul>

			</div>
			<!-- /.navbar-collapse -->
		</div>
	</nav>
	<div class="carousel slide" id="myCarousel" data-ride="carousel">
		<ol class="carousel-indicators">
			<li data-target="#myCarousel" data-slide-to="0" class="active"></li>
			<li data-target="#myCarousel" data-slide-to="1"></li>
			<li data-target="#myCarousel" data-slide-to="2"></li>
		</ol>

		<div class="carousel-inner">
			<div class="item active">
				<img class="banner" src="resources/img/banner01.png" alt="binhdinh">
			</div>
			<div class="item">
				<img class="banner" src="resources/img/banner04.png" alt="minhtruc">
			</div>
			<div class="item">
				<img class="banner" src="resources/img/banner05.png" alt="t2m">
			</div>
		</div>

		<a href="#myCarousel" class="left carousel-control" data-slide="prev">
			<i class="glyphicon glyphicon-chevron-left"></i> <span
			class="sr-only">Previous</span>

		</a> <a href="#myCarousel" class="right carousel-control"
			data-slide="next"> <span
			class="glyphicon glyphicon-chevron-right"></span> <span
			class="sr-only">Next</span>
		</a>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1>Danh sách sản phẩm</h1>
			</div>
		</div>
		<div class="row">
			<!--<div class="col-sm-3">
				<div class="product-item">
					<a href="#">
						<div class=product-img>
							<img src="img/doan-tau-giang-sinh-nhat.jpg" height="145px"
								width="145px">
						</div>
					</a>
					<div class="product-title">
						<a href="#">Đoàn tàu giáng sinh</a>
					</div>
					<div class="product-prices">
						<div>
							<strong>217.700đ</strong>
						</div>
					</div>
				</div>
			</div>-->


			<c:forEach items="${dsDoChoi}" var="dochoi">
				<div class="col-sm-3">
					<form name="modelDetail" method="post" action="CartController">
						<div class="product-item">
							<a href="ThongTinChiTietController?id=${dochoi.maDoChoi}">
								<div class=product-img>
									<img src="resources/${dochoi.hinhAnhURL}" height="145px"
										width="100%">
								</div>
							</a>
							<div class="product-title">
								<a href="#">${dochoi.tenDoChoi}</a>
							</div>
							<input type="hidden" name="maDoChoi" value="${dochoi.maDoChoi}">

							<div class="product-prices">
								<div>
									<strong>${dochoi.giatien}</strong>
								</div>
							</div>
							<input type="hidden" size="2" value="1" name="soLuong"> <input
								type="submit" class="btn btn-success" name="addToCart"
								value="Add to cart"> <input type="hidden" name="action"
								value="add">
						</div>
					</form>
				</div>
			</c:forEach>
			<!--	    <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/xe-cuu-hoa.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Xe cứu hỏa</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>287.500đ</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/xep-thap-hinh-thu.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Tháp xếp hình</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>148.500đ</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/do-choi-dat-nan.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Bộ đồ chơi hộp bánh quy</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>139.000đ</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/45-hello-kitty-mo-uoc-mai-sau-dan-hinh.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Hello Kitty-Ước mơ mai sau</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>45.000đ</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		  <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/40-hello-kitty-bst-1000-de-can-the-gioi-ngot-ngao.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Hello kitty thế giới ngọt ngào</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>45.000đ</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>		-->
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