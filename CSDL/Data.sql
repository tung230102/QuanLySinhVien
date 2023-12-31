USE [master]
GO
/****** Object:  Database [QuanLySinhVien]    Script Date: 17/11/2023 9:48:22 AM ******/
CREATE DATABASE [QuanLySinhVien]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'QuanLySinhVien', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SERVER\MSSQL\DATA\QuanLySinhVien.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'QuanLySinhVien_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.SERVER\MSSQL\DATA\QuanLySinhVien_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [QuanLySinhVien] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [QuanLySinhVien].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET ARITHABORT OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [QuanLySinhVien] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [QuanLySinhVien] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET  ENABLE_BROKER 
GO
ALTER DATABASE [QuanLySinhVien] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [QuanLySinhVien] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET RECOVERY FULL 
GO
ALTER DATABASE [QuanLySinhVien] SET  MULTI_USER 
GO
ALTER DATABASE [QuanLySinhVien] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [QuanLySinhVien] SET DB_CHAINING OFF 
GO
ALTER DATABASE [QuanLySinhVien] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [QuanLySinhVien] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [QuanLySinhVien] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [QuanLySinhVien] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'QuanLySinhVien', N'ON'
GO
ALTER DATABASE [QuanLySinhVien] SET QUERY_STORE = ON
GO
ALTER DATABASE [QuanLySinhVien] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [QuanLySinhVien]
GO
USE [QuanLySinhVien]
GO
/****** Object:  Sequence [dbo].[sinhvienSeq]    Script Date: 17/11/2023 9:48:22 AM ******/
CREATE SEQUENCE [dbo].[sinhvienSeq] 
 AS [bigint]
 START WITH 10
 INCREMENT BY 1
 MINVALUE -9223372036854775808
 MAXVALUE 9223372036854775807
 CACHE 
