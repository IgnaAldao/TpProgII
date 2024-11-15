USE [CINE_2024_BD]
GO
/****** Object:  Table [dbo].[Butacas]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Clasificaciones]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Clientes]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Compras]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Comprobantes]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[DetallesComprobante]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Entradas]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[FormasPago]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Funciones]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Generos]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Peliculas]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Promociones]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Reservas]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Salas]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[Tickets]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[TipoClientes]    Script Date: 11/11/2024 17:35:51 ******/
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
/****** Object:  Table [dbo].[TipoSalas]    Script Date: 11/11/2024 17:35:51 ******/
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
SET IDENTITY_INSERT [dbo].[Butacas] ON 

INSERT [dbo].[Butacas] ([id_butaca], [id_sala], [numero_butaca], [fila]) VALUES (1, 1, 1, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala], [numero_butaca], [fila]) VALUES (2, 1, 2, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala], [numero_butaca], [fila]) VALUES (3, 1, 1, 2)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala], [numero_butaca], [fila]) VALUES (4, 2, 1, 1)
INSERT [dbo].[Butacas] ([id_butaca], [id_sala], [numero_butaca], [fila]) VALUES (5, 2, 2, 1)
SET IDENTITY_INSERT [dbo].[Butacas] OFF
GO
SET IDENTITY_INSERT [dbo].[Clasificaciones] ON 

INSERT [dbo].[Clasificaciones] ([id_clasificacion], [descripcion]) VALUES (1, N'G')
INSERT [dbo].[Clasificaciones] ([id_clasificacion], [descripcion]) VALUES (2, N'PG')
INSERT [dbo].[Clasificaciones] ([id_clasificacion], [descripcion]) VALUES (3, N'PG-13')
INSERT [dbo].[Clasificaciones] ([id_clasificacion], [descripcion]) VALUES (4, N'R')
SET IDENTITY_INSERT [dbo].[Clasificaciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Clientes] ON 

INSERT [dbo].[Clientes] ([id_cliente], [nombre], [apellido], [email], [telefono], [id_tipo_cliente], [contrasena]) VALUES (1, N'Juan', N'Perez', N'juan.perez@example.com', N'12345678', 1, N'asd12')
INSERT [dbo].[Clientes] ([id_cliente], [nombre], [apellido], [email], [telefono], [id_tipo_cliente], [contrasena]) VALUES (2, N'Maria', N'Gómez', N'maria.gomez@example.com', N'87654321', 1, N'holachau')
INSERT [dbo].[Clientes] ([id_cliente], [nombre], [apellido], [email], [telefono], [id_tipo_cliente], [contrasena]) VALUES (1002, N'Nacho', N'Aldao', N'igna.aldao@gmail.com', N'3513450734', 1002, N'chau321')
SET IDENTITY_INSERT [dbo].[Clientes] OFF
GO
SET IDENTITY_INSERT [dbo].[Compras] ON 

INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1, CAST(N'2024-10-19T00:00:00.000' AS DateTime), 80.0000, 1, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (2, CAST(N'2024-10-20T00:00:00.000' AS DateTime), 60.0000, 2, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (3, CAST(N'2024-09-10T00:00:00.000' AS DateTime), 50.0000, 1, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (4, CAST(N'2024-09-15T00:00:00.000' AS DateTime), 70.0000, 1, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (5, CAST(N'2024-09-20T00:00:00.000' AS DateTime), 40.0000, 2, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1003, CAST(N'2024-11-09T21:13:20.547' AS DateTime), 85.0000, 1002, 2)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1004, CAST(N'2024-11-09T21:15:08.763' AS DateTime), 85.0000, 1002, 2)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1005, CAST(N'2024-11-09T21:22:21.783' AS DateTime), 85.0000, 1002, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1006, CAST(N'2024-11-09T22:05:01.137' AS DateTime), 85.0000, 1002, 1)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1007, CAST(N'2024-11-09T22:05:27.720' AS DateTime), 1190.0000, 1002, 3)
INSERT [dbo].[Compras] ([id_compra], [fechaCompra], [montoTotal], [id_cliente], [id_formaPago]) VALUES (1008, CAST(N'2024-11-11T02:37:31.903' AS DateTime), 85.0000, 1002, 1)
SET IDENTITY_INSERT [dbo].[Compras] OFF
GO
SET IDENTITY_INSERT [dbo].[Entradas] ON 

INSERT [dbo].[Entradas] ([id_entrada], [precio], [id_compra], [id_funcion], [id_butaca]) VALUES (3, 40, 1, 1, 1)
INSERT [dbo].[Entradas] ([id_entrada], [precio], [id_compra], [id_funcion], [id_butaca]) VALUES (4, 30, 2, 2, 2)
SET IDENTITY_INSERT [dbo].[Entradas] OFF
GO
SET IDENTITY_INSERT [dbo].[FormasPago] ON 

