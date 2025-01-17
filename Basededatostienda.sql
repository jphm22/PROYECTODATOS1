USE [master]
GO
/****** Object:  Database [Tienda_bestsecurity]    Script Date: 4/12/2023 23:54:23 ******/
CREATE DATABASE [Tienda_bestsecurity]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Tienda_bestsecurity', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tienda_bestsecurity.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Tienda_bestsecurity_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\Tienda_bestsecurity_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [Tienda_bestsecurity] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Tienda_bestsecurity].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Tienda_bestsecurity] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ARITHABORT OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Tienda_bestsecurity] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Tienda_bestsecurity] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET  ENABLE_BROKER 
GO
ALTER DATABASE [Tienda_bestsecurity] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Tienda_bestsecurity] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET RECOVERY FULL 
GO
ALTER DATABASE [Tienda_bestsecurity] SET  MULTI_USER 
GO
ALTER DATABASE [Tienda_bestsecurity] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Tienda_bestsecurity] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Tienda_bestsecurity] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Tienda_bestsecurity] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Tienda_bestsecurity] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Tienda_bestsecurity] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'Tienda_bestsecurity', N'ON'
GO
ALTER DATABASE [Tienda_bestsecurity] SET QUERY_STORE = ON
GO
ALTER DATABASE [Tienda_bestsecurity] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [Tienda_bestsecurity]
GO
/****** Object:  Table [dbo].[CategoriasProductos]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CategoriasProductos](
	[ID_Categoria] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Categoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[ID_Cliente] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](255) NULL,
	[ID_Contacto] [int] NULL,
	[ID_Red] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Contactos]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Contactos](
	[ID_Contacto] [int] NOT NULL,
	[Tipo] [varchar](50) NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Correo] [varchar](255) NULL,
	[Telefono] [varchar](15) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Contacto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesVenta]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesVenta](
	[ID_Detalle] [int] NOT NULL,
	[ID_Venta] [int] NULL,
	[ID_Producto] [int] NULL,
	[Cantidad] [int] NULL,
	[PrecioUnitario] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Empleados]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Empleados](
	[ID_Empleado] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NULL,
	[Correo] [varchar](255) NULL,
	[ID_Local] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Empleado] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Locales]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Locales](
	[ID_Local] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Direccion] [varchar](255) NULL,
	[Distrito] [varchar](255) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](255) NULL,
	[ID_Proveedor] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Local] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Productos]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Productos](
	[ID_Producto] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[ID_Subcategoria] [int] NULL,
	[Cantidad] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Producto] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Proveedores]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Proveedores](
	[ID_Proveedor] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Apellido] [varchar](255) NULL,
	[Telefono] [varchar](15) NULL,
	[Correo] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Proveedor] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[RedesSociales]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[RedesSociales](
	[ID_Red] [int] NOT NULL,
	[Nombre] [varchar](255) NOT NULL,
	[Enlace] [varchar](255) NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Red] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SubcategoriasProductos]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SubcategoriasProductos](
	[ID_Subcategoria] [int] NOT NULL,
	[ID_Categoria] [int] NULL,
	[Nombre] [varchar](255) NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Subcategoria] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Venta]    Script Date: 4/12/2023 23:54:25 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Venta](
	[ID_Venta] [int] NOT NULL,
	[ID_Empleado] [int] NULL,
	[ID_Cliente] [int] NULL,
	[Fecha] [date] NULL,
	[Total] [int] NULL,
PRIMARY KEY CLUSTERED 
(
	[ID_Venta] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (1, N'Alarmas')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (2, N'Alimentación')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (3, N'Cables')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (4, N'Cercos eléctricos')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (5, N'Incendio')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (6, N'Iluminación')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (7, N'Telefonía Inalámbrica')
INSERT [dbo].[CategoriasProductos] ([ID_Categoria], [Nombre]) VALUES (8, N'Videovigilancia')
GO
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (1, N'Ana', N'Morales', N'911222333', N'ana.morales@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (2, N'Carlos', N'González', N'922333444', N'carlos.gonzalez@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (3, N'Laura', N'Rodriguez', N'933444555', N'laura.rodriguez@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (4, N'Roberto', N'Martinez', N'944555666', N'roberto.martinez@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (5, N'Sofia', N'Herrera', N'955666777', N'sofia.herrera@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (6, N'Juan', N'Ramirez', N'966777888', N'juan.ramirez@gmail.com', 1, 1)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (7, N'Andrea', N'Castro', N'977888999', N'andrea.castro@gmail.com', 2, 2)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (8, N'Pedro', N'Diaz', N'988999000', N'pedro.diaz@gmail.com', 2, 2)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (9, N'Carolina', N'Vargas', N'999000111', N'carolina.vargas@gmail.com', 2, 3)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (10, N'Miguel', N'Lopez', N'900111222', N'miguel.lopez@gmail.com', 2, 3)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (11, N'Valeria', N'Flores', N'923456789', N'valeria.flores@gmail.com', 2, 4)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (12, N'Javier', N'Ortiz', N'934567890', N'javier.ortiz@gmail.com', 3, 4)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (13, N'Mariana', N'Sanchez', N'945678901', N'mariana.sanchez@gmail.com', 3, 4)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (14, N'Gabriel', N'Fernandez', N'956789012', N'gabriel.fernandez@gmail.com', 3, 4)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (15, N'Isabel', N'Castro', N'967890123', N'isabel.castro@gmail.com', 3, 5)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (16, N'Daniel', N'Ramirez', N'978901234', N'daniel.ramirez@gmail.com', 3, 5)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (17, N'Adriana', N'Torres', N'989012345', N'adriana.torres@gmail.com', 3, 5)
INSERT [dbo].[Clientes] ([ID_Cliente], [Nombre], [Apellido], [Telefono], [Correo], [ID_Contacto], [ID_Red]) VALUES (18, N'Alejandro', N'Martinez', N'990123456', N'alejandro.tinez@gmail.com', 3, 5)
GO
INSERT [dbo].[Contactos] ([ID_Contacto], [Tipo], [Nombre], [Correo], [Telefono]) VALUES (1, N'Soporte', N'Soporte Técnico', N'soporte@tienda.com', N'923563780')
INSERT [dbo].[Contactos] ([ID_Contacto], [Tipo], [Nombre], [Correo], [Telefono]) VALUES (2, N'Proyecto', N'Proyecto', N'proyecto@tienda.com', N'987651320')
INSERT [dbo].[Contactos] ([ID_Contacto], [Tipo], [Nombre], [Correo], [Telefono]) VALUES (3, N'Tienda', N'Ventas', N'ventas@tienda.com', N'456783123')
GO
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (1, 1, 1, 2, 150)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (2, 1, 2, 1, 20)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (3, 2, 3, 3, 5)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (4, 3, 4, 1, 30)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (5, 4, 5, 2, 15)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (6, 5, 6, 1, 10)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (7, 6, 7, 2, 40)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (8, 7, 8, 1, 25)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (9, 8, 9, 3, 8)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (10, 9, 10, 1, 35)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (11, 10, 11, 2, 18)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (12, 11, 12, 1, 60)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (13, 12, 13, 3, 12)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (14, 13, 14, 1, 48)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (15, 14, 15, 2, 80)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (16, 15, 16, 1, 100)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (17, 16, 17, 2, 70)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (18, 17, 18, 1, 22)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (19, 18, 19, 3, 14)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (20, 1, 20, 1, 32)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (21, 2, 21, 2, 28)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (22, 3, 22, 1, 45)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (23, 4, 23, 3, 15)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (24, 5, 24, 1, 19)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (25, 6, 25, 2, 38)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (26, 7, 26, 1, 75)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (27, 8, 27, 2, 90)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (28, 9, 28, 1, 55)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (29, 10, 29, 3, 30)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (30, 11, 30, 1, 42)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (31, 12, 31, 2, 60)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (32, 13, 32, 1, 110)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (33, 14, 33, 2, 75)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (34, 15, 34, 1, 140)
INSERT [dbo].[DetallesVenta] ([ID_Detalle], [ID_Venta], [ID_Producto], [Cantidad], [PrecioUnitario]) VALUES (35, 16, 35, 3, 90)
GO
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (1, N'Juan', N'Perez', N'juan.perez@bestsecurity.com', 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (2, N'Maria', N'Rodriguez', N'maria.rodriguez@bestsecurity.com', 1)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (3, N'Carlos', N'Fernandez', N'carlos.fernandez@bestsecurity.com', 2)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (4, N'Laura', N'Gomez', N'laura.gomez@bestsecurity.com', 2)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (5, N'Javier', N'Lopez', N'javier.lopez@bestsecurity.com', 3)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (6, N'Ana', N'Martinez', N'ana.martinez@bestsecurity.com', 3)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (7, N'Luis', N'Ramirez', N'luis.ramirez@bestsecurity.com', 4)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (8, N'Sofia', N'Herrera', N'sofia.herrera@bestsecurity.com', 4)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (9, N'Daniel', N'Castro', N'daniel.castro@bestsecurity.com', 5)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (10, N'Carolina', N'Vargas', N'carolina.vargas@bestsecurity.com', 5)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (11, N'Alejandro', N'Diaz', N'alejandro.diaz@bestsecurity.com', 6)
INSERT [dbo].[Empleados] ([ID_Empleado], [Nombre], [Apellido], [Correo], [ID_Local]) VALUES (12, N'Paula', N'Torres', N'paula.torres@bestsecurity.com', 6)
GO
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (1, N'Beltrán', N'Calle Rodolfo Beltran 134, Santa Catalina', N'La Victoria', N'994119158', N'ventas2@bestsecurityperu.com', 1)
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (2, N'Ate', N'Calle Rene Descartes 370', N'Ate', N'981490775', N'ventasate@bestsecurityperu.com', 2)
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (3, N'Pachitea', N'Jr. Pachitea 364', N'Cercado de Lima', N'946390453', N'ventaspachitea@bestsecurityperu.com', 2)
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (4, N'Marsano', N'Av. Tomás Marsano 1499 Tienda 16A-17A', N'Surquillo', N'950104695', N'ventasmarsano@bestsecurityperu.com', 3)
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (5, N'CyberPlaza', N'Av. Inca Garcilaso de la Vega 1348. SSA 112-113', N'Cercado Lima', N'934197657', N'ventascyberplaza@bestsecurityperu.com', 3)
INSERT [dbo].[Locales] ([ID_Local], [Nombre], [Direccion], [Distrito], [Telefono], [Correo], [ID_Proveedor]) VALUES (6, N'Paruro', N'Jr. Paruro 1355-1356. Tienda 228 2do. Piso', N'Cercado de Lima', N'946085078', N'ventasparuro@bestsecurityperu.com', 4)
GO
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (1, N'MODULO AMPLIFICADOR', 1, 50)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (2, N'PANEL DE ALARMA', 1, 100)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (3, N'PIR INALAMBRICO ANTIMASCOTAS', 1, 200)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (4, N'PANEL DE ALARMA 15', 2, 80)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (5, N'FOTOELÉCTRICO', 2, 150)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (6, N'SENSOR INFRARROJO', 2, 120)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (7, N'ALARMA COMUNITARIA', 3, 60)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (8, N'BATERIA 7AMP', 4, 90)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (9, N'BATERIA 1.3AMP', 4, 180)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (10, N'FUENTE AC24V', 5, 70)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (11, N'FUENTE DC12V', 5, 110)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (12, N'HAGROY UL', 6, 40)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (13, N'CERO HALOGENO FPL LSZH', 7, 130)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (14, N'ALARMA 4X22', 8, 55)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (15, N'ENERGIZADOR YANEX', 9, 30)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (16, N'ELECTRIFICADOR XPOWER', 9, 20)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (17, N'ENERGIZADOR HR', 9, 45)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (18, N'DETECTOR DE HUMO', 10, 95)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (19, N'RECEPTOR OPTICO', 10, 140)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (20, N'REPETIDOR INALAMBRICO', 11, 75)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (21, N'TECLADO PARA SERIE VISTA128', 11, 85)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (22, N'ANUNCIADOR REMOTO MIRCOM', 12, 50)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (23, N'MODULO DE RELE', 12, 110)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (24, N'LUZ DE EMERGENCIA 24 LED', 13, 100)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (25, N'LUZ DE EMERGENCIA 72 LED', 13, 60)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (26, N'CENTRAL COMUNIC 48', 14, 25)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (27, N'CENTRAL DE CONDOMINIOS', 14, 15)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (28, N'TXPE 1001 PLUS', 15, 35)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (29, N'TELEFONO ANÁLOGO', 15, 50)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (30, N'CÁMARA PINHOLE', 16, 40)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (31, N'CÁMARA DE RED', 16, 30)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (32, N'GRABADOR XVR 8', 17, 18)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (33, N'GRABADOR XVR 4', 17, 25)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (34, N'GRABADOR NVR 16', 18, 12)
INSERT [dbo].[Productos] ([ID_Producto], [Nombre], [ID_Subcategoria], [Cantidad]) VALUES (35, N'GRABADOR NVR 4', 18, 20)
GO
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (1, N'Marta', N'Sánchez', N'987654321', N'marta.sanchez@proveedor.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (2, N'Andrés', N'Torres', N'976543210', N'andres.torres@proveedor.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (3, N'Beatriz', N'López', N'965432109', N'beatriz.lopez@proveedor.com')
INSERT [dbo].[Proveedores] ([ID_Proveedor], [Nombre], [Apellido], [Telefono], [Correo]) VALUES (4, N'Gabriel', N'Ramirez', N'954321098', N'gabriel.ramirez@proveedor.com')
GO
INSERT [dbo].[RedesSociales] ([ID_Red], [Nombre], [Enlace]) VALUES (1, N'Facebook', N'https://www.facebook.com/bsperu')
INSERT [dbo].[RedesSociales] ([ID_Red], [Nombre], [Enlace]) VALUES (2, N'Tiktok', N'https://www.instagram.com/bestperu/')
INSERT [dbo].[RedesSociales] ([ID_Red], [Nombre], [Enlace]) VALUES (3, N'Instagram', N'https://www.tiktok.com/@bestsecurity.peru')
INSERT [dbo].[RedesSociales] ([ID_Red], [Nombre], [Enlace]) VALUES (4, N'Youtube', N'https://www.youtube.com/user/bestsecurityperu')
INSERT [dbo].[RedesSociales] ([ID_Red], [Nombre], [Enlace]) VALUES (5, N'Linkedin', N'https://www.linkedin.com/company/best-security-del-per%C3%BA')
GO
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (1, 1, N'Residencial')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (2, 1, N'Industrial')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (3, 1, N'Comunitaria')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (4, 2, N'Batería')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (5, 2, N'Fuente')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (6, 3, N'Contra incendio')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (7, 3, N'Cero Halogeno')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (8, 3, N'Contra intrusión')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (9, 4, N'Electrificadores')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (10, 5, N'Sistemas Convencionales')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (11, 5, N'Sistemas Híbridos')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (12, 5, N'Sistemas Direccionables')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (13, 6, N'Luces de Emergencia')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (14, 7, N'Centrales de condominio')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (15, 7, N'Telefonía')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (16, 8, N'Cámaras')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (17, 8, N'XVR')
INSERT [dbo].[SubcategoriasProductos] ([ID_Subcategoria], [ID_Categoria], [Nombre]) VALUES (18, 8, N'NVR')
GO
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (1, 1, 1, CAST(N'2023-01-15' AS Date), 550)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (2, 2, 2, CAST(N'2023-02-20' AS Date), 920)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (3, 3, 3, CAST(N'2023-03-10' AS Date), 320)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (4, 4, 4, CAST(N'2023-04-05' AS Date), 750)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (5, 5, 5, CAST(N'2023-05-12' AS Date), 410)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (6, 6, 6, CAST(N'2023-06-18' AS Date), 1450)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (7, 7, 7, CAST(N'2023-07-22' AS Date), 590)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (8, 8, 8, CAST(N'2023-08-09' AS Date), 180)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (9, 9, 9, CAST(N'2023-09-30' AS Date), 810)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (10, 10, 10, CAST(N'2023-10-14' AS Date), 1120)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (11, 11, 11, CAST(N'2023-11-25' AS Date), 490)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (12, 12, 12, CAST(N'2023-12-28' AS Date), 680)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (13, 1, 13, CAST(N'2023-01-02' AS Date), 870)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (14, 2, 14, CAST(N'2023-02-17' AS Date), 580)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (15, 3, 15, CAST(N'2023-03-30' AS Date), 330)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (16, 4, 16, CAST(N'2023-04-12' AS Date), 760)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (17, 5, 17, CAST(N'2023-05-25' AS Date), 420)
INSERT [dbo].[Venta] ([ID_Venta], [ID_Empleado], [ID_Cliente], [Fecha], [Total]) VALUES (18, 6, 18, CAST(N'2023-06-29' AS Date), 950)
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([ID_Contacto])
REFERENCES [dbo].[Contactos] ([ID_Contacto])
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD FOREIGN KEY([ID_Red])
REFERENCES [dbo].[RedesSociales] ([ID_Red])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([ID_Producto])
REFERENCES [dbo].[Productos] ([ID_Producto])
GO
ALTER TABLE [dbo].[DetallesVenta]  WITH CHECK ADD FOREIGN KEY([ID_Venta])
REFERENCES [dbo].[Venta] ([ID_Venta])
GO
ALTER TABLE [dbo].[Empleados]  WITH CHECK ADD FOREIGN KEY([ID_Local])
REFERENCES [dbo].[Locales] ([ID_Local])
GO
ALTER TABLE [dbo].[Locales]  WITH CHECK ADD FOREIGN KEY([ID_Proveedor])
REFERENCES [dbo].[Proveedores] ([ID_Proveedor])
GO
ALTER TABLE [dbo].[Productos]  WITH CHECK ADD FOREIGN KEY([ID_Subcategoria])
REFERENCES [dbo].[SubcategoriasProductos] ([ID_Subcategoria])
GO
ALTER TABLE [dbo].[SubcategoriasProductos]  WITH CHECK ADD FOREIGN KEY([ID_Categoria])
REFERENCES [dbo].[CategoriasProductos] ([ID_Categoria])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([ID_Cliente])
REFERENCES [dbo].[Clientes] ([ID_Cliente])
GO
ALTER TABLE [dbo].[Venta]  WITH CHECK ADD FOREIGN KEY([ID_Empleado])
REFERENCES [dbo].[Empleados] ([ID_Empleado])
GO
USE [master]
GO
ALTER DATABASE [Tienda_bestsecurity] SET  READ_WRITE 
GO
