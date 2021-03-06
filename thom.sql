USE [master]
GO
/****** Object:  Database [ThietBiDienTu]    Script Date: 9/20/2018 10:29:54 PM ******/
CREATE DATABASE [ThietBiDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThietBiDienTu', FILENAME = N'E:\ASP.NET\banlinhkien\ThietBiDienTu.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThietBiDienTu_log', FILENAME = N'E:\ASP.NET\banlinhkien\ThietBiDienTu_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [ThietBiDienTu] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [ThietBiDienTu].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [ThietBiDienTu] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET ARITHABORT OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [ThietBiDienTu] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [ThietBiDienTu] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET  ENABLE_BROKER 
GO
ALTER DATABASE [ThietBiDienTu] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [ThietBiDienTu] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET RECOVERY FULL 
GO
ALTER DATABASE [ThietBiDienTu] SET  MULTI_USER 
GO
ALTER DATABASE [ThietBiDienTu] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [ThietBiDienTu] SET DB_CHAINING OFF 
GO
ALTER DATABASE [ThietBiDienTu] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [ThietBiDienTu] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [ThietBiDienTu] SET DELAYED_DURABILITY = DISABLED 
GO
USE [ThietBiDienTu]
GO
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 9/20/2018 10:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DANHMUC](
	[MaDm] [int] IDENTITY(1,1) NOT NULL,
	[TenDm] [nvarchar](30) NOT NULL,
	[HinhAnh] [nchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDm] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DONHANG]    Script Date: 9/20/2018 10:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DONHANG](
	[MaDh] [int] IDENTITY(1,1) NOT NULL,
	[TenTk] [nchar](30) NOT NULL,
	[NguoiNhan] [nvarchar](50) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[DiaChiNhanHang] [nvarchar](200) NOT NULL,
	[SoDienThoai] [nchar](11) NOT NULL,
	[TongTien] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MATHANG]    Script Date: 9/20/2018 10:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MATHANG](
	[MaMh] [int] IDENTITY(1,1) NOT NULL,
	[MaDm] [int] NOT NULL,
	[TenMh] [nvarchar](60) NOT NULL,
	[SoLuong] [int] NOT NULL,
	[DonGia] [money] NOT NULL,
	[HinhAnh] [nchar](200) NOT NULL,
	[TinhNang] [ntext] NOT NULL,
	[ThongSoKiThuat] [ntext] NOT NULL,
	[BaoHanh] [ntext] NOT NULL,
	[TuKhoaMH] [nvarchar](200) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaMh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[MH-DH]    Script Date: 9/20/2018 10:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[MH-DH](
	[MaDh] [int] NOT NULL,
	[MaMh] [int] NOT NULL,
	[SoLuong] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[MaDh] ASC,
	[MaMh] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 9/20/2018 10:29:54 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[THANHVIEN](
	[TenTk] [nchar](30) NOT NULL,
	[Email] [nchar](50) NOT NULL,
	[MatKhau] [nchar](30) NOT NULL,
	[LoaiTk] [bit] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[TenTk] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET IDENTITY_INSERT [dbo].[DANHMUC] ON 

INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (11, N'Vi Điều Khiền - Nhúng', N'images/icon/icon1.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (12, N'Mạch Điện Tử', N'images/icon/icon2.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (13, N'Linh Kiện Điện Tử', N'images/icon/icon3.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (14, N'Module - Cảm Biến', N'images/icon/icon4.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (15, N'Phụ Kiện Điện Tử', N'images/icon/icon5.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (16, N'IC - Chức Năng', N'images/icon/icon6.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (17, N'Robot - Pin', N'images/icon/icon7.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (18, N'Led - Oneled', N'images/icon/icon8.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (19, N'Smart Home', N'images/icon/icon9.png                                                                                                                                                                                   ')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (20, N'3D Printer & CNC', N'images/icon/icon10.png                                                                                                                                                                                  ')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
SET IDENTITY_INSERT [dbo].[MATHANG] ON 

INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (1, 12, N'[Đặt Hàng] LCD Nextion 5.0 UART HMI Touch (Ver Nextion)', 100, 1750000.0000, N'images\machdientu\m1\m0.jpg,images\machdientu\m1\1.jpg,images\machdientu\m1\2.jpg                                                                                                                       ', N'- Tính năng giao tiếp qua UART HMI<br>
-  Thu nhận và hiển thị các hình ảnh từ các thiết bị bắn sang.<br>
- Phiên bản Nextion dùng tiếng anh, giá cao hơn.', N'IC	
NX8048T050
<br>Display Resolution	 
<br>Display Interface	Serial
<br>Screen Type	Touch Screen
<br>Display Controller	No
<br>TFT display interface	N/A<br>
Display Size	5.0”
<br>Board Size	 <br>
Expand	
SD Card Socket
Touch Screen', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
<br>-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'- LCD
- 2.4 uart
- mành hình hiển thị')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (3, 12, N'[Đặt Hàng] LCD Nextion 7.0 UART HMI Touch (Ver Nextion)', 90, 1950000.0000, N'images\machdientu\m2\m0.jpg,images\machdientu\m2\1.jpg                                                                                                                                                  ', N'- Tính năng giao tiếp qua UART HMI<br>
-  Thu nhận và hiển thị các hình ảnh từ các thiết bị bắn sang.<br>
- Phiên bản Nextion dùng tiếng anh, giá cao hơn.', N'IC	NX8048T070
Display Resolution	 
Display Interface	Serial
Screen Type	Touch Screen
Display Controller	No
TFT display interface	N/A
Display Size	7.0”
Board Size	 
Expand	
SD Card Socket
Touch Screen', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'- LCD
- 2.4 uart
- mành hình hiển thị')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (6, 12, N'[Đặt Hàng] Phim Cảm Quang 200 Mét', 80, 3950000.0000, N'images\machdientu\m3\m0.jpg,images\machdientu\m3\1.jpg                                                                                                                                                  ', N'- Sử dụng làm mạch in', N'- Kích thước 200 Mét
- Cuôn to', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Cảm quang<br>
- Phim<br>
- Làm mạch.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (30, 12, N'[Đặt hàng]LCD Nextion 5.0 UART HMI Touch  NX8048K050', 122, 2600000.0000, N'images\machdientu\m4\m0.jpg,images\machdientu\m4\1.jpg,images\machdientu\m4\2.jpg,images\machdientu\m4\3.jpg,images\machdientu\m4\4.jpg                                                                 ', N'- LCD Nextion 5.0 NX8048K050 là phiên bản nâng cao hơn của các bản LCD Nextion tiêu chuẩn. Bổ sung thêm một số chức năng mới như : tích hợp RTC , hỗ trợ lưu dữ liệu vào Flash, hỗ trợ GPIO, dung lượng flash lớn hơn và CPU clock lớn hơn.', N'- Loại cảm ứng: Điện Trở.<br>
- Hỗ trợ tích hợp RTC.<br>
- Hỗ trợ GPIO.<br>
- Giao diện Thẻ SD: hỗ trợ tối đa 32G thẻ Micro TF/SD (FAT32 định dạng tập tin).<br>
- Flash dữ liệu dung lượng : 32 MB.<br>
- EEPROM: 1024 byte.<br>
- RAM: 8192 byte.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".', N'- LCD Nextion 5.0 UART HMI Touch (Ver Nextion)  NX8048K050<br>
- NX8048K050<br>
- lcd nextion<br>
- lcd uart<br>
- lcd hmi.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (32, 12, N'[VN] Màn Hình DSO138 2.4in TFT', 56, 190000.0000, N'images\machdientu\m5\m0.jpg,images\machdientu\m5\2.jpg                                                                                                                                                  ', N'- Thay thế khi màn hình máy hiện sóng TFT gặp sự cố ', N'- Màn hình TFT 2.4 Inch', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Màn Hình  DSO138<br> - DSO138')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (33, 12, N'Bộ BreadBoard XF-25', 50, 39000.0000, N'images\machdientu\m6\m0.jpg,images\machdientu\m6\1.jpg,images\machdientu\m6\2.jpg                                                                                                                       ', N'- BreadBoard phục vụ lắp ráp mạch điện tử học tập, test...', N'- Bộ BreadBoard gồm 1 board gắn và 6 board cắm rời<br>
- Kích thước : 93*133*8MM.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của  Banlinhkien.Vn <br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Bộ BreadBoard XF-25<br>
- Board test<br>
- BreadBoard XF<br>
- BreadBoard<br>
- Mạch test.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (34, 12, N'Bộ Máy Lắc Bột Sắt Làm Mạch In Mini HS', 50, 190000.0000, N'images\machdientu\m7\m0.jpg,images\machdientu\m7\1.jpg,images\machdientu\m7\2.jpg,images\machdientu\m7\3.jpg,images\machdientu\m7\4.jpg                                                                 ', N'- Sử dụng trong quá trình làm mạch in thủ công<br>
- Sử dụng hỗ trợ lắc mực săm....', N'- Điện áp : 4.5V DC<br>
- Sử dụng pin con thỏ loại AA.<br>
- Số lượng Pin 3 Viên ( Sản phẩm chưa kèm Pin )<br>
- Sử dụng động cơ giảm tốc V3<br>
- Trọng lượng có thể để lên lắc max 2KG<br>
- Sản phẩm được làm bằng mica 3MM và hộp nhựa có độ thẫm mỹ cao.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Máy lắc.<br>- Bột sắt.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (36, 12, N'Bóng UV 8W (Thay Thế Cho Bộ Đèn UV)', 110, 100000.0000, N'images\machdientu\m8\m0.jpg,images\machdientu\m8\1.jpg,images\machdientu\m8\2.jpg,images\machdientu\m8\3.jpg                                                                                            ', N'- Dùng chụp chiếu các chất UV, làm mạch in cảm quang, khắc vẽ bằng UV...<br>
- Hàng dùng thay bóng cho  Bộ Đèn UV khi bị vỡ hoặc khách hàng chế được chấn lưu điện tử..', N'- Kích Thước: 31Cm<br>
- Bước Sóng: 365nm<br>
- Công Suất: 8W<br>
- Trọng lượng: 75g<br>
- Không có chấn lưu và máng kèm theo.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bóng UV.<br>
- Cảm Quang.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (37, 12, N'Bút Máy Khoan Mini BK-165MN', 122, 99000.0000, N'images\machdientu\m9\m0.jpg,images\machdientu\m9\1.jpg,images\machdientu\m9\2.jpg,images\machdientu\m9\3.jpg,images\machdientu\m9\4.jpg                                                                 ', N'- Bút khoan có các đầu mài, đánh bóng. Ứng dụng cho mài, giũa, đánh bóng.', N'- Chiều dài : 16.5 cm<br>
- Sử dụng 2 PIN AA.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bút Máy Khoan Mini BK-165MN<br>
- bút máy khoan<br>
- bút mài<br>
- bút đánh bóng.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (38, 12, N'Đầu Chụp 1.3 - 1.7MM_1_Chiếc', 300, 5000.0000, N'images\machdientu\m10\m0.jpg,images\machdientu\m10\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini..', N'- Đường kính kẹp : 1.3-1.7MM<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 1.3-1.7MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (39, 12, N'Đầu Chụp 2.1-2.5MM_1_Chiếc', 200, 5000.0000, N'images\machdientu\m11\m0.jpg,images\machdientu\m11\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini.', N'- Đường kính kẹp : 2.1-2.5MM<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 2.1-2.5MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (40, 12, N'Đầu Chụp 3.0-3.2MM_1_Chiếc', 300, 5000.0000, N'images\machdientu\m12\m0.jpg,images\machdientu\m12\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini.', N'- Đường kính kẹp : 3.0-3.2MM.<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 3.0-3.2MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (41, 12, N'DIY Mạch Báo Dung Lượng Pin 3.7-12V DL-3712', 100, 52000.0000, N'images\machdientu\m13\m0.jpg,images\machdientu\m13\1.jpg,images\machdientu\m13\2.jpg,images\machdientu\m13\3.jpg,images\machdientu\m13\4.jpg,images\machdientu\m13\5.jpg                                ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Mạch báo dung lượng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (42, 12, N'Giá Đỡ Màn Hình LCD1602', 100, 35000.0000, N'images\machdientu\m14\m0.jpg,images\machdientu\m14\1.jpg,images\machdientu\m14\2.jpg,images\machdientu\m14\3.jpg                                                                                        ', N'- Giá đỡ giữ, cố định màn hình LCD1602.', N'- Chất liệu Mica trong.<br>
- Sử dụng cho màn hình LCD1602.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Giá Đỡ Màn Hình LCD1602')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (43, 12, N'Khoan Tay Thủ Công MH-MS533', 70, 130000.0000, N'images\machdientu\m15\m0.jpg,images\machdientu\m15\1.jpg,images\machdientu\m15\2.jpg,images\machdientu\m15\3.jpg,images\machdientu\m15\4.jpg                                                            ', N'- Làm máy khoan mạch in cầm tay.<br>- Làm máy khoan gỗ, hoặc nhôm các vật liệu kim loại mềm, ...', N'- Chiều Dài: 195MM.<br>- Đường kính kẹp được các loại mũi Khoan: 1.0-1.5MM, xiết chặt 0.5MM.<br>- Lưu Ý: Sản phẩm có độ rung, nên cần định vị trước khi khoan.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'-  Khoan Tay Thủ Công')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (44, 12, N'LCD 4.3 UART HMI Cảm Ứng Điện Trở LCD43-HMI', 100, 1180000.0000, N'images\machdientu\m16\m0.jpg,images\machdientu\m16\1.jpg,images\machdientu\m16\2.jpg,images\machdientu\m16\3.jpg,images\machdientu\m16\4.jpg                                                            ', N'- LCD 4.3 UART HMI ứng dụng trong các hệ thống, sản phẩm UI ( User Interface - giao diện người dùng ).<br>
- Màn hình cảm ứng điện trở giúp cho thao tác thuận tiện, dễ dàng hơn...<br>
- Hỗ trợ lệnh : mở trang / thay đổi giá trị biến / đọc biến qua UART.', N'- Màn hình HMI LCD.<br>
- Cỗng giao tiếp : UART.<br>
- Độ phân giản màn hình : 480×272 pixels.<br>
- Kích thước màn hình : 4.3″.<br>
- Loại cảm ứng : điện trở.<br>
- Bộ nhớ chương trình và đồ họa : 8Mb.<br>
- Hộp màn hình : nhựa tốt không tái chế.<br>
- Điện áp hoạt động 12-35V ( cấp nguồn cho board ) / 5V cấp nguồn qua cổng UART.<br>
- Hỗ trợ module relay ngoài : 20 bộ ( mỗi bộ 10 relay ).<br>
- Hỗ trợ cảm biến DS18B20 / DHT31 / ADC.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'- LCD 4.3 UART HMI Cảm Ứng Điện Trở LCD43-HMI')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (46, 13, N'Cọc Đồng Thau M2 13MM Đực Cái SBB-213 Japan 4c', 200, 40000.0000, N'images\linhkiendientu\t1\t0.jpg,images\linhkiendientu\t1\1.jpg                                                                                                                                          ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Cọc đồng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (47, 13, N'CON 2 141V-02P 2.54MM', 1000, 4000.0000, N'images\linhkiendientu\t2\t0.jpg,images\linhkiendientu\t2\1.jpg                                                                                                                                          ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- CON 2 141V-02P 2.54MM')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (48, 13, N'Dây Nguồn DC5.5x2.1MM Có Công Tắc  LSD-201', 200, 15000.0000, N'images\linhkiendientu\t3\t0.jpg,images\linhkiendientu\t3\1.jpg,images\linhkiendientu\t3\2.jpg,images\linhkiendientu\t3\3.jpg                                                                            ', N'- Dây nguồn DC 2 đầu đực - cái, có công tắc bật tắt.', N'- Jack DC 5.5x2.1mm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Dây Nguồn DC5.5x2.1MM Có Công Tắc  LSD-201<br>
- day nguon dc<br>
- jack dc.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (49, 13, N'Header 12Px2 5557-4.2 Cái', 150, 5000.0000, N'images\linhkiendientu\t4\t0.jpg,images\linhkiendientu\t4\1.jpg,images\linhkiendientu\t4\2.jpg,images\linhkiendientu\t4\3.jpg                                                                            ', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'Header 12Px2 5557-4.2 Cái.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (50, 13, N'Jack Nối Dây 3 Chân 0.08-4.0MM SPL-3', 250, 12000.0000, N'images\linhkiendientu\t5\t0.jpg,images\linhkiendientu\t5\1.jpg,images\linhkiendientu\t5\2.jpg,images\linhkiendientu\t5\3.jpg                                                                            ', N'- SPL-3 là jack nối dây sẽ giúp cho việc đấu nối các đường dây điện dễ dàng và an toàn hơn. Jack nối sử dụng chất liệu cách nhiệt (PA66).', N'- Điện áp định mức : 400V.<br>
- Điện áp xung : 4KV.<br>
- Dòng định mức : 32A.<br>
- Vật liệu tiếp điện : Đồng.<br>
- Số đầu nối : 3 dây<br>
- Tiết diện dây : 0.08 ~ 4.0mm2.<br>
- AW :  28 ~ 12AWG.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Jack Nối Dây 3 Chân 0.08-4.0MM SPL-3.<br>
- đầu nối dây.<br>
- dau noi day.<br>
- noi day dien<br>
- nối dây điện.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (51, 13, N'Jack_Nối_Dây_2_Chân_0.08-4.0MM_SPL-2', 255, 9000.0000, N'images\linhkiendientu\t6\t0.jpg,images\linhkiendientu\t6\1.jpg,images\linhkiendientu\t6\2.jpg                                                                                                           ', N'- SPL-2 là jack nối dây sẽ giúp cho việc đấu nối các đường dây điện dễ dàng và an toàn hơn. Jack nối sử dụng chất liệu cách nhiệt (PA66).', N'- Điện áp định mức : 250V.<br>
- Điện áp xung : 4KV.<br>
- Dòng định mức : 32A.<br>
- Vật liệu tiếp điện : Đồng.<br>
- Số đầu nối : 2 dây<br>
- Tiết diện dây : 0.08 ~ 4.0mm2.<br>
- AW :  28 ~ 12AWG.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Jack Nối Dây 2 Chân 0.08-4.0MM SPL-2.<br>
- đầu nối dây.<br>
- dau noi day.<br>
- noi day dien<br>
- nối dây điện.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (53, 13, N'Trở 50W 5 phần trăm 2R RX24', 155, 21000.0000, N'images\linhkiendientu\t7\t0.jpg,images\linhkiendientu\t7\1.jpg,images\linhkiendientu\t7\2.jpg                                                                                                           ', N'- Điện trở công suất lớn vỏ nhôm tản nhiệt tốt, dòng tải tối đa cao chuyên dùng trong ứng dụng làm giả tải, trở xả, giới hạn dòng điện...', N'- Trở công suất : 50W.<br>
- Giá trị : 2R.<br>
- Màu vàng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở 50W 5% 2R RX24<br>
- trở công suất<br>
- tro cong suat.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (54, 13, N'Trở 200W 5 phần trăm 10R RXLG', 100, 90000.0000, N'images\linhkiendientu\t8\t0.jpg,images\linhkiendientu\t8\1.jpg,images\linhkiendientu\t8\2.jpg,images\linhkiendientu\t8\3.jpg                                                                            ', N'- Điện trở công suất lớn vỏ nhôm tản nhiệt tốt, dòng tải tối đa cao chuyên dùng trong ứng dụng làm giả tải, trở xả, giới hạn dòng điện...', N'- Trở công suất : 200W.<br>
- Sai số: 5%.<br>
- Giá trị: 10R.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở 200W 5% 10R RXLG<br>
- trở công suất<br>
- tro cong suat.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (56, 13, N'Trở 0402 1 phần trăm 1M 50c', 1000, 8000.0000, N'images\linhkiendientu\t9\t0.jpg,images\linhkiendientu\t9\1.jpg                                                                                                                                          ', N'- Trở 0402 1% 1M (50c).', N'- Trở dán 0402.<br>
- Giá trị 1 MΩ.<br>
- Sai số: 1%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở dán 0402 1% 1M.<br>
- smd 0402<br>
- trở dán 0402<br>
- tro 0402<br>
- tro dan 0402')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (57, 13, N'Trở 0402 1 phần trăm 124K 50c', 1500, 10000.0000, N'images\linhkiendientu\t10\t0.jpg,images\linhkiendientu\t10\1.jpg                                                                                                                                        ', N'- Trở 0402 1% 124k (50c).', N'- Trở dán 0402.<br>
- Giá trị 124K.<br>
- Sai số: 1%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- smd 0402<br>
- trở dán 0402<br>
- tro 0402<br>
- tro dan 0402')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (58, 13, N'Trở Vạch 18W 5 phần trăm 10K 50c', 2050, 4000.0000, N'images\linhkiendientu\t11\t0.jpg,images\linhkiendientu\t11\1.jpg                                                                                                                                        ', N'- Trở cắm 1/8W 5% 10k (50c)', N'- Giá trị 10K.<br>
- Công suất: 1/8W.<br>
- Sai số: 5%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- trở cắm<br>
- trở 1/8W<br>
- tro 1 : 8 W<br>
- tro 1/8w')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (60, 13, N'Trở Vạch 18W 5 phần trăm 33K 50c', 2000, 4000.0000, N'images\linhkiendientu\t12\t0.jpg,images\linhkiendientu\t12\1.jpg                                                                                                                                        ', N'Trở Vạch 1/8W 5% 33K 50c', N'- Giá trị 33K.<br>
- Công suất: 1/8W.<br>
- Sai số: 5%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- trở cắm<br>
- trở 1/8W<br>
- tro 1 : 8 W<br>
- tro 1/8w')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (61, 13, N'Tụ 0402 104-100nF ±10 phần trăm 50V X7R 0402B104K500NT 10c', 2000, 5000.0000, N'images\linhkiendientu\t13\t0.jpg,images\linhkiendientu\t13\1.jpg                                                                                                                                        ', N'', N'- Kích thước: 0402.<br>
- Giá trị: 100nF 10V', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ 100nF')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (63, 13, N'Tụ 0402 220-22pF 5phần trăm 50V 10c', 1050, 9000.0000, N'images\linhkiendientu\t14\t0.jpg,images\linhkiendientu\t14\1.jpg                                                                                                                                        ', N'- Dùng trong các mạch điện tử.', N'- Điện dung : 22pF<br>
- Điện áp : 50V<br>
- Sai số : +/- 5%<br>
- Kích thước : 0402 - 1.00mm x 0.50mm', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ 0402<br>
- Tụ dán<br>
- Tụ smd')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (64, 13, N'Tụ Hóa SANYO 150uF 16V 5c', 250, 45000.0000, N'images\linhkiendientu\t15\t0.jpg,images\linhkiendientu\t15\1.jpg                                                                                                                                        ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'Tụ Hóa SANYO 150uF 16V')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (65, 13, N'Tụ Tantalum 153-15nF 50V 5.08MM Sứ Vàng', 3500, 3000.0000, N'images\linhkiendientu\t16\t0.jpg,images\linhkiendientu\t16\1.jpg                                                                                                                                        ', N'- Tụ Tantalum có bản cực nhôm và dùng gel tantal làm dung môi, có trị số rất lớn với thể tích nhỏ.<br>
- Tụ Tantalum không bị khô giảm dung lượng như tụ hóa, bền hơn, trị số chính xác hơn tụ hóa. Thường sử dụng trong các mạch khuếch đại...', N'- Điện dung : 15nF.<br>
- Điện áp : 50V.<br>
- Chân cắm : DIP5.08 .', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ Tantalum 15nF')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (67, 14, N'[Đặt Hàng] Module Cảm Biến Vân Tay FPC1020A', 200, 650000.0000, N'images\Module _ cam_bien\m1\m0.jpg,images\Module _ cam_bien\m1\1.jpg                                                                                                                                    ', N'1020A là một phát triển trung module cho nhận dạng vân tay được thiết kế cho SCM. nó có một kích thước nhỏ, tiêu thụ điện năng thấp, giao diện đơn giản, độ tin cậy cao, nhỏ vân tay template (200 bytes), công suất lớn nhận dạng vân tay (1000 nhận dạng vân tay thời gian đáp ứng là ít hơn 1 (Giây) và khác lợi thế, nó có thể được rất dễ dàng để nhúng vào nó trong việc sử dụng hệ thống, bao gồm nhận dạng vân tay sản phẩm để đáp ứng nhu cầu khách hàng.', N'Sensor độ phân giải: 500 DPI<br>
cảm biến pixels: 160*160<br>
suất vân tay: 150 cái (1000, 2000, 4000 cái có thể được tùy chỉnh)<br>
tính năng vân tay khai thác thời gian: < 0.45 giây<br>
Fake rate: 0.0001% .....', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Cảm biến vân tay')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (68, 14, N'[Đặt Hàng]Bộ Van Cảm Ứng Xả Nước Tiểu Nam 12VDC XTN12 HS', 150, 490000.0000, N'images\Module _ cam_bien\m2\m0.jpg,images\Module _ cam_bien\m2\1.jpg,images\Module _ cam_bien\m2\2.jpg,images\Module _ cam_bien\m2\3.jpg                                                                ', N'- ứng dụng xả nước <br>
- phát hiện vật cản xả nước.', N'- Điện Áp 12VDC<br>- Khi người vào vị trí, sau 3s van xả tạm 2s, nếu người liền rời khỏi trong vòng 3s sau đó thì van xã rữa thêm 3s. <br>- Nếu sau 3s kể từ khi xã tạm mà người rời đi thì van xả rữa sạch 6s.<br>- Nếu trong 6h mà không có người sử dụng, van xã tráng bồn 2s (để chống hôi và quá khô).', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'Bộ Van Cảm Ứng Xả Nước Tiểu Nam')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (71, 14, N'[Sắp Về] Module Chuyển Đổi TDS sang UART-TDS-V1', 200, 185000.0000, N'images\Module _ cam_bien\m3\m0.jpg,images\Module _ cam_bien\m3\1.jpg,images\Module _ cam_bien\m3\2.jpg,images\Module _ cam_bien\m3\3.jpg,images\Module _ cam_bien\m3\4.jpg                              ', N'- Module chuyển đổi tín hiệu TDS sang UART<br>
- Ứng dụng trong các thiết bị kiểm soát chất lượng nước, lọc nước...', N'- Tương thích với các Đầu Đo TDS  tại BanLinhKien.<br>
- Điện áp làm việc: DC5V.<br>
- Chuẩn UART TTL.<br>
- Tốc Độ Mặc Định 9600.<br>
Bảng Hướng dẫn sử dụng lệnh AT.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Đầu Đo TDS<br>
- tds sensor<br>
- cảm biến tds')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (72, 14, N'[VN] Máy Kiểm Tra TDS-Mi Chính Hãng', 200, 185000.0000, N'images\Module _ cam_bien\m4\m0.jpg,images\Module _ cam_bien\m4\1.jpg,images\Module _ cam_bien\m4\2.jpg,images\Module _ cam_bien\m4\3.jpg,images\Module _ cam_bien\m4\4.jpg                              ', N'Bút TDS Xiaomi được thiết kế nhỏ, đẹp và cao cấp, sử dụng 2 pin cúc.<br>
Sử dụng để đo nồng độ dung dịch thủy canh.<br>
Chiếc bút TDS Xiaomi giúp bạn đo được độ tinh khiết của nước sinh hoạt, hoặc nước đóng chai có đạt chất lượng hay không. Bạn cũng có thể sử dụng nó để đo nước thành phẩm của máy lọc nước để xác định xem đã đến lúc cần thay bộ lọc hay chưa.', N'Hiển thị: Màn hình LCD lớn và dễ đọc.<br>
Phạm vi đo: 0-9990 ppm.<br>
Trọng lượng: 27.4g.<br>
Màu sắc: trắng sáng bóng.<br>
Hàng chính hãng Xiaomi (Nguyên hộp)', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bộ kiểm tra TDS')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (73, 14, N'[VN] Máy Phát Tần Số DDS', 150, 475000.0000, N'images\Module _ cam_bien\m5\m0.jpg,images\Module _ cam_bien\m5\1.jpg,images\Module _ cam_bien\m5\2.jpg                                                                                                  ', N'', N'- Máy phát xung:<br>
+ Xung sin <br>
+ Xung vuông<br>
+ Xung tam giác<br>
+ Xung răng cưa<br>
+ Điện tâm đồ tần số cao', N'- Hỗ trợ kiểm tra', N'Máy phát tần số')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (74, 14, N'[VN] Module Auido Bluetooth 4.0 BT-40AU', 200, 65000.0000, N'images\Module _ cam_bien\m6\m0.jpg,images\Module _ cam_bien\m6\1.jpg,images\Module _ cam_bien\m6\2.jpg                                                                                                  ', N'- Sản phẩm ứng dụng nghe nhạc qua bluetooth 4.0.<br>Module bluetooth 4.0 audio có kích thước nhỏ gọn, cho âm thanh stereo 2 kênh, thích hợp chế loa/tai nghe không dây. Bluetooth 4.0 hay còn gọi là Bluetooth LE (Low Energy) cho khả năng tiết kiệm điện mà vẫn giữ khoảng cách truyền cũng như tốc độ truyền tốt. Ngoài ra module còn có các chân chờ để gắn thêm Led báo hiệu, nút MUTE,...', N'Điện áp: 5V.<br>
Chuẩn Bluetooth: 4.0.<br>
Tần số: 2.4GHz.<br>
Số kênh Audio: 2 (Stereo).<br>
Kích thước: 30x20x3mm', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bluetooth<br>- 4.0<br>- Phát nhạc.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (75, 14, N'[VN] Module DS3231 Raspberry Pi', 160, 80000.0000, N'images\Module _ cam_bien\m7\m0.jpg,images\Module _ cam_bien\m7\1.jpg,images\Module _ cam_bien\m7\2.jpg                                                                                                  ', N'- Sử dụng giao tiếp với các dòng vi điều khiển chuẩn I2C .<br>
- Sử dụng tương thích với Raspberry.<br>
- Ứng dụng mạch đếm thời gian, đồng hồ...', N'- Điện Áp : DC3.3-5.5V<br>
- Sử dụng IC Readtime DS3231 +- 5ppm <br>
- Pin Cmos 3V <br>
- Chuẩn Giao Tiếp: I2C.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Đồng hồ<br>- Module delay')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (76, 14, N'Cảm Biến Âm Thanh 3x6MM 42DB TONETECK 4c', 300, 20000.0000, N'images\Module _ cam_bien\m8\m0.jpg,images\Module _ cam_bien\m8\1.jpg                                                                                                                                    ', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Cảm biến âm thanh')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (77, 14, N'Công Tắc Cảm Biến Chuyển Động DC12-24V 5A LN-SPIR-1206', 350, 110000.0000, N'images\Module _ cam_bien\m9\m0.jpg,images\Module _ cam_bien\m9\1.jpg,images\Module _ cam_bien\m9\2.jpg,images\Module _ cam_bien\m9\3.jpg                                                                ', N'- LN-SPIR-1206 là công tắc cảm biến phát hồng ngoại phát hiện chuyển động, sử dụng điều khiển để bật / tắt tải.', N'- Khoảng cách cảm biến: 5 ~ 8 M.<br>
- Điện áp vào : DC12 / 24V.<br>
- Điện áp đầu ra: DC12 / 24V.<br>
- Dòng ra max : 5A.<br>
- Góc cảm biến : 60°.<br>
- Thời gian trễ : 1-10 phút (có thể điều chỉnh)', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Công Tắc Cảm Biến Chuyển Động DC12-24V 5A LN-SPIR-1206<br>
- cong tac cam bien hong ngoai<br>
- cảm biến hồng ngoại')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (78, 14, N'Công Tắc Cảm Biến Chuyển Động DC12-24V 30A  LSD-01-CH', 45, 185000.0000, N'images\Module _ cam_bien\m10\m0.jpg,images\Module _ cam_bien\m10\1.jpg,images\Module _ cam_bien\m10\2.jpg,images\Module _ cam_bien\m10\3.jpg                                                            ', N'- Công Tắc Cảm Biến hồng ngoại phát hiện chuyển động, điều khiển tải đầu ra.<br>
- Công tắc có dòng ra cao max 30A.', N'- Nguồn cấp điện áp: 12V hoặc 24V.<br>
- Điện áp đầu ra: 12V hoặc 24V.<br>
- Dòng ra tải max : 30A.<br>
- Nhiệt độ làm việc: -20-60 ° C.<br>
- Khoảng cách cảm biến: 5-8 M.<br>
- Góc phát hiện : 120°.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Công Tắc Cảm Biến Chuyển Động DC12-24V 30A  LSD-01-CH<br>
- cong tac cam bien hong ngoai<br>
- cảm biến hồng ngoại<br>
- module hồng ngoại.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (79, 14, N'Công Tắc Cảm Biến Chuyển Động PIR TDL-2024 HS', 30, 120000.0000, N'images\Module _ cam_bien\m11\m0.jpg,images\Module _ cam_bien\m11\1.jpg,images\Module _ cam_bien\m11\2.jpg,images\Module _ cam_bien\m11\3.jpg,images\Module _ cam_bien\m11\4.jpg                         ', N'
- Công Tắc sử dụng Cảm Biến hồng ngoại, phát hiện chuyển động từ tia hồng ngoại phát ra từ con người.<br>
- Ứng dụng hệ thống báo động, điều khiển đèn, thiết bị.', N'- Điện áp vào: DC 5-24V.<br>
- Điện áp ra: DC 5-24V.<br>
- Dòng ra tải max : 4A.<br>
- Góc phát hiện : 120°.<br>
- Thời gian trễ ~15s.<br>
- Khoảng cách phát hiện: ~3m.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Công Tắc Cảm Biến Chuyển Động PIR TDL-2024 HS<br>
- cong tac cam bien<br>
- bao dong<br>
- chống trộm<br>
- báo động<br>
- chong trom.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (80, 14, N'Dimmer DC12-24V 30A DR-LSD-30A', 42, 160000.0000, N'images\Module _ cam_bien\m12\m0.jpg,images\Module _ cam_bien\m12\1.jpg,images\Module _ cam_bien\m12\2.jpg,images\Module _ cam_bien\m12\3.jpg                                                            ', N'- Dimmer DC điều khiển động cơ, đèn bàn, led 5050 3528...dòng ra tải max 30A.<br>
- Dimmer có vỏ chắc chắn, khung có lỗ vít dễ dàng cố định.', N'- Điện áp hoạt động : 12 - 24VDC.<br>
- Dòng ra max : 30A.<br>
- Công suất tối đa : 720W.<br>
- Nhiệt độ làm việc: -20 ~ 60 °C.<br>
- Kích thước: 85 mm (L) x 66 mm (W) x 20 mm (H).<br>
- Trọng lượng: 90 gram.<br>
- Đóng gói sản phẩm: 110g.<br>
- Vật liệu: kim loại.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Dimmer DC12-24V 30A DR-LSD-30A<br>
- dimmer dc12v<br>
- điều khiển động cơ<br>
- điều khiển độ sáng đèn<br>
- điều khiển led')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (81, 14, N'Mạch PLC FX3U-24MT Transistor', 20, 950000.0000, N'images\Module _ cam_bien\m13\m0.jpg,images\Module _ cam_bien\m13\1.jpg,images\Module _ cam_bien\m13\2.jpg,images\Module _ cam_bien\m13\3.jpg,images\Module _ cam_bien\m13\4.jpg                         ', N'- Module PLC FX3U-24MT điều khiển đầu ra Transistor.<br>
- Hỗ trợ mã hóa 16 bit, Hỗ trợ ba loại ngắt, Hỗ trợ giao tiếp 485 4 loại giao thức truyền thông, Hỗ trợ 1N, 2N, 3U của các hướng dẫn, Tắt nguồn để duy trì dải cài đặt riêng của họ, chương trình 8000 bước, tốc độ tải xuống 38400, hoạt động điểm nổi, HMI, quét 3000 bước 1ms.', N'- Điện áp làm việc: 24VĐC.<br>
- Phần mềm lập trình: GX developer.<br>
- Cáp nạp cho mạch: USB TO COM HL340.<br>
- Tốc độ speed: 38.4 Kbps.<br>
- 14 ngõ vào, 10 ngõ ra transistor, 6AD, 2DA, RS232/RS485<br>
- Phần tử đầu vào X : Đầu vào DC24 X0-X27 ， mức thấp, X0-5 là cổng đầu vào có tốc độ cao (Mặc định là 6K, tùy chọn 100KHZ).', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.
', N'- Mạch PLC FX3U-24MT Transistor<br>
- module plc FX3U-24MT <br>
- mach plc')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (82, 14, N'Module Điều Khiển Động Cơ L293 Mini MN-L293D', 55, 55000.0000, N'images\Module _ cam_bien\m14\m0.jpg,images\Module _ cam_bien\m14\1.jpg,images\Module _ cam_bien\m14\2.jpg,images\Module _ cam_bien\m14\3.jpg,images\Module _ cam_bien\m14\4.jpg                         ', N'-  Module L293 Mini là bộ điều khiển động cơ 4 kênh, điện áp và dòng điều khiển cao. Sử dụng chip L293D H-Bridge điều khiển động cơ DC, động cơ bước.<br>
- Module có Jump mở rộng kết nối với Vi điều khiển, Arduino... điều khiển động cơ (PWM).', N'- Điện áp điều khiển động cơ : DC 9 - 24V (có chân kết nối hàn mạch để chuyển sang điều khiển động cơ 5V).<br>
- Điện áp hoạt động : DC5V.<br>
- Dòng điều khiển : 600mA.<br>
- Kích thước : 38 x 35 x 12mm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.
', N'- Module Điều Khiển Động Cơ L293 Mini MN-L293D<br>
- module dieu khien dong co<br>
- động cơ dc<br>
- dong co buoc<br>
- động cơ bước')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (83, 14, N'Module Relay Mini 2 Kênh 12V RL-M2-12V', 100, 32000.0000, N'images\Module _ cam_bien\m15\m0.jpg,images\Module _ cam_bien\m15\1.jpg,images\Module _ cam_bien\m15\2.jpg,images\Module _ cam_bien\m15\3.jpg                                                            ', N'- Module điều khiển relay 12V 2 kênh, module có thiết kế nhỏ gọn, cách ly đầu vào.<br>
- Có Jump chốt để chọn đóng cắt Relay mức cao hay mức thấp (H or L) giúp dễ dàng hơn khi sử dụng và chuyển đổi, ngoài ra mạch có mối hàn cho ra điện áp 12V.', N'- Điện áp vào 12VDC.<br>
- 2 Relay đầu ra.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Module Relay Mini 2 Kênh 12V RL-M2-12V<br>
- module dieu khien relay<br>
- mach dieu khien relay')
SET IDENTITY_INSERT [dbo].[MATHANG] OFF
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'admin                         ', N'hongphonghoangquy@gmail.com                       ', N'admin123                      ', 1)
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'admin2                        ', N'hongphonghoangquy@gmail.com                       ', N'admin123                      ', 1)
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'phongphanh                    ', N'hongphonghoangquy@gmail.com                       ', N'admin123                      ', 0)
ALTER TABLE [dbo].[DONHANG]  WITH CHECK ADD FOREIGN KEY([TenTk])
REFERENCES [dbo].[THANHVIEN] ([TenTk])
GO
ALTER TABLE [dbo].[MATHANG]  WITH CHECK ADD FOREIGN KEY([MaDm])
REFERENCES [dbo].[DANHMUC] ([MaDm])
GO
ALTER TABLE [dbo].[MH-DH]  WITH CHECK ADD FOREIGN KEY([MaDh])
REFERENCES [dbo].[DONHANG] ([MaDh])
GO
ALTER TABLE [dbo].[MH-DH]  WITH CHECK ADD FOREIGN KEY([MaMh])
REFERENCES [dbo].[MATHANG] ([MaMh])
GO
USE [master]
GO
ALTER DATABASE [ThietBiDienTu] SET  READ_WRITE 
GO
