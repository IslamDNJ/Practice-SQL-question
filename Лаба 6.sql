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
/****** Object:  Table [dbo].[ДИСЦИПЛИНА]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ДИСЦИПЛИНА](
	[Код] [int] NOT NULL,
	[Объем] [int] NOT NULL,
	[Название] [nvarchar](100) NOT NULL,
	[Исполнитель] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_ДИСЦИПЛИНА] PRIMARY KEY CLUSTERED 
(
	[Код] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАВ_КАФЕДРОЙ]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАВ_КАФЕДРОЙ](
	[Таб_номер] [int] NOT NULL,
	[Стаж] [int] NOT NULL,
 CONSTRAINT [PK_ЗАВ_КАФЕДРОЙ] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЗАЯВКА]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЗАЯВКА](
	[Код] [int] NOT NULL,
	[Номер] [nvarchar](8) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ИНЖЕНЕР]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ИНЖЕНЕР](
	[Таб_номер] [int] NOT NULL,
	[Специальность] [nvarchar](100) NULL,
 CONSTRAINT [PK_ИНЖЕНЕР] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[КАФЕДРА]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[КАФЕДРА](
	[Шифр] [nvarchar](2) NOT NULL,
	[Название] [nvarchar](100) NOT NULL,
	[Факультет] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_КАФЕДРА] PRIMARY KEY CLUSTERED 
(
	[Шифр] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ПРЕПОДОВАТЕЛЬ]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ПРЕПОДОВАТЕЛЬ](
	[Таб_номер] [int] NOT NULL,
	[Звание] [nvarchar](100) NULL,
	[Степень] [nvarchar](100) NULL,
 CONSTRAINT [PK_ПРЕПОДОВАТЕЛЬ] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СОТРУДНИК]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СОТРУДНИК](
	[Таб_номер] [int] NOT NULL,
	[Шифр] [nvarchar](2) NOT NULL,
	[Фамилия] [nvarchar](100) NOT NULL,
	[Должность] [nvarchar](100) NOT NULL,
	[Зарплата] [money] NOT NULL,
	[Шеф] [int] NOT NULL,
 CONSTRAINT [PK_СОТРУДНИК] PRIMARY KEY CLUSTERED 
(
	[Таб_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СПЕЦИАЛЬНОСТЬ]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СПЕЦИАЛЬНОСТЬ](
	[Номер] [nvarchar](8) NOT NULL,
	[Направление] [nvarchar](100) NOT NULL,
	[Шифр] [nvarchar](2) NOT NULL,
 CONSTRAINT [PK_СПЕЦИАЛЬНОСТЬ] PRIMARY KEY CLUSTERED 
(
	[Номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[СТУДЕНТ]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[СТУДЕНТ](
	[Рег_номер] [int] NOT NULL,
	[Номер] [nvarchar](8) NULL,
	[Фамилия] [nvarchar](100) NULL,
 CONSTRAINT [PK_СТУДЕНТ] PRIMARY KEY CLUSTERED 
(
	[Рег_номер] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ФАКУЛЬТЕТ]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ФАКУЛЬТЕТ](
	[Аббривиатура] [nvarchar](2) NOT NULL,
	[Название] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_ФАКУЛЬТЕТ] PRIMARY KEY CLUSTERED 
(
	[Аббривиатура] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ЭКЗАМЕН]    Script Date: 29.10.2024 15:03:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ЭКЗАМЕН](
	[Дата] [date] NOT NULL,
	[Код] [int] NULL,
	[Рег_номер] [int] NULL,
	[Таб_номер] [int] NULL,
	[Аудитория] [nvarchar](4) NULL,
	[Оценка] [int] NULL
) ON [PRIMARY]
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (101, 320, N'Математика', N'вм')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (102, 160, N'Информатика', N'пи')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (103, 160, N'Физика', N'оф')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (202, 120, N'Базы данных', N'ис')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (204, 160, N'Электроника', N'эф')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (205, 80, N'Программирование', N'пи')
GO
INSERT [dbo].[ДИСЦИПЛИНА] ([Код], [Объем], [Название], [Исполнитель]) VALUES (209, 80, N'Моделирование', N'мм')
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (101, 15)
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (201, 18)
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (301, 20)
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (401, 10)
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (501, 18)
GO
INSERT [dbo].[ЗАВ_КАФЕДРОЙ] ([Таб_номер], [Стаж]) VALUES (601, 8)
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (101, N'01.03.04')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (205, N'01.03.04')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (209, N'01.03.04')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (101, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (102, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (103, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (202, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (205, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (209, N'09.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (101, N'09.03.03')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (102, N'09.03.03')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (103, N'09.03.03')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (202, N'09.03.03')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (205, N'09.03.03')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (101, N'14.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (102, N'14.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (103, N'14.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (204, N'14.03.02')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (101, N'38.03.05')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (103, N'38.03.05')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (202, N'38.03.05')
GO
INSERT [dbo].[ЗАЯВКА] ([Код], [Номер]) VALUES (209, N'38.03.05')
GO
INSERT [dbo].[ИНЖЕНЕР] ([Таб_номер], [Специальность]) VALUES (153, N'электроник')
GO
INSERT [dbo].[ИНЖЕНЕР] ([Таб_номер], [Специальность]) VALUES (241, N'электроник')
GO
INSERT [dbo].[ИНЖЕНЕР] ([Таб_номер], [Специальность]) VALUES (242, N'программист')
GO
INSERT [dbo].[ИНЖЕНЕР] ([Таб_номер], [Специальность]) VALUES (435, N'электроник')
GO
INSERT [dbo].[ИНЖЕНЕР] ([Таб_номер], [Специальность]) VALUES (614, N'программист')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'вм', N'Высшая математика', N'ен')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'ис', N'Информационные системы', N'ит')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'мм', N'Математическое моделирование', N'фм')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'оф', N'Общая физика', N'ен')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'пи', N'Прикладная информатика', N'ит')
GO
INSERT [dbo].[КАФЕДРА] ([Шифр], [Название], [Факультет]) VALUES (N'эф', N'Экспериментальная физика', N'фм')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (101, N'профессор', N'д. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (102, N'доцент', N'к. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (105, N'доцент', N'к. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (201, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (202, N'доцент', N'к. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (301, N'профессор', N'д. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (302, N'доцент', N'к. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (401, N'профессор', N'д. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (402, N'доцент', N'к. т.н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (403, N'ассистент', N'–')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (501, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (502, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (503, N'доцент', N'к. ф.-м. н.')
GO
INSERT [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер], [Звание], [Степень]) VALUES (601, N'профессор', N'д. ф.-м. н.')
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (101, N'пи', N'Прохоров П.П.', N'зав. кафедрой', 35000.0000, 101)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (102, N'пи', N'Семенов С.С.', N'преподаватель', 25000.0000, 101)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (105, N'пи', N'Петров П.П.', N'преподаватель', 25000.0000, 101)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (153, N'пи', N'Сидорова С.С.', N'инженер', 15000.0000, 102)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (201, N'ис', N'Андреев А.А.', N'зав. кафедрой', 35000.0000, 201)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (202, N'ис', N'Борисов Б.Б.', N'преподаватель', 25000.0000, 201)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (241, N'ис', N'Глухов Г.Г.', N'инженер', 20000.0000, 201)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (242, N'ис', N'Чернов Ч.Ч.', N'инженер', 15000.0000, 202)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (301, N'мм', N'Басов Б.Б.', N'зав. кафедрой', 35000.0000, 301)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (302, N'мм', N'Сергеева С.С.', N'преподаватель', 25000.0000, 301)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (401, N'оф', N'Волков В.В.', N'зав. кафедрой', 35000.0000, 401)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (402, N'оф', N'Зайцев З.З.', N'преподаватель', 25000.0000, 401)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (403, N'оф', N'Смирнов С.С.', N'преподаватель', 15000.0000, 401)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (435, N'оф', N'Лисин Л.Л.', N'инженер', 20000.0000, 402)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (501, N'вм', N'Кузнецов К.К.', N'зав. кафедрой', 35000.0000, 501)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (502, N'вм', N'Романцев Р.Р.', N'преподаватель', 25000.0000, 501)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (503, N'вм', N'Соловьев С.С.', N'преподаватель', 25000.0000, 501)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (601, N'эф', N'Зверев З.З.', N'зав. кафедрой', 35000.0000, 601)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (602, N'эф', N'Сорокина С.С.', N'преподаватель', 25000.0000, 601)
GO
INSERT [dbo].[СОТРУДНИК] ([Таб_номер], [Шифр], [Фамилия], [Должность], [Зарплата], [Шеф]) VALUES (614, N'эф', N'Григорьев Г.Г.', N'инженер', 20000.0000, 602)
GO
INSERT [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер], [Направление], [Шифр]) VALUES (N'01.03.04', N'Прикладная математика', N'мм')
GO
INSERT [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.02', N'Информационные системы и технологии', N'ис')
GO
INSERT [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер], [Направление], [Шифр]) VALUES (N'09.03.03', N'Прикладная информатика', N'пи')
GO
INSERT [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер], [Направление], [Шифр]) VALUES (N'14.03.02', N'Ядерные физика и технологии', N'эф')
GO
INSERT [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер], [Направление], [Шифр]) VALUES (N'38.03.05', N'Бизнес-информатика', N'ис')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (10101, N'09.03.03', N'Николаева Н. Н.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (10102, N'09.03.03', N'Иванов И. И.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (10103, N'09.03.03', N'Крюков К. К.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (20101, N'09.03.02', N'Андреев А. А.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (20102, N'09.03.02', N'Федоров Ф. Ф.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (30101, N'14.03.02', N'Бондаренко Б. Б.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (30102, N'14.03.02', N'Цветков К. К.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (30103, N'14.03.02', N'Петров П. П.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (50101, N'01.03.04', N'Сергеев С. С.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (50102, N'01.03.04', N'Кудрявцев К. К.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (80101, N'38.03.05', N'Макаров М. М.')
GO
INSERT [dbo].[СТУДЕНТ] ([Рег_номер], [Номер], [Фамилия]) VALUES (80102, N'38.03.05', N'Яковлев Я. Я.')
GO
INSERT [dbo].[ФАКУЛЬТЕТ] ([Аббривиатура], [Название]) VALUES (N'гм', N'Гуманитарные науки')
GO
INSERT [dbo].[ФАКУЛЬТЕТ] ([Аббривиатура], [Название]) VALUES (N'ен', N'Естественные науки')
GO
INSERT [dbo].[ФАКУЛЬТЕТ] ([Аббривиатура], [Название]) VALUES (N'ит', N'Информационные технологии')
GO
INSERT [dbo].[ФАКУЛЬТЕТ] ([Аббривиатура], [Название]) VALUES (N'фм', N'Физико-математический')
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10101, 102, N'т505', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-05' AS Date), 102, 10102, 102, N'т505', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20101, 202, N'т506', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-05' AS Date), 202, 20102, 202, N'т506', 3)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30101, 105, N'ф419', 3)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-07' AS Date), 102, 30102, 101, N'т506', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-07' AS Date), 102, 80101, 102, N'м425', 5)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-09' AS Date), 205, 80102, 402, N'м424', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-09' AS Date), 209, 20101, 302, N'ф333', 3)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10101, 501, N'т506', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-10' AS Date), 101, 10102, 501, N'т506', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-10' AS Date), 204, 30102, 601, N'ф349', 5)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80101, 301, N'э105', 5)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-10' AS Date), 209, 80102, 301, N'э105', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-12' AS Date), 101, 80101, 502, N'с324', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-15' AS Date), 101, 30101, 503, N'ф417', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50101, 501, N'ф201', 5)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-15' AS Date), 101, 50102, 501, N'ф201', 3)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-15' AS Date), 103, 10101, 403, N'ф414', 4)
GO
INSERT [dbo].[ЭКЗАМЕН] ([Дата], [Код], [Рег_номер], [Таб_номер], [Аудитория], [Оценка]) VALUES (CAST(N'2015-06-17' AS Date), 102, 10101, 102, N'т505', 5)
GO
ALTER TABLE [dbo].[ДИСЦИПЛИНА]  WITH CHECK ADD  CONSTRAINT [FK_ДИСЦИПЛИНА_КАФЕДРА] FOREIGN KEY([Исполнитель])
REFERENCES [dbo].[КАФЕДРА] ([Шифр])
GO
ALTER TABLE [dbo].[ДИСЦИПЛИНА] CHECK CONSTRAINT [FK_ДИСЦИПЛИНА_КАФЕДРА]
GO
ALTER TABLE [dbo].[ЗАЯВКА]  WITH CHECK ADD  CONSTRAINT [FK_ЗАЯВКА_ДИСЦИПЛИНА1] FOREIGN KEY([Код])
REFERENCES [dbo].[ДИСЦИПЛИНА] ([Код])
GO
ALTER TABLE [dbo].[ЗАЯВКА] CHECK CONSTRAINT [FK_ЗАЯВКА_ДИСЦИПЛИНА1]
GO
ALTER TABLE [dbo].[ЗАЯВКА]  WITH CHECK ADD  CONSTRAINT [FK_ЗАЯВКА_СПЕЦИАЛЬНОСТЬ] FOREIGN KEY([Номер])
REFERENCES [dbo].[СПЕЦИАЛЬНОСТЬ] ([Номер])
GO
ALTER TABLE [dbo].[ЗАЯВКА] CHECK CONSTRAINT [FK_ЗАЯВКА_СПЕЦИАЛЬНОСТЬ]
GO
ALTER TABLE [dbo].[КАФЕДРА]  WITH CHECK ADD  CONSTRAINT [FK_КАФЕДРА_ФАКУЛЬТЕТ1] FOREIGN KEY([Факультет])
REFERENCES [dbo].[ФАКУЛЬТЕТ] ([Аббривиатура])
GO
ALTER TABLE [dbo].[КАФЕДРА] CHECK CONSTRAINT [FK_КАФЕДРА_ФАКУЛЬТЕТ1]
GO
ALTER TABLE [dbo].[СОТРУДНИК]  WITH CHECK ADD  CONSTRAINT [FK_СОТРУДНИК_КАФЕДРА] FOREIGN KEY([Шифр])
REFERENCES [dbo].[КАФЕДРА] ([Шифр])
GO
ALTER TABLE [dbo].[СОТРУДНИК] CHECK CONSTRAINT [FK_СОТРУДНИК_КАФЕДРА]
GO
ALTER TABLE [dbo].[ЭКЗАМЕН]  WITH CHECK ADD  CONSTRAINT [FK_ЭКЗАМЕН_ПРЕПОДОВАТЕЛЬ] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[ПРЕПОДОВАТЕЛЬ] ([Таб_номер])
GO
ALTER TABLE [dbo].[ЭКЗАМЕН] CHECK CONSTRAINT [FK_ЭКЗАМЕН_ПРЕПОДОВАТЕЛЬ]
GO
ALTER TABLE [dbo].[ЭКЗАМЕН]  WITH CHECK ADD  CONSTRAINT [FK_ЭКЗАМЕН_СОТРУДНИК] FOREIGN KEY([Таб_номер])
REFERENCES [dbo].[СОТРУДНИК] ([Таб_номер])
GO
ALTER TABLE [dbo].[ЭКЗАМЕН] CHECK CONSTRAINT [FK_ЭКЗАМЕН_СОТРУДНИК]
GO
ALTER TABLE [dbo].[ЭКЗАМЕН]  WITH CHECK ADD  CONSTRAINT [FK_ЭКЗАМЕН_СТУДЕНТ] FOREIGN KEY([Рег_номер])
REFERENCES [dbo].[СТУДЕНТ] ([Рег_номер])
GO
ALTER TABLE [dbo].[ЭКЗАМЕН] CHECK CONSTRAINT [FK_ЭКЗАМЕН_СТУДЕНТ]
GO
USE [master]
GO
ALTER DATABASE [University] SET  READ_WRITE 
GO









/* Задание 1 */
SELECT 
    Студ.Фамилия AS Студент,
    Спец.Номер AS Специальность,
    Спец.Направление AS Направление,
    Каф.Название AS Кафедра,
    Фак.Аббривиатура AS Факультет
