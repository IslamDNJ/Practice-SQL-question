USE [master]
GO
/****** Object:  Database [University]    Script Date: 29.10.2024 15:03:58 ******/
CREATE DATABASE [University]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'University', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\University.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'University_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\University_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [University] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [University].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [University] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [University] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [University] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [University] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [University] SET ARITHABORT OFF 
GO
ALTER DATABASE [University] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [University] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [University] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [University] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [University] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [University] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [University] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [University] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [University] SET  DISABLE_BROKER 
GO
ALTER DATABASE [University] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [University] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [University] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [University] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [University] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [University] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [University] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [University] SET RECOVERY FULL 
GO
ALTER DATABASE [University] SET  MULTI_USER 
GO
ALTER DATABASE [University] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [University] SET DB_CHAINING OFF 
GO
ALTER DATABASE [University] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [University] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [University] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [University] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'University', N'ON'
GO
ALTER DATABASE [University] SET QUERY_STORE = ON
GO
ALTER DATABASE [University] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [University]
GO
/****** Object:  Table [dbo].[����������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[����������](
	[���] [int] NOT NULL,
	[�����] [int] NOT NULL,
	[��������] [nvarchar](100) NOT NULL,
	[�����������] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_����������] PRIMARY KEY CLUSTERED 
(
	[���] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[���_��������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[���_��������](
	[���_�����] [int] NOT NULL,
	[����] [int] NOT NULL,
 CONSTRAINT [PK_���_��������] PRIMARY KEY CLUSTERED 
(
	[���_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[������](
	[���] [int] NOT NULL,
	[�����] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������](
	[���_�����] [int] NOT NULL,
	[�������������] [nvarchar](100) NULL,
 CONSTRAINT [PK_�������] PRIMARY KEY CLUSTERED 
(
	[���_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������](
	[����] [nvarchar](2) NOT NULL,
	[��������] [nvarchar](100) NOT NULL,
	[���������] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_�������] PRIMARY KEY CLUSTERED 
(
	[����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������������](
	[���_�����] [int] NOT NULL,
	[������] [nvarchar](100) NULL,
	[�������] [nvarchar](100) NULL,
 CONSTRAINT [PK_�������������] PRIMARY KEY CLUSTERED 
(
	[���_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[���������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[���������](
	[���_�����] [int] NOT NULL,
	[����] [nvarchar](2) NOT NULL,
	[�������] [nvarchar](100) NOT NULL,
	[���������] [nvarchar](100) NOT NULL,
	[��������] [money] NOT NULL,
	[���] [int] NOT NULL,
 CONSTRAINT [PK_���������] PRIMARY KEY CLUSTERED 
(
	[���_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������������](
	[�����] [nvarchar](8) NOT NULL,
	[�����������] [nvarchar](100) NOT NULL,
	[����] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_�������������] PRIMARY KEY CLUSTERED 
(
	[�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������](
	[���_�����] [int] NOT NULL,
	[�����] [nvarchar](8) NULL,
	[�������] [nvarchar](100) NULL,
 CONSTRAINT [PK_�������] PRIMARY KEY CLUSTERED 
(
	[���_�����] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[���������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[���������](
	[������������] [nvarchar](2) NOT NULL,
	[��������] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_���������] PRIMARY KEY CLUSTERED 
(
	[������������] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[�������]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[�������](
	[����] [date] NOT NULL,
	[���] [int] NULL,
	[���_�����] [int] NULL,
	[���_�����] [int] NULL,
	[���������] [nvarchar](4) NULL,
	[������] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (101, 320, N'����������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (102, 160, N'�����������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (103, 160, N'������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (202, 120, N'���� ������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (204, 160, N'�����������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (205, 80, N'����������������', N'��')
GO
INSERT [dbo].[����������] ([���], [�����], [��������], [�����������]) VALUES (209, 80, N'�������������', N'��')
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (101, 15)
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (201, 18)
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (301, 20)
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (401, 10)
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (501, 18)
GO
INSERT [dbo].[���_��������] ([���_�����], [����]) VALUES (601, 8)
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (101, N'01.03.04')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (205, N'01.03.04')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (209, N'01.03.04')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (101, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (102, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (103, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (202, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (205, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (209, N'09.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (101, N'09.03.03')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (102, N'09.03.03')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (103, N'09.03.03')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (202, N'09.03.03')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (205, N'09.03.03')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (101, N'14.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (102, N'14.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (103, N'14.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (204, N'14.03.02')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (101, N'38.03.05')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (103, N'38.03.05')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (202, N'38.03.05')
GO
INSERT [dbo].[������] ([���], [�����]) VALUES (209, N'38.03.05')
GO
INSERT [dbo].[�������] ([���_�����], [�������������]) VALUES (153, N'����������')
GO
INSERT [dbo].[�������] ([���_�����], [�������������]) VALUES (241, N'����������')
GO
INSERT [dbo].[�������] ([���_�����], [�������������]) VALUES (242, N'�����������')
GO
INSERT [dbo].[�������] ([���_�����], [�������������]) VALUES (435, N'����������')
GO
INSERT [dbo].[�������] ([���_�����], [�������������]) VALUES (614, N'�����������')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'������ ����������', N'��')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'�������������� �������', N'��')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'�������������� �������������', N'��')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'����� ������', N'��')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'���������� �����������', N'��')
GO
INSERT [dbo].[�������] ([����], [��������], [���������]) VALUES (N'��', N'����������������� ������', N'��')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (101, N'���������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (102, N'������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (105, N'������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (201, N'���������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (202, N'������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (301, N'���������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (302, N'������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (401, N'���������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (402, N'������', N'�. �.�.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (403, N'���������', N'�')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (501, N'���������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (502, N'���������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (503, N'������', N'�. �.-�. �.')
GO
INSERT [dbo].[�������������] ([���_�����], [������], [�������]) VALUES (601, N'���������', N'�. �.-�. �.')
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (101, N'��', N'�������� �.�.', N'���. ��������', 35000.0000, 101)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (102, N'��', N'������� �.�.', N'�������������', 25000.0000, 101)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (105, N'��', N'������ �.�.', N'�������������', 25000.0000, 101)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (153, N'��', N'�������� �.�.', N'�������', 15000.0000, 102)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (201, N'��', N'������� �.�.', N'���. ��������', 35000.0000, 201)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (202, N'��', N'������� �.�.', N'�������������', 25000.0000, 201)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (241, N'��', N'������ �.�.', N'�������', 20000.0000, 201)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (242, N'��', N'������ �.�.', N'�������', 15000.0000, 202)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (301, N'��', N'����� �.�.', N'���. ��������', 35000.0000, 301)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (302, N'��', N'�������� �.�.', N'�������������', 25000.0000, 301)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (401, N'��', N'������ �.�.', N'���. ��������', 35000.0000, 401)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (402, N'��', N'������ �.�.', N'�������������', 25000.0000, 401)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (403, N'��', N'������� �.�.', N'�������������', 15000.0000, 401)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (435, N'��', N'����� �.�.', N'�������', 20000.0000, 402)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (501, N'��', N'�������� �.�.', N'���. ��������', 35000.0000, 501)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (502, N'��', N'�������� �.�.', N'�������������', 25000.0000, 501)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (503, N'��', N'�������� �.�.', N'�������������', 25000.0000, 501)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (601, N'��', N'������ �.�.', N'���. ��������', 35000.0000, 601)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (602, N'��', N'�������� �.�.', N'�������������', 25000.0000, 601)
GO
INSERT [dbo].[���������] ([���_�����], [����], [�������], [���������], [��������], [���]) VALUES (614, N'��', N'��������� �.�.', N'�������', 20000.0000, 602)
GO
INSERT [dbo].[�������������] ([�����], [�����������], [����]) VALUES (N'01.03.04', N'���������� ����������', N'��')
GO
INSERT [dbo].[�������������] ([�����], [�����������], [����]) VALUES (N'09.03.02', N'�������������� ������� � ����������', N'��')
GO
INSERT [dbo].[�������������] ([�����], [�����������], [����]) VALUES (N'09.03.03', N'���������� �����������', N'��')
GO
INSERT [dbo].[�������������] ([�����], [�����������], [����]) VALUES (N'14.03.02', N'������� ������ � ����������', N'��')
GO
INSERT [dbo].[�������������] ([�����], [�����������], [����]) VALUES (N'38.03.05', N'������-�����������', N'��')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (10101, N'09.03.03', N'��������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (10102, N'09.03.03', N'������ �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (10103, N'09.03.03', N'������ �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (20101, N'09.03.02', N'������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (20102, N'09.03.02', N'������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (30101, N'14.03.02', N'���������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (30102, N'14.03.02', N'������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (30103, N'14.03.02', N'������ �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (50101, N'01.03.04', N'������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (50102, N'01.03.04', N'��������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (80101, N'38.03.05', N'������� �. �.')
GO
INSERT [dbo].[�������] ([���_�����], [�����], [�������]) VALUES (80102, N'38.03.05', N'������� �. �.')
GO
INSERT [dbo].[���������] ([������������], [��������]) VALUES (N'��', N'������������ �����')
GO
INSERT [dbo].[���������] ([������������], [��������]) VALUES (N'��', N'������������ �����')
GO
INSERT [dbo].[���������] ([������������], [��������]) VALUES (N'��', N'�������������� ����������')
GO
INSERT [dbo].[���������] ([������������], [��������]) VALUES (N'��', N'������-��������������')
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'�505', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'�505', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'�506', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'�506', 3)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'�419', 3)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'�506', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'�425', 5)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'�424', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'�333', 3)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'�506', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'�506', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'�349', 5)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'�105', 5)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'�105', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'�324', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'�417', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'�201', 5)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'�201', 3)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'�414', 4)
GO
INSERT [dbo].[�������] ([����], [���], [���_�����], [���_�����], [���������], [������]) VALUES (CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'�505', 5)
GO
ALTER TABLE [dbo].[����������]  WITH CHECK ADD  CONSTRAINT [FK_����������_�������] FOREIGN KEY([�����������])
REFERENCES [dbo].[�������] ([����])
GO
ALTER TABLE [dbo].[����������] CHECK CONSTRAINT [FK_����������_�������]
GO
ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [FK_������_����������1] FOREIGN KEY([���])
REFERENCES [dbo].[����������] ([���])
GO
ALTER TABLE [dbo].[������] CHECK CONSTRAINT [FK_������_����������1]
GO
ALTER TABLE [dbo].[������]  WITH CHECK ADD  CONSTRAINT [FK_������_�������������] FOREIGN KEY([�����])
REFERENCES [dbo].[�������������] ([�����])
GO
ALTER TABLE [dbo].[������] CHECK CONSTRAINT [FK_������_�������������]
GO
ALTER TABLE [dbo].[�������]  WITH CHECK ADD  CONSTRAINT [FK_�������_���������1] FOREIGN KEY([���������])
REFERENCES [dbo].[���������] ([������������])
GO
ALTER TABLE [dbo].[�������] CHECK CONSTRAINT [FK_�������_���������1]
GO
ALTER TABLE [dbo].[���������]  WITH CHECK ADD  CONSTRAINT [FK_���������_�������] FOREIGN KEY([����])
REFERENCES [dbo].[�������] ([����])
GO
ALTER TABLE [dbo].[���������] CHECK CONSTRAINT [FK_���������_�������]
GO
ALTER TABLE [dbo].[�������]  WITH CHECK ADD  CONSTRAINT [FK_�������_�������������] FOREIGN KEY([���_�����])
REFERENCES [dbo].[�������������] ([���_�����])
GO
ALTER TABLE [dbo].[�������] CHECK CONSTRAINT [FK_�������_�������������]
GO
ALTER TABLE [dbo].[�������]  WITH CHECK ADD  CONSTRAINT [FK_�������_���������] FOREIGN KEY([���_�����])
REFERENCES [dbo].[���������] ([���_�����])
GO
ALTER TABLE [dbo].[�������] CHECK CONSTRAINT [FK_�������_���������]
GO
ALTER TABLE [dbo].[�������]  WITH CHECK ADD  CONSTRAINT [FK_�������_�������] FOREIGN KEY([���_�����])
REFERENCES [dbo].[�������] ([���_�����])
GO
ALTER TABLE [dbo].[�������] CHECK CONSTRAINT [FK_�������_�������]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO









/* ������� 1 */
SELECT 
    ����.������� AS �������,
    ����.����� AS �������������,
    ����.����������� AS �����������,
    ���.�������� AS �������,
    ���.������������ AS ���������
