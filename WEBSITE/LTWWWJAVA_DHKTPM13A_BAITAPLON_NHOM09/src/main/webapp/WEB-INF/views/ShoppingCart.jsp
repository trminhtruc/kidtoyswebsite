<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<title>Giỏ hàng</title>
<meta charset="utf-8">
<link rel="stylesheet" type="text/css"
	href="resources/css/bootstrap.css">
<script src="resources/js/jquery.min.js"></script>
<script type="text/javascript" src="resources/js/bootstrap.js"></script>
<script type="text/javascript" src="resources/js/myfunction.js"></script>
<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
<!-- đặt file css custom phía sau file bootstrap, những thuộc tính mà bootstrap ghi important bắt buộc sửa code bootstrap -->
<link rel="stylesheet"
	href="resources/fontawesome/css/fontawesome.min.css">
<link rel="stylesheet" href="resources/fontawesome/css/solid.css">
<link rel="stylesheet" href="resources/fontawesome/css/regular.css">
<link rel="stylesheet" type="text/css" href="resources/css/custom.css">
<link rel="stylesheet" type="text/css"
	href="resources/css/cartstyle.css">

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
			<div class="col-sm-12 col-md-offset-1">
				<h3 style="">Giỏ hàng</h3>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12 col-md-10 col-md-offset-1">
				<table class="table table-hover">
					<thead>
						<tr>
							<th>Sản phẩm</th>
							<th class="text-center">Giá tiền</th>
							<th class="text-center">Tổng tiền</th>
							<th>Số lượng</th>
							<th> </th>
						</tr>
					</thead>
					<tbody>
						<!--                     <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#" style="margin-right: 5px;"> <img class="media-object" src="../img/xe-cuu-hoa.jpg" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">Mô hình xe cứu hỏa</a></h4>
                                <h5 class="media-heading"> by <a href="#">Nhà cung cấp</a></h5>
                                <span>Trạng thái: </span><span class="text-success"><strong>Còn hàng</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="email" class="form-control" id="exampleInputEmail1" value="1"> số lượng
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>287.500₫</strong></td> Đơn giá
                        <td class="col-sm-1 col-md-1 text-center"><strong>287.500₫</strong></td> tổng tiền
                        <td class="col-sm-1 col-md-1">
                        <button type="button" class="btn btn-success" style="margin-bottom: 3px;">
                            Cập nhật <span class="glyphicon glyphicon-play"></span>
                        </button>	
                        <button type="button" class="btn btn-danger" style="width: 82px;">
                            <span class="glyphicon glyphicon-remove"></span> Xóa
                        </button></td>
                    </tr> -->
						<c:if test="cart.getLineItemCount()==0">
							<tr>
								<td colspan="2">Gio hang rong</td>
							</tr>
						</c:if>

						<c:forEach items="${cart.getListDoChoi()}" var="thanh">

							<tr>
								<td class="col-sm-8 col-md-6">
									<div class="media">
										<a class="thumbnail pull-left" href="#"
											style="margin-right: 5px;"> <img class="media-object"
											src="resources/${thanh.getDoChoi().hinhAnhURL}"
											style="width: 72px; height: 72px;">
										</a>
										<div class="media-body">
											<h4 class="media-heading">
												<a href="#">${thanh.getDoChoi().tenDoChoi}</a>
											</h4>
											<h5 class="media-heading">
												by <a href="#">Nhà cung cấp</a>
											</h5>
											<span>Trạng thái: </span><span class="text-success"><strong>Còn
													hàng</strong></span>
										</div>
									</div>
								</td>



								<!-- 		<input type="email" class="form-control" id="exampleInputEmail1"
									value="${thanh.quantity}"> -->
								<!-- số lượng -->

								<td class="col-sm-1 col-md-1 text-center"><strong>${thanh.getDoChoi().giatien}</strong></td>
								<!-- Đơn giá -->
								<c:set value="${thanh.getDoChoi().giatien}" var="dg" />
								<c:set value="${thanh.quantity}" var="sl" />

								<td class="col-sm-1 col-md-1 text-center"><strong>${dg*sl}</strong></td>
								<!-- tổng tiền -->

								<td class="col-sm-2 col-md-2" style="text-align: center">
									<form
										action="${pageContext.request.contextPath}/CartController"
										id="buttonTangGiam" method="post">

										<div class="btn-group" role="group" aria-label="...">
											<input type="hidden" name="maDoChoiUpdate"
												value="${thanh.getDoChoi().maDoChoi}">
											<!-- 	<button type="button" class="btn btn-default">-</button> -->

											<input type="text" maxlength="4" required="required"
												onkeyup="this.value=this.value.replace(/[^\d]/,'')"
												class="form-control" style="width: 100px;" name="soLuong"
												value="${thanh.quantity}">

											<!-- 	<button type="button" class="btn btn-default">+</button>-->


											<!-- onclick="location.href='${pageContext.request.contextPath}/CartController?action=add'" -->

										</div>
										<!-- 	</td>
								<td class="col-sm-1 col-md-1"> -->

										<button type="submit" class="btn btn-success"
											style="margin-bottom: 3px;" name="action" value="update">
											Cập nhật
											<!-- <span class="glyphicon glyphicon-play"></span> -->
											<!--  <input type="hidden" name="action" value="update">-->
										</button>
										<button type="submit" class="btn btn-danger"
											style="width: 82px;" name="action" value="delete">
											<!-- <span class="glyphicon glyphicon-remove"></span> -->
											Xóa
										</button>
									</form>
								</td>
							</tr>

						</c:forEach>
						<!-- <!--   <tr>
                        <td class="col-sm-8 col-md-6">
                        <div class="media">
                            <a class="thumbnail pull-left" href="#" style="margin-right: 5px;"> <img class="media-object" src="../img/xe-cuu-hoa.jpg" style="width: 72px; height: 72px;"> </a>
                            <div class="media-body">
                                <h4 class="media-heading"><a href="#">Mô hình xe cứu hỏa</a></h4>
                                <h5 class="media-heading"> by <a href="#">Nhà cung cấp</a></h5>
                                <span>Trạng thái: </span><span class="text-success"><strong>Còn hàng</strong></span>
                            </div>
                        </div></td>
                        <td class="col-sm-1 col-md-1" style="text-align: center">
                        <input type="email" class="form-control" id="exampleInputEmail1" value="1"> số lượng
                        </td>
                        <td class="col-sm-1 col-md-1 text-center"><strong>287.500₫</strong></td> Đơn giá
                        <td class="col-sm-1 col-md-1 text-center"><strong>287.500₫</strong></td> tổng tiền
                        <td class="col-sm-1 col-md-1">
                       <button type="button" class="btn btn-success" style="margin-bottom: 3px;">
                            Cập nhật <span class="glyphicon glyphicon-play"></span>
                        </button>	
                        <button type="button" class="btn btn-danger" style="width: 82px;">
                            <span class="glyphicon glyphicon-remove"></span> Xóa
                        </button></td>
                    </tr> -->

						<tr>
							<c:if test="${sessionScope.cart != null}">
								<td> </td>
								<td> </td>
								<td> </td>
								<td><h5>Tạm tính</h5></td>
								<td class="text-right"><h5>
										<strong>${cart.tongTien}</strong>
									</h5></td>
							</c:if>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
							<td> </td>
						</tr>
						<tr>
							<c:if test="${sessionScope.cart != null}">


								<td> </td>
								<td> </td>
								<td> </td>
								<td><h3>Thành tiền</h3></td>
								<td class="text-right"><h3>
										<strong>${cart.tongTien}</strong>
									</h3></td>
							</c:if>
						</tr>
						<tr>
							<td> </td>
							<td> </td>
							<td> </td>
							<td>
								<form action="HOME">
									<button type="submit" class="btn btn-default">
										<!--  <span class="glyphicon glyphicon-shopping-cart"></span> -->
										Tiếp tục mua sắm
									</button>
								</form>
							</td>
							<td><c:if test="${sessionScope.cart != null}">
									<form
										action="${pageContext.request.contextPath}/KiemTraThanhToan">
										<button type="submit" class="btn btn-success">
											Thanh toán
											<!-- <span class="glyphicon glyphicon-play"></span> -->
										</button>
									</form>
								</c:if></td>
						</tr>
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