FROM 
    [dbo].[СТУДЕНТ] Студ
JOIN 
    [dbo].[СПЕЦИАЛЬНОСТЬ] Спец ON Студ.Номер = Спец.Номер
JOIN 
    [dbo].[КАФЕДРА] Каф ON Спец.Шифр = Каф.Шифр
JOIN 
    [dbo].[ФАКУЛЬТЕТ] Фак ON Каф.Факультет = Фак.Аббривиатура
WHERE 
    Фак.Аббривиатура = 'ит';

/* Задание 2 */
SELECT 
    Ф.Аббривиатура AS Факультет,    
    К.Шифр AS Шифр_Кафедры,         
    К.Название AS Название_Кафедры,   
    С.Фамилия AS Заведующий           
FROM 
    [dbo].[КАФЕДРА] К                 
JOIN 
    [dbo].[СПЕЦИАЛЬНОСТЬ] СП ON К.Шифр = СП.Шифр    
JOIN 
    [dbo].[ФАКУЛЬТЕТ] Ф ON К.Факультет = Ф.Аббривиатура
JOIN 
    [dbo].[СОТРУДНИК] С ON К.Шифр = С.Шифр
WHERE 
    С.Должность = 'Зав. кафедрой'
GROUP BY 
    Ф.Аббривиатура, К.Шифр, К.Название, С.Фамилия