FROM 
    [dbo].[�������] ����
JOIN 
    [dbo].[�������������] ���� ON ����.����� = ����.�����
JOIN 
    [dbo].[�������] ��� ON ����.���� = ���.����
JOIN 
    [dbo].[���������] ��� ON ���.��������� = ���.������������
WHERE 
    ���.������������ = '��';

/* ������� 2 */
SELECT 
    �.������������ AS ���������,    
    �.���� AS ����_�������,         
    �.�������� AS ��������_�������,   
    �.������� AS ����������           
FROM 
    [dbo].[�������] �                 
JOIN 
    [dbo].[�������������] �� ON �.���� = ��.����    
JOIN 
    [dbo].[���������] � ON �.��������� = �.������������
JOIN 
    [dbo].[���������] � ON �.���� = �.����
WHERE 
    �.��������� = '���. ��������'
GROUP BY 
    �.������������, �.����, �.��������, �.�������

/* ������� 3 */
SELECT 
    �1.���_����� AS �����_����������,
    �1.������� AS �������_����������,
    V2.���_����� AS �����_������������,
    V2.������� AS �������_������������
FROM 
    [dbo].[���������] �1
LEFT JOIN 
    [dbo].[���������] V2 ON �1.��� = V2.���_�����
WHERE 
    �1.��������� <> '���. ��������';

