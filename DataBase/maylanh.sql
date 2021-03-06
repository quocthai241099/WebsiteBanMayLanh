USE [master]
GO
/****** Object:  Database [QLMayLanh]    Script Date: 27/11/2019 3:01:30 CH ******/
CREATE DATABASE [QLMayLanh]
 CONTAINMENT = NONE

GO
ALTER DATABASE [QLMayLanh] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QLMayLanh].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QLMayLanh] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QLMayLanh] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QLMayLanh] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QLMayLanh] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QLMayLanh] SET ARITHABORT OFF 
GO
ALTER DATABASE [QLMayLanh] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [QLMayLanh] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [QLMayLanh] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QLMayLanh] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QLMayLanh] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QLMayLanh] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QLMayLanh] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QLMayLanh] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QLMayLanh] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QLMayLanh] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QLMayLanh] SET  DISABLE_BROKER 
GO
ALTER DATABASE [QLMayLanh] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QLMayLanh] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QLMayLanh] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QLMayLanh] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QLMayLanh] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QLMayLanh] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QLMayLanh] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QLMayLanh] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [QLMayLanh] SET  MULTI_USER 
GO
ALTER DATABASE [QLMayLanh] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QLMayLanh] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QLMayLanh] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QLMayLanh] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [QLMayLanh]
GO
/****** Object:  Table [dbo].[Admin]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Admin](
	[TaiKhoan] [varchar](50) NOT NULL,
	[MatKhau] [varchar](50) NULL,
	[HoTen] [nvarchar](max) NULL,
 CONSTRAINT [PK_Admin_1] PRIMARY KEY CLUSTERED 
(
	[TaiKhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[ChiTietDonHang]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ChiTietDonHang](
	[MaDonHang] [int] NOT NULL,
	[MaSP] [int] NOT NULL,
	[SoLuong] [int] NULL,
	[DonGia] [decimal](18, 0) NULL,
 CONSTRAINT [PK_ChiTietDonHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC,
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[DonDatHang]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DonDatHang](
	[MaDonHang] [int] IDENTITY(1,1) NOT NULL,
	[DaThanhToan] [int] NULL,
	[TinhTrangGiaoHang] [int] NULL,
	[NgayDat] [datetime] NULL,
	[NgayGiao] [datetime] NULL,
	[MaKH] [int] NULL,
 CONSTRAINT [PK_DonDatHang] PRIMARY KEY CLUSTERED 
(
	[MaDonHang] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[KhachHang]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[KhachHang](
	[MaKH] [int] IDENTITY(1,1) NOT NULL,
	[HoTen] [nvarchar](max) NOT NULL,
	[TaiKhoan] [varchar](50) NULL,
	[MatKhau] [varchar](50) NULL,
	[Email] [varchar](50) NULL,
	[DiaChi] [nvarchar](max) NULL,
	[DienThoai] [varchar](50) NULL,
	[NgaySinh] [datetime] NULL,
 CONSTRAINT [PK_KhachHang] PRIMARY KEY CLUSTERED 
(
	[MaKH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[SanPham]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SanPham](
	[MaSP] [int] IDENTITY(1,1) NOT NULL,
	[TenSP] [nvarchar](50) NULL,
	[GiaBan] [decimal](18, 0) NULL,
	[MoTa] [nvarchar](max) NULL,
	[HinhAnhSP] [nvarchar](max) NULL,
	[MaTH] [int] NULL,
 CONSTRAINT [PK_SanPham] PRIMARY KEY CLUSTERED 
(
	[MaSP] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
/****** Object:  Table [dbo].[ThuongHieu]    Script Date: 27/11/2019 3:01:30 CH ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ThuongHieu](
	[MaTH] [int] IDENTITY(1,1) NOT NULL,
	[TenTH] [nvarchar](max) NULL,
	[HinhAnh] [nvarchar](max) NULL,
 CONSTRAINT [PK_ThuongHieu] PRIMARY KEY CLUSTERED 
(
	[MaTH] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
INSERT [dbo].[Admin] ([TaiKhoan], [MatKhau], [HoTen]) VALUES (N'admin', N'123', N'Trương Quốc Thái')
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [SoLuong], [DonGia]) VALUES (1, 8, 3, CAST(27850000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [SoLuong], [DonGia]) VALUES (1, 16, 1, CAST(6800000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [SoLuong], [DonGia]) VALUES (2, 7, 2, CAST(34950000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [SoLuong], [DonGia]) VALUES (2, 28, 1, CAST(7700000 AS Decimal(18, 0)))
INSERT [dbo].[ChiTietDonHang] ([MaDonHang], [MaSP], [SoLuong], [DonGia]) VALUES (3, 8, 1, CAST(27850000 AS Decimal(18, 0)))
SET IDENTITY_INSERT [dbo].[DonDatHang] ON 

INSERT [dbo].[DonDatHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (1, 0, 0, CAST(0x0000AAF401118FB1 AS DateTime), NULL, 2)
INSERT [dbo].[DonDatHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (2, 0, 0, CAST(0x0000AB0401098556 AS DateTime), NULL, 2)
INSERT [dbo].[DonDatHang] ([MaDonHang], [DaThanhToan], [TinhTrangGiaoHang], [NgayDat], [NgayGiao], [MaKH]) VALUES (3, 0, 0, CAST(0x0000AB1200DC166B AS DateTime), NULL, 2)
SET IDENTITY_INSERT [dbo].[DonDatHang] OFF
SET IDENTITY_INSERT [dbo].[KhachHang] ON 

INSERT [dbo].[KhachHang] ([MaKH], [HoTen], [TaiKhoan], [MatKhau], [Email], [DiaChi], [DienThoai], [NgaySinh]) VALUES (2, N'Đặng Quốc Thịnh', N'thinh', N'123', N'thinh@gmail.com', N'Tây Ninh', N'012343434', CAST(0x00008D9300000000 AS DateTime))
SET IDENTITY_INSERT [dbo].[KhachHang] OFF
SET IDENTITY_INSERT [dbo].[SanPham] ON 

INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (1, N'Máy Lạnh Aqua 1 HP AQA-KCR9NQ', CAST(5450000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ
Sử dụng cho phòng có thể tích 30 - 45 m3 khí, diện tích dưới 15 m2', N'01.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (2, N'Máy Lạnh Aqua Inverter 2 HP AQA-KCRV18WJB', CAST(11750000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, văn phòng
Sử dụng cho phòng có thể tích 60 - 80 m3 khí, diện tích từ 20 - 30 m2', N'02.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (3, N'Máy Lạnh Aqua Inverter 1.5 HP AQA-KCRV12N', CAST(8200000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng làm việc cá nhân. 
Sử dụng cho phòng có thể tích 45 - 60 m3 khí, diện tích từ 15 - 20 m2', N'03.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (4, N'Máy Lạnh Aqua Inverter 1.5 HP AQA-KCRV12WNM', CAST(7700000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ
Sử dụng cho phòng có thể tích 45 - 60 m3 khí, diện tích từ 15 - 20 m2', N'04.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (5, N'Máy Lạnh Aqua Inverter 1.5 HP AQA-KCHV12D', CAST(14100000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng làm việc cá nhân', N'05.jpg', 1)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (6, N'Daikin FTC25NV1V', CAST(7350000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ
Sử dụng cho phòng có thể tích : 30 - 40 m3 khí', N'06.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (7, N'Daikin FTXZ50NVMV', CAST(34950000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng khách hoặc văn phòng
Sử dụng cho phòng có thể tích: 60 - 80 m3 khí', N'07.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (8, N'Máy Lạnh Daikin Inverter FTKC71UVMV', CAST(27850000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng khách, văn phòng
Sử dụng cho phòng có thể tích 120 - 135 m3 khí, diện tích từ 40 - 45 m2', N'08.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (9, N'Máy Lạnh Daikin Inverter FTKC35UAVMV', CAST(11400000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng làm việc cá nhân', N'09.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (10, N'Máy Lạnh Daikin Inverter FTKC71UVMV', CAST(27850000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng khách, văn phòng
Sử dụng cho phòng có thể tích 120 - 135 m3 khí, diện tích từ 40 - 45 m2', N'10.jpg', 2)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (11, N'Máy Lạnh Funiki SC09MMC2 ', CAST(5400000 AS Decimal(18, 0)), N'Điều Hòa Funiki SC09MMC2 với thiết kế thanh lịch, mới mẻ kết hợp vỏ ngoài màu trắng tinh tế, đem đến 1 tổng thể độc đáo cho cả không gian, sản phẩm này chắc chắc sẽ mang đến vẻ đẹp tiện nghi, sang trọng, hiện đại cũng như dễ dàng kết hợp với nhiều không gian nội thất của nhà bạn.', N'11.jpg', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (12, N'Máy Lạnh Funiki SC12MMC2', CAST(6850000 AS Decimal(18, 0)), N'Máy Lạnh Funiki SC12MMC2 với thiết kế thanh lịch, mới mẻ kết hợp vỏ ngoài màu trắng tinh tế, đem đến 1 tổng thể độc đáo cho cả không gian, sản phẩm này chắc chắc sẽ mang đến vẻ đẹp tiện nghi, sang trọng, hiện đại cũng như dễ dàng kết hợp với nhiều không gian nội thất của nhà bạn.', N'12.jpg', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (13, N'Máy Lạnh Funiki SC18MMC2', CAST(9600000 AS Decimal(18, 0)), N'Máy Lạnh Funiki SC18MMC2 với thiết kế thanh lịch, mới mẻ kết hợp vỏ ngoài màu trắng tinh tế, đem đến 1 tổng thể độc đáo cho cả không gian, sản phẩm này chắc chắc sẽ mang đến vẻ đẹp tiện nghi, sang trọng, hiện đại cũng như dễ dàng kết hợp với nhiều không gian nội thất của nhà bạn.', N'13.jpg', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (14, N'Máy lạnh Funiki SC24MMC2', CAST(12100000 AS Decimal(18, 0)), N'Điều Hòa Funiki SC24MMC2 với thiết kế thanh lịch, mới mẻ kết hợp vỏ ngoài màu trắng tinh tế, đem đến 1 tổng thể độc đáo cho cả không gian, sản phẩm này chắc chắc sẽ mang đến vẻ đẹp tiện nghi, sang trọng, hiện đại cũng như dễ dàng kết hợp với nhiều không gian nội thất của nhà bạn.', N'15.jpg', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (15, N'Máy lạnh âm trần Funiki CC18', CAST(16900000 AS Decimal(18, 0)), N'Diện tích 24 - 27 m² hoặc 72 - 81 m³ khí (thích hợp cho phòng khách, văn phòng)', N'15.jpg', 3)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (16, N'Máy Lạnh LG Inverter 1 HP V10ENW', CAST(6800000 AS Decimal(18, 0)), N'Máy lạnh LG Inverter V10ENW thuộc loại máy lạnh treo tường với thiết kế bên ngoài đơn giản nhưng không kém phần sang trọng. Máy Sở hữu sắc trắng trung tính cùng với những đường nét bo cong tinh tế làm tôn lên nét sang trọng và hiện đại cho căn phòng', N'16.jpg', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (17, N'Máy Lạnh LG Inverter 1 HP V10APR', CAST(7250000 AS Decimal(18, 0)), N'Máy lạnh LG Inverter V10APR thuộc loại máy lạnh treo tường với thiết kế bên ngoài đơn giản nhưng không kém phần sang trọng. Máy Sở hữu sắc trắng trung tính cùng với những đường nét bo cong tinh tế làm tôn lên nét sang trọng và hiện đại cho căn phòng.', N'17.jpg', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (18, N'Máy Lạnh LG Inverter 1 HP V10BPB', CAST(9000000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng làm việc cá nhân', N'18.jpg', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (19, N'Máy Lạnh LG Inverter 1.5 HP V13ENC', CAST(7600000 AS Decimal(18, 0)), N'Máy lạnh LG Inverter V13ENC thuộc loại máy lạnh treo tường với thiết kế bên ngoài đơn giản nhưng không kém phần sang trọng. Máy Sở hữu sắc trắng trung tính cùng với những đường nét bo cong tinh tế làm tôn lên nét sang trọng và hiện đại cho căn phòng.', N'19.jpg', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (20, N'Máy lạnh LG Inverter 1.5 HP V13ENS', CAST(7800000 AS Decimal(18, 0)), N'Máy lạnh LG Inverter V13ENS thuộc loại máy lạnh treo tường với thiết kế bên ngoài đơn giản nhưng không kém phần sang trọng. Máy Sở hữu sắc trắng trung tính cùng với những đường nét bo cong tinh tế làm tôn lên nét sang trọng và hiện đại cho căn phòng.', N'20.jpg', 4)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (21, N'Mitsubishi Electric MS-HP25VF', CAST(6900000 AS Decimal(18, 0)), N'Máy lạnh Mitshubishi MS-HP25VF có thiết kế tinh tế, màu sắc trang nhã cùng đường nét hiện đại, sẽ phù hợp với mọi không gian nội thất trong căn phòng của bạn.

 ', N'21.jpg', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (22, N'Mitsubishi Electric MS-HP35VF', CAST(8850000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng khách, văn phòng', N'22.jpg', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (23, N'Mitsubishi Heavy SRK10YLS-S5', CAST(10700000 AS Decimal(18, 0)), N'Máy lạnh Mitsubishi Heavy SRK10YL thuộc dòng máy lạnh cao cấp của Misubishi. Mitsubishi SRK10YL sở hữu thiết kế hiện đại, trang nhã, phù hợp với mọi không gian nội thất.', N'23.jpg', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (24, N'Mitsubishi Heavy SRK12CT-S5', CAST(8500000 AS Decimal(18, 0)), N'Máy lạnh Mitsubishi Heavy SRK12CM-5 có thiết kế rất độc đáo, đem đến sự sang trọng, tinh tế cho căn phòng của bạn, phù hợp với mọi không gian nội thất.', N'24.jpg', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (25, N'Máy Lạnh Inverter Mitsubishi Heavy SRK13YT-S5', CAST(10050000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'25.jpg', 5)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (26, N'Máy Lạnh Samsung Inverter 1 HP AR10NVFHGWKNSV', CAST(6900000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'26.jpg', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (27, N'Máy Lạnh Samsung Inverter AR10NVFXAWKNSV', CAST(10000000 AS Decimal(18, 0)), N'Máy lạnh Samsung Digital Inverter AR10NVFXAWKNSV với thiết kế tam giác độc đáo mới lạ, tạo điểm nhấn và là sự khác biệt so với các dòng máy lạnh mang thiết kế truyền thống. Máy sở hữu kiểu dáng hiện đại cùng tông màu trắng thanh lịch, sản phẩm góp phần làm nổi bật và tôn lên nét sang trọng cho không gian nội thất căn phòng.', N'27.jpg', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (28, N'Máy Lạnh Samsung Inverter AR13MVFHGWKNSV', CAST(7700000 AS Decimal(18, 0)), N'Máy lạnh Samsung Inverter AR13MVFHGWKNSV sở hữu thiết kế đơn giản nhưng không kém phần hiện đại nhờ lớp vỏ ngoài trắng sáng, kết hợp những đường nét mềm mại tạo cảm giác sang trọng và góp phần nâng cao tính thẩm mỹ cho không gian sống.', N'28.jpg', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (29, N'Máy Lạnh Samsung Inverter 1.5 HP AR13NVFXAWKNSV', CAST(12000000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng làm việc các nhân,...', N'29.jpg', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (30, N'Máy Lạnh Samsung Inverter 2 HP AR18MVFHGWKNSV', CAST(12050000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng khách, văn phòng
Sử dung cho phòng có thể tích 60 - 80 m3 khí, diện tích từ 20 - 30 m2', N'30.jpg', 6)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (31, N'SHARP AH-X9VEW', CAST(6200000 AS Decimal(18, 0)), N'Máy lạnh Sharp AH-X9VEW là được thiết kế khá đơn giản nhưng sở hữu màu trắng tinh tế, trang nhã làm tôn thêm vẻ đẹp sang trọng và hiện đại. Vỏ máy sáng mịn, hạn chế bám bụi, dễ dàng vệ sinh.', N'31.jpg', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (32, N'Máy Lạnh Sharp Inverter 1 HP AH-XP10WMW', CAST(7100000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'32.jpg', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (33, N'Máy Lạnh Sharp Inverter 1 HP AH-XP10WHW', CAST(8100000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'33.jpg', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (34, N'Máy Lạnh Sharp Inverter AH-X12STW', CAST(7350000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'34.jpg', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (35, N'Máy Lạnh Sharp Inverter AH-X12VEW', CAST(7800000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'35.jpg', 7)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (36, N'Máy Lạnh TCL 1 HP RVSC09KAX', CAST(4800000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng khách, phòng làm việc cá nhân', N'36.jpg', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (37, N'Máy Lạnh TCL Inverter 1 HP TAC-09CS/LCI', CAST(5800000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'37.jpg', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (38, N'Máy Lạnh TCL Inverter 1 HP RVSC09KEI', CAST(6600000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'38.jpg', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (39, N'Máy Lạnh TCL 1.5 HP RVSC12KAX', CAST(6200000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ, phòng khách, phòng làm việc cá nhân', N'39.jpg', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (40, N'Máy Lạnh TCL Inverter 1.5 HP RVSC12KEI', CAST(8100000 AS Decimal(18, 0)), N'Thích hợp sử dụng cho phòng ngủ', N'40.jpg', 8)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (41, N'Máy lạnh Toshiba RAS-H10U2KSG-V', CAST(6700000 AS Decimal(18, 0)), N'Máy lạnh Toshiba 1 HP RAS-H10U2KSG-V có thiết kế truyền thống của Toshiba là vuông vắn, các đường nét góc cạnh mạnh mẽ rất ưa nhìn và sẽ làm tăng thêm nét sang trọng cho không gian nội thất của gia đình bạn', N'41.jpg', 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (42, N'Máy lạnh Toshiba RAS-H10D1KCVG-V (1.0 Hp) Inverter', CAST(7700000 AS Decimal(18, 0)), N'Máy lạnh Toshiba Inverter 1 HP RAS-H10D1KCVG-V có thiết kế bên ngoài đơn giản, nhỏ gọn, cùng sắc trắng thanh lịch sẽ dễ dàng kết hợp với mọi không gian nội thất của gia đình. Bên cạnh đó, chiếc máy lạnh Toshiba công suất 1 HP này là một sự lựa chọn lý tưởng cho phòng có diện tích dưới 15 m2', N'42.jpg', 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (43, N'Máy Lạnh Toshiba RAS-H13U2KSG-V', CAST(9300000 AS Decimal(18, 0)), N'Máy lạnh Toshiba 1.5 HP RAS-H13U2KSG-V có thiết kế chữ nhật đơn giản, cứng cáp, kết hợp với sắc trắng thanh lịch sẽ phù hợp với bất kỳ không gian nội thất nào.', N'43.jpg', 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (44, N'Máy lạnh Toshiba RAS-H13C1KCVG-V (1.5Hp) Inverter', CAST(10000000 AS Decimal(18, 0)), N'Được thiết kế với sắc trắng tinh tế cùng kiểu dáng chữ nhật đơn giản, máy lạnh Toshiba Inverter 1.5 HP RAS-H13C1KCVG-V hứa hẹn sẽ hoàn toàn phù hợp với bất kỳ không gian nội thất nào, đồng thời máy lạnh còn mang đến cho không gian nội thất của bạn nét sang trọng, tinh tế. Thuộc dòng máy lạnh công suất 1.5 HP.', N'44.jpg', 9)
INSERT [dbo].[SanPham] ([MaSP], [TenSP], [GiaBan], [MoTa], [HinhAnhSP], [MaTH]) VALUES (45, N'Máy lạnh Toshiba RAS-H10PKCVG-V (1.0Hp) Inverter', CAST(10300000 AS Decimal(18, 0)), N'Diện tích 12 - 15 m² hoặc 36 - 45 m³ khí (thích hợp cho phòng ngủ)', N'45.jpg', 9)
SET IDENTITY_INSERT [dbo].[SanPham] OFF
SET IDENTITY_INSERT [dbo].[ThuongHieu] ON 

INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (1, N'AQUA', N'aqua.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (2, N'DAIKIN', N'daikin.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (3, N'FUNIKI', N'funikii.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (4, N'LG', N'lg.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (5, N'MITSUBISHI', N'mitsubishi.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (6, N'SAMSUNG', N'samsung.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (7, N'SHARP', N'sharp.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (8, N'TCL', N'tcl.jpg')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (9, N'TOSHIBA', N'toshiba.png')
INSERT [dbo].[ThuongHieu] ([MaTH], [TenTH], [HinhAnh]) VALUES (13, N'Asanzo', N'01.jpg')
SET IDENTITY_INSERT [dbo].[ThuongHieu] OFF
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_DonDatHang] FOREIGN KEY([MaDonHang])
REFERENCES [dbo].[DonDatHang] ([MaDonHang])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_DonDatHang]
GO
ALTER TABLE [dbo].[ChiTietDonHang]  WITH CHECK ADD  CONSTRAINT [FK_ChiTietDonHang_SanPham] FOREIGN KEY([MaSP])
REFERENCES [dbo].[SanPham] ([MaSP])
GO
ALTER TABLE [dbo].[ChiTietDonHang] CHECK CONSTRAINT [FK_ChiTietDonHang_SanPham]
GO
ALTER TABLE [dbo].[DonDatHang]  WITH CHECK ADD  CONSTRAINT [FK_DonDatHang_KhachHang] FOREIGN KEY([MaKH])
REFERENCES [dbo].[KhachHang] ([MaKH])
GO
ALTER TABLE [dbo].[DonDatHang] CHECK CONSTRAINT [FK_DonDatHang_KhachHang]
GO
ALTER TABLE [dbo].[SanPham]  WITH CHECK ADD  CONSTRAINT [FK_SanPham_ThuongHieu] FOREIGN KEY([MaTH])
REFERENCES [dbo].[ThuongHieu] ([MaTH])
GO
ALTER TABLE [dbo].[SanPham] CHECK CONSTRAINT [FK_SanPham_ThuongHieu]
GO
USE [master]
GO
ALTER DATABASE [QLMayLanh] SET  READ_WRITE 
GO