/* Задание 3 */
SELECT 
    С1.Таб_номер AS Номер_Сотрудника,
    С1.Фамилия AS Фамилия_Сотрудника,
    V2.Таб_номер AS Номер_Руководителя,
    V2.Фамилия AS Фамилия_Руководителя
FROM 
    [dbo].[СОТРУДНИК] С1
LEFT JOIN 
    [dbo].[СОТРУДНИК] V2 ON С1.Шеф = V2.Таб_номер
WHERE 
    С1.Должность <> 'Зав. кафедрой';

/* Задание 4 */
SELECT 
    Студ.Рег_номер AS Регистрационный_номер,
    Студ.Фамилия AS Фамилия_Студента
FROM 
    [dbo].[СТУДЕНТ] Студ
JOIN 
    [dbo].[ЭКЗАМЕН] ON Студ.Рег_номер = ЭКЗАМЕН.Рег_номер
GROUP BY 
    Студ.Рег_номер, Студ.Фамилия
HAVING 
    COUNT(ЭКЗАМЕН.Код) >= 2;

/* Задание 5 */
SELECT 
    Инж.Таб_номер AS Номер_Инженера,
    Сотр.Фамилия AS Фамилия,
    Сотр.Должность AS Должность,
    Сотр.Зарплата AS Зарплата
