USE [master]
GO
/****** Object:  Database [Consultorio]    Script Date: 03/03/2018 11:31:42 a.m. ******/
CREATE DATABASE [Consultorio]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Consultorio', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Consultorio.mdf' , SIZE = 5120KB , MAXSIZE = UNLIMITED, FILEGROWTH = 1024KB )
 LOG ON 
( NAME = N'Consultorio_log', FILENAME = N'C:\Program Files (x86)\Microsoft SQL Server\MSSQL11.SQLEXPRESS\MSSQL\DATA\Consultorio_log.ldf' , SIZE = 2048KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [Consultorio] SET COMPATIBILITY_LEVEL = 110
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Consultorio].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Consultorio] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Consultorio] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Consultorio] SET ARITHABORT OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_CREATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Consultorio] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Consultorio] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Consultorio] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Consultorio] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Consultorio] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Consultorio] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Consultorio] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Consultorio] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Consultorio] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Consultorio] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Consultorio] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Consultorio] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Consultorio] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Consultorio] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Consultorio] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Consultorio] SET  MULTI_USER 
GO
ALTER DATABASE [Consultorio] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Consultorio] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Consultorio] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Consultorio] SET TARGET_RECOVERY_TIME = 0 SECONDS 
GO
USE [Consultorio]
GO
/****** Object:  Table [dbo].[Doctores]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Doctores](
	[Nombre] [nchar](10) NOT NULL,
	[Apellidos] [nvarchar](50) NOT NULL,
	[Especialidad] [nvarchar](50) NOT NULL,
	[AñosExperiencia] [tinyint] NOT NULL,
	[Salario] [int] NOT NULL,
	[id_empleado] [char](10) NULL,
	[id_paciente] [nchar](10) NULL,
 CONSTRAINT [DoctorEspecialidad] PRIMARY KEY CLUSTERED 
(
	[Especialidad] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Empleados](
	[IdEmpleado] [char](10) NOT NULL,
	[HoradeEntrada] [datetime] NOT NULL,
	[HoradeSalida] [datetime] NOT NULL,
	[NombreEmpleado] [nchar](10) NOT NULL,
	[SueldodelEmpleado] [nchar](10) NOT NULL,
 CONSTRAINT [IdEmpleadoConsultorio] PRIMARY KEY CLUSTERED 
(
	[IdEmpleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Paciente]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
SET ANSI_PADDING ON
GO
CREATE TABLE [dbo].[Paciente](
	[NombrePaciente] [nchar](10) NOT NULL,
	[ApellidoPaciente] [nchar](10) NOT NULL,
	[FechadeConsulta] [datetime] NOT NULL,
	[NumeroDeConsulta] [char](10) NOT NULL,
	[Expediente] [ntext] NULL,
	[id_producto] [nvarchar](50) NULL,
 CONSTRAINT [NombrePaciente] PRIMARY KEY CLUSTERED 
(
	[NombrePaciente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]

GO
SET ANSI_PADDING OFF
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[IdProducto] [nvarchar](50) NOT NULL,
	[NombreDelProducto] [nchar](10) NOT NULL,
	[FechadeExpiracion] [datetime] NOT NULL,
	[PreciodelProducto] [int] NOT NULL,
 CONSTRAINT [IdProducto] PRIMARY KEY CLUSTERED 
(
	[IdProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[NombreProveedor] [nvarchar](50) NOT NULL,
	[ProximaEntrega] [datetime] NOT NULL,
	[NumeroTelefono] [tinyint] NOT NULL,
	[Correoelectronico] [nvarchar](50) NULL,
	[id_productos] [nvarchar](50) NULL,
 CONSTRAINT [Proveedor] PRIMARY KEY CLUSTERED 
(
	[NombreProveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
/****** Object:  Table [dbo].[Ventas:v]    Script Date: 03/03/2018 11:31:42 a.m. ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Ventas:v](
	[id_ventas] [uniqueidentifier] NOT NULL,
	[id_producto] [nvarchar](50) NULL,
	[importe] [int] NULL,
 CONSTRAINT [PK_Ventas:v] PRIMARY KEY CLUSTERED 
(
	[id_ventas] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [IX_Doctores_Nombre]    Script Date: 03/03/2018 11:31:42 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Doctores_Nombre] ON [dbo].[Doctores]
(
	[Nombre] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Paciente_FechaConsulta]    Script Date: 03/03/2018 11:31:43 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Paciente_FechaConsulta] ON [dbo].[Paciente]
(
	[FechadeConsulta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON

GO
/****** Object:  Index [XProductos_Nombre]    Script Date: 03/03/2018 11:31:43 a.m. ******/
CREATE NONCLUSTERED INDEX [XProductos_Nombre] ON [dbo].[Productos]
(
	[NombreDelProducto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Proveedores_Telefono]    Script Date: 03/03/2018 11:31:43 a.m. ******/
CREATE NONCLUSTERED INDEX [IX_Proveedores_Telefono] ON [dbo].[Proveedores]
(
	[NumeroTelefono] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Doctores]  WITH CHECK ADD  CONSTRAINT [FK_Doctores_Empleados] FOREIGN KEY([id_empleado])
REFERENCES [dbo].[Empleados] ([IdEmpleado])
GO
ALTER TABLE [dbo].[Doctores] CHECK CONSTRAINT [FK_Doctores_Empleados]
GO
ALTER TABLE [dbo].[Doctores]  WITH CHECK ADD  CONSTRAINT [FK_Doctores_Paciente] FOREIGN KEY([id_paciente])
REFERENCES [dbo].[Paciente] ([NombrePaciente])
GO
ALTER TABLE [dbo].[Doctores] CHECK CONSTRAINT [FK_Doctores_Paciente]
GO
ALTER TABLE [dbo].[Paciente]  WITH CHECK ADD  CONSTRAINT [FK_Paciente_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Paciente] CHECK CONSTRAINT [FK_Paciente_Productos]
GO
ALTER TABLE [dbo].[Proveedores]  WITH CHECK ADD  CONSTRAINT [FK_Proveedores_Productos] FOREIGN KEY([id_productos])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Proveedores] CHECK CONSTRAINT [FK_Proveedores_Productos]
GO
ALTER TABLE [dbo].[Ventas:v]  WITH CHECK ADD  CONSTRAINT [FK_Ventas:v_Productos] FOREIGN KEY([id_producto])
REFERENCES [dbo].[Productos] ([IdProducto])
GO
ALTER TABLE [dbo].[Ventas:v] CHECK CONSTRAINT [FK_Ventas:v_Productos]
GO
USE [master]
GO
ALTER DATABASE [Consultorio] SET  READ_WRITE 
GO
