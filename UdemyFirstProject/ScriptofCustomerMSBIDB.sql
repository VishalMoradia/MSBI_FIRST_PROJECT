USE [master]
GO
/****** Object:  Database [CustomerDataWarehouse]    Script Date: 2021-10-29 7:27:41 PM ******/
CREATE DATABASE [CustomerDataWarehouse]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CustomerDataWarehouse', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CustomerDataWarehouse.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CustomerDataWarehouse_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\DATA\CustomerDataWarehouse_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CustomerDataWarehouse] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CustomerDataWarehouse].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CustomerDataWarehouse] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ARITHABORT OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CustomerDataWarehouse] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CustomerDataWarehouse] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CustomerDataWarehouse] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CustomerDataWarehouse] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET RECOVERY FULL 
GO
ALTER DATABASE [CustomerDataWarehouse] SET  MULTI_USER 
GO
ALTER DATABASE [CustomerDataWarehouse] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CustomerDataWarehouse] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CustomerDataWarehouse] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CustomerDataWarehouse] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CustomerDataWarehouse] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CustomerDataWarehouse] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CustomerDataWarehouse', N'ON'
GO
ALTER DATABASE [CustomerDataWarehouse] SET QUERY_STORE = OFF
GO
USE [CustomerDataWarehouse]
GO
/****** Object:  Table [dbo].[CountryTable]    Script Date: 2021-10-29 7:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CountryTable](
	[CountryID] [int] NOT NULL,
	[CountryName] [nvarchar](50) NULL,
 CONSTRAINT [PK_CountryTable] PRIMARY KEY CLUSTERED 
(
	[CountryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FactCustomer]    Script Date: 2021-10-29 7:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FactCustomer](
	[CustomerCode] [nvarchar](50) NOT NULL,
	[CustomerName] [nvarchar](50) NULL,
	[CustomerAccount] [money] NULL,
	[SalesDate] [datetime] NULL,
	[country_id] [int] NULL,
	[state_id] [int] NULL,
	[product_id] [int] NULL,
	[salesperson_id] [int] NULL,
 CONSTRAINT [PK_tblcustomer] PRIMARY KEY CLUSTERED 
(
	[CustomerCode] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ProductTable]    Script Date: 2021-10-29 7:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ProductTable](
	[ProductID] [int] NOT NULL,
	[ProductName] [nvarchar](50) NULL,
 CONSTRAINT [PK_ProductTable] PRIMARY KEY CLUSTERED 
(
	[ProductID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SalesTable]    Script Date: 2021-10-29 7:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SalesTable](
	[SalesPersonID] [int] NOT NULL,
	[SalesPersonName] [nvarchar](50) NULL,
 CONSTRAINT [PK_SalesTable] PRIMARY KEY CLUSTERED 
(
	[SalesPersonID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StateTable]    Script Date: 2021-10-29 7:27:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StateTable](
	[StateID] [int] NOT NULL,
	[StateName] [nvarchar](50) NULL,
 CONSTRAINT [PK_StateTable] PRIMARY KEY CLUSTERED 
(
	[StateID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[FactCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_CountryTable] FOREIGN KEY([country_id])
REFERENCES [dbo].[CountryTable] ([CountryID])
GO
ALTER TABLE [dbo].[FactCustomer] CHECK CONSTRAINT [FK_tblcustomer_CountryTable]
GO
ALTER TABLE [dbo].[FactCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_ProductTable] FOREIGN KEY([product_id])
REFERENCES [dbo].[ProductTable] ([ProductID])
GO
ALTER TABLE [dbo].[FactCustomer] CHECK CONSTRAINT [FK_tblcustomer_ProductTable]
GO
ALTER TABLE [dbo].[FactCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_SalesTable] FOREIGN KEY([salesperson_id])
REFERENCES [dbo].[SalesTable] ([SalesPersonID])
GO
ALTER TABLE [dbo].[FactCustomer] CHECK CONSTRAINT [FK_tblcustomer_SalesTable]
GO
ALTER TABLE [dbo].[FactCustomer]  WITH CHECK ADD  CONSTRAINT [FK_tblcustomer_StateTable] FOREIGN KEY([state_id])
REFERENCES [dbo].[StateTable] ([StateID])
GO
ALTER TABLE [dbo].[FactCustomer] CHECK CONSTRAINT [FK_tblcustomer_StateTable]
GO
USE [master]
GO
ALTER DATABASE [CustomerDataWarehouse] SET  READ_WRITE 
GO