GO
/****** Object:  Table [dbo].[tblDiem]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblDiem](
	[masinhvien] [varchar](50) NOT NULL,
	[malophoc] [bigint] NOT NULL,
	[lanhoc] [int] NOT NULL,
	[diemthilan1] [float] NULL,
	[diemthilan2] [float] NULL,
	[ngaytao] [datetime] NOT NULL,
	[nguoitao] [varchar](30) NOT NULL,
	[ngaycapnhat] [datetime] NOT NULL,
	[nguoicapnhat] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC,
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblGiaoVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblGiaoVien](
	[magiaovien] [int] IDENTITY(1,1) NOT NULL,
	[matkhau] [varchar](50) NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [tinyint] NOT NULL,
	[diachi] [nvarchar](150) NOT NULL,
	[dienthoai] [varchar](30) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[ngaytao] [datetime] NOT NULL,
	[nguoitao] [varchar](30) NOT NULL,
	[ngaycapnhat] [datetime] NOT NULL,
	[nguoicapnhat] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[magiaovien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblLopHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblLopHoc](
	[malophoc] [bigint] IDENTITY(1,1) NOT NULL,
	[magiaovien] [int] NULL,
	[mamonhoc] [int] NULL,
	[daketthuc] [tinyint] NOT NULL,
	[ngaytao] [datetime] NOT NULL,
	[nguoitao] [varchar](30) NOT NULL,
	[ngaycapnhat] [datetime] NOT NULL,
	[nguoicapnhat] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[malophoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblMonHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblMonHoc](
	[mamonhoc] [int] IDENTITY(1,1) NOT NULL,
	[tenmonhoc] [nvarchar](150) NOT NULL,
	[sotinchi] [int] NOT NULL,
	[ngaytao] [datetime] NOT NULL,
	[nguoitao] [varchar](30) NOT NULL,
	[ngaycapnhat] [datetime] NOT NULL,
	[nguoicapnhat] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[mamonhoc] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblSinhVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblSinhVien](
	[masinhvien] [varchar](50) NOT NULL,
	[matkhau] [varchar](50) NOT NULL,
	[hoten] [nvarchar](50) NOT NULL,
	[ngaysinh] [date] NOT NULL,
	[gioitinh] [tinyint] NOT NULL,
	[quequan] [nvarchar](150) NOT NULL,
	[diachi] [nvarchar](150) NOT NULL,
	[dienthoai] [varchar](30) NOT NULL,
	[email] [varchar](150) NOT NULL,
	[ngaytao] [datetime] NOT NULL,
	[nguoitao] [varchar](30) NOT NULL,
	[ngaycapnhat] [datetime] NOT NULL,
	[nguoicapnhat] [varchar](30) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[masinhvien] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tblTaiKhoan]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tblTaiKhoan](
	[tentaikhoan] [varchar](50) NOT NULL,
	[matkhau] [nvarchar](150) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[tentaikhoan] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 1, 1, 8, 7, CAST(N'2023-11-12T21:01:51.963' AS DateTime), N'SV10', CAST(N'2023-11-12T21:03:02.140' AS DateTime), N'1')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 2, 1, 8, 8, CAST(N'2023-11-12T21:15:01.590' AS DateTime), N'SV10', CAST(N'2023-11-12T21:15:20.347' AS DateTime), N'2')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 3, 1, 9, 9, CAST(N'2023-11-13T13:01:42.090' AS DateTime), N'SV10', CAST(N'2023-11-13T14:47:14.450' AS DateTime), N'3')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 5, 1, 8, 7, CAST(N'2023-11-13T14:46:30.453' AS DateTime), N'SV10', CAST(N'2023-11-15T10:59:02.520' AS DateTime), N'5')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 8, 2, 9, 8, CAST(N'2023-11-12T21:07:57.700' AS DateTime), N'SV10', CAST(N'2023-11-12T21:10:09.897' AS DateTime), N'1')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', 9, 3, 8, 8, CAST(N'2023-11-13T14:50:58.707' AS DateTime), N'SV10', CAST(N'2023-11-13T14:51:32.037' AS DateTime), N'7')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV11', 1, 1, 9, 9, CAST(N'2023-11-12T21:02:16.520' AS DateTime), N'SV11', CAST(N'2023-11-12T21:03:02.930' AS DateTime), N'1')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV11', 7, 1, 8, 8, CAST(N'2023-11-15T11:22:26.447' AS DateTime), N'SV11', CAST(N'2023-11-15T11:22:51.500' AS DateTime), N'7')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV12', 4, 1, 9, 8, CAST(N'2023-11-15T21:24:52.027' AS DateTime), N'SV12', CAST(N'2023-11-15T21:25:45.810' AS DateTime), N'4')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV14', 1, 1, 4, 2, CAST(N'2023-11-12T21:02:36.290' AS DateTime), N'SV14', CAST(N'2023-11-12T21:03:04.170' AS DateTime), N'1')
INSERT [dbo].[tblDiem] ([masinhvien], [malophoc], [lanhoc], [diemthilan1], [diemthilan2], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV14', 6, 1, 5, 3, CAST(N'2023-11-15T22:38:43.730' AS DateTime), N'SV14', CAST(N'2023-11-15T22:40:24.597' AS DateTime), N'6')
GO
SET IDENTITY_INSERT [dbo].[tblGiaoVien] ON 

INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (1, N'123', N'Nguyễn Văn Hách', CAST(N'1999-01-01' AS Date), 1, N'Hà Nội', N'1111111111', N'nvhachh@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (2, N'123', N'Đặng Thị Khánh Linh', CAST(N'1999-02-02' AS Date), 0, N'Hà Nội', N'2222222222', N'dtklinh@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (3, N'123', N'Lê Thị Vui', CAST(N'1999-03-03' AS Date), 0, N'Hà Nội', N'3333333333', N'ltvui@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.933' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (4, N'123', N'Thầy Quang', CAST(N'1999-04-04' AS Date), 1, N'Hà Nội', N'4444444444', N'quang@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (5, N'123', N'Đào Thị Phương Anh', CAST(N'1999-05-05' AS Date), 0, N'Hà Nội', N'5555555555', N'dtpanh@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (6, N'123', N'Lê Thị Thu Hà', CAST(N'1999-06-06' AS Date), 0, N'Hà Nội', N'6666666666', N'lttha@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin')
INSERT [dbo].[tblGiaoVien] ([magiaovien], [matkhau], [hoten], [ngaysinh], [gioitinh], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (7, N'123', N'Trương Mạnh Đạt', CAST(N'1999-07-07' AS Date), 1, N'Hà Nội', N'7777777777', N'tmdat@hunre.edu.vn', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:13.937' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tblGiaoVien] OFF
GO
SET IDENTITY_INSERT [dbo].[tblLopHoc] ON 

INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (1, 1, 1, 1, CAST(N'2023-11-12T20:59:39.670' AS DateTime), N'admin', CAST(N'2023-11-12T21:03:50.030' AS DateTime), N'1')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (2, 2, 2, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-12T21:15:24.800' AS DateTime), N'2')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (3, 3, 3, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-13T14:47:30.043' AS DateTime), N'3')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (4, 4, 4, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-15T21:25:48.280' AS DateTime), N'4')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (5, 5, 5, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-15T10:59:04.767' AS DateTime), N'5')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (6, 6, 6, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-15T22:40:27.490' AS DateTime), N'6')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (7, 7, 7, 1, CAST(N'2023-11-12T20:59:39.673' AS DateTime), N'admin', CAST(N'2023-11-15T11:22:53.717' AS DateTime), N'7')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (8, 1, 1, 1, CAST(N'2023-11-12T21:06:55.910' AS DateTime), N'admin', CAST(N'2023-11-12T21:10:12.900' AS DateTime), N'1')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (9, 7, 1, 1, CAST(N'2023-11-13T14:45:56.220' AS DateTime), N'admin', CAST(N'2023-11-13T14:51:34.467' AS DateTime), N'7')
INSERT [dbo].[tblLopHoc] ([malophoc], [magiaovien], [mamonhoc], [daketthuc], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (10009, 2, 5, 0, CAST(N'2023-11-16T21:02:30.740' AS DateTime), N'admin', CAST(N'2023-11-16T21:02:30.740' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tblLopHoc] OFF
GO
SET IDENTITY_INSERT [dbo].[tblMonHoc] ON 

INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (1, N'Phát triển ứng dụng mạng', 3, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (2, N'Quản lý dự án phần mềm', 2, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (3, N'Phát triển ứng dụng cho các thiết bị di động', 2, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (4, N'Phát triển hệ thống thông tin Enterprise', 3, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (5, N'Cơ sở dữ liệu phân tán và ứng dụng', 2, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (6, N'Phát triển thông tin hệ thông tài nguyên và môi trường', 2, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
INSERT [dbo].[tblMonHoc] ([mamonhoc], [tenmonhoc], [sotinchi], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (7, N'Phát triển phần mềm hướng dịch vụ', 3, CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:18.203' AS DateTime), N'admin')
SET IDENTITY_INSERT [dbo].[tblMonHoc] OFF
GO
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV10', N'123', N'Trần Thanh Tuấn', CAST(N'2002-07-03' AS Date), 1, N'Thái Bình', N'Hà Nội', N'20111062342', N'20111062342@hunre.edu.vn', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin')
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV11', N'123', N'Nguyễn Huy Tùng', CAST(N'2002-01-23' AS Date), 1, N'Hà Nam', N'Hà Nội', N'0917743489', N'20111064266@hunre.edu.vn', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin')
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV12', N'123', N'Lê Anh Tuấn', CAST(N'2002-12-22' AS Date), 1, N'Thanh Hóa', N'Hà Nội', N'20111063724', N'20111063724@hunre.edu.vn', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin')
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV13', N'123', N'Đỗ Văn Tư', CAST(N'2002-02-27' AS Date), 1, N'Nam Định', N'Hà Nội', N'20111063768', N'20111063768@hunre.edu.vn', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin', CAST(N'2023-11-12T20:59:09.953' AS DateTime), N'admin')
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV14', N'123', N'Trần Thị  B', CAST(N'2023-11-12' AS Date), 0, N'HN', N'Hà Nội', N'09123456', N'ttb123@', CAST(N'2023-11-12T21:00:56.993' AS DateTime), N'admin', CAST(N'2023-11-12T21:00:56.993' AS DateTime), N'admin')
INSERT [dbo].[tblSinhVien] ([masinhvien], [matkhau], [hoten], [ngaysinh], [gioitinh], [quequan], [diachi], [dienthoai], [email], [ngaytao], [nguoitao], [ngaycapnhat], [nguoicapnhat]) VALUES (N'SV15', N'123', N'Nguyễn Văn A', CAST(N'2121-11-12' AS Date), 1, N'', N'', N'', N'', CAST(N'2023-11-13T14:44:13.963' AS DateTime), N'admin', CAST(N'2023-11-13T14:44:13.963' AS DateTime), N'admin')
GO
INSERT [dbo].[tblTaiKhoan] ([tentaikhoan], [matkhau]) VALUES (N'admin', N'admin')
GO
ALTER TABLE [dbo].[tblDiem] ADD  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblDiem] ADD  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblDiem] ADD  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT ('123') FOR [matkhau]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblGiaoVien] ADD  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  DEFAULT ((0)) FOR [daketthuc]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblLopHoc] ADD  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblMonHoc] ADD  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT ('123') FOR [matkhau]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT (getdate()) FOR [ngaytao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT ('admin') FOR [nguoitao]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT (getdate()) FOR [ngaycapnhat]
GO
ALTER TABLE [dbo].[tblSinhVien] ADD  DEFAULT ('admin') FOR [nguoicapnhat]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblDiem_tblSinhVien] FOREIGN KEY([masinhvien])
REFERENCES [dbo].[tblSinhVien] ([masinhvien])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblDiem_tblSinhVien]
GO
ALTER TABLE [dbo].[tblDiem]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblDiem] FOREIGN KEY([malophoc])
REFERENCES [dbo].[tblLopHoc] ([malophoc])
GO
ALTER TABLE [dbo].[tblDiem] CHECK CONSTRAINT [FK_tblLopHoc_tblDiem]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblGiaoVien] FOREIGN KEY([magiaovien])
REFERENCES [dbo].[tblGiaoVien] ([magiaovien])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblGiaoVien]
GO
ALTER TABLE [dbo].[tblLopHoc]  WITH CHECK ADD  CONSTRAINT [FK_tblLopHoc_tblMonHoc] FOREIGN KEY([mamonhoc])
REFERENCES [dbo].[tblMonHoc] ([mamonhoc])
GO
ALTER TABLE [dbo].[tblLopHoc] CHECK CONSTRAINT [FK_tblLopHoc_tblMonHoc]
GO
/****** Object:  StoredProcedure [dbo].[chamdiem]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[chamdiem]
	@magiaovien varchar(10),
	@malop bigint,
	@masinhvien varchar(30),
	@diemlan1 float,
	@diemlan2 float
AS
BEGIN
UPDATE tblDiem
SET
    ngaycapnhat = GETDATE(),
    nguoicapnhat = @magiaovien,
    diemthilan1 = @diemlan1,
    diemthilan2 = @diemlan2
	WHERE malophoc = @malop AND masinhvien = @masinhvien;
END
GO
/****** Object:  StoredProcedure [dbo].[dangnhap]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dangnhap]
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50),
	@matkhau varchar(50)
AS
BEGIN
	IF @loaitaikhoan = 'admin' 
		SELECT * FROM tblTaiKhoan WHERE tentaikhoan = @taikhoan AND matkhau = @matkhau
		ELSE IF @loaitaikhoan = 'gv' 
			SELECT * FROM tblGiaoVien WHERE CAST(magiaovien AS varchar(50)) = @taikhoan AND matkhau = @matkhau
		ELSE SELECT * FROM tblSinhVien WHERE masinhvien = @taikhoan AND matkhau = @matkhau ;
END
GO
/****** Object:  StoredProcedure [dbo].[deleteGiaoVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[deleteGiaoVien]
    @magiaovien INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM tblDiem
        WHERE malophoc IN (SELECT malophoc FROM tblLopHoc WHERE magiaovien = @magiaovien);

        DELETE FROM tblLopHoc
        WHERE magiaovien = @magiaovien;

        DELETE FROM tblGiaoVien
        WHERE magiaovien = @magiaovien;

        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[deleteLopHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Tạo proc selectLopHoc --
CREATE PROC [dbo].[deleteLopHoc]
    @malophoc bigint
AS
BEGIN
    BEGIN TRY
        DELETE FROM tblLopHoc
        WHERE malophoc = @malophoc;
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[deleteMonHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteMonHoc]
    @mamonhoc INT
AS
BEGIN
    BEGIN TRY
		DELETE FROM tblLopHoc
        WHERE mamonhoc = @mamonhoc;
		DELETE FROM tblMonHoc
        WHERE mamonhoc = @mamonhoc;
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[deleteSinhVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[deleteSinhVien]
    @masinhvien varchar(50)
AS
BEGIN
    BEGIN TRY
		delete from tblSinhVien where masinhvien = @masinhvien
		delete from tblDiem where masinhvien = @masinhvien
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[dKyHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dKyHoc]
	@masinhvien varchar(50),
	@malophoc bigint
AS
BEGIN
	DECLARE @v_lanhoc int,
			@v_mamonhoc int,
			@v_dadangky int;
	SELECT @v_mamonhoc = mamonhoc
	FROM tblLopHoc
	WHERE malophoc = @malophoc;

	SELECT @v_lanhoc = COUNT(*)
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 1
	AND d.masinhvien = @masinhvien
	AND l.mamonhoc = @v_mamonhoc;

	SELECT @v_dadangky = COUNT(*)
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 0
	AND l.mamonhoc = @v_mamonhoc
	AND d.masinhvien = @masinhvien; 

	IF @v_dadangky>0 RETURN -1;

	SET @v_lanhoc = @v_lanhoc + 1;

	INSERT INTO tblDiem(nguoitao, masinhvien, malophoc, lanhoc)
	VALUES(@masinhvien, @masinhvien, @malophoc, @v_lanhoc);
	
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[doiMatKhau]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[doiMatKhau]
    @loaitaikhoan varchar(10),
    @taikhoan varchar(50),
    @matkhau varchar(50)
AS
BEGIN 
    IF @loaitaikhoan = 'admin' 
        UPDATE tblTaiKhoan SET matkhau = @matkhau WHERE tentaikhoan = @taikhoan
    ELSE IF @loaitaikhoan = 'gv' 
        UPDATE tblGiaoVien SET matkhau = @matkhau WHERE CAST(magiaovien AS varchar(50)) = @taikhoan
    ELSE 
        UPDATE tblSinhVien SET matkhau = @matkhau WHERE masinhvien = @taikhoan;
END
GO
/****** Object:  StoredProcedure [dbo].[dsLopChuaDKy]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dsLopChuaDKy]
	@masinhvien varchar(50)
AS
BEGIN
	SELECT
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		g.hoten
	FROM tblLopHoc l
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	INNER JOIN tblMonHoc m on l.mamonhoc = m.mamonhoc
	WHERE l.daketthuc = 0
	AND l.malophoc NOT IN (SELECT malophoc FROM tblDiem WHERE masinhvien = @masinhvien);
END
GO
/****** Object:  StoredProcedure [dbo].[dssv]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[dssv]
	@malophoc bigint,
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = lower(@tukhoa);
	SELECT 
		d.masinhvien,
		s.hoten,
		d.lanhoc,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblSinhVien s on d.masinhvien = s.masinhvien
	WHERE d.malophoc = @malophoc
	and LOWER(s.hoten) like '%'+@tukhoa+'%'
END
GO
/****** Object:  StoredProcedure [dbo].[insertGiaoVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertGiaoVien]
	@nguoitao varchar(30),
	@hoten nvarchar(50),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
AS
BEGIN
	INSERT INTO tblGiaoVien(nguoitao, hoten, gioitinh, ngaysinh, email, dienthoai, diachi)
	VALUES(@nguoitao, @hoten, @gioitinh, @ngaysinh, @email, @dienthoai, @diachi);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0 ;
END;
GO
/****** Object:  StoredProcedure [dbo].[insertLopHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertLopHoc]
	@nguoitao varchar(30),
	@magiaovien int,
	@mamonhoc int
AS
BEGIN
	INSERT INTO tblLopHoc(nguoitao, mamonhoc, magiaovien)
	VALUES(@nguoitao, @mamonhoc, @magiaovien);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[insertMonHoc]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Tạo proc insertMonHoc
CREATE PROC [dbo].[insertMonHoc]
	@nguoitao varchar(30),
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	INSERT INTO tblMonHoc(nguoitao,tenmonhoc,sotinchi)
	VALUES(@nguoitao,@tenmonhoc,@sotinchi);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[insertSinhVien]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[insertSinhVien]
	@hoten nvarchar(50), @ngaysinh date, 
	@gioitinh tinyint, @quequan nvarchar(150),
	@diachi nvarchar(150), @dienthoai varchar(30), 
	@email varchar(150)
AS
BEGIN
	INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
	VALUES('SV' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), @hoten, @ngaysinh, @gioitinh, @quequan, @diachi, @dienthoai, @email);
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END;
GO
/****** Object:  StoredProcedure [dbo].[ketThucHocPhan]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- Tạo proc ketThucHocPhan
CREATE PROC [dbo].[ketThucHocPhan]
	@magiaovien varchar(30),
	@malop bigint
AS
BEGIN
	UPDATE tblLopHoc
	SET
		nguoicapnhat = @magiaovien,
		ngaycapnhat = GETDATE(),
		daketthuc = 1
	WHERE malophoc = @malop;
	IF @@ROWCOUNT > 0 RETURN 1
	ELSE RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[monDaDKy]    Script Date: 17/11/2023 9:48:22 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[monDaDKy]
	@masinhvien varchar(50)
AS
BEGIN
	SELECT 
		l.malophoc,
		m.tenmonhoc,
		g.hoten,
		m.sotinchi,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE l.daketthuc = 0
	AND d.masinhvien = @masinhvien
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllGiaoVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectAllGiaoVien]
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	SELECT 
		magiaovien,
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) as ngaysinh,
		CASE WHEN gioitinh = 1 THEN 'Nam' ELSE N'Nữ' END AS gioitinh,
		dienthoai,
		email,
		diachi
	FROM tblGiaoVien
	WHERE LOWER(hoten) LIKE '%'+@tukhoa+'%'
	OR LOWER(email) LIKE '%'+@tukhoa+'%'
	OR LOWER(dienthoai) LIKE '%'+@tukhoa+'%'
	OR LOWER(magiaovien) LIKE '%'+@tukhoa+'%'
	ORDER BY hoten;
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllLopHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectAllLopHoc]
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);
	SELECT 
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		g.hoten ,
		CASE WHEN l.daketthuc = 1 THEN N'Đã kết thúc'
				ELSE N'Đang mở' END trangthai
	FROM tblLopHoc l
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE  m.tenmonhoc LIKE '%'+@tukhoa+'%'
	OR LOWER(hoten) LIKE '%'+@tukhoa+'%';
END
GO
/****** Object:  StoredProcedure [dbo].[selectAllMonHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Tạo proc selectAllMonHoc
CREATE PROC [dbo].[selectAllMonHoc]
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	SELECT 
		mamonhoc,
		tenmonhoc,
		sotinchi
	FROM tblMonHoc
	WHERE mamonhoc LIKE '%'+@tukhoa+'%'
	OR lower(tenmonhoc) LIKE '%'+@tukhoa+'%'
	ORDER BY tenmonhoc;	
END;
GO
/****** Object:  StoredProcedure [dbo].[selectAllSinhVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectAllSinhVien]
	@tukhoa nvarchar(50)
AS
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	select 
		masinhvien,
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) as ngaysinh,
		CASE WHEN gioitinh = 1 THEN 'Nam' ELSE N'Nữ' END AS gioitinh,
		quequan, diachi, dienthoai, email
	FROM tblSinhVien
	WHERE LOWER(hoten) LIKE '%'+@tukhoa+'%'
	OR LOWER(email) LIKE '%'+@tukhoa+'%'
	OR LOWER(diachi) LIKE '%'+@tukhoa+'%'
	OR LOWER(dienthoai) LIKE '%'+@tukhoa+'%'
	ORDER BY hoten;
GO
/****** Object:  StoredProcedure [dbo].[selectDiemTB]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectDiemTB]
AS
BEGIN
	SELECT
		sv.masinhvien,
		sv.hoten,
		SUM(
			CASE
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.5 THEN 4 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.5 THEN 3.5 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 7.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.0 THEN 3 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 6.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 7.0 THEN 2.5 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 6.5 THEN 2 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.5 THEN 1.5 * mh.sotinchi
				WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 4.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.0 THEN 1 * mh.sotinchi
				ELSE 0
			END
		) / NULLIF(SUM(mh.sotinchi), 0) AS DTBC
	FROM
		tblSinhVien sv
		INNER JOIN tblDiem d ON sv.masinhvien = d.masinhvien
		INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
		INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
	WHERE
		lh.daketthuc = 1
	GROUP BY
		sv.masinhvien, sv.hoten
END;
GO
/****** Object:  StoredProcedure [dbo].[selectDiemTongKetHocPhan]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectDiemTongKetHocPhan]
AS
BEGIN
	SELECT TOP 5
		d.masinhvien, AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)) AS DiemTrungBinh
	FROM tblDiem d
	JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 1
	GROUP BY d.masinhvien
	HAVING AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)) > 8
	ORDER BY DiemTrungBinh DESC;
END;
GO
/****** Object:  StoredProcedure [dbo].[selectGiaoVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectGiaoVien]
	@magiaovien int
AS
BEGIN
	SELECT
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) AS ngaysinh,
		gioitinh, 
		dienthoai, email, diachi
	FROM tblGiaoVien
	WHERE magiaovien = @magiaovien;
END
GO
/****** Object:  StoredProcedure [dbo].[selectLopHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectLopHoc]
	@malophoc bigint
AS
BEGIN
	SELECT
		m.tenmonhoc,
		g.magiaovien,
		l.mamonhoc
	FROM tblLopHoc l
	inner join tblGiaoVien g ON l.magiaovien = g.magiaovien
	inner join tblMonHoc m ON l.mamonhoc = m.mamonhoc
	WHERE malophoc = @malophoc;
END
GO
/****** Object:  StoredProcedure [dbo].[selectMonHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectMonHoc]
	@mamh int
AS
BEGIN
	SELECT 
		tenmonhoc,
		sotinchi
	FROM tblMonHoc
	WHERE mamonhoc = @mamh;
END
GO
/****** Object:  StoredProcedure [dbo].[selectSinhVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectSinhVien]
	@masinhvien varchar(50)
AS
BEGIN
	SELECT
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) AS ngaysinh,
		gioitinh,
		quequan, diachi, dienthoai, email
	FROM tblSinhVien
	WHERE masinhvien = @masinhvien;
END
GO
/****** Object:  StoredProcedure [dbo].[selectSinhVienMonHocChuaDat]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectSinhVienMonHocChuaDat]
AS
BEGIN
	WITH SinhVien AS (
		SELECT
			sv.masinhvien,
			sv.hoten,
			sv.ngaysinh,
			sv.quequan,
			sv.diachi,
			sv.dienthoai,
			sv.email,
			mh.tenmonhoc AS MonHoc,
			(d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) AS Diem
		FROM
			tblSinhVien sv
			INNER JOIN tblDiem d ON sv.masinhvien = d.masinhvien
			INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
			INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
		WHERE
			lh.daketthuc = 1
	)
	SELECT
		masinhvien,
		hoten,
		ngaysinh,
		quequan,
		diachi,
		dienthoai,
		email,
		MonHoc,
		Diem,
		CASE
			WHEN Diem < 4 THEN N'Chưa đạt'
		END AS XepLoai
	FROM
		SinhVien
	WHERE
		Diem < 4;
END;
GO
/****** Object:  StoredProcedure [dbo].[selectSVHocBong]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectSVHocBong]
AS
BEGIN
	WITH SinhVien AS (
	   SELECT TOP 5
			sv.masinhvien,
			sv.hoten,
			ROUND(AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)), 2) AS DiemHe10,
			CAST(
				SUM(
					CASE
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.5 THEN 4 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.5 THEN 3.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 7.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.0 THEN 3 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 6.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 7.0 THEN 2.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 6.5 THEN 2 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.5 THEN 1.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 4.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.0 THEN 1 * mh.sotinchi
						ELSE 0
					END
				) / NULLIF(SUM(mh.sotinchi), 0) AS decimal(10, 2)
			) AS DTBC,
			SUM(mh.sotinchi) AS TongSoTinChi
		FROM
			tblSinhVien sv
			INNER JOIN tblDiem d ON sv.masinhvien = d.masinhvien
			INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
			INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
		WHERE
			lh.daketthuc = 1
		GROUP BY
			sv.masinhvien, sv.hoten
		ORDER BY
			DTBC DESC
	)
	SELECT
		masinhvien,
		hoten,
		DiemHe10,
		DTBC,
		CASE
			WHEN DTBC >= 3.6 THEN N'Xuất sắc'
			WHEN DTBC >= 3.2 THEN N'Giỏi'
		END AS XepLoai,
		TongSoTinChi,
		CASE
			WHEN DTBC >= 3.6 THEN CONCAT(FORMAT(433100, 'N0'), N' VND')
			WHEN DTBC >= 3.2 THEN CONCAT(FORMAT(407700, 'N0'), N' VND')
		END AS tien,
		CONCAT(FORMAT(
			CASE
				WHEN DTBC >= 3.6 THEN 433100 * TongSoTinChi
				WHEN DTBC >= 3.2 THEN 407700 * TongSoTinChi
				ELSE 0
			END, 'N0'), N' VND') AS TienThuong
	FROM
		SinhVien
	WHERE
		DTBC >= 3.6 OR DTBC >= 3.2;
END;
GO
/****** Object:  StoredProcedure [dbo].[selectTaiKhoan]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectTaiKhoan]
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50)
AS
BEGIN
	IF @loaitaikhoan = 'admin' 
		SELECT tentaikhoan, matkhau FROM tblTaiKhoan WHERE tentaikhoan = @taikhoan
		ELSE IF @loaitaikhoan = 'gv' 
			SELECT magiaovien, matkhau FROM tblGiaoVien WHERE CAST(magiaovien AS varchar(50)) = @taikhoan
		ELSE SELECT masinhvien, matkhau FROM tblSinhVien WHERE masinhvien = @taikhoan;
END
GO
/****** Object:  StoredProcedure [dbo].[selectXepLoaiSinhVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[selectXepLoaiSinhVien]
AS
BEGIN
    WITH SinhVien AS (
        SELECT
            COALESCE(
                SUM(
                    CASE
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.5 THEN 4 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.5 THEN 3.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 7.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.0 THEN 3 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 6.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 7.0 THEN 2.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 6.5 THEN 2 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.5 THEN 1.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 4.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.0 THEN 1 * mh.sotinchi
						ELSE 0
                    END
                ) / NULLIF(SUM(mh.sotinchi), 0),
                0
            ) AS DTBC
        FROM
            tblDiem d
            INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
            INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
        WHERE
            lh.daketthuc = 1
        GROUP BY
            d.masinhvien
    )
    SELECT
        CASE
            WHEN DTBC >= 3.6 THEN N'Xuất sắc'
            WHEN DTBC >= 3.2 THEN N'Giỏi'
            WHEN DTBC >= 2.5 THEN N'Khá'
            WHEN DTBC >= 2.0 THEN N'Trung bình'
            WHEN DTBC >= 1.0 THEN N'Yếu'
            ELSE 'Kém'
        END AS XepLoai,
        COUNT(*) AS Count
    FROM
        SinhVien
    GROUP BY
        CASE
            WHEN DTBC >= 3.6 THEN N'Xuất sắc'
            WHEN DTBC >= 3.2 THEN N'Giỏi'
            WHEN DTBC >= 2.5 THEN N'Khá'
            WHEN DTBC >= 2.0 THEN N'Trung bình'
            WHEN DTBC >= 1.0 THEN N'Yếu'
            ELSE 'Kém'
        END;
END;
GO
/****** Object:  StoredProcedure [dbo].[traCuuDiem]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[traCuuDiem]
	@masinhvien varchar(50),
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);

	SELECT 
		m.mamonhoc,
		m.tenmonhoc,
		d.lanhoc,
		g.hoten,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE l.daketthuc = 1
	AND d.masinhvien = @masinhvien
	AND (LOWER(m.tenmonhoc) LIKE '%'+@tukhoa+'%' OR LOWER(g.hoten) LIKE '%'+@tukhoa+'%');
END
GO
/****** Object:  StoredProcedure [dbo].[traCuuLop]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[traCuuLop]
	@magiaovien int,
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);
	SELECT 
		tb.malophoc,
		tb.mamonhoc,
		tb.tenmonhoc,
		tb.sotinchi,
		COUNT(d.masinhvien) AS siso
	FROM
	(
		SELECT 
			l.malophoc,
			l.mamonhoc,
			m.tenmonhoc,
			m.sotinchi
		FROM tblLopHoc l
		INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
		WHERE daketthuc = 0
		AND magiaovien = @magiaovien
		AND LOWER(m.tenmonhoc) LIKE '%'+@tukhoa+'%'
	) as tb INNER JOIN tblDiem d ON d.malophoc = tb.malophoc
	GROUP BY tb.malophoc, tb.mamonhoc, tb.tenmonhoc,
		tb.sotinchi;
END
GO
/****** Object:  StoredProcedure [dbo].[updateGiaoVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateGiaoVien]
	@magiaovien int,
	@nguoicapnhat varchar(30),
	@hoten nvarchar(50),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
AS
BEGIN
	UPDATE tblGiaoVien
	SET nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = GETDATE(),
		hoten = @hoten,
		gioitinh = @gioitinh, ngaysinh = @ngaysinh, email = @email, dienthoai = @dienthoai, diachi = @diachi
	WHERE magiaovien = @magiaovien;
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END;
GO
/****** Object:  StoredProcedure [dbo].[updateLopHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--  Tạo proc updateLopHoc
CREATE PROC [dbo].[updateLopHoc]
	@nguoicapnhat varchar(30),
	@malophoc bigint,
	@magiaovien int,
	@mamonhoc int
AS
BEGIN
	UPDATE tblLopHoc
	SET
		ngaycapnhat = GETDATE(),
		nguoicapnhat = @nguoicapnhat,		
		magiaovien = @magiaovien,
		mamonhoc = @mamonhoc
	WHERE malophoc = @malophoc;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END
GO
/****** Object:  StoredProcedure [dbo].[updateMonHoc]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateMonHoc]
	@nguoicapnhat varchar(30),
	@mamonhoc bigint,
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	UPDATE tblMonHoc
	SET
		nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = GETDATE(),
		tenmonhoc = @tenmonhoc,
		sotinchi = @sotinchi
	WHERE mamonhoc = @mamonhoc;
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END
GO
/****** Object:  StoredProcedure [dbo].[updateSinhVien]    Script Date: 17/11/2023 9:48:23 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROC [dbo].[updateSinhVien]
	@masinhvien varchar(50),
	@hoten nvarchar(50),
	@ngaysinh date,
	@gioitinh tinyint,
	@quequan nvarchar(150),
	@diachi nvarchar(150),
	@dienthoai varchar(30),
	@email varchar(150)
AS
BEGIN
	UPDATE tblSinhVien
	SET 
		hoten = @hoten,
		ngaysinh = @ngaysinh,gioitinh = @gioitinh,
		quequan = @quequan, diachi = @diachi,
		dienthoai = @dienthoai, email = @email
	WHERE masinhvien = @masinhvien;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END 
	ELSE BEGIN RETURN 0 END;
END;
GO
USE [master]
GO
ALTER DATABASE [QuanLySinhVien] SET  READ_WRITE 
GO
