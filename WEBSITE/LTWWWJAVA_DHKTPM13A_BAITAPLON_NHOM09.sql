USE [master]
GO
/****** Object:  Database [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09]    Script Date: 05/07/2020 12:01:16 SA ******/
CREATE DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ARITHABORT OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET  ENABLE_BROKER 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET RECOVERY FULL 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET  MULTI_USER 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET DB_CHAINING OFF 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09', N'ON'
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET QUERY_STORE = OFF
GO
USE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09]
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 05/07/2020 12:01:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[maDoChoi] [varchar](255) NOT NULL,
	[maDonHang] [varchar](255) NOT NULL,
	[donGia] [float] NOT NULL,
	[soLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[maDoChoi] ASC,
	[maDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DanhMuc]    Script Date: 05/07/2020 12:01:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DanhMuc](
	[maDanhMuc] [varchar](255) NOT NULL,
	[tenDanhMuc] [nvarchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maDanhMuc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DoChoi]    Script Date: 05/07/2020 12:01:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DoChoi](
	[maDoChoi] [varchar](255) NOT NULL,
	[giatien] [float] NOT NULL,
	[hinhAnhURL] [varchar](255) NULL,
	[moTa] [nvarchar](255) NULL,
	[soLuong] [int] NOT NULL,
	[tenDoChoi] [nvarchar](255) NULL,
	[tinhTrang] [nvarchar](255) NULL,
	[maDanhMuc] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maDoChoi] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DonHang]    Script Date: 05/07/2020 12:01:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonHang](
	[maDonHang] [varchar](255) NOT NULL,
	[diaChi] [nvarchar](255) NULL,
	[ngayLap] [datetime] NULL,
	[tinhTrang] [nvarchar](255) NULL,
	[maNguoiDung] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[NguoiDung]    Script Date: 05/07/2020 12:01:17 SA ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[NguoiDung](
	[maNguoiDung] [varchar](255) NOT NULL,
	[email] [varchar](255) NULL,
	[gioiTinh] [nvarchar](255) NULL,
	[loaiNguoiDung] [nvarchar](255) NULL,
	[matKhau] [varchar](255) NULL,
	[soDienThoai] [varchar](255) NULL,
	[tenNguoiDung] [nvarchar](255) NULL,
	[tenTaiKhoan] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[maNguoiDung] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi1', N'DonHang3', 12000, 2)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi1', N'DonHang5', 12000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi2', N'DonHang5', 15000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi3', N'DonHang12', 20000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi3', N'DonHang4', 20000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi3', N'DonHang8', 20000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi4', N'DonHang10', 13000, 13)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi4', N'DonHang11', 13000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi4', N'DonHang6', 13000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi4', N'DonHang7', 13000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi4', N'DonHang8', 13000, 1)
INSERT [dbo].[ChiTietDonHang] ([maDoChoi], [maDonHang], [donGia], [soLuong]) VALUES (N'dochoi5', N'DonHang9', 12333, 1)
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'danhmuc1', N'Đồ chơi cho bé trai')
INSERT [dbo].[DanhMuc] ([maDanhMuc], [tenDanhMuc]) VALUES (N'danhmuc2', N'Đồ chơi cho bé gái')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi1', 12000, N'img/banner01.png', N'Đồ chơi  12 món Shopkin Bổ sung thêm vào bộ sưu tập Shopskin của bé với những người bạn Shoppets đến với Thế giới Shopkins đầy thú vị này. Với bộ tộc Wild Tribe của mùa 9 này, với hàng loạt nhân vật mới sẽ là một trải nghiệm độc đáo dành cho các bé', 119, N'Cá voi xanh', N'ĐANG KINH DOANH', N'danhmuc1')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi2', 15000, N'img/banner02.jpg', N'khung', 138, N'Cá Heo', N'NGỪNG KINH DOANH', N'danhmuc2')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi3', 20000, N'img/banner03.jpg', N'cuwc dep cuc fe fawe', 197, N'Biển Rạng', N'ĐANG KINH DOANH', N'danhmuc2')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi4', 13000, N'img/doan-tau-giang-sinh-nhat.jpg', N'Biển Rạng', 200, N'Traing Toy', N'ĐANG KINH DOANH', N'danhmuc2')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi5', 12333, N'img/IMG_0269.jpg', N'dệp', 23, N'Cá voi lớn', N'ĐANG KINH DOANH', N'danhmuc2')
INSERT [dbo].[DoChoi] ([maDoChoi], [giatien], [hinhAnhURL], [moTa], [soLuong], [tenDoChoi], [tinhTrang], [maDanhMuc]) VALUES (N'dochoi6', 2222222, N'img/', N'fawe', 3444444, N'fawegawegawe', N'ĐANG KINH DOANH', N'danhmuc1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang1', N'Go Vap', CAST(N'2020-07-04T08:29:29.050' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang10', N'', CAST(N'2020-07-04T22:33:55.040' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang11', N'fawe', CAST(N'2020-07-04T23:28:34.337' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang12', N'asdf', CAST(N'2020-07-04T23:29:38.613' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang2', N'Go Vap', CAST(N'2020-07-04T09:21:46.467' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang3', N'Go Vap', CAST(N'2020-07-04T09:32:36.230' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang4', N'eeeegareg', CAST(N'2020-07-04T09:43:52.060' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang5', N'van bao', CAST(N'2020-07-04T09:47:02.990' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang6', N'gfwaef', CAST(N'2020-07-04T12:56:02.010' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang7', N'gÆ°aegwae', CAST(N'2020-07-04T12:56:16.473' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang8', N'TONA', CAST(N'2020-07-04T15:37:54.357' AS DateTime), NULL, N'khachhang5')
INSERT [dbo].[DonHang] ([maDonHang], [diaChi], [ngayLap], [tinhTrang], [maNguoiDung]) VALUES (N'DonHang9', N'', CAST(N'2020-07-04T15:41:51.970' AS DateTime), NULL, N'khachhang1')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang1', N'doankimdinh333@gmail.com', N'Nam', N'quantri', N'123', N'113', N'Đoàn', N'doan')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang2', N'dinh@gmail.com', N'Nu', N'khachhang', N'111', N'115', N'Kim', N'duyen')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang3', N'thanh@gmail.com', N'Nam', N'khachhang', N'1122', N'02132412412', N'Định', N'thanh')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang4', N'son@gmail.com', N'Nu', N'khachhang', N'123', N'4234234', N'Thành', N'son')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang5', N'doankimdinh113@gmail.com', N'nam', N'khachhang', N'2', N'01443213', N'thanh', N'2')
INSERT [dbo].[NguoiDung] ([maNguoiDung], [email], [gioiTinh], [loaiNguoiDung], [matKhau], [soDienThoai], [tenNguoiDung], [tenTaiKhoan]) VALUES (N'khachhang6', N'doankimdinh113@gmail.com', N'nam', N'khachhang', N'e', N'e', N'e', N'e')
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FKc6u2skna5psh3e10vrapqwecx] FOREIGN KEY([maDonHang])
REFERENCES [dbo].[DonHang] ([maDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FKc6u2skna5psh3e10vrapqwecx]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FKg2vbnl4ncsv2mrf0ty0lk271c] FOREIGN KEY([maDoChoi])
REFERENCES [dbo].[DoChoi] ([maDoChoi])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FKg2vbnl4ncsv2mrf0ty0lk271c]
GO
ALTER TABLE [dbo].[DoChoi]  WITH CHECK ADD  CONSTRAINT [FKl1dhwraowx4avxubi0d0e62mq] FOREIGN KEY([maDanhMuc])
REFERENCES [dbo].[DanhMuc] ([maDanhMuc])
GO
ALTER TABLE [dbo].[DoChoi] CHECK CONSTRAINT [FKl1dhwraowx4avxubi0d0e62mq]
GO
ALTER TABLE [dbo].[DonHang]  WITH CHECK ADD  CONSTRAINT [FKqj27nl6nspnhu8q4xogaekbt3] FOREIGN KEY([maNguoiDung])
REFERENCES [dbo].[NguoiDung] ([maNguoiDung])
GO
ALTER TABLE [dbo].[DonHang] CHECK CONSTRAINT [FKqj27nl6nspnhu8q4xogaekbt3]
GO
USE [master]
GO
ALTER DATABASE [LTWWWJAVA_DHKTPM13A_BAITAPLON_NHOM09] SET  READ_WRITE 
GO
