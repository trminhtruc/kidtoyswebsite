<!DOCTYPE html>
<html>
<head>
	<title>Home</title>  
	<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap.min.css"> -->
	<!-- <link rel="stylesheet" type="text/css" href="../css/bootstrap-theme.min.css"> -->
	<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
  	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
	<script type="text/javascript" src="../js/bootstrap.js"></script>
	
	<!-- ca -->
	<!-- <link rel="stylesheet" type="text/css" href="../css/style.css"> -->
	<link rel="stylesheet" type="text/css" href="custom.css">
	<!-- đặt file css custom phía sau file bootstrap, những thuộc tính mà bootstrap ghi important bắt buộc sửa code bootstrap -->
	<link rel="stylesheet" href="../fontawesome/css/fontawesome.min.css">
	<link rel="stylesheet" href="../fontawesome/css/solid.css">
	<link rel="stylesheet" href="../fontawesome/css/regular.css">
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css"> -->
	<!-- mày dẫn link của cdn nó tải cái pre processor về luôn khong sửa dc -->
  	<!-- transsssssss x10000 -->
</head>
<body>
	<nav class="navbar navbar-default navbav-default-sm" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-ex1-collapse">
					<span class="sr-only">Toggle navigation</span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
					<span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">Logo</a>
				<!-- chỗ này logo -->
			</div>
	
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse navbar-ex1-collapse">
				<ul class="nav navbar-nav navbar-left">
					<li><a href="#">Trang chủ</a></li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Sản phẩm <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Đồ chơi cho trẻ sơ sinh</a></li>
							<li><a href="#">Đồ chơi cho bé gái</a></li>
							<li><a href="#">Đồ chơi cho bé trai</a></li>
						</ul>
					</li>
					<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">Thương hiệu <b class="caret"></b></a>
						<ul class="dropdown-menu">
							<li><a href="#">Mooney</a></li>
							<li><a href="#">Bobby</a></li>
							<li><a href="#">Aptamil</a></li>
						</ul>
					</li>
				</ul>
				<ul class="nav navbar-nav navbar-right">
					<li class="searchbox">
							<input style="padding-left: 3px" class="search-txt" type="text" name="" placeholder="Search here...">
							<a class="search-btn" href="#">
								<i class="fa fa-search" aria-hidden="true"></i>
							</a>
					</li>
					<li><a href="#"><i style="font-size: 20px;" class="fa fa-shopping-cart" aria-hidden="true"></i></a></li>
					<li><a href="#">Đăng nhập</a></li>
					
				</ul>
			</div><!-- /.navbar-collapse -->
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
					<img class="banner" src="../img/banner01.png" alt="binhdinh">
				</div>
				<div class="item">
					<img class="banner" src="../img/banner04.png" alt="minhtruc">
				</div>
				<div class="item">
					<img class="banner" src="../img/banner05.png" alt="t2m">
				</div>
			</div>

			<a href="#myCarousel" class="left carousel-control" data-slide="prev">
				<i class="glyphicon glyphicon-chevron-left"></i>
				<span class="sr-only">Previous</span>
				
			</a>
			<a href="#myCarousel" class="right carousel-control" data-slide="next">
				<span class="glyphicon glyphicon-chevron-right"></span>
				<span class="sr-only">Next</span>
			</a>
	</div>
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1>Danh sách sản phẩm</h1>
			</div>
		</div>
		<div class="row">
		    <div class="col-sm-3">
		    	<div class="product-item">
		    		<a href="#">
		    			<div class=product-img>
		    				<img src="../img/doan-tau-giang-sinh-nhat.jpg" height="145px" width="145px">
		    			</div>
		    		</a>
		    		<div class="product-title">
		    			<a href="#">Đoàn tàu giáng sinh</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>217.700₫</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>
		    <div class="col-sm-3">
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
		    				<strong>287.500₫</strong>
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
		    			<a href="#">Tháp xếp hình thứ</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>148.500₫</strong>
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
		    				<strong>139.000₫</strong>
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
		    				<strong>45.000₫</strong>
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
		    			<a href="#">Hello Kitty-Thế giới ngọt ngào</a>
		    		</div>
		    		<div class="product-prices">
		    			<div>
		    				<strong>45.000₫</strong>
		    			</div>
		    		</div>
		    	</div>
		    </div>		    
		</div>
	</div>
	<footer class="footer">
		<div class="footer-bottom">
			<div class="container">
				<div class="row">
					<div class="col-sm-6">
						<div class="footer-logo">
							<img src="#">
						</div>
						<div class="footer-info">
							<h4 style="font-weight: bold;">KID TOYS SHOP</h4>
							<p>
								<strong>Số điện thoại:</strong>
								0367141419 <br>
								<strong>Emai: </strong>
								<a href="#">trminhtruc99@gmail.com</a> <br>
								<strong>Địa chỉ: </strong>
								12 Nguyễn Văn Bảo, Phường 4, Quận Gò Vấp, TP.Hồ Chí Minh
							</p>
						</div>
					</div>
					<div class="col-sm-6">
						<h4 style="font-weight: bold">Sinh viên thực hiện</h4>
						<div class="col-ms-3">
							<p>
								<strong>Họ tên: </strong>
								Trần Minh Trúc <br>
								<strong>MSSV: </strong>
								17067021 <br>
								<strong>Email:</strong>
								trminhtruc99@gmail.com
							</p>
						</div>
						<div class="col-ms-3">
							<p>
								<strong>Họ tên: </strong>
								Đoàn Kim Định <br>
								<strong>MSSV: </strong>
								1706.... <br>
								<strong>Email:</strong>
								.......
							</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</footer>
</body>
</html>