FROM 
    [dbo].[ИНЖЕНЕР] Инж    
JOIN 
    [dbo].[СОТРУДНИК] Сотр ON Инж.Таб_номер = Сотр.Таб_номер
WHERE 
    Сотр.Зарплата < 20000;


/* Задание 6*/
DECLARE @Аудитория NVARCHAR(4) = 'т505';  -- Задается аудтитория

SELECT 
    Студ.Рег_номер AS Регистрационный_номер,
    Студ.Фамилия AS Фамилия_Студента,
    Экз.Аудитория AS Аудитория,
    Экз.Дата AS Дата_Экзамена
FROM 
    [dbo].[СТУДЕНТ] Студ
JOIN 
    [dbo].[ЭКЗАМЕН] Экз ON Студ.Рег_номер = Экз.Рег_номер  
WHERE 
    Экз.Аудитория = @Аудитория;               -- Фильтр вывода


/* Задание 7 */
DECLARE @Мин_Средний_Балл FLOAT = 4;

SELECT 
    Студ.Рег_номер AS Регистрационный_номер,
    Студ.Фамилия AS Фамилия_Студента,
    COUNT(Экз.Код) AS Количество_Экзаменов,
    AVG(Экз.Оценка) AS Средний_Балл
FROM 
    [dbo].[СТУДЕНТ] Студ
