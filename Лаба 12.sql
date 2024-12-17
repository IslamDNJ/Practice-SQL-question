USE [master]
GO
/****** Object:  Database [Country - Lab7]    Script Date: 03.12.2024 9:15:55 ******/
CREATE DATABASE [Country - Lab12]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Country - Lab12', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Country - Lab12.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Country - Lab12_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Country - Lab12_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Country - Lab12] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Country - Lab12].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Country - Lab12] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Country - Lab12] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Country - Lab12] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Country - Lab12] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Country - Lab12] SET ARITHABORT OFF 
GO
ALTER DATABASE [Country - Lab12] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Country - Lab12] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Country - Lab12] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Country - Lab12] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Country - Lab12] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Country - Lab12] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Country - Lab12] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Country - Lab12] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Country - Lab12] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Country - Lab12] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Country - Lab12] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Country - Lab12] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Country - Lab12] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Country - Lab12] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Country - Lab12] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Country - Lab12] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Country - Lab12] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Country - Lab12] SET RECOVERY FULL 
GO
ALTER DATABASE [Country - Lab12] SET  MULTI_USER 
GO
ALTER DATABASE [Country - Lab12] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Country - Lab12] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Country - Lab12] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Country - Lab12] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Country - Lab12] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Country - Lab12] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Country - Lab12', N'ON'
GO
ALTER DATABASE [Country - Lab12] SET QUERY_STORE = ON
GO
ALTER DATABASE [Country - Lab12] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Country - Lab12]
GO
/****** Object:  Table [dbo].[County]    Script Date: 03.12.2024 9:15:56 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[County](
	[ID] [int] NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Metropolis] [nvarchar](50) NULL,
	[Area] [int] NULL,
	[Population] [int] NULL,
	[Continent] [nvarchar](50) NULL,
 CONSTRAINT [PK_County] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (1, N'�������', N'����', 83858, 8741753, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (2, N'�����������', N'����', 86600, 9705600, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (3, N'�������', N'������', 28748, 2866026, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (4, N'�����', N'�����', 2381740, 39813722, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (5, N'������', N'������', 1246700, 25831000, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (6, N'���������', N'������-�����', 2766890, 43847000, N'����� �������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (7, N'����������', N'�����', 647500, 29822848, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (8, N'���������', N'�����', 144000, 160221000, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (9, N'�������', N'������', 701, 1397000, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (10, N'�����', N'���������', 22966, 377968, N'�������� �������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (11, N'����������', N'�����', 207595, 9498400, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (12, N'�������', N'��������', 30528, 11250585, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (13, N'�����', N'�����-����', 112620, 11167000, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (14, N'��������', N'�����', 110910, 7153784, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (15, N'�������', N'�����', 1098580, 10985059, N'����� �������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (16, N'��������', N'��������', 600370, 2209208, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (17, N'��������', N'��������', 8511965, 206081432, N'����� �������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (18, N'�������-����', N'��������', 274200, 19034397, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (19, N'�����', N'�������', 47000, 784000, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (20, N'��������������', N'������', 244820, 65341183, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (21, N'�������', N'��������', 93030, 9830485, N'������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (22, N'���������', N'�������', 912050, 31028637, N'����� �������')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (23, N'��������� �����', N'����', 14874, 1167242, N'����')
GO
INSERT [dbo].[County] ([ID], [Name], [Metropolis], [Area], [Population], [Continent]) VALUES (24, N'�������', N'�����', 329560, 91713300, N'����')
GO
USE [master]
GO
ALTER DATABASE [Country - Lab12] SET  READ_WRITE 
GO

/* ������� 1 */
-- �������
CREATE FUNCTION GetCountryByCapital 
(
    @Capital NVARCHAR(50) -- �������� �������
)
RETURNS NVARCHAR(50) -- ������������ �������� ������
AS
BEGIN
    -- ���������� ��� ����������
    DECLARE @CountryName NVARCHAR(50)
    
    -- ��������� �������� ������
    SELECT @CountryName = [Name]
    FROM [dbo].[County]
    WHERE [Metropolis] = @Capital

    -- ����������� ����������
    RETURN @CountryName
END
GO

-- ����� �������
DECLARE @Capital NVARCHAR(50) = N'������'
SELECT dbo.GetCountryByCapital(@Capital) AS CountryName

/* ������� 2 */
-- �������� �������
CREATE FUNCTION ConvertPopulationToMillions
(
    @Population INT -- �������: ���������
)
RETURNS FLOAT -- ������������: ���������
AS
BEGIN
    -- ���������� � ���
    RETURN CAST(@Population AS FLOAT) / 1000000.0
END

-- ����� ������� ��� ������ ��������
DECLARE @Population INT = 8741753 -- ��������� �������
SELECT dbo.ConvertPopulationToMillions(@Population) AS PopulationInMillions

-- ����� ������� ��� ���� �����
SELECT 
    [Name] AS CountryName, 
    [Population] AS Population, 
    dbo.ConvertPopulationToMillions([Population]) AS PopulationInMillions
FROM [dbo].[County]

/* ������� 3 */
-- �������� �������
CREATE FUNCTION GetPopulationDensityByContinent
(
    @Continent NVARCHAR(50) -- �������: ����� �����
)
RETURNS FLOAT -- ������������: ��������� ���������
AS
BEGIN
    DECLARE @TotalPopulation INT
    DECLARE @TotalArea INT
    
    -- ���������� ���������� ��������� � ������� ��� �������� ����� �����
    SELECT 
        @TotalPopulation = SUM([Population]),
        @TotalArea = SUM([Area])
    FROM [dbo].[County]
    WHERE [Continent] = @Continent

    -- ��������, ����� ������� �� ���� ����� ����
    IF @TotalArea = 0
        RETURN 0 -- ��� �������������� ������� �� 0
    
    -- ����������: ��������� ���������
    RETURN CAST(@TotalPopulation AS FLOAT) / @TotalArea
END

-- ����� ������� ��� ������
DECLARE @Continent NVARCHAR(50) = N'������'
SELECT dbo.GetPopulationDensityByContinent(@Continent) AS PopulationDensity

-- ������ ������� ��� ���� ������ �����
SELECT 
    DISTINCT [Continent], 
    dbo.GetPopulationDensityByContinent([Continent]) AS PopulationDensity
FROM [dbo].[County]
