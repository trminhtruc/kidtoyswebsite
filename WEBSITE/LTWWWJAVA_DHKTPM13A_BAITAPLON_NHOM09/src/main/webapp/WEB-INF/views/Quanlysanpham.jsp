<%@ page language="java" contentType="text/html; charset=UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page session="true"%>
<!DOCTYPE html>
<html>
<head>
<title>Quản lý sản phẩm</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/myfunction.js"></script>
<link rel="stylesheet"
	href="resources/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="resources/fontawesome/css/solid.css">
<link rel="stylesheet" href="resources/fontawesome/css/regular.css">
<link rel="stylesheet" type="text/css" href="resources/css/quanly.css">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<script type="text/javascript">
	window.setTimeout(function() {
		$(".alert").fadeTo(500, 0).slideUp(500, function() {
			$(this).remove();
		});
	}, 2000);
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
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h3>Quản lý sản phẩm</h3>
				<c:if test="${xoasanpham eq '114'}">
					<div class="alert alert-warning" role="alert">Tồn tại sản
						phẩm trong đơn hàng</div>

					<%
						session.removeAttribute("xoasanpham");
					%>
				</c:if>
				<c:if test="${xoasanpham eq '113'}">
					<div class="alert alert-success" role="alert">Xóa thành công
						sản phẩm</div>

					<%
						session.removeAttribute("xoasanpham");
					%>
				</c:if>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-8"></div>


			<div class="col-sm-4">
				<div class="manager-search" style="margin-top: 15px;">
					<form action="TimKiemController" method="GET">
						<input type="text" name="search"
							placeholder="Tìm kiếm theo tên sản phẩm"
							style="border-radius: 10px; width: 200px; height: 30px;">
						<button class="btn btn-danger">Tìm kiếm</button>
					</form>
				</div>
			</div>

		</div>

		<div class="row">
			<div class="col-sm-12">
				<table class="table table-hover">
					<thead>
						<tr>
							<th scope="col">ID</th>
							<th scope="col">Hình ảnh</th>
							<th scope="col">Tên sản phẩm</th>
							<th scope="col">Mô tả</th>
							<th scope="col">Giá tiền</th>
							<th scope="col">Số lượng</th>
							<th scope="col">Danh mục</th>
							<th scope="col">Tình trạng</th>
							<th></th>
							<th></th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${dsDoChoi}" var="dochoi">
							<tr>
								<th scope="row">${dochoi.maDoChoi}</th>
								<td><img src="resources/${dochoi.hinhAnhURL}" height="50px"
									width="50px"></td>
								<td>${dochoi.tenDoChoi }</td>
								<td>${dochoi.moTa}</td>
								<td>${dochoi.giatien}</td>
								<td>${dochoi.soLuong}</td>
								<td>${dochoi.danhmuc.tenDanhMuc}</td>
								<td>${dochoi.tinhTrang}</td>
								<td>
									<!-- <form action="${pageContext.request.contextPath}/ChinhSuaSanPham?id=${dochoi.maDoChoi}"> -->
									<form action="#" method="POST">
										<a href="ChinhSua?id=${dochoi.maDoChoi}">
											<button style="margin-bottom: 5px;" type="button"
												class="btn btn-primary">Chỉnh sửa</button>
										</a>

									</form>

									<form action="#">
										<a href="XoaSanPham?xoa=${dochoi.maDoChoi}">
											<button type="button" class="btn btn-danger"
												style="width: 90px;">Xóa</button>
										</a>
									</form>
								</td>
							</tr>
						</c:forEach>

						<!--  <tr>
					      	<th scope="row">ID2</th>
					      	<td>Đoàn tàu giáng sinh</td>
					      	<td>sản phẩm đẹp mắt đa dạng màu sắc phù hợp cho trẻ phát triển khả năng quan sát nhận biết màu sắc thích hợp cho bé ........</td>
					      	<td>217.700₫</td>
					      	<td>20</td>
					      	<td>Đồ chơi cho bé trai</td>
					     	<td><button type="button" class="btn btn-primary">Chỉnh sửa</button>	</td>
					      	<td><button type="button" class="btn btn-danger">Xóa</button>	</td>
					    </tr>
					    <tr>
					      	<th scope="row">ID3</th>
					      	<td>Đoàn tàu giáng sinh</td>
					      	<td>sản phẩm đẹp mắt đa dạng màu sắc phù hợp cho trẻ phát triển khả năng quan sát nhận biết màu sắc thích hợp cho bé ........</td>
					      	<td>217.700₫</td>
					      	<td>20</td>
					      	<td>Đồ chơi cho bé trai</td>
					     	<td><button type="button" class="btn btn-primary">Chỉnh sửa</button>	</td>
					      	<td><button type="button" class="btn btn-danger">Xóa</button>	</td>
					    </tr>
					    <tr>
					      	<th scope="row">ID4</th>
					      	<td>Đoàn tàu giáng sinh</td>
					      	<td>sản phẩm đẹp mắt đa dạng màu sắc phù hợp cho trẻ phát triển khả năng quan sát nhận biết màu sắc thích hợp cho bé ........</td>
					      	<td>217.700₫</td>
					      	<td>20</td>
					      	<td>Đồ chơi cho bé trai</td>
					     	<td><button type="button" class="btn btn-primary">Chỉnh sửa</button>	</td>
					     	SAU KHI NHẤN NÚT CHỈNH SỬA SẼ CHUYỂN SANG FORM CHỈNH SỬA SẢN PHẨM
					      	<td><button type="button" class="btn btn-danger">Xóa</button>	</td>
					    </tr> -->
					</tbody>
				</table>
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