JOIN 
    [dbo].[ЭКЗАМЕН] Экз ON Студ.Рег_номер = Экз.Рег_номер
GROUP BY 
    Студ.Рег_номер, Студ.Фамилия
HAVING 
    AVG(Экз.Оценка) >= @Мин_Средний_Балл;

/* Задание 8 */
SELECT 
    Сотр.Фамилия AS Фамилия_Заведующего,
    Сотр.Зарплата AS Зарплата,
    Препод.Степень AS Степень,
    Кафер.Название AS Название_Кафедры
FROM 
    [dbo].[СОТРУДНИК] Сотр
JOIN 
    [dbo].[КАФЕДРА] Кафер ON Сотр.Шифр = Кафер.Шифр
JOIN 
    [dbo].[ПРЕПОДОВАТЕЛЬ] Препод ON Сотр.Таб_номер = Препод.Таб_номер
WHERE 
    Сотр.Должность = 'зав. кафедрой';

/* Задание 9 */
SELECT 
    Сотр.Фамилия AS Фамилия_Профессора,
    Сотр.Зарплата AS Зарплата,
    Препод.Степень AS Степень,
    Препод.Звание AS Звание
FROM 
    [dbo].[СОТРУДНИК] Сотр
JOIN 
    [dbo].[ПРЕПОДОВАТЕЛЬ] Препод ON Сотр.Таб_номер = Препод.Таб_номер
