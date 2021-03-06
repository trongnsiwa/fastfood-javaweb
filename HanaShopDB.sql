USE [master]
GO
/****** Object:  Database [HanaShop]    Script Date: 1/20/2021 1:38:23 PM ******/
CREATE DATABASE [HanaShop]
 COLLATE SQL_Latin1_General_CP1_CI_AS
GO
ALTER DATABASE [HanaShop] SET COMPATIBILITY_LEVEL = 120
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [HanaShop].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [HanaShop] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [HanaShop] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [HanaShop] SET ARITHABORT OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [HanaShop] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [HanaShop] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [HanaShop] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [HanaShop] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [HanaShop] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [HanaShop] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [HanaShop] SET  DISABLE_BROKER 
GO
ALTER DATABASE [HanaShop] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [HanaShop] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [HanaShop] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [HanaShop] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [HanaShop] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [HanaShop] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [HanaShop] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [HanaShop] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [HanaShop] SET  MULTI_USER 
GO
ALTER DATABASE [HanaShop] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [HanaShop] SET DB_CHAINING OFF 
GO
ALTER DATABASE [HanaShop] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [HanaShop] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
ALTER DATABASE [HanaShop] SET DELAYED_DURABILITY = DISABLED 
GO
USE [HanaShop]
GO
/****** Object:  Table [dbo].[Category]    Script Date: 1/20/2021 1:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Category](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
 CONSTRAINT [PK_Category] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Order]    Script Date: 1/20/2021 1:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Order](
	[Id] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[UserId] [varchar](30) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[CustomerName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Address] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Phone] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[PaymentMethod] [nvarchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[DeliveryFee] [smallmoney] NOT NULL,
	[TotalPrice] [smallmoney] NOT NULL,
	[Content] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_tblOrder_1] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[OrderDetails]    Script Date: 1/20/2021 1:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[OrderDetails](
	[OrderId] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductId] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ProductName] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImageLink] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Amount] [int] NOT NULL,
	[Price] [smallmoney] NOT NULL,
 CONSTRAINT [PK_OrderDetails_1] PRIMARY KEY CLUSTERED 
(
	[OrderId] ASC,
	[ProductId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Product]    Script Date: 1/20/2021 1:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Product](
	[Id] [varchar](15) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Name] [nvarchar](100) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[ImageLink] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Quantity] [int] NOT NULL,
	[Description] [nvarchar](max) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Price] [smallmoney] NOT NULL,
	[Category] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedUserId] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[UpdatedDate] [datetime] NULL,
	[UpdatedUserId] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [bit] NOT NULL,
 CONSTRAINT [PK_Product] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[User]    Script Date: 1/20/2021 1:38:23 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[User](
	[Id] [varchar](30) COLLATE SQL_Latin1_General_CP1_CS_AS NOT NULL,
	[Password] [varchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Firstname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[Lastname] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NOT NULL,
	[IsAdmin] [bit] NOT NULL,
	[GoogleId] [varchar](30) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
 CONSTRAINT [PK_tblUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (1, N'Food')
GO
INSERT [dbo].[Category] ([Id], [Name]) VALUES (2, N'Drink')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210115PNAZCCZT', N'customer', N'Customer 1', N'oooo', N'1234567890', CAST(N'2021-01-15 21:29:17.000' AS DateTime), N'COD', 2.0000, 41.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210115TJHTBRWO', N'customer', N'Customer 1', N'abc', N'1234567890', CAST(N'2021-01-15 21:16:20.000' AS DateTime), N'COD', 2.0000, 16.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210118YMSUJMZB', N'customer', N'Customer 1', N'school abc', N'123-456-7890', CAST(N'2021-01-18 00:03:40.000' AS DateTime), N'COD', 2.0000, 19.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210119GVRNMPWB', N'customer', N'Customer 1', N'123', N'1234567890', CAST(N'2021-01-19 00:52:17.000' AS DateTime), N'COD', 2.0000, 15.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210119HSSQZUQD', N'customer', N'Customer 1', N'yyy', N'1234567890', CAST(N'2021-01-19 00:56:24.000' AS DateTime), N'COD', 2.0000, 66.0000, N'hello')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210119INBFXYNS', N'customer', N'Customer 1', N'abc', N'123-456-7890', CAST(N'2021-01-19 00:49:59.000' AS DateTime), N'COD', 2.0000, 12.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210119OCTMZVCF', N'customer', N'Customer 1', N'jjj', N'1234567890', CAST(N'2021-01-19 00:57:50.000' AS DateTime), N'COD', 2.0000, 6.0000, N'a')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210119WNSMKRRP', N'customer', N'Customer 1', N'school b', N'1234567890', CAST(N'2021-01-19 20:27:38.000' AS DateTime), N'COD', 2.0000, 45.0000, N'')
GO
INSERT [dbo].[Order] ([Id], [UserId], [CustomerName], [Address], [Phone], [CreatedDate], [PaymentMethod], [DeliveryFee], [TotalPrice], [Content]) VALUES (N'210120XJXGMLRJ', N'customer', N'Customer 1', N'District 9', N'1234567890', CAST(N'2021-01-20 10:49:38.000' AS DateTime), N'COD', 2.0000, 90.0000, N'')
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210115PNAZCCZT', N'P018', N'Elsa Birthday Cake', N'/image/20.jpg', 1, 30.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210115PNAZCCZT', N'P023', N'Matcha Cake', N'/image/matchacake.jpg', 3, 9.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210115TJHTBRWO', N'P022', N'Matcha Tea', N'/image/matchalatte.jpg', 2, 8.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210115TJHTBRWO', N'P023', N'Matcha Cake', N'/image/matchacake.jpg', 2, 6.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210118YMSUJMZB', N'P021', N'Matcha Latte', N'/image/matcha1.png', 1, 5.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210118YMSUJMZB', N'P022', N'Matcha Tea', N'/image/matchalatte.jpg', 3, 12.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119GVRNMPWB', N'P021', N'Matcha Latte', N'/image/matcha1.png', 1, 5.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119GVRNMPWB', N'P022', N'Matcha Tea', N'/image/matchalatte.jpg', 2, 8.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119HSSQZUQD', N'P001', N'Coffee', N'/image/1.jpg', 2, 20.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119HSSQZUQD', N'P013', N'Ham Pizza', N'/image/15.jpg', 2, 44.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119INBFXYNS', N'P021', N'Matcha Latte', N'/image/matcha1.png', 2, 10.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119OCTMZVCF', N'P022', N'Matcha Tea', N'/image/matchalatte.jpg', 1, 4.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119WNSMKRRP', N'P016', N'Garlic Ricepaper', N'/image/18.jpg', 1, 11.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119WNSMKRRP', N'P021', N'Matcha Latte', N'/image/matcha1.png', 4, 20.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210119WNSMKRRP', N'P025', N'Pizza hut', N'https://foodanddrinknetwork-uk.co.uk/wp-content/uploads/2020/07/pizza-hut.jpg', 1, 12.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210120XJXGMLRJ', N'P009', N'Brown Sugar Milk', N'/image/10.jpg', 2, 44.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210120XJXGMLRJ', N'P022', N'Matcha Latte', N'/image/matchalatte.jpg', 2, 8.0000)
GO
INSERT [dbo].[OrderDetails] ([OrderId], [ProductId], [ProductName], [ImageLink], [Amount], [Price]) VALUES (N'210120XJXGMLRJ', N'P025', N'Pizza hut', N'https://foodanddrinknetwork-uk.co.uk/wp-content/uploads/2020/07/pizza-hut.jpg', 3, 36.0000)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P001', N'Orange juice', N'/image/1.jpg', 15, N'Juicy drink', 10.0000, N'Drink', CAST(N'2021-01-07 23:19:04.260' AS DateTime), N'test', CAST(N'2021-01-19 22:47:39.997' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P0012', N'Spaghetii', N'https://static.hotdeal.vn/images/1625/1625210/60x60/359907-combo-4-phan-mi-spaghetti-bo-bam-hop-500gr-sot-spaghetti-thuong-hang-100-tang-500gr-mi-ong-tai-mr-pasta-cong-thuc-tu-bep-5-giao-hang-tan-noi.jpg', 12, N'Delicious food from Italya', 12.0000, N'Food', CAST(N'2021-01-17 23:15:00.587' AS DateTime), N'test', CAST(N'2021-01-19 22:11:29.557' AS DateTime), N'test', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P002', N'Vegetable Noodle', N'/image/2.jpg', 20, N'Noodle with clean vegatable', 15.0000, N'Food', CAST(N'2021-01-09 20:39:15.253' AS DateTime), N'test', CAST(N'2021-01-19 23:10:47.073' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P0027', N'Potato chips', N'/image/images_-_2021-01-02T185424.592.jpeg', 12, N'Crunchy potato chips', 3.0000, N'Food', CAST(N'2021-01-20 11:14:33.393' AS DateTime), N'test', CAST(N'2021-01-20 11:18:13.003' AS DateTime), N'test', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P003', N'Bear Chocolate Cake', N'/image/unnamed.jpg', 10, N'Sweet chocolate', 5.0000, N'Food', CAST(N'2021-01-09 21:18:24.743' AS DateTime), N'test', CAST(N'2021-01-20 11:17:31.233' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P004', N'Sweet Chocolate Cream', N'/image/mousse.jpg', 10, N'Sweet, yummy drink for hot summer', 22.0000, N'Drink', CAST(N'2021-01-09 21:19:40.333' AS DateTime), N'test', CAST(N'2021-01-19 22:53:05.150' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P005', N'Milk Coffee', N'/image/5.jpg', 10, N'Break your sleep to work better', 7.0000, N'Drink', CAST(N'2021-01-09 21:20:41.640' AS DateTime), N'test', CAST(N'2021-01-19 23:17:13.523' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P006', N'Black Coffee', N'/image/6.jpg', 20, N'Black coffee for whom don''t like sweet', 8.0000, N'Drink', CAST(N'2021-01-09 21:21:14.393' AS DateTime), N'test', CAST(N'2021-01-19 23:19:06.500' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P007', N'Oolong Tea', N'/image/8.jpg', 22, N'Oolong tea from Japan', 12.0000, N'Drink', CAST(N'2021-01-09 21:22:29.577' AS DateTime), N'test', CAST(N'2021-01-19 22:25:05.950' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P008', N'Milk Cream Hot Sweet', N'/image/9.jpg', 12, N'Hot sweet to warm you in cold day', 14.0000, N'Drink', CAST(N'2021-01-09 21:23:13.550' AS DateTime), N'test', CAST(N'2021-01-19 22:24:31.203' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P009', N'Brown Sugar Milk', N'/image/10.jpg', 13, N'Yummy drink for best day', 22.0000, N'Drink', CAST(N'2021-01-09 21:24:18.390' AS DateTime), N'test', CAST(N'2021-01-19 22:22:03.313' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P010', N'Sweet Chicken Pan', N'/image/11.jpg', 12, N'More sweet more chicken', 7.0000, N'Food', CAST(N'2021-01-09 21:26:23.613' AS DateTime), N'test', CAST(N'2021-01-19 22:21:37.353' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P011', N'Sweet Chicken Cake', N'/image/13.jpg', 15, N'We love chicken', 5.0000, N'Food', CAST(N'2021-01-09 21:27:50.130' AS DateTime), N'test', CAST(N'2021-01-19 22:21:08.943' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P012', N'KFC Chicken', N'/image/14.jpg', 20, N'Chicken from KFC', 9.0000, N'Food', CAST(N'2021-01-09 21:28:19.987' AS DateTime), N'test', CAST(N'2021-01-19 22:20:25.107' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P013', N'Ham Pizza', N'/image/15.jpg', 9, N'Hot pizza run your life', 23.0000, N'Food', CAST(N'2021-01-09 21:29:18.390' AS DateTime), N'test', CAST(N'2021-01-19 22:20:01.023' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P014', N'Seafood Pizza', N'/image/16.jpg', 12, N'If you like seafood, this is for you', 12.0000, N'Food', CAST(N'2021-01-09 21:29:55.407' AS DateTime), N'test', CAST(N'2021-01-19 22:18:24.673' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P015', N'Ricepaper', N'/image/17.jpg', 34, N'Simple food always the best', 5.0000, N'Food', CAST(N'2021-01-09 21:30:45.270' AS DateTime), N'test', CAST(N'2021-01-19 22:17:47.143' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P016', N'Garlic Ricepaper', N'/image/18.jpg', 12, N'Ricepaper with garlic', 11.0000, N'Food', CAST(N'2021-01-09 21:31:27.173' AS DateTime), N'test', CAST(N'2021-01-19 22:17:22.007' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P017', N'Cheese Ricepaper', N'/image/19.jpg', 15, N'Crunchy ricepaper with cheese', 17.0000, N'Food', CAST(N'2021-01-09 21:31:55.533' AS DateTime), N'test', CAST(N'2021-01-19 22:16:28.637' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P018', N'Elsa Birthday Cake', N'/image/20.jpg', 7, N'Queen Elsa is coming to happy birthday to you', 30.0000, N'Food', CAST(N'2021-01-09 21:32:27.583' AS DateTime), N'test', CAST(N'2021-01-19 22:15:47.753' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P019', N'Flamingo Cake', N'/image/21.jpg', 5, N'This cake made for best princess', 29.0000, N'Food', CAST(N'2021-01-09 21:32:58.497' AS DateTime), N'test', CAST(N'2021-01-19 22:15:22.167' AS DateTime), N'test', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P020', N'Small Sugar Pan', N'/image/12.jpg', 12, N'Try it and love it', 5.0000, N'Food', CAST(N'2021-01-09 21:33:42.990' AS DateTime), N'test', CAST(N'2021-01-19 22:14:27.567' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P021', N'Matcha Tea', N'/image/matcha1.png', 12, N'Tea make you feel relax', 5.0000, N'Drink', CAST(N'2021-01-09 21:37:22.060' AS DateTime), N'test', CAST(N'2021-01-19 22:13:08.300' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P022', N'Matcha Latte', N'/image/matchalatte.jpg', 12, N'Sweet latte for smooth day', 4.0000, N'Drink', CAST(N'2021-01-15 10:19:58.307' AS DateTime), N'test', CAST(N'2021-01-19 22:12:34.240' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P023', N'Matcha Cake', N'https://assets.tmecosys.com/image/upload/t_web767x639/img/recipe/vimdb/202640_0-1254-5478-5478.jpg', 10, N'Matcha is life', 12.0000, N'Food', CAST(N'2021-01-15 10:23:08.243' AS DateTime), N'test', CAST(N'2021-01-19 22:11:50.633' AS DateTime), N'test', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P024', N'Honey Popcorn', N'/image/popcornHOR-11.png', 12, N'Delicious popcorn make you feel happy', 4.0000, N'Food', CAST(N'2021-01-19 20:10:35.097' AS DateTime), N'test', CAST(N'2021-01-19 23:24:32.640' AS DateTime), N'test', 0)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P025', N'Pizza hut', N'https://foodanddrinknetwork-uk.co.uk/wp-content/uploads/2020/07/pizza-hut.jpg', 6, N'Pizza is the best', 12.0000, N'Food', CAST(N'2021-01-19 01:04:29.917' AS DateTime), N'test', CAST(N'2021-01-19 22:11:06.693' AS DateTime), N'test', 1)
GO
INSERT [dbo].[Product] ([Id], [Name], [ImageLink], [Quantity], [Description], [Price], [Category], [CreatedDate], [CreatedUserId], [UpdatedDate], [UpdatedUserId], [Status]) VALUES (N'P026', N'Classic Hamburger', N'/image/hamburger.jpg', 15, N'Tasty hamburger', 8.0000, N'Food', CAST(N'2021-01-20 11:00:02.540' AS DateTime), N'test', CAST(N'2021-01-20 11:18:13.007' AS DateTime), N'test', 0)
GO
INSERT [dbo].[User] ([Id], [Password], [Firstname], [Lastname], [IsAdmin], [GoogleId]) VALUES (N'100451665989634493208', NULL, N'Kazegami', N'Iwata', 0, N'100451665989634493208')
GO
INSERT [dbo].[User] ([Id], [Password], [Firstname], [Lastname], [IsAdmin], [GoogleId]) VALUES (N'customer', N'customer', N'Customer', N'1', 0, NULL)
GO
INSERT [dbo].[User] ([Id], [Password], [Firstname], [Lastname], [IsAdmin], [GoogleId]) VALUES (N'test', N'test', N'test', N'test', 1, NULL)
GO
ALTER TABLE [dbo].[Order]  WITH CHECK ADD  CONSTRAINT [FK_Order_User] FOREIGN KEY([UserId])
REFERENCES [dbo].[User] ([Id])
GO
ALTER TABLE [dbo].[Order] CHECK CONSTRAINT [FK_Order_User]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Order] FOREIGN KEY([OrderId])
REFERENCES [dbo].[Order] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Order]
GO
ALTER TABLE [dbo].[OrderDetails]  WITH CHECK ADD  CONSTRAINT [FK_OrderDetails_Product] FOREIGN KEY([ProductId])
REFERENCES [dbo].[Product] ([Id])
GO
ALTER TABLE [dbo].[OrderDetails] CHECK CONSTRAINT [FK_OrderDetails_Product]
GO
USE [master]
GO
ALTER DATABASE [HanaShop] SET  READ_WRITE 
GO
