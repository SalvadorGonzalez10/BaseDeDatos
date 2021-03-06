USE [master]
GO
/****** Object:  Database [TacosBerna]    Script Date: 27/04/2018 06:24:17 p. m. ******/
CREATE DATABASE [TacosBerna]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TacosBerna', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TacosBerna.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TacosBerna_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\TacosBerna_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [TacosBerna] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TacosBerna].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TacosBerna] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TacosBerna] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TacosBerna] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TacosBerna] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TacosBerna] SET ARITHABORT OFF 
GO
ALTER DATABASE [TacosBerna] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TacosBerna] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TacosBerna] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TacosBerna] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TacosBerna] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TacosBerna] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TacosBerna] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TacosBerna] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TacosBerna] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TacosBerna] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TacosBerna] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TacosBerna] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TacosBerna] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TacosBerna] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TacosBerna] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TacosBerna] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TacosBerna] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TacosBerna] SET RECOVERY FULL 
GO
ALTER DATABASE [TacosBerna] SET  MULTI_USER 
GO
ALTER DATABASE [TacosBerna] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TacosBerna] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TacosBerna] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TacosBerna] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TacosBerna] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'TacosBerna', N'ON'
GO
ALTER DATABASE [TacosBerna] SET QUERY_STORE = OFF
GO
USE [TacosBerna]
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
USE [TacosBerna]
GO
/****** Object:  Table [dbo].[Cargo]    Script Date: 27/04/2018 06:24:17 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cargo](
	[Id_cargo] [int] NOT NULL,
	[Cargo] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Cliente]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Cliente](
	[Id_Cliente] [int] NOT NULL,
	[Nombres_Cliente] [varchar](50) NOT NULL,
	[Apellidos_Cliente] [varchar](50) NOT NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Direccion_Cliente] [varchar](50) NOT NULL,
	[Tipo_Cliente] [varchar](50) NOT NULL,
	[FechaNacimiento] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleo]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleo](
	[Id_tipo_personal] [int] NOT NULL,
	[Tipo_empleo] [varchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insumo]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insumo](
	[Id_insumo] [int] NOT NULL,
	[Nombre_insumo] [varchar](15) NOT NULL,
	[Cantidad_insumo] [int] NOT NULL,
	[Unidad_medida_insumo] [nchar](10) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Insumo_Producto]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Insumo_Producto](
	[Id_insumo] [int] NOT NULL,
	[Id_producto] [int] NOT NULL,
	[Cantidad_Insumo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Mesa]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Mesa](
	[Id_Mesa] [int] NOT NULL,
	[Capacidad] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Pedido]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Pedido](
	[Id_Pedido] [int] NOT NULL,
	[Id_Cliente] [int] NOT NULL,
	[Tipo_Pedido] [varchar](50) NOT NULL,
	[Id_Mesa] [int] NOT NULL,
	[Id_Personal] [varchar](50) NOT NULL,
	[Fecha_Pedido] [date] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Personal]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Personal](
	[Id_personal] [int] NOT NULL,
	[Nombres] [varchar](50) NOT NULL,
	[Apellidos] [varchar](50) NOT NULL,
	[Id_tipo_personal] [int] NOT NULL,
	[Salario] [money] NOT NULL,
	[Direccion] [varchar](50) NULL,
	[Telefono] [varchar](50) NOT NULL,
	[Correo] [varchar](50) NULL,
	[Id_cargo] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto]    Script Date: 27/04/2018 06:24:18 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto](
	[Id_producto] [int] NOT NULL,
	[Precio_producto] [money] NOT NULL,
	[Tipo_producto] [varchar](50) NOT NULL,
	[Descripcion_producto] [varchar](80) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Producto_Pedido]    Script Date: 27/04/2018 06:24:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Producto_Pedido](
	[Id_Pedido] [int] NOT NULL,
	[Id_Producto] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor]    Script Date: 27/04/2018 06:24:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor](
	[Id_proveedor] [int] NOT NULL,
	[Nombre_proveedor] [varchar](30) NOT NULL,
	[Direccion_proveedor] [varchar](50) NOT NULL,
	[Telefono_proveedor] [varchar](12) NOT NULL,
	[Mail_proveedor] [varchar](20) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedor_Insumo]    Script Date: 27/04/2018 06:24:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedor_Insumo](
	[Id_Proveedor] [int] NOT NULL,
	[Id_insumo] [int] NOT NULL,
	[Precio_insumo] [money] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 27/04/2018 06:24:19 p. m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[Id_Venta] [int] NOT NULL,
	[Fecha] [date] NOT NULL,
	[Subtotal] [money] NOT NULL,
	[Propina] [money] NOT NULL,
	[Total] [money] NOT NULL,
	[Efectivo] [money] NOT NULL,
	[Cambio] [money] NOT NULL,
	[Id_Pedido] [int] NOT NULL
) ON [PRIMARY]
GO
USE [master]
GO
ALTER DATABASE [TacosBerna] SET  READ_WRITE 
GO