WHERE 
    Препод.Звание = 'профессор';

/* Задание 10 */
DECLARE @StartDate DATE = '2015-06-05';
DECLARE @EndDate DATE = '2015-06-07';

SELECT
    Дисцип.Название AS Название_Дисциплины,
    Сотр.Фамилия AS Фамилия_Преподавателя,
    Сотр.Должность AS Должность_Преподавателя,
    Препод.Степень AS Степень_Преподавателя,
    Экз.Дата AS Дата_Экзамена,
    Экз.Аудитория AS Аудитория
FROM 
    [dbo].[ЭКЗАМЕН] Экз
JOIN 
    [dbo].[ДИСЦИПЛИНА] Дисцип ON Экз.Код = Дисцип.Код
JOIN 
    [dbo].[СОТРУДНИК] Сотр ON Экз.Таб_номер = Сотр.Таб_номер
JOIN 
    [dbo].[ПРЕПОДОВАТЕЛЬ] Препод ON Сотр.Таб_номер = Препод.Таб_номер
WHERE 
    Экз.Дата BETWEEN @StartDate AND @EndDate
ORDER BY 
    Экз.Дата;

/* Задание 11 */
SELECT 
    Сотр.Фамилия AS Фамилия_Преподавателя
FROM 
    [dbo].[ЭКЗАМЕН] Экз
JOIN 
    [dbo].[СОТРУДНИК] Сотр ON Экз.Таб_номер = Сотр.Таб_номер
GROUP BY 
    Сотр.Фамилия
HAVING 
    COUNT(Экз.Дата) > 3;

/* Задание 12 */
DECLARE @УказаннаяДата DATE = '2015-06-05';

SELECT
    Студ.Рег_номер AS Учетный_номер_студента,
    Студ.Фамилия AS Фамилия
FROM
    [dbo].[СТУДЕНТ] Студ
LEFT JOIN
    [dbo].[ЭКЗАМЕН] Экз ON Студ.Рег_номер = Экз.Рег_номер
    AND Экз.Дата = @УказаннаяДата
    AND (Экз.Оценка IS NULL OR Экз.Оценка < 2)
WHERE
    Экз.Рег_номер IS NULL;