/* ������� 4 */
SELECT 
    ����.���_����� AS ���������������_�����,
    ����.������� AS �������_��������
FROM 
    [dbo].[�������] ����
JOIN 
    [dbo].[�������] ON ����.���_����� = �������.���_�����
GROUP BY 
    ����.���_�����, ����.�������
HAVING 
    COUNT(�������.���) >= 2;

/* ������� 5 */
SELECT 
    ���.���_����� AS �����_��������,
    ����.������� AS �������,
    ����.��������� AS ���������,
    ����.�������� AS ��������
FROM 
    [dbo].[�������] ���    
JOIN 
    [dbo].[���������] ���� ON ���.���_����� = ����.���_�����
WHERE 
    ����.�������� < 20000;


/* ������� 6*/
DECLARE @��������� NVARCHAR(4) = '�505';  -- �������� ����������

SELECT 
    ����.���_����� AS ���������������_�����,
    ����.������� AS �������_��������,
    ���.��������� AS ���������,
    ���.���� AS ����_��������
FROM 
    [dbo].[�������] ����
JOIN 
    [dbo].[�������] ��� ON ����.���_����� = ���.���_�����  
WHERE 
    ���.��������� = @���������;               -- ������ ������


/* ������� 7 */
DECLARE @���_�������_���� FLOAT = 4;

