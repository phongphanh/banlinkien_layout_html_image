USE [master]
GO
/****** Object:  Database [ThietBiDienTu]    Script Date: 9/19/2018 2:26:10 PM ******/
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
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 9/19/2018 2:26:10 PM ******/
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
/****** Object:  Table [dbo].[DONHANG]    Script Date: 9/19/2018 2:26:10 PM ******/
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
/****** Object:  Table [dbo].[MATHANG]    Script Date: 9/19/2018 2:26:10 PM ******/
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
/****** Object:  Table [dbo].[MH-DH]    Script Date: 9/19/2018 2:26:10 PM ******/
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
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 9/19/2018 2:26:10 PM ******/
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

INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (1, 12, N'[Đặt Hàng] LCD Nextion 5.0 UART HMI Touch (Ver Nextion)', 100, 1750000.0000, N'images\Mạch Điện Tử\[Đặt Hàng] LCD Nextion 5.0 UART HMI Touch (Ver Nextion)\[Đặt Hàng]_LCD_Nextion_5.0_UART_HMI Touch_(Ver_Nextion).jpg                                                                 ', N'- Tính năng giao tiếp qua UART HMI
-  Thu nhận và hiển thị các hình ảnh từ các thiết bị bắn sang.
- Phiên bản Nextion dùng tiếng anh, giá cao hơn.', N'IC	
NX8048T050
Display Resolution	 
Display Interface	Serial
Screen Type	Touch Screen
Display Controller	No
TFT display interface	N/A
Display Size	5.0”
Board Size	 
Expand	
SD Card Socket
Touch Screen', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'- LCD
- 2.4 uart
- mành hình hiển thị')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (3, 12, N'[Đặt Hàng] LCD Nextion 7.0 UART HMI Touch (Ver Nextion)', 150, 1950000.0000, N'images\Mạch Điện Tử\[Đặt Hàng] LCD Nextion 7.0 UART HMI Touch (Ver Nextion)\[Đặt_Hàng]_LCD_Nextion_7.0_UART_HMI _Touch (Ver_Nextion).jpg                                                                ', N'- Tính năng giao tiếp qua UART HMI
-  Thu nhận và hiển thị các hình ảnh từ các thiết bị bắn sang.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (6, 12, N'[Đặt Hàng] Phim Cảm Quang 200 Mét', 90, 3950000.0000, N'[Đặt_Hàng]_Phim_Cảm_Quang_200_Mét.jpg                                                                                                                                                                   ', N'- Sử dụng làm mạch in', N'- Kích thước 200 Mét
- Cuôn to', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'')
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
