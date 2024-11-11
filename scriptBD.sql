USE [master]
GO
/****** Object:  Database [CINE_2024_BD]    Script Date: 11/11/2024 14:33:48 ******/
CREATE DATABASE [CINE_2024_BD]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CINE_2024_BD', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CINE_2024_BD.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CINE_2024_BD_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL16.MSSQLSERVER\MSSQL\DATA\CINE_2024_BD_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT, LEDGER = OFF
GO
ALTER DATABASE [CINE_2024_BD] SET COMPATIBILITY_LEVEL = 160
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CINE_2024_BD].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CINE_2024_BD] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET ARITHABORT OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CINE_2024_BD] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CINE_2024_BD] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET  ENABLE_BROKER 
GO
ALTER DATABASE [CINE_2024_BD] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CINE_2024_BD] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET RECOVERY FULL 
GO
ALTER DATABASE [CINE_2024_BD] SET  MULTI_USER 
GO
ALTER DATABASE [CINE_2024_BD] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CINE_2024_BD] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CINE_2024_BD] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CINE_2024_BD] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CINE_2024_BD] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CINE_2024_BD] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
EXEC sys.sp_db_vardecimal_storage_format N'CINE_2024_BD', N'ON'
GO
ALTER DATABASE [CINE_2024_BD] SET QUERY_STORE = ON
GO
ALTER DATABASE [CINE_2024_BD] SET QUERY_STORE (OPERATION_MODE = READ_WRITE, CLEANUP_POLICY = (STALE_QUERY_THRESHOLD_DAYS = 30), DATA_FLUSH_INTERVAL_SECONDS = 900, INTERVAL_LENGTH_MINUTES = 60, MAX_STORAGE_SIZE_MB = 1000, QUERY_CAPTURE_MODE = AUTO, SIZE_BASED_CLEANUP_MODE = AUTO, MAX_PLANS_PER_QUERY = 200, WAIT_STATS_CAPTURE_MODE = ON)
GO
USE [CINE_2024_BD]
GO
/****** Object:  Table [dbo].[Butacas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Butacas](
	[id_butaca] [int] IDENTITY(1,1) NOT NULL,
	[id_sala] [int] NULL,
	[numero_butaca] [int] NOT NULL,
	[fila] [int] NOT NULL,
 CONSTRAINT [pk_butacas] PRIMARY KEY CLUSTERED 
(
	[id_butaca] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clasificaciones](
	[id_clasificacion] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_clasificacion] PRIMARY KEY CLUSTERED 
(
	[id_clasificacion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Clientes](
	[id_cliente] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[apellido] [varchar](50) NOT NULL,
	[email] [varchar](50) NULL,
	[telefono] [varchar](50) NOT NULL,
	[id_tipo_cliente] [int] NULL,
	[contrasena] [varchar](50) NULL,
 CONSTRAINT [pk_Clientes] PRIMARY KEY CLUSTERED 
(
	[id_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Compras]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Compras](
	[id_compra] [int] IDENTITY(1,1) NOT NULL,
	[fechaCompra] [datetime] NOT NULL,
	[montoTotal] [money] NOT NULL,
	[id_cliente] [int] NULL,
	[id_formaPago] [int] NULL,
 CONSTRAINT [pk_compras] PRIMARY KEY CLUSTERED 
(
	[id_compra] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Comprobantes]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Comprobantes](
	[id_comprobante] [int] IDENTITY(1,1) NOT NULL,
	[id_compra] [int] NOT NULL,
	[fechaEmision] [datetime] NOT NULL,
	[total] [decimal](6, 2) NOT NULL,
	[id_forma_pago] [int] NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_pelicula] [int] NOT NULL,
	[id_sala] [int] NOT NULL,
	[id_funcion] [int] NOT NULL,
 CONSTRAINT [pk_comprobante] PRIMARY KEY CLUSTERED 
(
	[id_comprobante] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[DetallesComprobante]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[DetallesComprobante](
	[id_detalle] [int] IDENTITY(1,1) NOT NULL,
	[id_comprobante] [int] NULL,
	[id_entrada] [int] NULL,
	[precio] [money] NULL,
 CONSTRAINT [pk_DetallesComprobante] PRIMARY KEY CLUSTERED 
(
	[id_detalle] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Entradas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Entradas](
	[id_entrada] [int] IDENTITY(1,1) NOT NULL,
	[precio] [int] NOT NULL,
	[id_compra] [int] NULL,
	[id_funcion] [int] NULL,
	[id_butaca] [int] NULL,
 CONSTRAINT [pk_entradas] PRIMARY KEY CLUSTERED 
(
	[id_entrada] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[FormasPago]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[FormasPago](
	[id_formaPago] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_formaPago] PRIMARY KEY CLUSTERED 
(
	[id_formaPago] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Funciones]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Funciones](
	[id_funcion] [int] IDENTITY(1,1) NOT NULL,
	[id_pelicula] [int] NULL,
	[id_sala] [int] NULL,
	[fecha] [datetime] NOT NULL,
	[hora] [int] NULL,
	[precio_base] [money] NOT NULL,
	[id_promocion] [int] NULL,
 CONSTRAINT [pk_funciones] PRIMARY KEY CLUSTERED 
(
	[id_funcion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Generos]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Generos](
	[id_genero] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_genero] PRIMARY KEY CLUSTERED 
(
	[id_genero] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Peliculas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Peliculas](
	[id_pelicula] [int] IDENTITY(1,1) NOT NULL,
	[titulo] [varchar](50) NOT NULL,
	[id_genero] [int] NULL,
	[duracion] [int] NOT NULL,
	[id_clasificacion] [int] NULL,
 CONSTRAINT [pk_peliculas] PRIMARY KEY CLUSTERED 
(
	[id_pelicula] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Promociones]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Promociones](
	[id_promocion] [int] IDENTITY(1,1) NOT NULL,
	[descrpcion] [varchar](100) NULL,
	[descuento] [int] NULL,
	[fechaInicio] [datetime] NULL,
	[fechaFin] [datetime] NULL,
 CONSTRAINT [pk_promociones] PRIMARY KEY CLUSTERED 
(
	[id_promocion] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reservas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reservas](
	[id_reserva] [int] IDENTITY(1,1) NOT NULL,
	[id_cliente] [int] NOT NULL,
	[id_funcion] [int] NOT NULL,
	[id_butaca] [int] NOT NULL,
	[fechaReserva] [datetime] NOT NULL,
	[estado] [varchar](50) NOT NULL,
 CONSTRAINT [pk_reserva] PRIMARY KEY CLUSTERED 
(
	[id_reserva] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Salas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Salas](
	[id_sala] [int] IDENTITY(1,1) NOT NULL,
	[nombre] [varchar](50) NOT NULL,
	[id_tipo_sala] [int] NULL,
	[capacidad] [int] NULL,
 CONSTRAINT [pk_Salas] PRIMARY KEY CLUSTERED 
(
	[id_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Tickets]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Tickets](
	[id_ticket] [int] IDENTITY(1,1) NOT NULL,
	[id_entrada] [int] NULL,
	[id_pelicula] [int] NULL,
	[id_funcion] [int] NULL,
	[id_sala] [int] NULL,
	[id_butaca] [int] NULL,
	[fechaFuncion] [datetime] NULL,
 CONSTRAINT [pk_tickets] PRIMARY KEY CLUSTERED 
(
	[id_ticket] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoClientes]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoClientes](
	[id_tipo_cliente] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_tipoCliente] PRIMARY KEY CLUSTERED 
(
	[id_tipo_cliente] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TipoSalas]    Script Date: 11/11/2024 14:33:49 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TipoSalas](
	[id_tipo_sala] [int] IDENTITY(1,1) NOT NULL,
	[descripcion] [varchar](50) NOT NULL,
 CONSTRAINT [pk_tipoSala] PRIMARY KEY CLUSTERED 
(
	[id_tipo_sala] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Butacas]  WITH CHECK ADD  CONSTRAINT [fk_butacas_salas] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Butacas] CHECK CONSTRAINT [fk_butacas_salas]
GO
ALTER TABLE [dbo].[Clientes]  WITH CHECK ADD  CONSTRAINT [fk_clientes_tipoCliente] FOREIGN KEY([id_tipo_cliente])
REFERENCES [dbo].[TipoClientes] ([id_tipo_cliente])
GO
ALTER TABLE [dbo].[Clientes] CHECK CONSTRAINT [fk_clientes_tipoCliente]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_compras_clientes] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_compras_clientes]
GO
ALTER TABLE [dbo].[Compras]  WITH CHECK ADD  CONSTRAINT [fk_compras_formasPago] FOREIGN KEY([id_formaPago])
REFERENCES [dbo].[FormasPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[Compras] CHECK CONSTRAINT [fk_compras_formasPago]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_compra] FOREIGN KEY([id_compra])
REFERENCES [dbo].[Compras] ([id_compra])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_compra]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_forma_pago] FOREIGN KEY([id_forma_pago])
REFERENCES [dbo].[FormasPago] ([id_formaPago])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_forma_pago]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_funcion] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_funcion]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_id_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_id_cliente]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_id_sala] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_id_sala]
GO
ALTER TABLE [dbo].[Comprobantes]  WITH CHECK ADD  CONSTRAINT [fk_pelicula] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Comprobantes] CHECK CONSTRAINT [fk_pelicula]
GO
ALTER TABLE [dbo].[DetallesComprobante]  WITH CHECK ADD  CONSTRAINT [fk_DetalleComprobante_entrada] FOREIGN KEY([id_entrada])
REFERENCES [dbo].[Entradas] ([id_entrada])
GO
ALTER TABLE [dbo].[DetallesComprobante] CHECK CONSTRAINT [fk_DetalleComprobante_entrada]
GO
ALTER TABLE [dbo].[DetallesComprobante]  WITH CHECK ADD  CONSTRAINT [fk_DetallesComprobante_comprobante] FOREIGN KEY([id_comprobante])
REFERENCES [dbo].[Comprobantes] ([id_comprobante])
GO
ALTER TABLE [dbo].[DetallesComprobante] CHECK CONSTRAINT [fk_DetallesComprobante_comprobante]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [fk_entradas_butacas] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [fk_entradas_butacas]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [fk_entradas_compras] FOREIGN KEY([id_compra])
REFERENCES [dbo].[Compras] ([id_compra])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [fk_entradas_compras]
GO
ALTER TABLE [dbo].[Entradas]  WITH CHECK ADD  CONSTRAINT [fk_entradas_funciones] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Entradas] CHECK CONSTRAINT [fk_entradas_funciones]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [fk_funciones_peliculas] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [fk_funciones_peliculas]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [fk_funciones_promociones] FOREIGN KEY([id_promocion])
REFERENCES [dbo].[Promociones] ([id_promocion])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [fk_funciones_promociones]
GO
ALTER TABLE [dbo].[Funciones]  WITH CHECK ADD  CONSTRAINT [fk_funciones_salas] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Funciones] CHECK CONSTRAINT [fk_funciones_salas]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_clasificaciones] FOREIGN KEY([id_clasificacion])
REFERENCES [dbo].[Clasificaciones] ([id_clasificacion])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [fk_peliculas_clasificaciones]
GO
ALTER TABLE [dbo].[Peliculas]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_generos] FOREIGN KEY([id_genero])
REFERENCES [dbo].[Generos] ([id_genero])
GO
ALTER TABLE [dbo].[Peliculas] CHECK CONSTRAINT [fk_peliculas_generos]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [fk_reserva_butaca] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [fk_reserva_butaca]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [fk_reserva_cliente] FOREIGN KEY([id_cliente])
REFERENCES [dbo].[Clientes] ([id_cliente])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [fk_reserva_cliente]
GO
ALTER TABLE [dbo].[Reservas]  WITH CHECK ADD  CONSTRAINT [fk_reserva_funcion] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Reservas] CHECK CONSTRAINT [fk_reserva_funcion]
GO
ALTER TABLE [dbo].[Salas]  WITH CHECK ADD  CONSTRAINT [fk_salas_tipoSala] FOREIGN KEY([id_tipo_sala])
REFERENCES [dbo].[TipoSalas] ([id_tipo_sala])
GO
ALTER TABLE [dbo].[Salas] CHECK CONSTRAINT [fk_salas_tipoSala]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_butacas_tickets] FOREIGN KEY([id_butaca])
REFERENCES [dbo].[Butacas] ([id_butaca])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_butacas_tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_entradas_tickets] FOREIGN KEY([id_entrada])
REFERENCES [dbo].[Entradas] ([id_entrada])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_entradas_tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_funcion_tickets] FOREIGN KEY([id_funcion])
REFERENCES [dbo].[Funciones] ([id_funcion])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_funcion_tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_peliculas_tickets] FOREIGN KEY([id_pelicula])
REFERENCES [dbo].[Peliculas] ([id_pelicula])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_peliculas_tickets]
GO
ALTER TABLE [dbo].[Tickets]  WITH CHECK ADD  CONSTRAINT [fk_salas_tickets] FOREIGN KEY([id_sala])
REFERENCES [dbo].[Salas] ([id_sala])
GO
ALTER TABLE [dbo].[Tickets] CHECK CONSTRAINT [fk_salas_tickets]
GO
USE [master]
GO
ALTER DATABASE [CINE_2024_BD] SET  READ_WRITE 
GO