INSERT [dbo].[FormasPago] ([id_formaPago], [descripcion]) VALUES (1, N'Efectivo')
INSERT [dbo].[FormasPago] ([id_formaPago], [descripcion]) VALUES (2, N'Tarjeta de Crédito')
INSERT [dbo].[FormasPago] ([id_formaPago], [descripcion]) VALUES (3, N'Tarjeta de Débito')
SET IDENTITY_INSERT [dbo].[FormasPago] OFF
GO
SET IDENTITY_INSERT [dbo].[Funciones] ON 

INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora], [precio_base], [id_promocion]) VALUES (1, 1, 1, CAST(N'2024-10-20T00:00:00.000' AS DateTime), 18, 100.0000, 1)
INSERT [dbo].[Funciones] ([id_funcion], [id_pelicula], [id_sala], [fecha], [hora], [precio_base], [id_promocion]) VALUES (2, 2, 1, CAST(N'2024-10-21T00:00:00.000' AS DateTime), 20, 100.0000, 1)
SET IDENTITY_INSERT [dbo].[Funciones] OFF
GO
SET IDENTITY_INSERT [dbo].[Generos] ON 

INSERT [dbo].[Generos] ([id_genero], [descripcion]) VALUES (1, N'Acción')
INSERT [dbo].[Generos] ([id_genero], [descripcion]) VALUES (2, N'Comedia')
INSERT [dbo].[Generos] ([id_genero], [descripcion]) VALUES (3, N'Drama')
INSERT [dbo].[Generos] ([id_genero], [descripcion]) VALUES (4, N'Terror')
SET IDENTITY_INSERT [dbo].[Generos] OFF
GO
SET IDENTITY_INSERT [dbo].[Peliculas] ON 

INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [id_genero], [duracion], [id_clasificacion]) VALUES (1, N'Avengers: Endgame', 1, 181, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [id_genero], [duracion], [id_clasificacion]) VALUES (2, N'Toy Story 4', 2, 120, 1)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [id_genero], [duracion], [id_clasificacion]) VALUES (3, N'The Shawshank Redemption', 3, 142, 2)
INSERT [dbo].[Peliculas] ([id_pelicula], [titulo], [id_genero], [duracion], [id_clasificacion]) VALUES (4, N'A Nightmare on Elm Street', 1, 100, 2)
SET IDENTITY_INSERT [dbo].[Peliculas] OFF
GO
SET IDENTITY_INSERT [dbo].[Promociones] ON 

INSERT [dbo].[Promociones] ([id_promocion], [descrpcion], [descuento], [fechaInicio], [fechaFin]) VALUES (1, N'Descuento Menor Edad', 20, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promociones] ([id_promocion], [descrpcion], [descuento], [fechaInicio], [fechaFin]) VALUES (2, N'Descuento Online', 15, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
INSERT [dbo].[Promociones] ([id_promocion], [descrpcion], [descuento], [fechaInicio], [fechaFin]) VALUES (3, N'Descuento Jubilados', 10, CAST(N'2024-01-01T00:00:00.000' AS DateTime), CAST(N'2024-12-31T00:00:00.000' AS DateTime))
SET IDENTITY_INSERT [dbo].[Promociones] OFF
GO
SET IDENTITY_INSERT [dbo].[Salas] ON 

INSERT [dbo].[Salas] ([id_sala], [nombre], [id_tipo_sala], [capacidad]) VALUES (1, N'Sala 1', 1, 150)
INSERT [dbo].[Salas] ([id_sala], [nombre], [id_tipo_sala], [capacidad]) VALUES (2, N'Sala 2', 2, 100)
SET IDENTITY_INSERT [dbo].[Salas] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoClientes] ON 

INSERT [dbo].[TipoClientes] ([id_tipo_cliente], [descripcion]) VALUES (1, N'Menor de Edad')
INSERT [dbo].[TipoClientes] ([id_tipo_cliente], [descripcion]) VALUES (2, N'Adulto')
INSERT [dbo].[TipoClientes] ([id_tipo_cliente], [descripcion]) VALUES (1002, N'ResponsableWEB')
SET IDENTITY_INSERT [dbo].[TipoClientes] OFF
GO
SET IDENTITY_INSERT [dbo].[TipoSalas] ON 

INSERT [dbo].[TipoSalas] ([id_tipo_sala], [descripcion]) VALUES (1, N'3D')
INSERT [dbo].[TipoSalas] ([id_tipo_sala], [descripcion]) VALUES (2, N'2D')
SET IDENTITY_INSERT [dbo].[TipoSalas] OFF
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
