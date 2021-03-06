USE [master]
GO
/****** Object:  Database [proyectof]    Script Date: 05/05/2018 04:46:52 a. m. ******/
CREATE DATABASE [proyectof]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'proyectof', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\proyectof.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'proyectof_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER01\MSSQL\DATA\proyectof_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 COLLATE Modern_Spanish_CI_AS
GO
ALTER DATABASE [proyectof] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [proyectof].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [proyectof] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [proyectof] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [proyectof] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [proyectof] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [proyectof] SET ARITHABORT OFF 
GO
ALTER DATABASE [proyectof] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [proyectof] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [proyectof] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [proyectof] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [proyectof] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [proyectof] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [proyectof] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [proyectof] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [proyectof] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [proyectof] SET  ENABLE_BROKER 
GO
ALTER DATABASE [proyectof] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [proyectof] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [proyectof] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [proyectof] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [proyectof] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [proyectof] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [proyectof] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [proyectof] SET RECOVERY FULL 
GO
ALTER DATABASE [proyectof] SET  MULTI_USER 
GO
ALTER DATABASE [proyectof] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [proyectof] SET DB_CHAINING OFF 
GO
ALTER DATABASE [proyectof] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [proyectof] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [proyectof] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'proyectof', N'ON'
GO
ALTER DATABASE [proyectof] SET QUERY_STORE = OFF
GO
USE [proyectof]
GO
ALTER DATABASE SCOPED CONFIGURATION SET IDENTITY_CACHE = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [proyectof]
GO
/****** Object:  Table [dbo].[countries]    Script Date: 05/05/2018 04:46:52 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[countries](
	[country_id] [uniqueidentifier] NOT NULL,
	[country_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[region_id] [uniqueidentifier] NOT NULL,
 CONSTRAINT [country_id] PRIMARY KEY CLUSTERED 
(
	[country_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[customers]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[customers](
	[customer_id] [uniqueidentifier] NOT NULL,
	[cust_fist_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[cust_last_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[cust_address] [varchar](40) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[phone_numbers] [int] NOT NULL,
	[nls_language] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[nls_territory] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[credit_limit] [money] NOT NULL,
	[cust_email] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[account_mgr_id] [uniqueidentifier] NOT NULL,
	[cust_geo_location] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[date_of_birth] [date] NOT NULL,
	[marital_status] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[gender] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[income_level] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[departments]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[departments](
	[department_id] [uniqueidentifier] NOT NULL,
	[department_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[manager_id] [uniqueidentifier] NOT NULL,
	[location_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[department_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[employees]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[employees](
	[employee_id] [uniqueidentifier] NOT NULL,
	[first_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[last_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[email] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[hire_date] [date] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[salary] [money] NOT NULL,
	[comission_pct] [money] NOT NULL,
	[manager_id] [uniqueidentifier] NOT NULL,
	[department_id] [uniqueidentifier] NOT NULL,
	[phone_number] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[employee_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[inventories]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[inventories](
	[product_id] [uniqueidentifier] NOT NULL,
	[warehouse_id] [uniqueidentifier] NOT NULL,
	[quantity_on_hand] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[job_history]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[job_history](
	[employee_id] [uniqueidentifier] NOT NULL,
	[start_date] [date] NOT NULL,
	[job_id] [uniqueidentifier] NOT NULL,
	[department_id] [uniqueidentifier] NOT NULL,
	[end_date] [date] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[jobs]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[jobs](
	[job_id] [uniqueidentifier] NOT NULL,
	[job_title] [varchar](15) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[min_salary] [money] NOT NULL,
	[max_salary] [money] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[job_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[locations]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[locations](
	[location_id] [uniqueidentifier] NOT NULL,
	[postal_code] [int] NOT NULL,
	[stat_providence] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[country_id] [uniqueidentifier] NOT NULL,
	[street_address] [varchar](max) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[city] [varchar](max) COLLATE Modern_Spanish_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[location_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[order_items]    Script Date: 05/05/2018 04:47:00 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[order_items](
	[order_id] [uniqueidentifier] NOT NULL,
	[line_item_id] [uniqueidentifier] NOT NULL,
	[product_id] [uniqueidentifier] NOT NULL,
	[unit_price] [money] NOT NULL,
	[quantity] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[orders]    Script Date: 05/05/2018 04:47:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[orders](
	[order_id] [uniqueidentifier] NOT NULL,
	[order_date] [date] NOT NULL,
	[order_mode] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[customer_id] [uniqueidentifier] NOT NULL,
	[order_status] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[order_total] [money] NOT NULL,
	[sales_rep_id] [uniqueidentifier] NOT NULL,
	[promotion_id] [uniqueidentifier] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[order_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_description]    Script Date: 05/05/2018 04:47:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_description](
	[product_id] [uniqueidentifier] NOT NULL,
	[language_id] [uniqueidentifier] NOT NULL,
	[translated_name] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[translated_description] [varchar](50) COLLATE Modern_Spanish_CI_AS NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[product_information]    Script Date: 05/05/2018 04:47:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[product_information](
	[product_id] [uniqueidentifier] NOT NULL,
	[product_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[product_description] [varchar](100) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[category_id] [uniqueidentifier] NOT NULL,
	[weigh_class] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[warrently_period] [varchar](5) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[supllier_id] [uniqueidentifier] NOT NULL,
	[product_status] [varchar](10) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[list_price] [money] NOT NULL,
	[min_price] [money] NOT NULL,
	[catalog_url] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[product_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[regions]    Script Date: 05/05/2018 04:47:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[regions](
	[region_id] [uniqueidentifier] NOT NULL,
	[region_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NULL,
 CONSTRAINT [region_id] PRIMARY KEY CLUSTERED 
(
	[region_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[warehouses]    Script Date: 05/05/2018 04:47:01 a. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[warehouses](
	[warehouse_id] [uniqueidentifier] NOT NULL,
	[warehouse_spec] [varchar](30) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[wahtehouse_name] [varchar](20) COLLATE Modern_Spanish_CI_AS NOT NULL,
	[location_id] [uniqueidentifier] NOT NULL,
	[wh_geo_location] [geography] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[warehouse_id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'3f090ba2-f075-4ba8-bdbc-0376633d1f4a', N'Rusia', N'cb21c687-dace-4110-ac79-f816e346827f')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'36a62a3a-15fc-4f30-9eae-0461b821cd47', N'Sudafrica', N'2d07204b-e11c-4d35-9076-6803cd3034da')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'be2f404a-8b4c-4c8c-8360-166579d3f59b', N'España', N'210e4690-23f0-4acc-af56-4f0312268453')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'1704d387-5f90-4458-b571-2a49e8f9d809', N'Egipto', N'2d07204b-e11c-4d35-9076-6803cd3034da')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'418cc06d-8544-493f-b05e-41d5558bbfcd', N'Francia', N'210e4690-23f0-4acc-af56-4f0312268453')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'b09587ca-abc0-4f88-96af-4eae2e7ea38b', N'Filipinas', N'2796506b-1d82-4565-a150-c85014b6e7a9')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'dcefb16c-41af-4fba-b321-5bdec29ea188', N'Israel', N'cb21c687-dace-4110-ac79-f816e346827f')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'24cf5815-a1e1-4634-bc1e-674dff8eb99f', N'Australia', N'2796506b-1d82-4565-a150-c85014b6e7a9')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'79a712c7-980f-4b4a-8bcb-675661540f9b', N'USA', N'81a4958c-aa0a-46ab-9d8e-95cb5fd0d21e')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'2effd68b-0601-4a8d-8227-972ae485cabd', N'Ingalterra', N'210e4690-23f0-4acc-af56-4f0312268453')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'e6669336-780d-4269-93f7-c955438f1f77', N'México', N'81a4958c-aa0a-46ab-9d8e-95cb5fd0d21e')
INSERT [dbo].[countries] ([country_id], [country_name], [region_id]) VALUES (N'a37ab5b8-f04a-4424-8e36-f05a331406f6', N'Argentina', N'81a4958c-aa0a-46ab-9d8e-95cb5fd0d21e')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'46ce0c88-a9f6-463e-87dc-16d0dff2ffb0', N'Ventas', N'58868564-f700-43a7-ac2f-ba80f08a041a', N'25722759-d0c1-4f53-ab64-4656264c737a')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'35618ea3-dd83-4f9c-ba35-4535aa555ec6', N'Compras', N'b7df46df-f2fb-4887-b934-9facbcf95921', N'f748b4b1-53f6-49b2-b816-8634bd6cfa7c')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'82cd58bd-fdc5-4395-a165-4804660a4024', N'Logistica', N'f5cb73ee-82ea-49a7-b27d-80d37acdae8e', N'f470f6d4-2c8f-4842-ab77-97fa95126a15')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'7013818e-12f2-418b-bb78-4ce4c7862659', N'Recursos Humanos', N'3e979879-508e-4014-ab79-64d08a483805', N'f748b4b1-53f6-49b2-b816-8634bd6cfa7c')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'33092912-e915-4273-8cc3-53e227b19138', N'Logistica', N'79eaf91e-4536-4a6c-87cb-8a1ef7d86eb9', N'f470f6d4-2c8f-4842-ab77-97fa95126a15')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'f918c75a-0bd9-4a70-bb13-56d842e6acaf', N'Mercadotecnia', N'40021ed8-e9c2-4ad2-97c6-9dc6023d1522', N'25722759-d0c1-4f53-ab64-4656264c737a')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'a93435a3-f803-4f58-9a3f-7879f4610517', N'Control de calidad', N'f5339140-7a44-4cbd-bf2d-18203bb558c5', N'd58560cf-de6d-4843-9f8b-ba16bebf83e5')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'af2a99f4-a78f-4a50-9d76-9639857ef655', N'Recursos Humanos', N'ea0873df-9f36-4329-a6e0-f5ba45fedf92', N'0d0c6e0e-2b3f-4ab4-bb91-2b05579ead3c')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'eb439d1f-41e1-4b3a-93f4-b509c99aed99', N'Sistemas', N'c21de9f9-a81a-4c4e-ac02-27eac7cbd03c', N'25722759-d0c1-4f53-ab64-4656264c737a')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'd0633fb8-f4ba-4522-9c82-b81862d88655', N'Logistica', N'18106e88-0712-4d3a-a250-0c1a936ffbf8', N'f470f6d4-2c8f-4842-ab77-97fa95126a15')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'797fbf32-6203-4293-9e8b-b8d7fbbf8b1a', N'Ventas', N'3f43ab83-ad58-4ca8-998a-6e030adc2a47', N'0d0c6e0e-2b3f-4ab4-bb91-2b05579ead3c')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'32f5c9fc-43fb-4e7a-b6e8-c49cf4e499ff', N'Control de calidad', N'3664ec1a-ac9f-459a-9e32-7f143f13d06b', N'd58560cf-de6d-4843-9f8b-ba16bebf83e5')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'70e0c10e-b6ed-498b-943f-e2dab4632ac1', N'Compras', N'fa5800e7-8791-4d3d-a95c-6b6e8830207d', N'0d0c6e0e-2b3f-4ab4-bb91-2b05579ead3c')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'5d5a673a-4a2f-4f26-84b3-e33705b2f5b3', N'Sistemas', N'f44df128-a116-41aa-9420-23282fb007dc', N'eda52bcb-3e5a-4d7c-a2f4-a5e8e199b1b0')
INSERT [dbo].[departments] ([department_id], [department_name], [manager_id], [location_id]) VALUES (N'cb4a2cb5-414e-467f-a47c-e66f4a31e7ab', N'Control de calidad', N'1370374e-0723-4d8d-8087-2ad0b3c93a28', N'd58560cf-de6d-4843-9f8b-ba16bebf83e5')
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [hire_date], [job_id], [salary], [comission_pct], [manager_id], [department_id], [phone_number]) VALUES (N'89293e0f-d5bf-4213-8509-06076c05a570', N'Pedro', N'Armendariz', N'pedroA@empresa.com', CAST(N'2014-08-10' AS Date), N'd307ccc2-0ad0-4a99-a642-4939d8689451', 4250.5000, 30.5000, N'b7df46df-f2fb-4887-b934-9facbcf95921', N'35618ea3-dd83-4f9c-ba35-4535aa555ec6', N'8181012325')
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [hire_date], [job_id], [salary], [comission_pct], [manager_id], [department_id], [phone_number]) VALUES (N'a5db69b1-f458-4261-b9cf-0e9010f7a7fb', N'Fabian', N'Martinez', N'fabianM@empresa.com', CAST(N'2008-02-28' AS Date), N'27ac1fdd-5af9-467e-8607-89e3f2e4aa7c', 2500.5000, 20.3000, N'f5cb73ee-82ea-49a7-b27d-80d37acdae8e', N'82cd58bd-fdc5-4395-a165-4804660a4024', N'8181002523')
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [hire_date], [job_id], [salary], [comission_pct], [manager_id], [department_id], [phone_number]) VALUES (N'68e3ce5d-09ab-471f-af75-7d834b68e7b5', N'Guadalupe', N'Reyes', N'guadaR@empresa.com', CAST(N'2012-12-21' AS Date), N'b63ea2f9-5349-4f3e-8d4c-f9ab18be55b1', 2450.3000, 30.2000, N'c21de9f9-a81a-4c4e-ac02-27eac7cbd03c', N'eb439d1f-41e1-4b3a-93f4-b509c99aed99', N'8182015152')
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [hire_date], [job_id], [salary], [comission_pct], [manager_id], [department_id], [phone_number]) VALUES (N'4165c44f-f3d3-4286-a517-ddd050d1879f', N'Juan', N'Perez', N'juanp@empresa.com', CAST(N'2004-06-05' AS Date), N'03f577d1-0e6d-4c6e-b3de-1fffd71b50a7', 2000.0000, 15.0000, N'58868564-f700-43a7-ac2f-ba80f08a041a', N'46ce0c88-a9f6-463e-87dc-16d0dff2ffb0', N'8181002324')
INSERT [dbo].[employees] ([employee_id], [first_name], [last_name], [email], [hire_date], [job_id], [salary], [comission_pct], [manager_id], [department_id], [phone_number]) VALUES (N'101563c4-0d22-478a-98ff-e8f18e6ce4d0', N'Maria', N'Lopez', N'mariaL@empresa.com', CAST(N'2010-03-21' AS Date), N'cef14bce-f4ba-4d4e-bacf-b31e0129cb4f', 3700.0000, 25.0000, N'3e979879-508e-4014-ab79-64d08a483805', N'7013818e-12f2-418b-bb78-4ce4c7862659', N'8181023132')
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'e7711cb4-7cfd-4bdc-8192-1fe7b18862a6', N'ae158fd2-2f76-4b66-b3c1-07f59fe16396', 50)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'05ae4211-4a29-45b4-89a6-5c17d5700ac3', N'3998e7b8-b91e-4083-92c1-3684520e582f', 30)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'e1dad985-b78c-47f7-ad78-c3211f1e055f', N'5e475c32-0bf0-4c6b-b9f6-5ffd65c23515', 80)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'fef8e49d-8787-46e7-b10b-ece62619e5d0', N'23440c34-39b5-4ee7-ade0-701e156c48ce', 35)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'a0bf422f-6f72-4371-8a80-f35c1170ca08', N'187cf278-86c2-47d2-99f4-a17700fdb726', 95)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'e7711cb4-7cfd-4bdc-8192-1fe7b18862a6', N'cc125f34-67f7-4af0-b9ad-b051b02ff010', 42)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'05ae4211-4a29-45b4-89a6-5c17d5700ac3', N'ae158fd2-2f76-4b66-b3c1-07f59fe16396', 64)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'e1dad985-b78c-47f7-ad78-c3211f1e055f', N'3998e7b8-b91e-4083-92c1-3684520e582f', 78)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'fef8e49d-8787-46e7-b10b-ece62619e5d0', N'5e475c32-0bf0-4c6b-b9f6-5ffd65c23515', 15)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'a0bf422f-6f72-4371-8a80-f35c1170ca08', N'23440c34-39b5-4ee7-ade0-701e156c48ce', 64)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'e7711cb4-7cfd-4bdc-8192-1fe7b18862a6', N'187cf278-86c2-47d2-99f4-a17700fdb726', 32)
INSERT [dbo].[inventories] ([product_id], [warehouse_id], [quantity_on_hand]) VALUES (N'05ae4211-4a29-45b4-89a6-5c17d5700ac3', N'cc125f34-67f7-4af0-b9ad-b051b02ff010', 28)
INSERT [dbo].[job_history] ([employee_id], [start_date], [job_id], [department_id], [end_date]) VALUES (N'89293e0f-d5bf-4213-8509-06076c05a570', CAST(N'2014-08-10' AS Date), N'd307ccc2-0ad0-4a99-a642-4939d8689451', N'35618ea3-dd83-4f9c-ba35-4535aa555ec6', NULL)
INSERT [dbo].[job_history] ([employee_id], [start_date], [job_id], [department_id], [end_date]) VALUES (N'a5db69b1-f458-4261-b9cf-0e9010f7a7fb', CAST(N'2008-02-28' AS Date), N'27ac1fdd-5af9-467e-8607-89e3f2e4aa7c', N'82cd58bd-fdc5-4395-a165-4804660a4024', NULL)
INSERT [dbo].[job_history] ([employee_id], [start_date], [job_id], [department_id], [end_date]) VALUES (N'68e3ce5d-09ab-471f-af75-7d834b68e7b5', CAST(N'2012-12-21' AS Date), N'b63ea2f9-5349-4f3e-8d4c-f9ab18be55b1', N'eb439d1f-41e1-4b3a-93f4-b509c99aed99', NULL)
INSERT [dbo].[job_history] ([employee_id], [start_date], [job_id], [department_id], [end_date]) VALUES (N'4165c44f-f3d3-4286-a517-ddd050d1879f', CAST(N'2004-06-05' AS Date), N'03f577d1-0e6d-4c6e-b3de-1fffd71b50a7', N'46ce0c88-a9f6-463e-87dc-16d0dff2ffb0', NULL)
INSERT [dbo].[job_history] ([employee_id], [start_date], [job_id], [department_id], [end_date]) VALUES (N'101563c4-0d22-478a-98ff-e8f18e6ce4d0', CAST(N'2010-03-21' AS Date), N'cef14bce-f4ba-4d4e-bacf-b31e0129cb4f', N'7013818e-12f2-418b-bb78-4ce4c7862659', NULL)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'03f577d1-0e6d-4c6e-b3de-1fffd71b50a7', N'Comprador', 2000.0000, 3500.0000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'd307ccc2-0ad0-4a99-a642-4939d8689451', N'Auditor', 4000.0000, 5000.0000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'27ac1fdd-5af9-467e-8607-89e3f2e4aa7c', N'Tecnico', 2500.0000, 3000.0000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'cef14bce-f4ba-4d4e-bacf-b31e0129cb4f', N'Administrador', 3500.0000, 4000.0000)
INSERT [dbo].[jobs] ([job_id], [job_title], [min_salary], [max_salary]) VALUES (N'b63ea2f9-5349-4f3e-8d4c-f9ab18be55b1', N'Vendedor', 1500.0000, 2500.0000)
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'0d0c6e0e-2b3f-4ab4-bb91-2b05579ead3c', 98000, N'Gauteng', N'36a62a3a-15fc-4f30-9eae-0461b821cd47', N'Av. Nelson', N'Johannesburgo')
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'25722759-d0c1-4f53-ab64-4656264c737a', 14000, N'Leningrado', N'3f090ba2-f075-4ba8-bdbc-0376633d1f4a', N'Av. Chekov', N'San Petesburgo')
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'f748b4b1-53f6-49b2-b816-8634bd6cfa7c', 50200, N'Madrid', N'be2f404a-8b4c-4c8c-8360-166579d3f59b', N'Av. Castilla No. 350 Col. De la Mancha', N'Madrid')
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'f470f6d4-2c8f-4842-ab77-97fa95126a15', 90200, N'Normandía', N'418cc06d-8544-493f-b05e-41d5558bbfcd', N'Av. Napoleon', N'Sainte-Mere-Églese')
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'eda52bcb-3e5a-4d7c-a2f4-a5e8e199b1b0', 24000, N'Texas', N'79a712c7-980f-4b4a-8bcb-675661540f9b', N'Lincoln St. No. 201 Col. Jefferson', N'Arlingtone')
INSERT [dbo].[locations] ([location_id], [postal_code], [stat_providence], [country_id], [street_address], [city]) VALUES (N'd58560cf-de6d-4843-9f8b-ba16bebf83e5', 65000, N'Nuevo León', N'e6669336-780d-4269-93f7-c955438f1f77', N'Av. Barragan No.100 Col. Anahuac', N'San Nicolas de los Garza')
INSERT [dbo].[product_description] ([product_id], [language_id], [translated_name], [translated_description]) VALUES (N'e7711cb4-7cfd-4bdc-8192-1fe7b18862a6', N'0a60c6a0-b032-4440-8dad-576e20b31e3c', N'Cuaderno a rayas', N'Sin traducción')
INSERT [dbo].[product_description] ([product_id], [language_id], [translated_name], [translated_description]) VALUES (N'05ae4211-4a29-45b4-89a6-5c17d5700ac3', N'b9ac5e0a-c974-4f14-b8a4-2a07c6567fd4', N'Math Book', N'Traducido al ingles')
INSERT [dbo].[product_description] ([product_id], [language_id], [translated_name], [translated_description]) VALUES (N'e1dad985-b78c-47f7-ad78-c3211f1e055f', N'ab9bab6a-b725-4617-bfb7-db9da45fb312', N'Sociologia Basica', N'Traducido del Frances')
INSERT [dbo].[product_description] ([product_id], [language_id], [translated_name], [translated_description]) VALUES (N'fef8e49d-8787-46e7-b10b-ece62619e5d0', N'b31e0d2e-e419-4d18-b95d-f9a87a4c96d4', N'World History', N'Traducido del Italiano al Ingles')
INSERT [dbo].[product_description] ([product_id], [language_id], [translated_name], [translated_description]) VALUES (N'a0bf422f-6f72-4371-8a80-f35c1170ca08', N'78594944-2d9a-4e0c-a02d-afacc7c2e9a7', N'Cuaderno de cuadricula', N'Sin traducción')
INSERT [dbo].[product_information] ([product_id], [product_name], [product_description], [category_id], [weigh_class], [warrently_period], [supllier_id], [product_status], [list_price], [min_price], [catalog_url]) VALUES (N'e7711cb4-7cfd-4bdc-8192-1fe7b18862a6', N'Cuaderno', N'Cuaderno a rayas', N'a6e08a81-9c91-4328-a741-64454e983155', N'Ligero', N'1 año', N'd54afa4a-d129-428d-9244-00fd51804907', N'Activo', 50.0000, 70.0000, N'cat/cuadernos/02')
INSERT [dbo].[product_information] ([product_id], [product_name], [product_description], [category_id], [weigh_class], [warrently_period], [supllier_id], [product_status], [list_price], [min_price], [catalog_url]) VALUES (N'05ae4211-4a29-45b4-89a6-5c17d5700ac3', N'Libro', N'Es un libro de matematicas', N'47332b38-168c-415d-8b5a-75c3e13ac01a', N'Ligero', N'1 año', N'd4bf749b-460c-4ace-84dc-bf011015f2a4', N'Activo', 250.0000, 330.0000, N'cat/libros/03')
INSERT [dbo].[product_information] ([product_id], [product_name], [product_description], [category_id], [weigh_class], [warrently_period], [supllier_id], [product_status], [list_price], [min_price], [catalog_url]) VALUES (N'e1dad985-b78c-47f7-ad78-c3211f1e055f', N'Libro', N'Es un libro de sociologia', N'6ed5a357-2bff-427d-b91b-15fd1e4dfcce', N'Ligero', N'1 año', N'a089e08e-db62-4117-aa2d-fe054c48ac20', N'Activo', 350.0000, 400.0000, N'cat/libros/02')
INSERT [dbo].[product_information] ([product_id], [product_name], [product_description], [category_id], [weigh_class], [warrently_period], [supllier_id], [product_status], [list_price], [min_price], [catalog_url]) VALUES (N'fef8e49d-8787-46e7-b10b-ece62619e5d0', N'Libro', N'Es un libro de historia mundial', N'5185c9a7-f5bd-4246-9732-481f28f671e3', N'Ligero', N'1 año', N'd9128793-0098-4d4c-a308-52fa2ee9e67f', N'Activo', 250.0000, 270.0000, N'cat/libros/01')
INSERT [dbo].[product_information] ([product_id], [product_name], [product_description], [category_id], [weigh_class], [warrently_period], [supllier_id], [product_status], [list_price], [min_price], [catalog_url]) VALUES (N'a0bf422f-6f72-4371-8a80-f35c1170ca08', N'Cuaderno', N'Cuaderno de cuadricula', N'0b3a8546-44ec-4ab9-b3e6-1830e45c696c', N'Ligero', N'1 año', N'03eb704d-3327-4326-aefb-882541655970', N'Activo', 70.0000, 80.0000, N'cat/cuadernos/01')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (N'210e4690-23f0-4acc-af56-4f0312268453', N'Europa')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (N'2d07204b-e11c-4d35-9076-6803cd3034da', N'Africa')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (N'81a4958c-aa0a-46ab-9d8e-95cb5fd0d21e', N'América')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (N'2796506b-1d82-4565-a150-c85014b6e7a9', N'Oceania')
INSERT [dbo].[regions] ([region_id], [region_name]) VALUES (N'cb21c687-dace-4110-ac79-f816e346827f', N'Asia')
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'ae158fd2-2f76-4b66-b3c1-07f59fe16396', N'Envio de paquetes', N'Envios 2', N'eda52bcb-3e5a-4d7c-a2f4-a5e8e199b1b0', 0xE6100000010CE6CC76853E5A404018EB1B98DC4758C0)
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'3998e7b8-b91e-4083-92c1-3684520e582f', N'Envios de paquetes', N'Envios', N'f748b4b1-53f6-49b2-b816-8634bd6cfa7c', 0xE6100000010C211FF46C56354440C74B378941A00DC0)
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'5e475c32-0bf0-4c6b-b9f6-5ffd65c23515', N'Productos defectuosos', N'Defectos', N'f470f6d4-2c8f-4842-ab77-97fa95126a15', 0xE6100000010CDA58897956B448406D3656629E15F5BF)
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'23440c34-39b5-4ee7-ade0-701e156c48ce', N'Almacenar', N'Almacenamiento', N'25722759-d0c1-4f53-ab64-4656264c737a', 0xE6100000010CB285200725F84D4046B1DCD26A503E40)
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'187cf278-86c2-47d2-99f4-a17700fdb726', N'Monitor inventory', N'Inventario', N'0d0c6e0e-2b3f-4ab4-bb91-2b05579ead3c', 0xE6100000010CDE1FEF552B0B3C4040F67AF7C7333AC0)
INSERT [dbo].[warehouses] ([warehouse_id], [warehouse_spec], [wahtehouse_name], [location_id], [wh_geo_location]) VALUES (N'cc125f34-67f7-4af0-b9ad-b051b02ff010', N'Almacenar', N'Almacenamiento 2', N'd58560cf-de6d-4843-9f8b-ba16bebf83e5', 0xE6100000010C0000000000C039402A38BC20221259C0)
ALTER TABLE [dbo].[countries]  WITH CHECK ADD FOREIGN KEY([region_id])
REFERENCES [dbo].[regions] ([region_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[customers]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[employees] ([employee_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[departments]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[employees]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
GO
ALTER TABLE [dbo].[inventories]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product_information] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[inventories]  WITH CHECK ADD FOREIGN KEY([warehouse_id])
REFERENCES [dbo].[warehouses] ([warehouse_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD FOREIGN KEY([department_id])
REFERENCES [dbo].[departments] ([department_id])
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD FOREIGN KEY([employee_id])
REFERENCES [dbo].[employees] ([employee_id])
GO
ALTER TABLE [dbo].[job_history]  WITH CHECK ADD FOREIGN KEY([job_id])
REFERENCES [dbo].[jobs] ([job_id])
GO
ALTER TABLE [dbo].[locations]  WITH CHECK ADD FOREIGN KEY([country_id])
REFERENCES [dbo].[countries] ([country_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([order_id])
REFERENCES [dbo].[orders] ([order_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[order_items]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product_information] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[orders]  WITH CHECK ADD FOREIGN KEY([customer_id])
REFERENCES [dbo].[employees] ([employee_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[product_description]  WITH CHECK ADD FOREIGN KEY([product_id])
REFERENCES [dbo].[product_information] ([product_id])
ON UPDATE CASCADE
GO
ALTER TABLE [dbo].[warehouses]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
GO
ALTER TABLE [dbo].[warehouses]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
GO
ALTER TABLE [dbo].[warehouses]  WITH CHECK ADD FOREIGN KEY([location_id])
REFERENCES [dbo].[locations] ([location_id])
GO
USE [master]
GO
ALTER DATABASE [proyectof] SET  READ_WRITE 
GO