SELECT 
    ����.���_����� AS ���������������_�����,
    ����.������� AS �������_��������,
    COUNT(���.���) AS ����������_���������,
    AVG(���.������) AS �������_����
FROM 
    [dbo].[�������] ����
JOIN 
    [dbo].[�������] ��� ON ����.���_����� = ���.���_�����
GROUP BY 
    ����.���_�����, ����.�������
HAVING 
    AVG(���.������) >= @���_�������_����;

/* ������� 8 */
SELECT 
    ����.������� AS �������_�����������,
    ����.�������� AS ��������,
    ������.������� AS �������,
    �����.�������� AS ��������_�������
FROM 
    [dbo].[���������] ����
JOIN 
    [dbo].[�������] ����� ON ����.���� = �����.����
JOIN 
    [dbo].[�������������] ������ ON ����.���_����� = ������.���_�����
WHERE 
    ����.��������� = '���. ��������';

/* ������� 9 */
SELECT 
    ����.������� AS �������_����������,
    ����.�������� AS ��������,
    ������.������� AS �������,
    ������.������ AS ������
FROM 
    [dbo].[���������] ����
JOIN 
    [dbo].[�������������] ������ ON ����.���_����� = ������.���_�����
WHERE 
    ������.������ = '���������';

/* ������� 10 */
DECLARE @StartDate DATE = '2015-06-05';
DECLARE @EndDate DATE = '2015-06-07';

SELECT
    ������.�������� AS ��������_����������,
    ����.������� AS �������_�������������,
    ����.��������� AS ���������_�������������,
    ������.������� AS �������_�������������,
    ���.���� AS ����_��������,
    ���.��������� AS ���������
FROM 
    [dbo].[�������] ���
JOIN 
    [dbo].[����������] ������ ON ���.��� = ������.���
JOIN 
    [dbo].[���������] ���� ON ���.���_����� = ����.���_�����
JOIN 
    [dbo].[�������������] ������ ON ����.���_����� = ������.���_�����
WHERE 
    ���.���� BETWEEN @StartDate AND @EndDate
ORDER BY 
    ���.����;

/* ������� 11 */
SELECT 
    ����.������� AS �������_�������������
FROM 
    [dbo].[�������] ���
JOIN 
    [dbo].[���������] ���� ON ���.���_����� = ����.���_�����
GROUP BY 
    ����.�������
HAVING 
    COUNT(���.����) > 3;

/* ������� 12 */
DECLARE @������������� DATE = '2015-06-05';

SELECT
    ����.���_����� AS �������_�����_��������,
    ����.������� AS �������
FROM
    [dbo].[�������] ����
LEFT JOIN
    [dbo].[�������] ��� ON ����.���_����� = ���.���_�����
    AND ���.���� = @�������������
    AND (���.������ IS NULL OR ���.������ < 2)
WHERE
    ���.���_����� IS NULL;
