USE [master]
GO
/****** Object:  Database [Trade]    Script Date: 05.04.2023 15:29:41 ******/
CREATE DATABASE [Trade]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Trade', FILENAME = N'E:\SQL Server 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Trade_log', FILENAME = N'E:\SQL Server 2022\MSSQL16.SQLEXPRESS\MSSQL\DATA\Trade_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Trade] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Trade].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Trade] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Trade] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Trade] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Trade] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Trade] SET ARITHABORT OFF 
GO
ALTER DATABASE [Trade] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [Trade] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Trade] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Trade] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Trade] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Trade] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Trade] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Trade] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Trade] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Trade] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Trade] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Trade] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Trade] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Trade] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Trade] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Trade] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Trade] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Trade] SET  MULTI_USER 
GO
ALTER DATABASE [Trade] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Trade] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Trade] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Trade] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Trade] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Trade] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Trade] SET QUERY_STORE = ON
GO
ALTER DATABASE [Trade] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Trade]
GO
/****** Object:  Table [dbo].[Order]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Order](
	[OrderID] [int] IDENTITY(1,1) NOT NULL,
	[OrderStatusID] [int] NOT NULL,
	[OrderDeliveryDate] [datetime] NOT NULL,
	[OrderPickupPoint] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK__Order__C3905BAF9FFE48E4] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[OrderProduct]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[OrderProduct](
	[OrderID] [int] NOT NULL,
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[Quantity] [int] NOT NULL,
 CONSTRAINT [PK__OrderPro__817A2662D1443053] PRIMARY KEY CLUSTERED 
(
	[OrderID] ASC,
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Product]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Product](
	[ProductArticleNumber] [nvarchar](100) NOT NULL,
	[ProductName] [nvarchar](max) NOT NULL,
	[ProductDescription] [nvarchar](max) NOT NULL,
	[ProductCategory] [nvarchar](max) NOT NULL,
	[ProductPhoto] [image] NULL,
	[ProductManufacturer] [nvarchar](max) NOT NULL,
	[ProductCost] [decimal](19, 4) NOT NULL,
	[ProductDiscountAmount] [tinyint] NULL,
	[ProductQuantityInStock] [int] NOT NULL,
 CONSTRAINT [PK__Product__2EA7DCD5B998A9D2] PRIMARY KEY CLUSTERED 
(
	[ProductArticleNumber] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[RoleID] [int] IDENTITY(1,1) NOT NULL,
	[RoleName] [nvarchar](100) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[RoleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Status]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Status](
	[StatusID] [int] IDENTITY(1,1) NOT NULL,
	[StatusValue] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Status] PRIMARY KEY CLUSTERED 
(
	[StatusID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 05.04.2023 15:29:42 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserSurname] [nvarchar](100) NOT NULL,
	[UserName] [nvarchar](100) NOT NULL,
	[UserPatronymic] [nvarchar](100) NOT NULL,
	[UserLogin] [nvarchar](max) NOT NULL,
	[UserPassword] [nvarchar](max) NOT NULL,
	[UserRoleID] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Order] ON 

INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (1, 1, CAST(N'2022-05-21T00:00:00.000' AS DateTime), N'18')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (2, 2, CAST(N'2022-05-22T00:00:00.000' AS DateTime), N'14')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (3, 1, CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'22')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (4, 2, CAST(N'2022-05-23T00:00:00.000' AS DateTime), N'22')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (5, 1, CAST(N'2022-05-25T00:00:00.000' AS DateTime), N'26')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (6, 2, CAST(N'2022-05-26T00:00:00.000' AS DateTime), N'28')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (7, 1, CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'28')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (8, 2, CAST(N'2022-05-28T00:00:00.000' AS DateTime), N'32')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (9, 1, CAST(N'2022-05-29T00:00:00.000' AS DateTime), N'36')
INSERT [dbo].[Order] ([OrderID], [OrderStatusID], [OrderDeliveryDate], [OrderPickupPoint]) VALUES (10, 1, CAST(N'2022-05-30T00:00:00.000' AS DateTime), N'36')
SET IDENTITY_INSERT [dbo].[Order] OFF
GO
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'BPV4MM', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (1, N'PMEZMH', 2)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'F895RB', 15)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (2, N'JVL42J', 15)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'3L7RCZ', 17)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (3, N'3XBOTN', 13)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'2G3280', 40)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (4, N'MIO8YV', 100)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'UER2QD', 100)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (5, N'ZR70B4', 100)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'LPDDM4', 20)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (6, N'LQ48MW', 20)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'M26EXW', 50)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (7, N'O43COU', 50)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'ASPXSG', 40)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (8, N'K0YACK', 40)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'4JR1HN', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (9, N'4WZEOT', 10)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'EQ6RKO', 1)
INSERT [dbo].[OrderProduct] ([OrderID], [ProductArticleNumber], [Quantity]) VALUES (10, N'QHNOKR', 1)
GO
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'0YGHZ7', N'Очки защитные ', N'Очки защитные Husqvarna Clear (5449638-01) открытые с прозрачными линзами', N'Защита лица, глаз, головы', NULL, N'Husqvarna', CAST(700.0000 AS Decimal(19, 4)), 9, 36)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'2G3280', N'Угол наружный', N'Угол наружный Vinylon 3050 мм серо-голубой', N'Стеновые и фасадные материалы', NULL, N'Vinylon', CAST(795.0000 AS Decimal(19, 4)), 16, 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'3L7RCZ', N'Газобетон', N'Газобетон ЛСР 100х250х625 мм D400', N'Стеновые и фасадные материалы', NULL, N'ЛСР', CAST(7400.0000 AS Decimal(19, 4)), 7, 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'3XBOTN', N'Керамзит фракция', N'Керамзит фракция 10-20 мм 0,05 куб.м', N'Общестроительные материалы', NULL, N'MixMaster', CAST(110.0000 AS Decimal(19, 4)), 14, 21)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'4JR1HN', N'Шпатель', N'Шпатель малярный 100 мм с пластиковой ручкой', N'Ручной инструмент', NULL, N'Hesler', CAST(26.0000 AS Decimal(19, 4)), 3, 7)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'4WZEOT', N'Лезвие для ножа ', N'Лезвие для ножа Armero 18 мм прямое (10 шт.)', N'Ручной инструмент', NULL, N'Armero', CAST(110.0000 AS Decimal(19, 4)), 2, 17)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'61PGH3', N'Очки защитные', N'Очки защитные Delta Plus KILIMANDJARO (KILIMGRIN) открытые с прозрачными линзами', N'Защита лица, глаз, головы', NULL, N'KILIMGRIN', CAST(184.0000 AS Decimal(19, 4)), 2, 25)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'81F1WG', N'Каска защитная', N'Каска защитная Delta Plus BASEBALL DIAMOND V UP (DIAM5UPBCFLBS) белая', N'Защита лица, глаз, головы', NULL, N'Delta', CAST(1500.0000 AS Decimal(19, 4)), 1, 13)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'83M5ME', N'Кисть', N'Кисть плоская смешанная щетина 100х12 мм для красок и антисептиков на водной основе', N'Ручной инструмент', NULL, N'Armero', CAST(122.0000 AS Decimal(19, 4)), 16, 26)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'ASPXSG', N'Ровнитель', N'Ровнитель (наливной пол) финишный Weber.vetonit 4100 самовыравнивающийся высокопрочный 20 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'Weber', CAST(711.0000 AS Decimal(19, 4)), 17, 20)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'BPV4MM', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 60 мк 3 м рукав 1,5 м, пог.м', N'Общестроительные материалы', NULL, N'Изостронг', CAST(8.0000 AS Decimal(19, 4)), 13, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'EQ6RKO', N'Подшлемник', N'Подшлемник для каски одноразовый', N'Защита лица, глаз, головы', NULL, N'Husqvarna', CAST(36.0000 AS Decimal(19, 4)), 17, 22)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'F895RB', N'Песок строительный', N'Песок строительный 50 кг', N'Общестроительные материалы', NULL, N'Knauf', CAST(102.0000 AS Decimal(19, 4)), 17, 7)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'GN6ICZ', N'Каска защитная ', N'Каска защитная Исток (КАС001О) оранжевая', N'Защита лица, глаз, головы', NULL, N'Исток', CAST(154.0000 AS Decimal(19, 4)), 10, 8)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'I6MH89', N'Валик', N'Валик Wenzo Roma полиакрил 250 мм ворс 18 мм для красок грунтов и антисептиков на водной основе с рукояткой', N'Ручной инструмент', NULL, N'Wenzo Roma', CAST(326.0000 AS Decimal(19, 4)), 12, 3)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'JVL42J', N'Пленка техническая', N'Пленка техническая полиэтиленовая Изостронг 100 мк 3 м рукав 1,5 м, пог.м', N'Общестроительные материалы', NULL, N'Изостронг', CAST(13.0000 AS Decimal(19, 4)), 1, 34)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'K0YACK', N'Смесь цементно-песчаная', N'Смесь цементно-песчаная (ЦПС) 300 по ТУ MixMaster Универсал 25 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'MixMaster', CAST(160.0000 AS Decimal(19, 4)), 9, 19)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'LPDDM4', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf Ротбанд 30 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'Knauf', CAST(500.0000 AS Decimal(19, 4)), 17, 38)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'LQ48MW', N'Штукатурка гипсовая', N'Штукатурка гипсовая Knauf МП-75 машинная 30 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'Weber', CAST(462.0000 AS Decimal(19, 4)), 16, 33)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'M26EXW', N'Клей для плитки, керамогранита и камня', N'Клей для плитки, керамогранита и камня Крепс Усиленный серый (класс С1) 25 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'Knauf', CAST(340.0000 AS Decimal(19, 4)), 8, 2)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'MIO8YV', N'Кирпич', N'Кирпич рядовой Боровичи полнотелый М150 250х120х65 мм 1NF', N'Стеновые и фасадные материалы', NULL, N'ВОЛМА', CAST(30.0000 AS Decimal(19, 4)), 9, 31)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'O43COU', N'Шпаклевка', N'Шпаклевка полимерная Weber.vetonit LR + для сухих помещений белая 20 кг', N'Сухие строительные смеси и гидроизоляция', NULL, N'ВОЛМА', CAST(750.0000 AS Decimal(19, 4)), 9, 16)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'PMEZMH', N'Цемент', N'Цемент Евроцемент М500 Д0 ЦЕМ I 42,5 50 кг', N'Общестроительные материалы', NULL, N'М500', CAST(440.0000 AS Decimal(19, 4)), 10, 34)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'QHNOKR', N'Маска защитная', N'Маска защитная Исток (ЩИТ001) ударопрочная и термостойкая', N'Защита лица, глаз, головы', NULL, N'Исток', CAST(251.0000 AS Decimal(19, 4)), 6, 22)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'S72AM3', N'Пазогребневая плита ', N'Пазогребневая плита ВОЛМА Гидро 667х500х80 мм полнотелая', N'Стеновые и фасадные материалы', NULL, N'ВОЛМА', CAST(500.0000 AS Decimal(19, 4)), 9, 35)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'UER2QD', N'Скоба для пазогребневой плиты', N'Скоба для пазогребневой плиты Knauf С1 120х100 мм', N'Стеновые и фасадные материалы', NULL, N'Knauf', CAST(25.0000 AS Decimal(19, 4)), 20, 27)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'Z3LO0U', N'Очки защитные ', N'Очки защитные Delta Plus RUIZ (RUIZ1VI) закрытые с прозрачными линзами', N'Защита лица, глаз, головы', NULL, N'RUIZ', CAST(228.0000 AS Decimal(19, 4)), 19, 11)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'Z3XFSP', N'Нож строительный ', N'Нож строительный Hesler 18 мм с ломающимся лезвием пластиковый корпус', N'Ручной инструмент', NULL, N'Hesler', CAST(63.0000 AS Decimal(19, 4)), 19, 5)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'ZKQ5FF', N'Лезвие для ножа ', N'Лезвие для ножа Hesler 18 мм прямое (10 шт.)', N'Ручной инструмент', NULL, N'Hesler', CAST(65.0000 AS Decimal(19, 4)), 13, 6)
INSERT [dbo].[Product] ([ProductArticleNumber], [ProductName], [ProductDescription], [ProductCategory], [ProductPhoto], [ProductManufacturer], [ProductCost], [ProductDiscountAmount], [ProductQuantityInStock]) VALUES (N'ZR70B4', N'Кирпич', N'Кирпич рядовой силикатный Павловский завод полнотелый М200 250х120х65 мм 1NF', N'Стеновые и фасадные материалы', NULL, N'Павловский завод ', CAST(16.0000 AS Decimal(19, 4)), 3, 26)
GO
SET IDENTITY_INSERT [dbo].[Role] ON 

INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (1, N'Администратор')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (2, N'Менеджер')
INSERT [dbo].[Role] ([RoleID], [RoleName]) VALUES (3, N'Клиент')
SET IDENTITY_INSERT [dbo].[Role] OFF
GO
SET IDENTITY_INSERT [dbo].[Status] ON 

INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (1, N'Завершен')
INSERT [dbo].[Status] ([StatusID], [StatusValue]) VALUES (2, N'Новый')
SET IDENTITY_INSERT [dbo].[Status] OFF
GO
SET IDENTITY_INSERT [dbo].[User] ON 

INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (1, N'Басова', N' Амина', N' Кирилловна', N'klh7pi4rcbtz@gmail.com', N'2L6KZG', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (2, N'Михайлов', N' Андрей', N' Денисович', N'gn0354mbiork@outlook.com', N'uzWC67', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (3, N'Сидоров', N' Егор', N' Александрович', N'1o4l05k8dwpv@yahoo.com', N'8ntwUp', 1)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (4, N'Аксенова', N' Ульяна', N' Ивановна', N'hsqixl2vebuz@mail.com', N'YOyhfR', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (5, N'Васильева', N' Камила', N' Ивановна', N'towkse0hf26b@outlook.com', N'RSbvHv', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (6, N'Ильин', N' Артём', N' Родионович', N'khx0ncdwz4uj@gmail.com', N'rwVDh9', 2)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (7, N'Васильева', N' Василиса', N' Фёдоровна', N'01zji3wfuq7h@outlook.com', N'LdNyos', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (8, N'Кудрявцева', N' Василиса', N' Матвеевна', N'am65k18q7bwp@mail.com', N'gynQMT', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (9, N'Кириллова', N' Николь', N' Святославовна', N'wt9q8i6ypx47@outlook.com', N'AtnDjr', 3)
INSERT [dbo].[User] ([UserID], [UserSurname], [UserName], [UserPatronymic], [UserLogin], [UserPassword], [UserRoleID]) VALUES (10, N'Андреева', N' Полина', N' Артёмовна', N'4o72gufv3xlz@tutanota.com', N'JlFRCZ', 3)
SET IDENTITY_INSERT [dbo].[User] OFF
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_Status] FOREIGN KEY([OrderStatusID])
REFERENCES [dbo].[Status] ([StatusID])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_Status]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Order__52593CB8] FOREIGN KEY([OrderID])
REFERENCES [dbo].[Order] ([OrderID])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Order__52593CB8]
GO
ALTER TABLE [dbo].[OrderProduct]  WITH CHECK ADD  CONSTRAINT [FK__OrderProd__Produ__534D60F1] FOREIGN KEY([ProductArticleNumber])
REFERENCES [dbo].[Product] ([ProductArticleNumber])
GO
ALTER TABLE [dbo].[OrderProduct] CHECK CONSTRAINT [FK__OrderProd__Produ__534D60F1]
GO
ALTER TABLE [dbo].[User]  WITH CHECK ADD FOREIGN KEY([UserRoleID])
REFERENCES [dbo].[Role] ([RoleID])
GO
USE [master]
GO
ALTER DATABASE [Trade] SET  READ_WRITE 
GO
