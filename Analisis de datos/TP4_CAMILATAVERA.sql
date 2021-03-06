USE [master]
GO
/****** Object:  Database [TP4_TAVERA_2E]    Script Date: 11/18/2021 9:42:49 PM ******/
CREATE DATABASE [TP4_TAVERA_2E]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'TP4', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP4.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'TP4_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\TP4_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [TP4_TAVERA_2E] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [TP4_TAVERA_2E].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ARITHABORT OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET  DISABLE_BROKER 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET  MULTI_USER 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [TP4_TAVERA_2E] SET DB_CHAINING OFF 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [TP4_TAVERA_2E] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [TP4_TAVERA_2E] SET QUERY_STORE = OFF
GO
USE [TP4_TAVERA_2E]
GO
/****** Object:  Table [dbo].[estudiantes]    Script Date: 11/18/2021 9:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[estudiantes](
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[SEXO] [char](1) NOT NULL,
	[PLATA_GASTADA] [int] NULL,
	[CANTIDAD_PRODUCTOS_COMPRADOS] [int] NULL,
	[CANTIDAD_COMPRAS] [int] NULL,
	[PROMEDIO_GENERAL] [float] NOT NULL,
	[ANIO_CURSO] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[ordenanzas]    Script Date: 11/18/2021 9:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ordenanzas](
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[SEXO] [char](1) NOT NULL,
	[PLATA_GASTADA] [int] NULL,
	[CANTIDAD_PRODUCTOS_COMPRADOS] [int] NULL,
	[CANTIDAD_COMPRAS] [int] NULL,
	[TURNO] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[profesores]    Script Date: 11/18/2021 9:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[profesores](
	[NOMBRE] [varchar](50) NOT NULL,
	[APELLIDO] [varchar](50) NOT NULL,
	[SEXO] [char](1) NOT NULL,
	[PLATA_GASTADA] [int] NULL,
	[CANTIDAD_PRODUCTOS_COMPRADOS] [int] NULL,
	[CANTIDAD_COMPRAS] [int] NULL,
	[HORAS_CATEDRA] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[sexos]    Script Date: 11/18/2021 9:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[sexos](
	[ID_SEXO_CHAR] [char](1) NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
 CONSTRAINT [PK_Table_4] PRIMARY KEY CLUSTERED 
(
	[ID_SEXO_CHAR] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[turnos_ordenanza]    Script Date: 11/18/2021 9:42:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[turnos_ordenanza](
	[ID_TURNO] [int] NOT NULL,
	[DESCRIPCION] [varchar](50) NOT NULL,
 CONSTRAINT [PK_turnos_ordenanza] PRIMARY KEY CLUSTERED 
(
	[ID_TURNO] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[estudiantes] ([NOMBRE], [APELLIDO], [SEXO], [PLATA_GASTADA], [CANTIDAD_PRODUCTOS_COMPRADOS], [CANTIDAD_COMPRAS], [PROMEDIO_GENERAL], [ANIO_CURSO]) VALUES (N'Nicolas', N'Lopez', N'm', 0, 0, 0, 4, 3)
INSERT [dbo].[estudiantes] ([NOMBRE], [APELLIDO], [SEXO], [PLATA_GASTADA], [CANTIDAD_PRODUCTOS_COMPRADOS], [CANTIDAD_COMPRAS], [PROMEDIO_GENERAL], [ANIO_CURSO]) VALUES (N'Santiago', N'Maxim', N'm', 200, 3, 2, 7, 1)
GO
INSERT [dbo].[ordenanzas] ([NOMBRE], [APELLIDO], [SEXO], [PLATA_GASTADA], [CANTIDAD_PRODUCTOS_COMPRADOS], [CANTIDAD_COMPRAS], [TURNO]) VALUES (N'Valentina', N'Menitex', N'f', 680, 5, 1, 1)
INSERT [dbo].[ordenanzas] ([NOMBRE], [APELLIDO], [SEXO], [PLATA_GASTADA], [CANTIDAD_PRODUCTOS_COMPRADOS], [CANTIDAD_COMPRAS], [TURNO]) VALUES (N'Luca', N'Riesgo', N'm', 0, 0, 0, 2)
GO
INSERT [dbo].[profesores] ([NOMBRE], [APELLIDO], [SEXO], [PLATA_GASTADA], [CANTIDAD_PRODUCTOS_COMPRADOS], [CANTIDAD_COMPRAS], [HORAS_CATEDRA]) VALUES (N'Florencia', N'Corla', N'f', 1200, 5, 5, 40)
GO
INSERT [dbo].[sexos] ([ID_SEXO_CHAR], [DESCRIPCION]) VALUES (N'f', N'femenino')
INSERT [dbo].[sexos] ([ID_SEXO_CHAR], [DESCRIPCION]) VALUES (N'm', N'masculino')
GO
INSERT [dbo].[turnos_ordenanza] ([ID_TURNO], [DESCRIPCION]) VALUES (1, N'maniana')
INSERT [dbo].[turnos_ordenanza] ([ID_TURNO], [DESCRIPCION]) VALUES (2, N'noche')
GO
ALTER TABLE [dbo].[estudiantes]  WITH CHECK ADD  CONSTRAINT [FK_est_sexos] FOREIGN KEY([SEXO])
REFERENCES [dbo].[sexos] ([ID_SEXO_CHAR])
GO
ALTER TABLE [dbo].[estudiantes] CHECK CONSTRAINT [FK_est_sexos]
GO
ALTER TABLE [dbo].[ordenanzas]  WITH CHECK ADD  CONSTRAINT [FK_ordenanzas_sexos] FOREIGN KEY([SEXO])
REFERENCES [dbo].[sexos] ([ID_SEXO_CHAR])
GO
ALTER TABLE [dbo].[ordenanzas] CHECK CONSTRAINT [FK_ordenanzas_sexos]
GO
ALTER TABLE [dbo].[ordenanzas]  WITH CHECK ADD  CONSTRAINT [FK_ordenanzas_turnos_ordenanza] FOREIGN KEY([TURNO])
REFERENCES [dbo].[turnos_ordenanza] ([ID_TURNO])
GO
ALTER TABLE [dbo].[ordenanzas] CHECK CONSTRAINT [FK_ordenanzas_turnos_ordenanza]
GO
ALTER TABLE [dbo].[profesores]  WITH CHECK ADD  CONSTRAINT [FK_profes_sexos] FOREIGN KEY([SEXO])
REFERENCES [dbo].[sexos] ([ID_SEXO_CHAR])
GO
ALTER TABLE [dbo].[profesores] CHECK CONSTRAINT [FK_profes_sexos]
GO
USE [master]
GO
ALTER DATABASE [TP4_TAVERA_2E] SET  READ_WRITE 
GO
