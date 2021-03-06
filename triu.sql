USE [master]
GO
/****** Object:  Database [ThietBiDienTu]    Script Date: 20-Sep-18 9:20:05 PM ******/
CREATE DATABASE [ThietBiDienTu]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'ThietBiDienTu', FILENAME = N'G:\text\text\data-asp\ThietBiDienTu.mdf' , SIZE = 3264KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'ThietBiDienTu_log', FILENAME = N'G:\text\text\data-asp\ThietBiDienTu_log.ldf' , SIZE = 832KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
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
/****** Object:  Table [dbo].[DANHMUC]    Script Date: 20-Sep-18 9:20:06 PM ******/
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
/****** Object:  Table [dbo].[DONHANG]    Script Date: 20-Sep-18 9:20:06 PM ******/
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
/****** Object:  Table [dbo].[MATHANG]    Script Date: 20-Sep-18 9:20:06 PM ******/
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
/****** Object:  Table [dbo].[MH-DH]    Script Date: 20-Sep-18 9:20:06 PM ******/
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
/****** Object:  Table [dbo].[THANHVIEN]    Script Date: 20-Sep-18 9:20:06 PM ******/
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

INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (11, N'Vi Điều Khiền - Nhúng', N'images/icon/icon1.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (12, N'Mạch Điện Tử', N'images/icon/icon2.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (13, N'Linh Kiện Điện Tử', N'images/icon/icon3.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (14, N'Module - Cảm Biến', N'images/icon/icon4.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (15, N'Phụ Kiện Điện Tử', N'images/icon/icon5.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (16, N'IC - Chức Năng', N'images/icon/icon6.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (17, N'Robot - Pin', N'images/icon/icon7.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (18, N'Led - Oneled', N'images/icon/icon8.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (19, N'Smart Home', N'images/icon/icon9.png')
INSERT [dbo].[DANHMUC] ([MaDm], [TenDm], [HinhAnh]) VALUES (20, N'3D Printer & CNC', N'images/icon/icon10.png')
SET IDENTITY_INSERT [dbo].[DANHMUC] OFF
SET IDENTITY_INSERT [dbo].[MATHANG] ON 

INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (6, 15, N'Máy Hàn Dây Đồng Nhôm DC24V CT-24DN', 15, 350000.0000, N'images\PhuKienDienTu\sp501\a1.jpg,images\PhuKienDienTu\sp501\a2.jpg', N'- Chuyên dùng hàn các mối hàn to, cho xe máy, oto, sử dụng nguồn 1 chiều, an toàn cho người sử dụng.
- Đơn giản khi mang theo, tận dụng bình acquy trên xe máy.', N'- Model: CT-24DN.- Xuất xứ: ChiNa.
- Điện áp: DC24-48V (Có thể dùng DC12V nhưng công suất yếu).
- Dòng xả cao, nên phải sử dụng Acquy hoặc Pin Lipo 6S.
- Chuyên dùng cho các mối hàn to.- Lưu ý: Chỉ Hàn được .', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- máy hàn ')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (11, 15, N'Bút Viết Bảng Dạ Quang Màu Hồng DQ-63-P', 200, 30000.0000, N'images\PhuKienDienTu\sp502\a1.jpg,images\PhuKienDienTu\sp502\a2.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (19, 15, N'[VN] Máy Hiện Sóng Oscilloscope Hantek DSO5102P 100MHz', 30, 6500000.0000, N'images\PhuKienDienTu\sp503\a1.jpg,images\PhuKienDienTu\sp503\a2.jpg', N'', N'• Model: DSO5102P 
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (20, 15, N'[Đặt Hàng] Module Scan Barcode QR 1D2A UART GM65-1D2A', 40, 980000.0000, N'images\PhuKienDienTu\sp504\a1.jpg,images\PhuKienDienTu\sp504\a2.jpg', N'1. USB có dây máy quét mã vạch để nắm bắt 1D, 2D mã trên nhãn, giấy, điện thoại di động hoặc máy tính.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (23, 15, N'[VN] Màn Hình DSO138 2.4in TFT', 50, 190000.0000, N'images\PhuKienDienTu\sp505\a1.jpg,', N'- Thay thế khi màn hình máy hiện sóng TFT gặp sự cố ', N'- Màn hình TFT 2.4 Inch', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Màn Hình DSO138
- DSO138')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (24, 15, N'Bộ Tản Nhiệt Cho Module TEC 150W X168-150 (6 Ống Đồng)', 35, 580000.0000, N'images\PhuKienDienTu\sp506\a1.jpg,images\PhuKienDienTu\sp506\a2.jpg,images\PhuKienDienTu\sp506\a3.jpg', N'- X168 là bộ tản nhiệt làm mát hiệu suất cao, có thể kết hợp với Module TEC dùng tản nhiệt CPU, làm mát không gian nhỏ, chế tủ mát...', N'- Bộ tản nhiệt có 6 ống đồng kết hợp nhôm tản nhiệt và quạt gió.
- Điện áp quạt gió : 12VDC
- Kích thước : 135 * 115 * 98mm.
- Công suất : 150W.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Bộ Tản Nhiệt Cho Module TEC 150W X168-150 (6 Ống Đồng)
- bo tan nhiet cpu')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (25, 15, N'Bộ Tản Nhiệt Cho Module TEC 60W X168-60 (2 Ống Đồng)', 35, 270000.0000, N'images\PhuKienDienTu\sp507\a1.jpg,images\PhuKienDienTu\sp507\a2.jpg,images\PhuKienDienTu\sp507\a3.jpg', N'- X168 là bộ tản nhiệt làm mát hiệu suất cao, có thể kết hợp với Module TEC dùng tản nhiệt CPU, làm mát không gian nhỏ, chế tủ mát...', N'- Bộ tản nhiệt có 2 ống đồng kết hợp nhôm tản nhiệt và tản nhiệt.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (26, 15, N'Mặt Công Tắc 1 Phím MCT86', 29, 40000.0000, N'images\PhuKienDienTu\sp508\a1.jpg,images\PhuKienDienTu\sp508\a2.jpg', N'- Mặt công tắc 1 phím cho công tắc cảm ứng MCT86.', N'- Vật liệu thủy tinh nguyên khối.
- Kích thước : 86 * 3mm.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của  Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Mặt Công Tắc 1 Phím MCT86
- mặt công tắc cảm ứng
- mat cong tac cam ung')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (27, 15, N'Mặt Công Tắc 2 Phím MCT118', 30, 55000.0000, N'images\PhuKienDienTu\sp509\a1.jpg,images\PhuKienDienTu\sp509\a2.jpg', N'- Mặt công tắc bảo vệ 2 phím cho Công tắc cảm ứng MCT118.', N'- Vật liệu thủy tinh nguyên khối.
- Mặt trước màu trắng
- Kích thước : 120x72x4MM', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.
', N'- Mặt Công Tắc 2 Phím MCT118
- mat cong tac 2 phim mct118
- mat cong tac mct118
- mặt công tắc cảm ứng')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (31, 15, N'[Đặt Hàng] Máy Hàn Atten AT-937 Chính Hãng', 23, 1500000.0000, N'images\PhuKienDienTu\sp510\a1.jpg,images\PhuKienDienTu\sp510\a2.jpg', N'- Dùng để hàn các linh kiện trong mạch điện tử thông dụng.', N'- Model: AT-937
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (32, 15, N'[Đặt Hàng] Máy Hàn Quick 203H ESD', 30, 37500000.0000, N'images\PhuKienDienTu\sp511\a1.jpg', N'-       Cảm biến gần mũi, nhiệt độ chính xác, bù nhiệt nhanh.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (33, 15, N'Băng Dán Tản Nhiệt 3M9448A Rộng 1CM Dài 50 Mét', 50, 70000.0000, N'images\PhuKienDienTu\sp512\a1.jpg', N'- Băng dán tản nhiệt có độ dẫn nhiệt cao, cách điện tốt, sử dụng cho IC công suất, led công suất...', N'- Độ dày : 0.15mm.
- Rộng 1cm.
- Chiều Dài 50m.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Băng Dán Tản Nhiệt 3M9448A Rộng 2CM Dài 50 Mét
- 3M9448A
- tan nhiet')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (34, 15, N'Cầu Chì 4A 250V T4A250V Loại Tròn', 60, 3500.0000, N'images\PhuKienDienTu\sp513\a1.jpg,images\PhuKienDienTu\sp513\a2.jpg', N'- Cầu chì bảo vệ loại tròn, chịu dòng cao.', N'- Điện áp : 250V.
- Dòng 4A.
- Chân cắm.', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành:', N'- Cầu Chì 4A 250V T4A250V Loại Tròn
- fuse
- cầu chì 4a
- cau chi 4a')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (36, 15, N'Dây Kéo Dài Anten SMA RG-178 Đực Cái 3 Mét WT-FM- SA3M', 35, 105000.0000, N'images\PhuKienDienTu\sp514\a1.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (37, 15, N'Nút Nhấn 4 Chân 4.5x4.5x8MM DIP', 100, 500.0000, N'images\PhuKienDienTu\sp515\a1.jpg,images\PhuKienDienTu\sp515\a2.jpg', N'- Nút Nhấn 4 Chân 4.5x4.5x8MM DIP.', N'- Kích thước :  4.5 x 4.5 x8mm (rộng * dài * cao).
- Giá trị định mức : DC12V 50mA.
- Nhiệt độ : -25 ° ~ + 75 ° C.
- Hoạt động : 100.000 lần.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Nút Nhấn 4 Chân 4.5x4.5x5MM DIP
- nut nhan 4 chan
- nút nhấn dc12v')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (38, 16, N'[Đặt Hàng] TMS320VC5502PGF300 TI/QFP-176', 40, 550000.0000, N'images\ICChucnang\sp601\a1.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (39, 16, N'SP312ECT SOP18 Transceiver Full RS232', 36, 52000.0000, N'images\ICChucnang\sp602\a1.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (40, 16, N'MC34119 SOP8 Low Power Audio Amplifier', 70, 5000.0000, N'images\ICChucnang\sp603\a1.jpg', N'- MC34119 là IC khuếch đại âm thanh công suất thấp, ứng dụng chế loa mini, module âm thanh...', N'- Điện áp cung cấp hoạt động : 2.0 V đến 16 V.
- Công suất đầu ra vượt quá 250 mW với loa 32 W.
- Trở kháng phạm vi 8-100Ω.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- MC34119 SOP8 Low Power Audio Amplifier
- MC34119
- audio')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (41, 16, N'MC14094 DIP16', 55, 15000.0000, N'images\ICChucnang\sp604\a1.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (42, 16, N'NRF51822 QFAC48 Bluetooth 4.0 (QFAC)', 30, 60000.0000, N'images\ICChucnang\sp605\a1.jpg', N'- The nRF51822 is a powerful multiprotocol single chip solution for ULP wireless applications. It incorporates Nordic’s latest best-in-class performance radio transceiver, an ARM® Cortex™ M0 CPU and 256kB/128kB flash and 32kB/16kB RAM memory. The nRF51822 supports Bluetooth® low energy (formerly known as Bluetooth Smart) and 2.4 GHz protocol stacks
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (43, 16, N'KA3525 DIP16 Chính Hãng', 45, 15000.0000, N'images\ICChucnang\sp606\a1.jpg', N'- KA3525 là IC ổn áp điều xung PWM, thường ứng dụng trong mạch tạo dao động, chuyển đổi DC-DC, DC - AC, bộ sạc, nguồn, kích điện, Inverter...', N'- Điện áp cung cấp Vcc : 40V.
- Điện áp Vc (chân 13) : 40V.
- Iout : 500mA.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- KA3525 DIP16 Chính Hãng
- KA3525
- PWM
- ic on ap
- SG3525')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (44, 16, N'FT2705p', 45, 21000.0000, N'images\ICChucnang\sp607\a1.jpg,images\ICChucnang\sp607\a2.jpg', N'- FT2705p là IC Khuếch đại Audio Class-D hiệu suất cao (88%).
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (45, 16, N'LT1085', 25, 48000.0000, N'images\ICChucnang\sp608\a1.jpg', N'- The LT®1085 series of positive adjustable regulators are designed to provide 3A, 5A and 7.5A with higher efficiency than currently available devices. All internal circuitry is designed to operate down to 1V input to output differential and the dropout voltage is fully specified as a function of load current. Dropout is guaranteed at a maximum of 1.5V at maximum output current, decreasing at lower load currents. On-chip trimming adjusts the output voltage to 1%. Current limit is also trimmed, minimizing the stress on both the regulator and power source circuitry under overload conditions.', N'- Three-Terminal 3.3V, 3.6V, 5V and 12V
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (46, 16, N'LT1086', 20, 60000.0000, N'images\ICChucnang\sp609\a1.jpg                                                                                                                                                                          ', N'- LT1086 is 1.5A Low Dropout Positive Regulators Adjustable and Fixed 2.85V, 3.3V, 3.6V, 5V, 12V.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (47, 16, N'HCF4013BE DIP14', 60, 6000.0000, N'images\ICChucnang\sp610\a1.jpg', N'- HCF4013BE là IC Logic Flip-Flop tích hợp nguyên khối, được chế tạo bằng công nghệ bán dẫn oxit kim loại.', N'- HCF4013BE gồm 2 bộ Flip-Flop giống nhau.
- Điện áp : 3 - 20VDC.
- Hiệu suất ESD.
 + HBM: 2 kV.
 + MM: 200 V.
 + CDM: 1 kV.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- HCF4013BE DIP14
- Flip-Flop 
- ic logic')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (48, 16, N'74HC4066D SOP14', 44, 7000.0000, N'images\ICChucnang\sp611\a1.jpg', N'- 74HC4066D là IC CMOS QUAD BILATERAL SWITCH tốc độ cao, được chế tạo với công nghệ C2MOS.
- IC gồm 4 công tắc độc lập tốc độ cao, có khả năng kiểm soát tín hiệu số hoặc tương tự.', N'- VCC : 2 - 12V.
- Nhiệt độ hoạt động : -40 to 85°C.
- Kiểu chân : SOP14', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- 74HC4066D SOP14
- 74HC4066D')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (49, 16, N'LM1084IS-3.3 TO263 IC Nguồn 3.3V 5A', 52, 7500.0000, N'images\ICChucnang\sp612\a1.jpg,images\ICChucnang\sp612\a2.jpg', N'- LM1084IS-3.3 là linh kiện điều chỉnh điện áp dương, có đầu ra cố định.
- Ứng dụng điều chỉnh chuyển đổi điện áp DC-DC.', N'- Điện áp vào : 2.6 - 27V.
- Điện áp ra : 3.3V.
- Dòng ra max : 5A.
- Nhiệt độ hoạt động : -40°C - 125°C
- Kiểu chân : TO263', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LM1084IS-3.3 TO263 IC Nguồn 3.3V 5A')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (50, 16, N'LM1084IT-ADJ TO220 IC Nguồn ADJ 5A', 55, 6500.0000, N'images\ICChucnang\sp613\a1.jpg,images\ICChucnang\sp613\a2.jpg,images\ICChucnang\sp613\a3.jpg', N'- LM1084IS-5.0 là linh kiện điều chỉnh điện áp dương, đầu ra có thể điều chỉnh được như LM317.
- Ứng dụng điều chỉnh chuyển đổi điện áp DC-DC.', N'- Điện áp vào : 2.6 - 29VDC
- Điện áp ra : 1.25 - 27VDC
- Dòng ra max : 5A.
- Nhiệt độ hoạt động : -40°C - 125°C
- Kiểu chân : TO220', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- LM1084IS-5.0')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (51, 16, N'PCM1702 SOP20', 26, 275000.0000, N'images\ICChucnang\sp614\a1.jpg                                                                                                                                                                          ', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (52, 16, N'CDCS503 TSSOP8 Clock Buffer-Multiplier', 36, 25000.0000, N'images\ICChucnang\sp615\a1.jpg', N'- CDCS503 là bộ đệm clock đầu vào(Clocl Buffer/Clock Multiplier With Optional SSC), phổ rộng.', N'- Điện áp : 3.3V.', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- CDCS503 TSSOP8 Clock Buffer-Multiplier
- CDCS503 TSSOP8 
- CDCS503')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (53, 17, N'Pin 3.7V 26650 6800mAh', 34, 50000.0000, N'images\Robot-Pin\sp701\a1.jpg,images\Robot-Pin\sp701\a2.jpg', N'- Pin Lithium 3.7V dung lượng cao, có thể sạc lại, vòng đời hoạt động dài.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (54, 17, N'[Đặt Hàng] Khung Cánh Tay ROBOT ARM', 11, 1200000.0000, N'images\Robot-Pin\sp702\a1.jpg,images\Robot-Pin\sp702\a2.jpg,images\Robot-Pin\sp702\a3.jpg,images\Robot-Pin\sp702\a4.jpg,images\Robot-Pin\sp702\a5.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (55, 17, N'Bộ Lưu Điện Chuyển Nguồn UPS 12V2A UPS122 HS', 19, 160000.0000, N'images\Robot-Pin\sp703\a1.jpg,images\Robot-Pin\sp703\a2.jpg,images\Robot-Pin\sp703\a3.jpg', N'- Bộ chuyển đổi nguồn 12VDC. Cấp nguồn cho các thiết bị Router, đèn, loa... các thiết bị điện tử nguồn 12VDC.', N'- Điện áp vào : 12V DC
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (57, 17, N'[VN] Động Cơ Bước Mini 5-6V Giảm Tốc 1:63 ST56-GT63', 26, 120000.0000, N'images\Robot-Pin\sp704\a1.jpg,images\Robot-Pin\sp704\a2.jpg,images\Robot-Pin\sp704\a3.jpg,images\Robot-Pin\sp704\a4.jpg', N'- Dùng nhiều trong các mô hình sản phẩm 
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (58, 17, N'[VN] Pin 18650 3.7V 2200mAh Lii-22A Chính Hãng', 30, 70000.0000, N'images\Robot-Pin\sp705\a1.jpg', N'Lưu Ý Sử Dụng:
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (60, 17, N'[VN] Sạc 1 Pin 18650-26650 Lii-100 Chính Hãng', 23, 180000.0000, N'images\Robot-Pin\sp706\a1.jpg,images\Robot-Pin\sp706\a2.jpg,images\Robot-Pin\sp706\a3.jpg,images\Robot-Pin\sp706\a4.jpg,images\Robot-Pin\sp706\a5.jpg,images\Robot-Pin\sp706\a6.jpg', N'', N'', N'-  Hàng đã được kiểm tra trước khi đóng gói sản phẩm.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng trực tiếp.
-  Hàng sẽ được kiểm tra khi khách hàng mua hàng online.
-  Sản phẩm được kiểm tra là sản phẩm đã có dán tem kiểm tra hoặc ký hiệu dấu tích  " v ".
-  Sản phẩm thuộc cấp độ Bảo Hành: 6 tháng', N'- Sạc pin 18650')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (75, 17, N'Sạc Pin 18650-26650 Kiểm Tra Nội Trở Full Lii-500 Chính Hãng', 18, 64000.0000, N'images\Robot-Pin\sp707\a1.jpg,images\Robot-Pin\sp707\a2.jpg,images\Robot-Pin\sp707\a3.jpg,images\Robot-Pin\sp707\a4.jpg,images\Robot-Pin\sp707\a5.jpg', N'Bộ Sạc 4 Pin Đa Năng Và Đo Nội Trở Pin Liitokala LII-500 Sạc Pin 26650-18650-14500-16340 là bộ sạc thông minh có khả năng sạc hầu hết các loại pin Li-ion, NiMH / NiCd. Ngoài sạc pin, Lii-500 còn có chế độ kiểm tra pin, hiển thị dòng sạc, dung lượng, nội trở trên màn hình.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (77, 17, N'Động Cơ BLDC 24V Loại 6 Dây Trục 2 Đầu BLDC-24-6-TD ', 26, 115000.0000, N'images\Robot-Pin\sp708\a1.jpg,images\Robot-Pin\sp708\a2.jpg,images\Robot-Pin\sp708\a3.jpg,images\Robot-Pin\sp708\a4.jpg', N'- Đây là động cơ không chổi than DC hãng Nidec có sẵn mạch điều khiển. Động cơ có tốc độ cao, hoạt động ổn định, bền.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (78, 17, N'Động Cơ BLDC 24V Loại 3 Dây BLDC-24-3-TN (Làm quạt DC)', 30, 120000.0000, N'images\Robot-Pin\sp709\a1.jpg,images\Robot-Pin\sp709\a2.jpg,images\Robot-Pin\sp709\a3.jpg,images\Robot-Pin\sp709\a4.jpg', N'- Động cơ Nidec BLDC chế quạt, hoạt động ổn định, bền, công suất 20W.
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (79, 17, N'[VN] Nguồn Adapter 12V3.5A NETGEAR Chất Lượng Cao', 36, 135000.0000, N'images\Robot-Pin\sp710\a1.jpg,images\Robot-Pin\sp710\a2.jpg,images\Robot-Pin\sp710\a3.jpg,images\Robot-Pin\sp710\a4.jpg,images\Robot-Pin\sp710\a5.jpg,images\Robot-Pin\sp710\a6.jpg', N'- Sử dụng cho các mạch điện tử
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (82, 17, N'Nguồn Không Vỏ 24V1.5A', 35, 50000.0000, N'images\Robot-Pin\sp711\a1.jpg,images\Robot-Pin\sp711\a2.jpg,images\Robot-Pin\sp711\a3.jpg,images\Robot-Pin\sp711\a4.jpg', N'- Là nguồn chuyển đổi từ AC100-240V 50/60Hz sang DC24V 1.5A
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
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (83, 17, N'[VN] Robot Lắp Ghép Tư Duy Trẻ Em XiaoMi MiTu', 5, 2490000.0000, N'images\Robot-Pin\sp712\a1.jpg,images\Robot-Pin\sp712\a2.jpg,images\Robot-Pin\sp712\a3.jpg,images\Robot-Pin\sp712\a4.jpg,images\Robot-Pin\sp712\a5.jpg,images\Robot-Pin\sp712\a6.jpg', N'Vừa qua, người dùng đã có dịp tiếp xúc với một phiên bản robot được lắp ráp từ Mi Pad 2 goi là robot biến hình Mi Pad. Những tưởng đây là loại robot kỳ lạ nhất từng xuất hiện nhưng mới đây Xiaomi đã nghiên cứu và cho ra mắt nhiều loại đồ chơi với nhiều tính năng vượt trội hơn nữa. Tiêu biểu là ', N'Chất liệu: nhựa polycarbonate
Kích thước: 38 x 32 x 9cm
Dung lượng pin: 1700mAh
Hỗ trợ cổng USB: 4 cổng
Hệ điều hành hỗ trợ: Android 4.3.0 trở lên, iOS 6.0 trở lên', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (85, 17, N'Hộp Led Nháy 7 Mầu HL7-012', 41, 9000.0000, N'images\Robot-Pin\sp713\a1.jpg,images\Robot-Pin\sp713\a2.jpg,images\Robot-Pin\sp713\a3.jpg', N'- Sử dụng pin LR44, AG13.. 
- Đựng được 2 Pin
- Làm đồ chơi, quà tặng sinh nhật, trung thu, DIY sản phẩm', N'- Kích thước: 3.1x17x0.9MM
- Công tắc gạt để bật tắt nguồn.
- Sử dụng 2 Pin AG13
- Nháy 7 Mầu', N'-  Sản phẩm được nhập trực tiếp từ nhà sản xuất.
-  Sản phẩm được đóng gói theo quy trình của Banlinhkien.Vn
-  Sản phẩm được kiểm tra khi quý khách yêu cầu.', N'- Đế Pin
- 3 Pin
- LR44 1.5V')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (86, 17, N'Nguồn AC-DC Mini 12V400mA P-AD12400', 37, 35000.0000, N'images\Robot-Pin\sp714\a1.jpg,images\Robot-Pin\sp714\a2.jpg,images\Robot-Pin\sp714\a3.jpg', N'', N'', N'', N'')
INSERT [dbo].[MATHANG] ([MaMh], [MaDm], [TenMh], [SoLuong], [DonGia], [HinhAnh], [TinhNang], [ThongSoKiThuat], [BaoHanh], [TuKhoaMH]) VALUES (87, 17, N'Động Cơ Giảm Tốc DC3-9V GT130-T39', 43, 21000.0000, N'images\Robot-Pin\sp715\a1.jpg,images\Robot-Pin\sp715\a2.jpg,images\Robot-Pin\sp715\a3.jpg,images\Robot-Pin\sp715\a4.jpg', N'- Động cơ giảm tốc DC sử dụng trong xe dò line, mô hình.
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
SET IDENTITY_INSERT [dbo].[MATHANG] OFF
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'admin', N'hongphonghoangquy@gmail.com', N'admin123', 1)
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'admin2', N'hongphonghoangquy@gmail.com', N'admin123', 1)
INSERT [dbo].[THANHVIEN] ([TenTk], [Email], [MatKhau], [LoaiTk]) VALUES (N'phongphanh', N'hongphonghoangquy@gmail.com', N'admin123', 0)
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
