USE [master]
GO
/****** Object:  Database [ThietBiDienTu]    Script Date: 9/21/2018 9:18:44 AM ******/
CREATE DATABASE [ThietBiDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThietBiDienTu', FILENAME = N'G:\text\text\data-asp\ThietBiDienTu.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThietBiDienTu_log', FILENAME = N'G:\text\text\data-asp\ThietBiDienTu_log.ldf' , SIZE = 1088KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 9/21/2018 9:18:44 AM ******/
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
/****** Object:  Table [dbo].[DONHANG]    Script Date: 9/21/2018 9:18:44 AM ******/
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
/****** Object:  Table [dbo].[MATHANG]    Script Date: 9/21/2018 9:18:44 AM ******/
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
/****** Object:  Table [dbo].[MH-DH]    Script Date: 9/21/2018 9:18:44 AM ******/
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
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 9/21/2018 9:18:44 AM ******/
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

INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (101, 15, N'Máy Hàn Dây Đồng Nhôm DC24V CT-24DN', 15, 350000.0000, N'images\PhuKienDienTu\sp501\a1.jpg,images\PhuKienDienTu\sp501\a2.jpg                                                                                                                                     ', N'- Chuyên dùng hàn các mối hàn to, cho xe máy, oto, sử dụng nguồn 1 chiều, an toàn cho người sử dụng.
- Đơn giản khi mang theo, tận dụng bình acquy trên xe máy.', N'- Model: CT-24DN.- Xuất xứ: ChiNa.
- Điện áp: DC24-48V (Có thể dùng DC12V nhưng công suất yếu).
- Dòng xả cao, nên phải sử dụng Acquy hoặc Pin Lipo 6S.
- Chuyên dùng cho các mối hàn to.- Lưu ý: Chỉ Hàn được .', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- máy hàn ')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (102, 15, N'Bút Viết Bảng Dạ Quang Màu Hồng DQ-63-P', 200, 30000.0000, N'images\PhuKienDienTu\sp502\a1.jpg,images\PhuKienDienTu\sp502\a2.jpg                                                                                                                                     ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (103, 15, N'[VN] Máy Hiện Sóng Oscilloscope Hantek DSO5102P 100MHz', 30, 6500000.0000, N'images\PhuKienDienTu\sp503\a1.jpg,images\PhuKienDienTu\sp503\a2.jpg                                                                                                                                     ', N'', N'• Model: DSO5102P 
• Băng thông: 100MHz
• Channel: 2 
• Real-Time mẫu: 1GSa / s 
• Mẫu Equivalent: 25GSa / s 
• Chiều sâu Memory: 40K 
• Rise Time: 3.5ns 
• Thời gian cơ bản chính xác: ± 50ppm 
• Thời gian Phạm vi cơ sở : 4ns / div-40 / div 
• impendance đầu vào: 1MΩ 
• VOLTS / DIV Range: 2mV / div ~ 5V / div 
• A / D Converter: 8 bit 
Phạm vi • Chức vụ: ± 50V (5V / div), ± 40V (2V / div ~ 500mV / div), ± 2V (200mV / div ~ 50mV / div), ± 400mV (20mV / div ~ 2mV / div) 
• DC Gain Độ chính xác: 
± 3% đối với chế độ mua lại bình thường hoặc trung bình, 5V / div để 10mV / div; 
± 4% đối với chế độ mua lại bình thường hoặc trung bình, 5mV / div để 2mV / div 
• Giới hạn Băng thông: 20MHz 
loại • Trigger: Edge, Video, Pulse, Slope, theo thời gian, Alternative 
• Kích hoạt Nguồn: CH1, CH2, EXT, EXT / 5, AC Line 
• Math: +, -, x, ÷, FFT 
• Cursor Đo lường: 
sự khác biệt điện áp giữa con trỏ: △ V; 
chênh giữa con trỏ: △ T; 
đối ứng của △ T trong Hertz (1 / ΔT ); 
• Auto Measuerment: Tần số, Thời gian, Mean, Vn-Pk, Cycli RMS, tối thiểu, tối đa, tăng thời gian, + độ rộng xung, -Pulse Width, Delay1-2Rise, Delay1-2Fall, + Duty, -Duty , Vbase, Vtop, Vmid, Vamp, chênh, Preshoot, Preiod Mean, Preiod RMS, FOVShoot, RPREShoot, BWIDTH, FRF 
• Màn hình: 7 "LCD TFT 16K màu, 800 * 480 điểm', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Oscilloscope.
- 2 Kênh
- Điều khiển qua USB')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (104, 15, N'[Đặt Hàng] Module Scan Barcode QR 1D2A UART GM65-1D2A', 40, 980000.0000, N'images\PhuKienDienTu\sp504\a1.jpg,images\PhuKienDienTu\sp504\a2.jpg                                                                                                                                     ', N'1. USB có dây máy quét mã vạch để nắm bắt 1D, 2D mã trên nhãn, giấy, điện thoại di động hoặc máy tính.
2. High-hiệu quả recognization và cao tốc độ tải lên cho việc cải thiện của bạn hiệu quả làm việc.
3. Với buzzer để nhắc nhở bạn rằng các chức năng quét thành công hay không.
4. Compatible với USB và UART giao diện.
5. Over 180 cấu hình tùy chọn
6. Macro hỗ trợ thay thế một string trong mã vạch với một
7. Programmable lời nói đầu postamble và chấm dứt strings
8. Superior đọc hiệu suất bằng cách sử dụng tiên tiến thuật toán giải mã', N'Khả Năng giải mã:
1D: EAN-8, EAN-UPC-A, UPC-E, Code 39, Code 93, Mã 128, EAN128,, Codebar, công nghiệp 2 5, Interleave 2 5, Matrix 2 5, MSI, mã bưu ect.
2D: PDF417, Mã QR, Ma Trận dữ liệu ect.
độ phân giải: 0.10 mét (triệu)
Khoảng Cách đọc: 25-250 mét
giao diện: USB2.0 '' s UART
loại của Soi Sáng: 617nm LED (Aimer), 6500 K Đèn Led (Chiếu Sáng)
Scan Angle: Cuộn: 0-360 °, Pitch: ±65°or lớn hơn, Yaw: ±60°or lớn hơn
quét góc góc Độ Nghiêng: 34 °, góc độ cao 26 °, in Tương Phản 30% tối thiểu sự khác biệt phản xạ
LED Chỉ Thị: Buzzer và bi-màu ánh sáng: Đỏ-điện, màu xanh-giải mã Thành Công
Nhiệt Độ hoạt động:-20 độ đến 55 độ
Nhiệt Độ bảo quản:-40 độ đến 65 độ
nhiệt độ độ Ẩm: 5%-95% độ ẩm Tương Đối, không ngưng tụ
Mức Độ ánh sáng: 0-85000LUX
Điện Áp hoạt động: 5 V
điều hành Hiện Tại: 120mA', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Máy Bắn Mã Vạch Có Dây CT900
- barcode ct900')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (105, 15, N'[VN] Màn Hình DSO138 2.4in TFT', 50, 190000.0000, N'images\PhuKienDienTu\sp505\a1.jpg,                                                                                                                                                                      ', N'- Thay thế khi màn hình máy hiện sóng TFT gặp sự cố ', N'- Màn hình TFT 2.4 Inch', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Màn Hình DSO138
- DSO138')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (106, 15, N'Bộ Tản Nhiệt Cho Module TEC 150W X168-150 (6 Ống Đồng)', 35, 580000.0000, N'images\PhuKienDienTu\sp506\a1.jpg,images\PhuKienDienTu\sp506\a2.jpg,images\PhuKienDienTu\sp506\a3.jpg                                                                                                   ', N'- X168 là bộ tản nhiệt làm mát hiệu suất cao, có thể kết hợp với Module TEC dùng tản nhiệt CPU, làm mát không gian nhỏ, chế tủ mát...', N'- Bộ tản nhiệt có 6 ống đồng kết hợp nhôm tản nhiệt và quạt gió.
- Điện áp quạt gió : 12VDC
- Kích thước : 135 * 115 * 98mm.
- Công suất : 150W.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Bộ Tản Nhiệt Cho Module TEC 150W X168-150 (6 Ống Đồng)
- bo tan nhiet cpu')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (107, 15, N'Bộ Tản Nhiệt Cho Module TEC 60W X168-60 (2 Ống Đồng)', 35, 270000.0000, N'images\PhuKienDienTu\sp507\a1.jpg,images\PhuKienDienTu\sp507\a2.jpg,images\PhuKienDienTu\sp507\a3.jpg                                                                                                   ', N'- X168 là bộ tản nhiệt làm mát hiệu suất cao, có thể kết hợp với Module TEC dùng tản nhiệt CPU, làm mát không gian nhỏ, chế tủ mát...', N'- Bộ tản nhiệt có 2 ống đồng kết hợp nhôm tản nhiệt và tản nhiệt.
- Điện áp quạt gió : 12VDC
- Kích thước : 135 * 115 * 98mm.
- Công suất : 60W.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Bộ Tản Nhiệt Cho Module TEC 60W X168-60 (2 Ống Đồng)
- bo tan nhiet cpu
- tan nhiet tec
- che tu lanh
- bo lam mat
- làm mát
- chế tủ lạnh
- X168')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (108, 15, N'Mặt Công Tắc 1 Phím MCT86', 29, 40000.0000, N'images\PhuKienDienTu\sp508\a1.jpg,images\PhuKienDienTu\sp508\a2.jpg                                                                                                                                     ', N'- Mặt công tắc 1 phím cho công tắc cảm ứng MCT86.', N'- Vật liệu thủy tinh nguyên khối.
- Kích thước : 86 * 3mm.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của  Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Mặt Công Tắc 1 Phím MCT86
- mặt công tắc cảm ứng
- mat cong tac cam ung')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (109, 15, N'Mặt Công Tắc 2 Phím MCT118', 30, 55000.0000, N'images\PhuKienDienTu\sp509\a1.jpg,images\PhuKienDienTu\sp509\a2.jpg                                                                                                                                     ', N'- Mặt công tắc bảo vệ 2 phím cho Công tắc cảm ứng MCT118.', N'- Vật liệu thủy tinh nguyên khối.
- Mặt trước màu trắng
- Kích thước : 120x72x4MM', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.
', N'- Mặt Công Tắc 2 Phím MCT118
- mat cong tac 2 phim mct118
- mat cong tac mct118
- mặt công tắc cảm ứng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (110, 15, N'[Đặt Hàng] Máy Hàn Atten AT-937 Chính Hãng', 23, 1500000.0000, N'images\PhuKienDienTu\sp510\a1.jpg,images\PhuKienDienTu\sp510\a2.jpg                                                                                                                                     ', N'- Dùng để hàn các linh kiện trong mạch điện tử thông dụng.', N'- Model: AT-937
- Xuất xứ: Atten
- Công Suất: 50W
- Sử dụng các mũi hàn 900M-T-I (Serial các dòng 900M-T-...)
- Điện áp sử dụng:AC220V 50Hz 
- Nhiệt độ: 200° C - 480 ° C. 
- Trọng lượng: 1.6Kg
- Sản phẩm bao gồm:
+ 1 Trạm hàn AT-937
+ 1 Tay Hàn AT-937 (Model 907)
+ 1 Kệ Hàn ', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- máy hàn 
- trạm hàn 
- Atten')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (111, 15, N'[Đặt Hàng] Máy Hàn Quick 203H ESD', 30, 37500000.0000, N'images\PhuKienDienTu\sp511\a1.jpg                                                                                                                                                                       ', N'-       Cảm biến gần mũi, nhiệt độ chính xác, bù nhiệt nhanh.
-       Chức năng tự nghỉ khi không làm việc, tiết kiệm năng lượng.
-       Chức năng khoá nhiệt độ bằng mật khẩu, ổn định bảo đảm nhiệt độ khi làm việc.
-       Thiết kế ESD chống tĩnh điện.', N'- Công suất tổng: 90W
- Bộ phận làm nóng: Ceramic
- Nhiệt độ: 50-600oC
- Điện áp tay hàn: 36V AC
- Chiều dài tay hàn: 190 mm
- Chiều dài tay + dây: 1.2m
- Trọng lượng tay hàn: 44g
- Điện áp đầu vào: AC 220V - 240V
- Chức năng khóa: Mật khẩu
- Kích thước: 200 x 130 x 130 mm
- Trọng lượng máy: 2.6 kg', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- máy hàn 
- trạm hàn 
- hakko')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (112, 15, N'Băng Dán Tản Nhiệt 3M9448A Rộng 1CM Dài 50 Mét', 50, 70000.0000, N'images\PhuKienDienTu\sp512\a1.jpg                                                                                                                                                                       ', N'- Băng dán tản nhiệt có độ dẫn nhiệt cao, cách điện tốt, sử dụng cho IC công suất, led công suất...', N'- Độ dày : 0.15mm.
- Rộng 1cm.
- Chiều Dài 50m.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Băng Dán Tản Nhiệt 3M9448A Rộng 2CM Dài 50 Mét
- 3M9448A
- tan nhiet')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (113, 15, N'Cầu Chì 4A 250V T4A250V Loại Tròn', 60, 3500.0000, N'images\PhuKienDienTu\sp513\a1.jpg,images\PhuKienDienTu\sp513\a2.jpg                                                                                                                                     ', N'- Cầu chì bảo vệ loại tròn, chịu dòng cao.', N'- Điện áp : 250V.
- Dòng 4A.
- Chân cắm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Cầu Chì 4A 250V T4A250V Loại Tròn
- fuse
- cầu chì 4a
- cau chi 4a')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (114, 15, N'Dây Kéo Dài Anten SMA RG-178 Đực Cái 3 Mét WT-FM- SA3M', 35, 105000.0000, N'images\PhuKienDienTu\sp514\a1.jpg                                                                                                                                                                       ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (115, 15, N'Nút Nhấn 4 Chân 4.5x4.5x8MM DIP', 100, 500.0000, N'images\PhuKienDienTu\sp515\a1.jpg,images\PhuKienDienTu\sp515\a2.jpg                                                                                                                                     ', N'- Nút Nhấn 4 Chân 4.5x4.5x8MM DIP.', N'- Kích thước :  4.5 x 4.5 x8mm (rộng * dài * cao).
- Giá trị định mức : DC12V 50mA.
- Nhiệt độ : -25 ° ~ + 75 ° C.
- Hoạt động : 100.000 lần.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Nút Nhấn 4 Chân 4.5x4.5x5MM DIP
- nut nhan 4 chan
- nút nhấn dc12v')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (116, 16, N'[Đặt Hàng] TMS320VC5502PGF300 TI/QFP-176', 40, 550000.0000, N'images\ICChucnang\sp601\a1.jpg                                                                                                                                                                          ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (117, 16, N'SP312ECT SOP18 Transceiver Full RS232', 36, 52000.0000, N'images\ICChucnang\sp602\a1.jpg                                                                                                                                                                          ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (118, 16, N'MC34119 SOP8 Low Power Audio Amplifier', 70, 5000.0000, N'images\ICChucnang\sp603\a1.jpg                                                                                                                                                                          ', N'- MC34119 là IC khuếch đại âm thanh công suất thấp, ứng dụng chế loa mini, module âm thanh...', N'- Điện áp cung cấp hoạt động : 2.0 V đến 16 V.
- Công suất đầu ra vượt quá 250 mW với loa 32 W.
- Trở kháng phạm vi 8-100Ω.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- MC34119 SOP8 Low Power Audio Amplifier
- MC34119
- audio')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (119, 16, N'MC14094 DIP16', 55, 15000.0000, N'images\ICChucnang\sp604\a1.jpg                                                                                                                                                                          ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (120, 16, N'NRF51822 QFAC48 Bluetooth 4.0 (QFAC)', 30, 60000.0000, N'images\ICChucnang\sp605\a1.jpg                                                                                                                                                                          ', N'- The nRF51822 is a powerful multiprotocol single chip solution for ULP wireless applications. It incorporates Nordic’s latest best-in-class performance radio transceiver, an ARM® Cortex™ M0 CPU and 256kB/128kB flash and 32kB/16kB RAM memory. The nRF51822 supports Bluetooth® low energy (formerly known as Bluetooth Smart) and 2.4 GHz protocol stacks
- Applications :
+ Bluetooth low energy applications
+ Wearables
+ Beacons
+ Appcessories
+ Computer peripherals
+ CE remote controls for TV, STB and media systems
+ Proximity and security alert tags
+ Sports- and fitness sensors
+ Healthcare and lifestyle sensors
+ Game controllers for computers
+ Toys and Electronic games
+ Domestic/Industrial control and data-acquisition
+ Intelligent domestic appliances', N'- Multiprotocol 2.4GHz radio
- 32-bit ARM Cortex M0 processor
- 256kB/128kB flash and 32kB/16kB RAM
- Software stacks available as downloads
- Pin compatible with other nRF51 Series devices
- Application development independent from protocol stack
- Fully on-air compatible with nRF24L Series
- Programmable output power from +4dBm to -20dBm
- RSSI
- RAM mapped FIFOs using EasyDMA
- Dynamic on air payload length up to 256 Bytes
- Flexible and configurable 31 pin GPIO
- Programmable Peripheral Interface – PPI
- Simple ON/OFF global power modes
- Full set of digital interfaces including: SPI/2-wire/UART
- 10-bit ADC
- 128-bit AES ECB/CCM/AAR co-processor
- Quadrature demodulator
- Low cost external crystal 16MHz ± 40ppm
- Low power 16MHz crystal and RC oscillators
- Ultra low power 32kHz crystal and RC oscillators
- Wide supply voltage range (1.8 V to 3.6 V)
- On-chip DC/DC buck converter
- Individual power management for all peripherals
- Package options: 48-pin 6x6 QFN/WLCSP, Thin-CSP', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- NRF51822 QFAC48 Bluetooth 4.0 (QFAC)')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (121, 16, N'KA3525 DIP16 Chính Hãng', 45, 15000.0000, N'images\ICChucnang\sp606\a1.jpg                                                                                                                                                                          ', N'- KA3525 là IC ổn áp điều xung PWM, thường ứng dụng trong mạch tạo dao động, chuyển đổi DC-DC, DC - AC, bộ sạc, nguồn, kích điện, Inverter...', N'- Điện áp cung cấp Vcc : 40V.
- Điện áp Vc (chân 13) : 40V.
- Iout : 500mA.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- KA3525 DIP16 Chính Hãng
- KA3525
- PWM
- ic on ap
- SG3525')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (122, 16, N'FT2705p', 45, 21000.0000, N'images\ICChucnang\sp607\a1.jpg,images\ICChucnang\sp607\a2.jpg                                                                                                                                           ', N'- FT2705p là IC Khuếch đại Audio Class-D hiệu suất cao (88%).
- Ứng dụng trong :
 + Các mạch khuếch đại âm thanh, loa bluetooth...
 + TV/Monitor
 + Thiết bị phát âm thanh cầm tay...', N'- Điện áp cung cấp : 4.5 - 8.8V.
- Kiểu chân : SOP-16L.
- Hiệu suất : 88%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- FT2705p
- audio amplifier
- class-d 
- ic audio
- 2x10w')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (123, 16, N'LT1085', 25, 48000.0000, N'images\ICChucnang\sp608\a1.jpg                                                                                                                                                                          ', N'- The LT®1085 series of positive adjustable regulators are designed to provide 3A, 5A and 7.5A with higher efficiency than currently available devices. All internal circuitry is designed to operate down to 1V input to output differential and the dropout voltage is fully specified as a function of load current. Dropout is guaranteed at a maximum of 1.5V at maximum output current, decreasing at lower load currents. On-chip trimming adjusts the output voltage to 1%. Current limit is also trimmed, minimizing the stress on both the regulator and power source circuitry under overload conditions.', N'- Three-Terminal 3.3V, 3.6V, 5V and 12V
- Output Current of 3A, 5A or 7.5A
- Operates Down to 1V Dropout
- Guaranteed Dropout Voltage at Multiple Current Levels
- Line Regulation: 0.015%
- Load Regulation: 0.1%
- 100% Thermal Limit Functional Test
- Adjustable Versions Available', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LT1085
-  positive adjustable regulators 
- charge')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (124, 16, N'LT1086', 20, 60000.0000, N'images\ICChucnang\sp609\a1.jpg                                                                                                                                                                          ', N'- LT1086 is 1.5A Low Dropout Positive Regulators Adjustable and Fixed 2.85V, 3.3V, 3.6V, 5V, 12V.
* Applications :
- SCSI-2 Active Terminator
- High Efficiency Linear Regulators
- Post Regulators for Switching Supplies
- Constant Current Regulators
- Battery Chargers
- Microprocessor Supply', N'- 3-Terminal Adjustable or Fixed 2.85V, 3.3V, 3.6V, 5V, 12V
■ Output Current of 1.5A (0.5A for LT1086H)
■ Operates Down to 1V Dropout
■ Guaranteed Dropout Voltage at Multiple Current Levels
■ Line Regulation: 0.015%
■ Load Regulation: 0.1%
■ 100% Thermal Limit Functional Test
■ Ripple Rejection >75dB
■ Available in 3-Pin TO-220 and 3-Pin DD Packages', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LT1086
- Positive Regulators Adjustable')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (125, 16, N'HCF4013BE DIP14', 60, 6000.0000, N'images\ICChucnang\sp610\a1.jpg                                                                                                                                                                          ', N'- HCF4013BE là IC Logic Flip-Flop tích hợp nguyên khối, được chế tạo bằng công nghệ bán dẫn oxit kim loại.', N'- HCF4013BE gồm 2 bộ Flip-Flop giống nhau.
- Điện áp : 3 - 20VDC.
- Hiệu suất ESD.
 + HBM: 2 kV.
 + MM: 200 V.
 + CDM: 1 kV.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- HCF4013BE DIP14
- Flip-Flop 
- ic logic')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (126, 16, N'74HC4066D SOP14', 44, 7000.0000, N'images\ICChucnang\sp611\a1.jpg                                                                                                                                                                          ', N'- 74HC4066D là IC CMOS QUAD BILATERAL SWITCH tốc độ cao, được chế tạo với công nghệ C2MOS.
- IC gồm 4 công tắc độc lập tốc độ cao, có khả năng kiểm soát tín hiệu số hoặc tương tự.', N'- VCC : 2 - 12V.
- Nhiệt độ hoạt động : -40 to 85°C.
- Kiểu chân : SOP14', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- 74HC4066D SOP14
- 74HC4066D')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (127, 16, N'LM1084IS-3.3 TO263 IC Nguồn 3.3V 5A', 52, 7500.0000, N'images\ICChucnang\sp612\a1.jpg,images\ICChucnang\sp612\a2.jpg                                                                                                                                           ', N'- LM1084IS-3.3 là linh kiện điều chỉnh điện áp dương, có đầu ra cố định.
- Ứng dụng điều chỉnh chuyển đổi điện áp DC-DC.', N'- Điện áp vào : 2.6 - 27V.
- Điện áp ra : 3.3V.
- Dòng ra max : 5A.
- Nhiệt độ hoạt động : -40°C - 125°C
- Kiểu chân : TO263', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LM1084IS-3.3 TO263 IC Nguồn 3.3V 5A')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (128, 16, N'LM1084IT-ADJ TO220 IC Nguồn ADJ 5A', 55, 6500.0000, N'images\ICChucnang\sp613\a1.jpg,images\ICChucnang\sp613\a2.jpg,images\ICChucnang\sp613\a3.jpg                                                                                                            ', N'- LM1084IS-5.0 là linh kiện điều chỉnh điện áp dương, đầu ra có thể điều chỉnh được như LM317.
- Ứng dụng điều chỉnh chuyển đổi điện áp DC-DC.', N'- Điện áp vào : 2.6 - 29VDC
- Điện áp ra : 1.25 - 27VDC
- Dòng ra max : 5A.
- Nhiệt độ hoạt động : -40°C - 125°C
- Kiểu chân : TO220', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LM1084IS-5.0')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (129, 16, N'PCM1702 SOP20', 26, 275000.0000, N'images\ICChucnang\sp614\a1.jpg                                                                                                                                                                          ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (130, 16, N'CDCS503 TSSOP8 Clock Buffer-Multiplier', 36, 25000.0000, N'images\ICChucnang\sp615\a1.jpg                                                                                                                                                                          ', N'- CDCS503 là bộ đệm clock đầu vào(Clocl Buffer/Clock Multiplier With Optional SSC), phổ rộng.', N'- Điện áp : 3.3V.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- CDCS503 TSSOP8 Clock Buffer-Multiplier
- CDCS503 TSSOP8 
- CDCS503')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (131, 17, N'Pin 3.7V 26650 6800mAh', 34, 50000.0000, N'images\Robot-Pin\sp701\a1.jpg,images\Robot-Pin\sp701\a2.jpg                                                                                                                                             ', N'- Pin Lithium 3.7V dung lượng cao, có thể sạc lại, vòng đời hoạt động dài.
- Pin sử dụng cho các thiết bị di động : POS, Máy in di động, thiết bị cầm tay, dụng cụ y tế, thiết bị điện tử, Robot, xe mô hình, thuyền điều khiển từ xa...* Lưu ý : - Tránh để Pin tiếp xúc với lửa.
- Không đâm thủng, hư hỏng, tháo rời Pin.
- Không để chung các loại Pin đã qua sử dụng.', N'- Điện áp : 3.7V.
- Dung lượng : 6800mAh.
- Số lần hoạt động : 1000 lần.
- Kích thước 18.3mm * 65.3mm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Pin 3.7V 26650 6800mAh
- pin lithium
- pin li ion')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (132, 17, N'[Đặt Hàng] Khung Cánh Tay ROBOT ARM', 11, 1200000.0000, N'images\Robot-Pin\sp702\a1.jpg,images\Robot-Pin\sp702\a2.jpg,images\Robot-Pin\sp702\a3.jpg,images\Robot-Pin\sp702\a4.jpg,images\Robot-Pin\sp702\a5.jpg                                                   ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (133, 17, N'Bộ Lưu Điện Chuyển Nguồn UPS 12V2A UPS122 HS', 19, 160000.0000, N'images\Robot-Pin\sp703\a1.jpg,images\Robot-Pin\sp703\a2.jpg,images\Robot-Pin\sp703\a3.jpg                                                                                                               ', N'- Bộ chuyển đổi nguồn 12VDC. Cấp nguồn cho các thiết bị Router, đèn, loa... các thiết bị điện tử nguồn 12VDC.', N'- Điện áp vào : 12V DC
- Điện áp ra : 12VDC Max tải 2A
- Đầu ra : DC 5.5x2.1mm.
- Mạch tích hợp mạch sạc và bảo vệ pin giúp tăng tuổi thọ cho pin
- Tính năng tự động chuyển nguồn khi mất điện
- Khi có điện sử dụng điện từ nguôn ngoài cấp
- Tự động xạc và ngắt bảo vệ Pin cạn
- Kích thước 100x70x35mm
- Sử dụng pin ultrafile dung lượng 1200mAH ( Bên trong có 3 viên pin ) ', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Bộ Chuyển Nguồn UPS 12VDC 
- chuyển nguồn ups
- boost dc-dc 12v
- tăng áp 12vdc
- usb type a')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (134, 17, N'[VN] Động Cơ Bước Mini 5-6V Giảm Tốc 1:63 ST56-GT63', 26, 120000.0000, N'images\Robot-Pin\sp704\a1.jpg,images\Robot-Pin\sp704\a2.jpg,images\Robot-Pin\sp704\a3.jpg,images\Robot-Pin\sp704\a4.jpg                                                                                 ', N'- Dùng nhiều trong các mô hình sản phẩm 
- Dùng trong các mạch điện tử 
- Động Cơ ( Motor) có bộ giảm tốc, tăng lực kéo. 
- Động cơ tích hợp hộp giảm tốc(Hộp Số bánh răng sắt)
- Động cơ nhỏ, thích hợp với Robot nhỏ', N'- Động Cơ Bước
- Giảm tốc: 1:63
- Trở Kháng: 20R
- Điện Áp: 5-6V
- Dòng : 0.3A
- Bước Góc: 18 Độ
- Trọng lượng: 10g
- Trục bánh răng bằng sắt', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- động cơ bước , động cơ bước có giảm tốc')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (135, 17, N'[VN] Pin 18650 3.7V 2200mAh Lii-22A Chính Hãng', 30, 70000.0000, N'images\Robot-Pin\sp705\a1.jpg                                                                                                                                                                           ', N'Lưu Ý Sử Dụng:
- Sử dụng với mạch bảo vệ, hoặc thiết bị chuyên dụng
- Không được xả xuống dưới điện 2.7V (Sẽ làm hỏng pin)
- Không được nạp quá 4.2V (Sẽ làm pin nóng và gây cháy nổ)', N'- Thương hiệu: LiitoKala
- Model: Lii-22A
- Dòng xả: 10A
- Pin 3.7V
- Chuẩn 18650
- Dung lượng: 2200mAh', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: Hỗ trợ kiểm tra', N'- Sạc pin 18650')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (136, 17, N'[VN] Sạc 1 Pin 18650-26650 Lii-100 Chính Hãng', 23, 180000.0000, N'images\Robot-Pin\sp706\a1.jpg,images\Robot-Pin\sp706\a2.jpg,images\Robot-Pin\sp706\a3.jpg,images\Robot-Pin\sp706\a4.jpg,images\Robot-Pin\sp706\a5.jpg,images\Robot-Pin\sp706\a6.jpg                     ', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: 6 tháng', N'- Sạc pin 18650')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (137, 17, N'Sạc Pin 18650-26650 Kiểm Tra Nội Trở Full Lii-500 Chính Hãng', 18, 64000.0000, N'images\Robot-Pin\sp707\a1.jpg,images\Robot-Pin\sp707\a2.jpg,images\Robot-Pin\sp707\a3.jpg,images\Robot-Pin\sp707\a4.jpg,images\Robot-Pin\sp707\a5.jpg                                                   ', N'Bộ Sạc 4 Pin Đa Năng Và Đo Nội Trở Pin Liitokala LII-500 Sạc Pin 26650-18650-14500-16340 là bộ sạc thông minh có khả năng sạc hầu hết các loại pin Li-ion, NiMH / NiCd. Ngoài sạc pin, Lii-500 còn có chế độ kiểm tra pin, hiển thị dòng sạc, dung lượng, nội trở trên màn hình.
Bộ Sạc Pin Đa Năng Liitokala LII-500 có thể sạc được đa số loại khác nhau của pin lithium, Li-ion, pin AA AAA, pin nickel-hydrogen, các loại pin sạc, pin 26650, 18500, 18490,18350, 17670, 14500, 10440, 16340 (RCR123). 
Một tính năng nổi bật của Bộ Sạc Pin Đa Năng Liitokala LII-500 là dùng làm box sạc dự phòng với cổng kết nối USB.
Bộ Sạc Pin Đa Năng Liitokala LII-500 Sạc 4 Pin 26650-18650-14500-16340 được sử dụng rộng rãi trong sạc pin đèn pin, dụng cụ điện, dụng cụ, máy ảnh kỹ thuật số và các sản phẩm điện tử pin khác.', N'Hỗ trợ pin Li-ion / IMR: 26650, 18500, 18490,18350, 17670, 14500, 10440, 16340 (RCR123). 
-    Hỗ trợ pin NiMH / NiCd : AA, AAA, AAAA, C
-    Điện áp đầu vào: 12V-2A
-    Dòng ra: 300mA / 500mA / 700mA / 1000mA
-    Dòng xả: 250mA, 500mA
-    Khối lượng: 250g
-    Bộ sản phẩm bao gồm
  + PPKP83 Bộ Sạc Pin Đa Năng Liitokala LII-500 Sạc 4 Pin 26650-18650-14500-16340
  + NG8 Adapter 12V - 2A
- Cổng USB ra 5V (Là cổng sạc pin dự phòng, chỉ có điện khi có pin và không cắm Jack DC12V)', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: 6 tháng', N'- Sạc pin 18650
- Máy kiểm tra nội trở')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (138, 17, N'Động Cơ BLDC 24V Loại 6 Dây Trục 2 Đầu BLDC-24-6-TD ', 26, 115000.0000, N'images\Robot-Pin\sp708\a1.jpg,images\Robot-Pin\sp708\a2.jpg,images\Robot-Pin\sp708\a3.jpg,images\Robot-Pin\sp708\a4.jpg                                                                                 ', N'- Đây là động cơ không chổi than DC hãng Nidec có sẵn mạch điều khiển. Động cơ có tốc độ cao, hoạt động ổn định, bền.
- Động cơ sử dụng chế quạt DC...* Lưu ý : không đấu nối ngược 2 cực :  dương (Dây đỏ ) và cực âm (Dây đen) của động cơ, mạch điều khiển sẽ cháy.', N'- Điện áp hoạt động : 24VDC ( đỏ ) , 5VDC ( trắng ).
- Tốc độ ở : DC24V - Dòng: 0.13A -  Tốc độ: 2500 vòng / phút
- Tần số xung điều khiển : 200 - 4000Hz.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: Hỗ trợ kiểm tra', N'- Động Cơ BLDC 24V Loại 6 Dây Trục 2 Đầu BLDC-24-6-TD (Làm quạt DC)
- dong co bldc
- động cơ bldc
- động cơ chế quạt
- dong cơ che quat dc')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (139, 17, N'Động Cơ BLDC 24V Loại 3 Dây BLDC-24-3-TN (Làm quạt DC)', 30, 120000.0000, N'images\Robot-Pin\sp709\a1.jpg,images\Robot-Pin\sp709\a2.jpg,images\Robot-Pin\sp709\a3.jpg,images\Robot-Pin\sp709\a4.jpg                                                                                 ', N'- Động cơ Nidec BLDC chế quạt, hoạt động ổn định, bền, công suất 20W.
- Động cơ có sẵn 3 dây kết nối, 2 dây nguồn (vàng và đen), 1 dây PWM điều khiển tốc độ (dây đỏ). Vì vậy chỉ cần 1 nguồn điện có thể điều khiển động cơ dễ dàng.', N'- Điện áp hoạt động : 12V - 24V DC.
- Dòng không tải max : 0.41A.
- Công suất : 20W.
- Trọng lượng : 259g.
- Đường kính trục : 8mm.
- Tốc độ động cơ : 
 + DC12V  -  dòng : 0.25A   -   Tốc độ : 1560 RPM
 + DC15V  -  dòng : 0.5A     -   Tốc độ : 2200 RPM
 + DC18V  -  dòng : 0.35A   -   Tốc độ : 2950 RPM
 + DC20V  -  dòng : 0.4A     -   Tốc độ : 4800 RPM', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: Hỗ trợ kiểm tra', N'- Động Cơ BLDC 24V Loại 3 Dây BLDC-24-3-TN (Làm quạt DC)
- động cơ chế quạt
- dong co che quat6')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (140, 17, N'[VN] Nguồn Adapter 12V3.5A NETGEAR Chất Lượng Cao', 36, 135000.0000, N'images\Robot-Pin\sp710\a1.jpg,images\Robot-Pin\sp710\a2.jpg,images\Robot-Pin\sp710\a3.jpg,images\Robot-Pin\sp710\a4.jpg,images\Robot-Pin\sp710\a5.jpg,images\Robot-Pin\sp710\a6.jpg                     ', N'- Sử dụng cho các mạch điện tử
- Cấp nguồn cho các thiết bị
- Nguồn chất lượng cao, dòng lên tới 3.5A. 
- Chống nhiễu, bảo vệ quá dòng quá áp, an toàn khi sử dụng.
- Thương hiệu NETGEAR theo tiêu chuẩn của Nhật.', N'- Điện Áp Vào: AC100-240 50/60Hz
- Điện Áp Ra: DC12V 3.5A.
- Đầu Jack DC5.5x2.1MM.
- Bảo vệ quá dòng, quá áp
- Tương thích với các loại Jack DC: 5.5x2.1 or 5.5x2.5
- Trọng lượng: 200g
- Dòng đủ công suất, chất lượng cao.
- Chiều dài dây ~ 1.83M

(Khuyến cáo sử dụng nguồn khoảng 2/3 công suất để đảm bảo sản phẩm được bền . 
Sử dụng nguồn 24/24 nguồn có thể lên được 80-90% công suất )', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: 6 tháng', N'- nguồn 12v
- adapter 12v 3a
- nguồn không vỏ 12v')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (141, 17, N'Nguồn Không Vỏ 24V1.5A', 35, 50000.0000, N'images\Robot-Pin\sp711\a1.jpg,images\Robot-Pin\sp711\a2.jpg,images\Robot-Pin\sp711\a3.jpg,images\Robot-Pin\sp711\a4.jpg                                                                                 ', N'- Là nguồn chuyển đổi từ AC100-240V 50/60Hz sang DC24V 1.5A
- Cấp nguồn cho các thiết bị, máy in 
- Là loại nguồn tốt, chất lượng cao', N'- Điện áp vào: AC100-240V ( 50-60HZ)
- Điện áp ra: DC24V 1.5A
- Đầu Jack Vào: AC
- Dầu Jack Ra: 2.54-3P
- Thứ Tự Đầu Ra: (2)+24V;  (1) GND .', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: 6 tháng', N'- nguồn adapter 24v
- nguồn adapter')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (142, 17, N'[VN] Robot Lắp Ghép Tư Duy Trẻ Em XiaoMi MiTu', 5, 2490000.0000, N'images\Robot-Pin\sp712\a1.jpg,images\Robot-Pin\sp712\a2.jpg,images\Robot-Pin\sp712\a3.jpg,images\Robot-Pin\sp712\a4.jpg,images\Robot-Pin\sp712\a5.jpg,images\Robot-Pin\sp712\a6.jpg                     ', N'Vừa qua, người dùng đã có dịp tiếp xúc với một phiên bản robot được lắp ráp từ Mi Pad 2 goi là robot biến hình Mi Pad. Những tưởng đây là loại robot kỳ lạ nhất từng xuất hiện nhưng mới đây Xiaomi đã nghiên cứu và cho ra mắt nhiều loại đồ chơi với nhiều tính năng vượt trội hơn nữa. Tiêu biểu là ', N'Chất liệu: nhựa polycarbonate
Kích thước: 38 x 32 x 9cm
Dung lượng pin: 1700mAh
Hỗ trợ cổng USB: 4 cổng
Hệ điều hành hỗ trợ: Android 4.3.0 trở lên, iOS 6.0 trở lên', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (143, 17, N'Hộp Led Nháy 7 Mầu HL7-012', 41, 9000.0000, N'images\Robot-Pin\sp713\a1.jpg,images\Robot-Pin\sp713\a2.jpg,images\Robot-Pin\sp713\a3.jpg                                                                                                               ', N'- Sử dụng pin LR44, AG13.. 
- Đựng được 2 Pin
- Làm đồ chơi, quà tặng sinh nhật, trung thu, DIY sản phẩm', N'- Kích thước: 3.1x17x0.9MM
- Công tắc gạt để bật tắt nguồn.
- Sử dụng 2 Pin AG13
- Nháy 7 Mầu', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đế Pin
- 3 Pin
- LR44 1.5V')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (144, 17, N'Nguồn AC-DC Mini 12V400mA P-AD12400', 37, 35000.0000, N'images\Robot-Pin\sp714\a1.jpg,images\Robot-Pin\sp714\a2.jpg,images\Robot-Pin\sp714\a3.jpg                                                                                                               ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (145, 17, N'Động Cơ Giảm Tốc DC3-9V GT130-T39', 43, 21000.0000, N'images\Robot-Pin\sp715\a1.jpg,images\Robot-Pin\sp715\a2.jpg,images\Robot-Pin\sp715\a3.jpg,images\Robot-Pin\sp715\a4.jpg                                                                                 ', N'- Động cơ giảm tốc DC sử dụng trong xe dò line, mô hình.
- Sử dụng làm thí nghiệm, điều khiển tốc độ, bàn xoay...', N'- Điện áp : DC3-9V. (Sử dụng ổn định 3-6V)
Chú ý: Trục động cơ không vừa với Bánh Xe Robot Màu Vàng', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: Hỗ trợ kiểm tra', N'- Động Cơ Giảm Tốc DC3-9V GT130-T39
- dong co giam toc dc
- động cơ robot
- dong co robot
- dong co xe do line
- động cơ xe dò line')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (201, 12, N'[Đặt Hàng] LCD Nextion 5.0 UART HMI Touch (Ver Nextion)', 100, 1750000.0000, N'images\machdientu\m1\m0.jpg,images\machdientu\m1\1.jpg,images\machdientu\m1\2.jpg                                                                                                                       ', N'- Tính năng giao tiếp qua UART HMI<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (202, 12, N'[Đặt Hàng] LCD Nextion 7.0 UART HMI Touch (Ver Nextion)', 90, 1950000.0000, N'images\machdientu\m2\m0.jpg,images\machdientu\m2\1.jpg                                                                                                                                                  ', N'- Tính năng giao tiếp qua UART HMI<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (203, 12, N'[Đặt Hàng] Phim Cảm Quang 200 Mét', 80, 3950000.0000, N'images\machdientu\m3\m0.jpg,images\machdientu\m3\1.jpg                                                                                                                                                  ', N'- Sử dụng làm mạch in', N'- Kích thước 200 Mét
- Cuôn to', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Cảm quang<br>
- Phim<br>
- Làm mạch.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (204, 12, N'[Đặt hàng]LCD Nextion 5.0 UART HMI Touch  NX8048K050', 122, 2600000.0000, N'images\machdientu\m4\m0.jpg,images\machdientu\m4\1.jpg,images\machdientu\m4\2.jpg,images\machdientu\m4\3.jpg,images\machdientu\m4\4.jpg                                                                 ', N'- LCD Nextion 5.0 NX8048K050 là phiên bản nâng cao hơn của các bản LCD Nextion tiêu chuẩn. Bổ sung thêm một số chức năng mới như : tích hợp RTC , hỗ trợ lưu dữ liệu vào Flash, hỗ trợ GPIO, dung lượng flash lớn hơn và CPU clock lớn hơn.', N'- Loại cảm ứng: Điện Trở.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (205, 12, N'[VN] Màn Hình DSO138 2.4in TFT', 56, 190000.0000, N'images\machdientu\m5\m0.jpg,images\machdientu\m5\2.jpg                                                                                                                                                  ', N'- Thay thế khi màn hình máy hiện sóng TFT gặp sự cố ', N'- Màn hình TFT 2.4 Inch', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Màn Hình  DSO138<br> - DSO138')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (206, 12, N'Bộ BreadBoard XF-25', 50, 39000.0000, N'images\machdientu\m6\m0.jpg,images\machdientu\m6\1.jpg,images\machdientu\m6\2.jpg                                                                                                                       ', N'- BreadBoard phục vụ lắp ráp mạch điện tử học tập, test...', N'- Bộ BreadBoard gồm 1 board gắn và 6 board cắm rời<br>
- Kích thước : 93*133*8MM.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của  Banlinhkien.Vn <br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Bộ BreadBoard XF-25<br>
- Board test<br>
- BreadBoard XF<br>
- BreadBoard<br>
- Mạch test.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (207, 12, N'Bộ Máy Lắc Bột Sắt Làm Mạch In Mini HS', 50, 190000.0000, N'images\machdientu\m7\m0.jpg,images\machdientu\m7\1.jpg,images\machdientu\m7\2.jpg,images\machdientu\m7\3.jpg,images\machdientu\m7\4.jpg                                                                 ', N'- Sử dụng trong quá trình làm mạch in thủ công<br>
- Sử dụng hỗ trợ lắc mực săm....', N'- Điện áp : 4.5V DC<br>
- Sử dụng pin con thỏ loại AA.<br>
- Số lượng Pin 3 Viên ( Sản phẩm chưa kèm Pin )<br>
- Sử dụng động cơ giảm tốc V3<br>
- Trọng lượng có thể để lên lắc max 2KG<br>
- Sản phẩm được làm bằng mica 3MM và hộp nhựa có độ thẫm mỹ cao.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Máy lắc.<br>- Bột sắt.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (208, 12, N'Bóng UV 8W (Thay Thế Cho Bộ Đèn UV)', 110, 100000.0000, N'images\machdientu\m8\m0.jpg,images\machdientu\m8\1.jpg,images\machdientu\m8\2.jpg,images\machdientu\m8\3.jpg                                                                                            ', N'- Dùng chụp chiếu các chất UV, làm mạch in cảm quang, khắc vẽ bằng UV...<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (209, 12, N'Bút Máy Khoan Mini BK-165MN', 122, 99000.0000, N'images\machdientu\m9\m0.jpg,images\machdientu\m9\1.jpg,images\machdientu\m9\2.jpg,images\machdientu\m9\3.jpg,images\machdientu\m9\4.jpg                                                                 ', N'- Bút khoan có các đầu mài, đánh bóng. Ứng dụng cho mài, giũa, đánh bóng.', N'- Chiều dài : 16.5 cm<br>
- Sử dụng 2 PIN AA.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bút Máy Khoan Mini BK-165MN<br>
- bút máy khoan<br>
- bút mài<br>
- bút đánh bóng.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (210, 12, N'Đầu Chụp 1.3 - 1.7MM_1_Chiếc', 300, 5000.0000, N'images\machdientu\m10\m0.jpg,images\machdientu\m10\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini..', N'- Đường kính kẹp : 1.3-1.7MM<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 1.3-1.7MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (211, 12, N'Đầu Chụp 2.1-2.5MM_1_Chiếc', 200, 5000.0000, N'images\machdientu\m11\m0.jpg,images\machdientu\m11\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini.', N'- Đường kính kẹp : 2.1-2.5MM<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 2.1-2.5MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (212, 12, N'Đầu Chụp 3.0-3.2MM_1_Chiếc', 300, 5000.0000, N'images\machdientu\m12\m0.jpg,images\machdientu\m12\1.jpg                                                                                                                                                ', N'- Đầu kẹp trục mũi khoan, sử dụng cho các loại máy khoan, mài, khắc mini.', N'- Đường kính kẹp : 3.0-3.2MM.<br>
- Chất liệu : đồng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đầu chụp 3.0-3.2MM<br>
- đầu kẹp mũi khoan<br>
- đầu kẹp trục.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (213, 12, N'DIY Mạch Báo Dung Lượng Pin 3.7-12V DL-3712', 100, 52000.0000, N'images\machdientu\m13\m0.jpg,images\machdientu\m13\1.jpg,images\machdientu\m13\2.jpg,images\machdientu\m13\3.jpg,images\machdientu\m13\4.jpg,images\machdientu\m13\5.jpg                                ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Mạch báo dung lượng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (214, 12, N'Giá Đỡ Màn Hình LCD1602', 100, 35000.0000, N'images\machdientu\m14\m0.jpg,images\machdientu\m14\1.jpg,images\machdientu\m14\2.jpg,images\machdientu\m14\3.jpg                                                                                        ', N'- Giá đỡ giữ, cố định màn hình LCD1602.', N'- Chất liệu Mica trong.<br>
- Sử dụng cho màn hình LCD1602.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Giá Đỡ Màn Hình LCD1602')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (215, 12, N'Khoan Tay Thủ Công MH-MS533', 70, 130000.0000, N'images\machdientu\m15\m0.jpg,images\machdientu\m15\1.jpg,images\machdientu\m15\2.jpg,images\machdientu\m15\3.jpg,images\machdientu\m15\4.jpg                                                            ', N'- Làm máy khoan mạch in cầm tay.<br>- Làm máy khoan gỗ, hoặc nhôm các vật liệu kim loại mềm, ...', N'- Chiều Dài: 195MM.<br>- Đường kính kẹp được các loại mũi Khoan: 1.0-1.5MM, xiết chặt 0.5MM.<br>- Lưu Ý: Sản phẩm có độ rung, nên cần định vị trước khi khoan.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  “ v “.', N'-  Khoan Tay Thủ Công')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (216, 12, N'LCD 4.3 UART HMI Cảm Ứng Điện Trở LCD43-HMI', 100, 1180000.0000, N'images\machdientu\m16\m0.jpg,images\machdientu\m16\1.jpg,images\machdientu\m16\2.jpg,images\machdientu\m16\3.jpg,images\machdientu\m16\4.jpg                                                            ', N'- LCD 4.3 UART HMI ứng dụng trong các hệ thống, sản phẩm UI ( User Interface - giao diện người dùng ).<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (217, 13, N'Cọc Đồng Thau M2 13MM Đực Cái SBB-213 Japan 4c', 200, 40000.0000, N'images\linhkiendientu\t1\t0.jpg,images\linhkiendientu\t1\1.jpg                                                                                                                                          ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Cọc đồng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (218, 13, N'CON 2 141V-02P 2.54MM', 1000, 4000.0000, N'images\linhkiendientu\t2\t0.jpg,images\linhkiendientu\t2\1.jpg                                                                                                                                          ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- CON 2 141V-02P 2.54MM')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (219, 13, N'Dây Nguồn DC5.5x2.1MM Có Công Tắc  LSD-201', 200, 15000.0000, N'images\linhkiendientu\t3\t0.jpg,images\linhkiendientu\t3\1.jpg,images\linhkiendientu\t3\2.jpg,images\linhkiendientu\t3\3.jpg                                                                            ', N'- Dây nguồn DC 2 đầu đực - cái, có công tắc bật tắt.', N'- Jack DC 5.5x2.1mm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Dây Nguồn DC5.5x2.1MM Có Công Tắc  LSD-201<br>
- day nguon dc<br>
- jack dc.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (220, 13, N'Header 12Px2 5557-4.2 Cái', 150, 5000.0000, N'images\linhkiendientu\t4\t0.jpg,images\linhkiendientu\t4\1.jpg,images\linhkiendientu\t4\2.jpg,images\linhkiendientu\t4\3.jpg                                                                            ', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'Header 12Px2 5557-4.2 Cái.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (221, 13, N'Jack Nối Dây 3 Chân 0.08-4.0MM SPL-3', 250, 12000.0000, N'images\linhkiendientu\t5\t0.jpg,images\linhkiendientu\t5\1.jpg,images\linhkiendientu\t5\2.jpg,images\linhkiendientu\t5\3.jpg                                                                            ', N'- SPL-3 là jack nối dây sẽ giúp cho việc đấu nối các đường dây điện dễ dàng và an toàn hơn. Jack nối sử dụng chất liệu cách nhiệt (PA66).', N'- Điện áp định mức : 400V.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (222, 13, N'Jack_Nối_Dây_2_Chân_0.08-4.0MM_SPL-2', 255, 9000.0000, N'images\linhkiendientu\t6\t0.jpg,images\linhkiendientu\t6\1.jpg,images\linhkiendientu\t6\2.jpg                                                                                                           ', N'- SPL-2 là jack nối dây sẽ giúp cho việc đấu nối các đường dây điện dễ dàng và an toàn hơn. Jack nối sử dụng chất liệu cách nhiệt (PA66).', N'- Điện áp định mức : 250V.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (223, 13, N'Trở 50W 5 phần trăm 2R RX24', 155, 21000.0000, N'images\linhkiendientu\t7\t0.jpg,images\linhkiendientu\t7\1.jpg,images\linhkiendientu\t7\2.jpg                                                                                                           ', N'- Điện trở công suất lớn vỏ nhôm tản nhiệt tốt, dòng tải tối đa cao chuyên dùng trong ứng dụng làm giả tải, trở xả, giới hạn dòng điện...', N'- Trở công suất : 50W.<br>
- Giá trị : 2R.<br>
- Màu vàng.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở 50W 5% 2R RX24<br>
- trở công suất<br>
- tro cong suat.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (224, 13, N'Trở 200W 5 phần trăm 10R RXLG', 100, 90000.0000, N'images\linhkiendientu\t8\t0.jpg,images\linhkiendientu\t8\1.jpg,images\linhkiendientu\t8\2.jpg,images\linhkiendientu\t8\3.jpg                                                                            ', N'- Điện trở công suất lớn vỏ nhôm tản nhiệt tốt, dòng tải tối đa cao chuyên dùng trong ứng dụng làm giả tải, trở xả, giới hạn dòng điện...', N'- Trở công suất : 200W.<br>
- Sai số: 5%.<br>
- Giá trị: 10R.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở 200W 5% 10R RXLG<br>
- trở công suất<br>
- tro cong suat.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (225, 13, N'Trở 0402 1 phần trăm 1M 50c', 1000, 8000.0000, N'images\linhkiendientu\t9\t0.jpg,images\linhkiendientu\t9\1.jpg                                                                                                                                          ', N'- Trở 0402 1% 1M (50c).', N'- Trở dán 0402.<br>
- Giá trị 1 MΩ.<br>
- Sai số: 1%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Trở dán 0402 1% 1M.<br>
- smd 0402<br>
- trở dán 0402<br>
- tro 0402<br>
- tro dan 0402')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (226, 13, N'Trở 0402 1 phần trăm 124K 50c', 1500, 10000.0000, N'images\linhkiendientu\t10\t0.jpg,images\linhkiendientu\t10\1.jpg                                                                                                                                        ', N'- Trở 0402 1% 124k (50c).', N'- Trở dán 0402.<br>
- Giá trị 124K.<br>
- Sai số: 1%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- smd 0402<br>
- trở dán 0402<br>
- tro 0402<br>
- tro dan 0402')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (227, 13, N'Trở Vạch 18W 5 phần trăm 10K 50c', 2050, 4000.0000, N'images\linhkiendientu\t11\t0.jpg,images\linhkiendientu\t11\1.jpg                                                                                                                                        ', N'- Trở cắm 1/8W 5% 10k (50c)', N'- Giá trị 10K.<br>
- Công suất: 1/8W.<br>
- Sai số: 5%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- trở cắm<br>
- trở 1/8W<br>
- tro 1 : 8 W<br>
- tro 1/8w')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (228, 13, N'Trở Vạch 18W 5 phần trăm 33K 50c', 2000, 4000.0000, N'images\linhkiendientu\t12\t0.jpg,images\linhkiendientu\t12\1.jpg                                                                                                                                        ', N'Trở Vạch 1/8W 5% 33K 50c', N'- Giá trị 33K.<br>
- Công suất: 1/8W.<br>
- Sai số: 5%.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- trở cắm<br>
- trở 1/8W<br>
- tro 1 : 8 W<br>
- tro 1/8w')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (229, 13, N'Tụ 0402 104-100nF ±10 phần trăm 50V X7R 0402B104K500NT 10c', 2000, 5000.0000, N'images\linhkiendientu\t13\t0.jpg,images\linhkiendientu\t13\1.jpg                                                                                                                                        ', N'', N'- Kích thước: 0402.<br>
- Giá trị: 100nF 10V', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ 100nF')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (230, 13, N'Tụ 0402 220-22pF 5phần trăm 50V 10c', 1050, 9000.0000, N'images\linhkiendientu\t14\t0.jpg,images\linhkiendientu\t14\1.jpg                                                                                                                                        ', N'- Dùng trong các mạch điện tử.', N'- Điện dung : 22pF<br>
- Điện áp : 50V<br>
- Sai số : +/- 5%<br>
- Kích thước : 0402 - 1.00mm x 0.50mm', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ 0402<br>
- Tụ dán<br>
- Tụ smd')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (231, 13, N'Tụ Hóa SANYO 150uF 16V 5c', 250, 45000.0000, N'images\linhkiendientu\t15\t0.jpg,images\linhkiendientu\t15\1.jpg                                                                                                                                        ', N'', N'', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'Tụ Hóa SANYO 150uF 16V')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (232, 13, N'Tụ Tantalum 153-15nF 50V 5.08MM Sứ Vàng', 3500, 3000.0000, N'images\linhkiendientu\t16\t0.jpg,images\linhkiendientu\t16\1.jpg                                                                                                                                        ', N'- Tụ Tantalum có bản cực nhôm và dùng gel tantal làm dung môi, có trị số rất lớn với thể tích nhỏ.<br>
- Tụ Tantalum không bị khô giảm dung lượng như tụ hóa, bền hơn, trị số chính xác hơn tụ hóa. Thường sử dụng trong các mạch khuếch đại...', N'- Điện dung : 15nF.<br>
- Điện áp : 50V.<br>
- Chân cắm : DIP5.08 .', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.<br>
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn<br>
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Tụ Tantalum 15nF')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (233, 14, N'[Đặt Hàng] Module Cảm Biến Vân Tay FPC1020A', 200, 650000.0000, N'images\Module _ cam_bien\m1\m0.jpg,images\Module _ cam_bien\m1\1.jpg                                                                                                                                    ', N'1020A là một phát triển trung module cho nhận dạng vân tay được thiết kế cho SCM. nó có một kích thước nhỏ, tiêu thụ điện năng thấp, giao diện đơn giản, độ tin cậy cao, nhỏ vân tay template (200 bytes), công suất lớn nhận dạng vân tay (1000 nhận dạng vân tay thời gian đáp ứng là ít hơn 1 (Giây) và khác lợi thế, nó có thể được rất dễ dàng để nhúng vào nó trong việc sử dụng hệ thống, bao gồm nhận dạng vân tay sản phẩm để đáp ứng nhu cầu khách hàng.', N'Sensor độ phân giải: 500 DPI<br>
cảm biến pixels: 160*160<br>
suất vân tay: 150 cái (1000, 2000, 4000 cái có thể được tùy chỉnh)<br>
tính năng vân tay khai thác thời gian: < 0.45 giây<br>
Fake rate: 0.0001% .....', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Cảm biến vân tay')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (234, 14, N'[Đặt Hàng]Bộ Van Cảm Ứng Xả Nước Tiểu Nam 12VDC XTN12 HS', 150, 490000.0000, N'images\Module _ cam_bien\m2\m0.jpg,images\Module _ cam_bien\m2\1.jpg,images\Module _ cam_bien\m2\2.jpg,images\Module _ cam_bien\m2\3.jpg                                                                ', N'- ứng dụng xả nước <br>
- phát hiện vật cản xả nước.', N'- Điện Áp 12VDC<br>- Khi người vào vị trí, sau 3s van xả tạm 2s, nếu người liền rời khỏi trong vòng 3s sau đó thì van xã rữa thêm 3s. <br>- Nếu sau 3s kể từ khi xã tạm mà người rời đi thì van xả rữa sạch 6s.<br>- Nếu trong 6h mà không có người sử dụng, van xã tráng bồn 2s (để chống hôi và quá khô).', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'Bộ Van Cảm Ứng Xả Nước Tiểu Nam')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (235, 14, N'[Sắp Về] Module Chuyển Đổi TDS sang UART-TDS-V1', 200, 185000.0000, N'images\Module _ cam_bien\m3\m0.jpg,images\Module _ cam_bien\m3\1.jpg,images\Module _ cam_bien\m3\2.jpg,images\Module _ cam_bien\m3\3.jpg,images\Module _ cam_bien\m3\4.jpg                              ', N'- Module chuyển đổi tín hiệu TDS sang UART<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (236, 14, N'[VN] Máy Kiểm Tra TDS-Mi Chính Hãng', 200, 185000.0000, N'images\Module _ cam_bien\m4\m0.jpg,images\Module _ cam_bien\m4\1.jpg,images\Module _ cam_bien\m4\2.jpg,images\Module _ cam_bien\m4\3.jpg,images\Module _ cam_bien\m4\4.jpg                              ', N'Bút TDS Xiaomi được thiết kế nhỏ, đẹp và cao cấp, sử dụng 2 pin cúc.<br>
Sử dụng để đo nồng độ dung dịch thủy canh.<br>
Chiếc bút TDS Xiaomi giúp bạn đo được độ tinh khiết của nước sinh hoạt, hoặc nước đóng chai có đạt chất lượng hay không. Bạn cũng có thể sử dụng nó để đo nước thành phẩm của máy lọc nước để xác định xem đã đến lúc cần thay bộ lọc hay chưa.', N'Hiển thị: Màn hình LCD lớn và dễ đọc.<br>
Phạm vi đo: 0-9990 ppm.<br>
Trọng lượng: 27.4g.<br>
Màu sắc: trắng sáng bóng.<br>
Hàng chính hãng Xiaomi (Nguyên hộp)', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bộ kiểm tra TDS')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (237, 14, N'[VN] Máy Phát Tần Số DDS', 150, 475000.0000, N'images\Module _ cam_bien\m5\m0.jpg,images\Module _ cam_bien\m5\1.jpg,images\Module _ cam_bien\m5\2.jpg                                                                                                  ', N'', N'- Máy phát xung:<br>
+ Xung sin <br>
+ Xung vuông<br>
+ Xung tam giác<br>
+ Xung răng cưa<br>
+ Điện tâm đồ tần số cao', N'- Hỗ trợ kiểm tra', N'Máy phát tần số')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (238, 14, N'[VN] Module Auido Bluetooth 4.0 BT-40AU', 200, 65000.0000, N'images\Module _ cam_bien\m6\m0.jpg,images\Module _ cam_bien\m6\1.jpg,images\Module _ cam_bien\m6\2.jpg                                                                                                  ', N'- Sản phẩm ứng dụng nghe nhạc qua bluetooth 4.0.<br>Module bluetooth 4.0 audio có kích thước nhỏ gọn, cho âm thanh stereo 2 kênh, thích hợp chế loa/tai nghe không dây. Bluetooth 4.0 hay còn gọi là Bluetooth LE (Low Energy) cho khả năng tiết kiệm điện mà vẫn giữ khoảng cách truyền cũng như tốc độ truyền tốt. Ngoài ra module còn có các chân chờ để gắn thêm Led báo hiệu, nút MUTE,...', N'Điện áp: 5V.<br>
Chuẩn Bluetooth: 4.0.<br>
Tần số: 2.4GHz.<br>
Số kênh Audio: 2 (Stereo).<br>
Kích thước: 30x20x3mm', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Bluetooth<br>- 4.0<br>- Phát nhạc.')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (239, 14, N'[VN] Module DS3231 Raspberry Pi', 160, 80000.0000, N'images\Module _ cam_bien\m7\m0.jpg,images\Module _ cam_bien\m7\1.jpg,images\Module _ cam_bien\m7\2.jpg                                                                                                  ', N'- Sử dụng giao tiếp với các dòng vi điều khiển chuẩn I2C .<br>
- Sử dụng tương thích với Raspberry.<br>
- Ứng dụng mạch đếm thời gian, đồng hồ...', N'- Điện Áp : DC3.3-5.5V<br>
- Sử dụng IC Readtime DS3231 +- 5ppm <br>
- Pin Cmos 3V <br>
- Chuẩn Giao Tiếp: I2C.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Đồng hồ<br>- Module delay')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (240, 14, N'Cảm Biến Âm Thanh 3x6MM 42DB TONETECK 4c', 300, 20000.0000, N'images\Module _ cam_bien\m8\m0.jpg,images\Module _ cam_bien\m8\1.jpg                                                                                                                                    ', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.<br>-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.<br>
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.<br>
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".<br>
-  Sản phẩm thuộc cấp độ Bảo Hành.', N'- Cảm biến âm thanh')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (241, 14, N'Công Tắc Cảm Biến Chuyển Động DC12-24V 5A LN-SPIR-1206', 350, 110000.0000, N'images\Module _ cam_bien\m9\m0.jpg,images\Module _ cam_bien\m9\1.jpg,images\Module _ cam_bien\m9\2.jpg,images\Module _ cam_bien\m9\3.jpg                                                                ', N'- LN-SPIR-1206 là công tắc cảm biến phát hồng ngoại phát hiện chuyển động, sử dụng điều khiển để bật / tắt tải.', N'- Khoảng cách cảm biến: 5 ~ 8 M.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (242, 14, N'Công Tắc Cảm Biến Chuyển Động DC12-24V 30A  LSD-01-CH', 45, 185000.0000, N'images\Module _ cam_bien\m10\m0.jpg,images\Module _ cam_bien\m10\1.jpg,images\Module _ cam_bien\m10\2.jpg,images\Module _ cam_bien\m10\3.jpg                                                            ', N'- Công Tắc Cảm Biến hồng ngoại phát hiện chuyển động, điều khiển tải đầu ra.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (243, 14, N'Công Tắc Cảm Biến Chuyển Động PIR TDL-2024 HS', 30, 120000.0000, N'images\Module _ cam_bien\m11\m0.jpg,images\Module _ cam_bien\m11\1.jpg,images\Module _ cam_bien\m11\2.jpg,images\Module _ cam_bien\m11\3.jpg,images\Module _ cam_bien\m11\4.jpg                         ', N'
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (244, 14, N'Dimmer DC12-24V 30A DR-LSD-30A', 42, 160000.0000, N'images\Module _ cam_bien\m12\m0.jpg,images\Module _ cam_bien\m12\1.jpg,images\Module _ cam_bien\m12\2.jpg,images\Module _ cam_bien\m12\3.jpg                                                            ', N'- Dimmer DC điều khiển động cơ, đèn bàn, led 5050 3528...dòng ra tải max 30A.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (245, 14, N'Mạch PLC FX3U-24MT Transistor', 20, 950000.0000, N'images\Module _ cam_bien\m13\m0.jpg,images\Module _ cam_bien\m13\1.jpg,images\Module _ cam_bien\m13\2.jpg,images\Module _ cam_bien\m13\3.jpg,images\Module _ cam_bien\m13\4.jpg                         ', N'- Module PLC FX3U-24MT điều khiển đầu ra Transistor.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (246, 14, N'Module Điều Khiển Động Cơ L293 Mini MN-L293D', 55, 55000.0000, N'images\Module _ cam_bien\m14\m0.jpg,images\Module _ cam_bien\m14\1.jpg,images\Module _ cam_bien\m14\2.jpg,images\Module _ cam_bien\m14\3.jpg,images\Module _ cam_bien\m14\4.jpg                         ', N'-  Module L293 Mini là bộ điều khiển động cơ 4 kênh, điện áp và dòng điều khiển cao. Sử dụng chip L293D H-Bridge điều khiển động cơ DC, động cơ bước.<br>
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (247, 14, N'Module Relay Mini 2 Kênh 12V RL-M2-12V', 100, 32000.0000, N'images\Module _ cam_bien\m15\m0.jpg,images\Module _ cam_bien\m15\1.jpg,images\Module _ cam_bien\m15\2.jpg,images\Module _ cam_bien\m15\3.jpg                                                            ', N'- Module điều khiển relay 12V 2 kênh, module có thiết kế nhỏ gọn, cách ly đầu vào.<br>
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
