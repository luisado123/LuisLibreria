USE [master]
GO
/****** Object:  Database [BdMyLibrary]    Script Date: 11/02/2022 16:46:51 ******/
CREATE DATABASE [BdMyLibrary]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'BdMyLibrary', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BdMyLibrary.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'BdMyLibrary_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.MSSQLSERVER\MSSQL\DATA\BdMyLibrary_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [BdMyLibrary] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [BdMyLibrary].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [BdMyLibrary] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [BdMyLibrary] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [BdMyLibrary] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [BdMyLibrary] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [BdMyLibrary] SET ARITHABORT OFF 
GO
ALTER DATABASE [BdMyLibrary] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [BdMyLibrary] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [BdMyLibrary] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [BdMyLibrary] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [BdMyLibrary] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [BdMyLibrary] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [BdMyLibrary] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [BdMyLibrary] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [BdMyLibrary] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [BdMyLibrary] SET  ENABLE_BROKER 
GO
ALTER DATABASE [BdMyLibrary] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [BdMyLibrary] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [BdMyLibrary] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [BdMyLibrary] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [BdMyLibrary] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [BdMyLibrary] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [BdMyLibrary] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [BdMyLibrary] SET RECOVERY FULL 
GO
ALTER DATABASE [BdMyLibrary] SET  MULTI_USER 
GO
ALTER DATABASE [BdMyLibrary] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [BdMyLibrary] SET DB_CHAINING OFF 
GO
ALTER DATABASE [BdMyLibrary] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [BdMyLibrary] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [BdMyLibrary] SET DELAYED_DURABILITY = DISABLED 
GO
EXEC sys.sp_db_vardecimal_storage_format N'BdMyLibrary', N'ON'
GO
ALTER DATABASE [BdMyLibrary] SET QUERY_STORE = OFF
GO
USE [BdMyLibrary]
GO
/****** Object:  Schema [Library]    Script Date: 11/02/2022 16:46:52 ******/
CREATE SCHEMA [Library]
GO
/****** Object:  Schema [Master]    Script Date: 11/02/2022 16:46:52 ******/
CREATE SCHEMA [Master]
GO
/****** Object:  Schema [Security]    Script Date: 11/02/2022 16:46:52 ******/
CREATE SCHEMA [Security]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[__EFMigrationsHistory](
	[MigrationId] [nvarchar](150) NOT NULL,
	[ProductVersion] [nvarchar](32) NOT NULL,
 CONSTRAINT [PK___EFMigrationsHistory] PRIMARY KEY CLUSTERED 
(
	[MigrationId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Library].[Book]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Library].[Book](
	[IdBook] [int] IDENTITY(1,1) NOT NULL,
	[DatePreRealease] [datetime2](7) NOT NULL,
	[IdTypeBook] [int] NOT NULL,
	[Name] [nvarchar](100) NULL,
	[AuthorName] [nvarchar](100) NULL,
	[DateRelease] [datetime2](7) NULL,
	[Description] [nvarchar](300) NULL,
	[IdState] [int] NOT NULL,
	[IdUserLibrary] [int] NULL,
 CONSTRAINT [PK_Book] PRIMARY KEY CLUSTERED 
(
	[IdBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Library].[TypeBook]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Library].[TypeBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[TypeBook] [nvarchar](100) NULL,
 CONSTRAINT [PK_TypeBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Library].[UserBook]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Library].[UserBook](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdBook] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_UserBook] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Master].[State]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[State](
	[IdState] [int] NOT NULL,
	[State] [nvarchar](max) NULL,
	[IdTypeState] [int] NOT NULL,
 CONSTRAINT [PK_State] PRIMARY KEY CLUSTERED 
(
	[IdState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [Master].[TypeStateEntity]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Master].[TypeStateEntity](
	[IdTypeState] [int] NOT NULL,
	[TypeState] [nvarchar](100) NULL,
 CONSTRAINT [PK_TypeStateEntity] PRIMARY KEY CLUSTERED 
(
	[IdTypeState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[Permission]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[Permission](
	[IdPermission] [int] NOT NULL,
	[Permission] [nvarchar](100) NULL,
	[Description] [nvarchar](150) NULL,
	[IdTypePermission] [int] NOT NULL,
 CONSTRAINT [PK_Permission] PRIMARY KEY CLUSTERED 
(
	[IdPermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[Rol]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[Rol](
	[IdRol] [int] NOT NULL,
	[Rol] [nvarchar](100) NULL,
 CONSTRAINT [PK_Rol] PRIMARY KEY CLUSTERED 
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[RolesPermissions]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[RolesPermissions](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdPermission] [int] NOT NULL,
 CONSTRAINT [PK_RolesPermissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[RolUser]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[RolUser](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[IdRol] [int] NOT NULL,
	[IdUser] [int] NOT NULL,
 CONSTRAINT [PK_RolUser] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[TypePermission]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[TypePermission](
	[IdTypePermission] [int] NOT NULL,
	[TypePermission] [nvarchar](50) NULL,
 CONSTRAINT [PK_TypePermission] PRIMARY KEY CLUSTERED 
(
	[IdTypePermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [Security].[User]    Script Date: 11/02/2022 16:46:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [Security].[User](
	[IdUser] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[Email] [nvarchar](200) NOT NULL,
	[Password] [nvarchar](200) NOT NULL,
 CONSTRAINT [PK_User] PRIMARY KEY CLUSTERED 
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20220210171958_segunda', N'3.1.4')
SET IDENTITY_INSERT [Library].[Book] ON 

INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (2, CAST(N'2023-10-22T00:00:00.0000000' AS DateTime2), 1, N'primero', N'luis', NULL, N'hola soy 1', 1, 1)
INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (3, CAST(N'2034-03-10T00:00:00.0000000' AS DateTime2), 1, N'segundo', N'luisdos', NULL, N'juan', 1, 1)
INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (7, CAST(N'2022-02-12T16:03:59.6230000' AS DateTime2), 2, N'string', N'string', NULL, N'PRUEBA DEL ALTER', 1, NULL)
INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (8, CAST(N'2022-02-14T15:07:56.3120000' AS DateTime2), 1, N'pepe y stetdf', N'Vegetta', NULL, N'wapa', 2, NULL)
INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (9, CAST(N'2022-02-12T20:41:15.5170000' AS DateTime2), 1, N'luisito', N'string', NULL, N'string', 1, 1)
INSERT [Library].[Book] ([IdBook], [DatePreRealease], [IdTypeBook], [Name], [AuthorName], [DateRelease], [Description], [IdState], [IdUserLibrary]) VALUES (10, CAST(N'2022-02-13T20:45:02.0330000' AS DateTime2), 1, N'Insertar', N'LUIS PRUEBA insert', NULL, N'esta es la prueba para el insert', 1, 1)
SET IDENTITY_INSERT [Library].[Book] OFF
SET IDENTITY_INSERT [Library].[TypeBook] ON 

INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (1, N'drama')
INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (2, N'suspenso')
INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (3, N'terror')
INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (4, N'comedia')
INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (5, N'Romantico')
INSERT [Library].[TypeBook] ([Id], [TypeBook]) VALUES (6, N'Barroco')
SET IDENTITY_INSERT [Library].[TypeBook] OFF
INSERT [Master].[State] ([IdState], [State], [IdTypeState]) VALUES (1, N'1', 1)
INSERT [Master].[State] ([IdState], [State], [IdTypeState]) VALUES (2, N'2', 2)
INSERT [Master].[State] ([IdState], [State], [IdTypeState]) VALUES (3, N'3', 3)
INSERT [Master].[TypeStateEntity] ([IdTypeState], [TypeState]) VALUES (1, N'Libro Aprobado')
INSERT [Master].[TypeStateEntity] ([IdTypeState], [TypeState]) VALUES (2, N'Libro En Revision')
INSERT [Master].[TypeStateEntity] ([IdTypeState], [TypeState]) VALUES (3, N'Libro Rechazado')
SET IDENTITY_INSERT [Security].[User] ON 

INSERT [Security].[User] ([IdUser], [Name], [LastName], [Email], [Password]) VALUES (1, N'luis', N'conde', N'hola123@gmail.com', N'1234')
SET IDENTITY_INSERT [Security].[User] OFF
/****** Object:  Index [IX_Book_IdState]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_Book_IdState] ON [Library].[Book]
(
	[IdState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_IdTypeBook]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_Book_IdTypeBook] ON [Library].[Book]
(
	[IdTypeBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Book_IdUserLibrary]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_Book_IdUserLibrary] ON [Library].[Book]
(
	[IdUserLibrary] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserBook_IdBook]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_UserBook_IdBook] ON [Library].[UserBook]
(
	[IdBook] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_UserBook_IdUser]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_UserBook_IdUser] ON [Library].[UserBook]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_State_IdTypeState]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_State_IdTypeState] ON [Master].[State]
(
	[IdTypeState] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_Permission_IdTypePermission]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_Permission_IdTypePermission] ON [Security].[Permission]
(
	[IdTypePermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolesPermissions_IdPermission]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_RolesPermissions_IdPermission] ON [Security].[RolesPermissions]
(
	[IdPermission] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolesPermissions_IdRol]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_RolesPermissions_IdRol] ON [Security].[RolesPermissions]
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolUser_IdRol]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_RolUser_IdRol] ON [Security].[RolUser]
(
	[IdRol] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
/****** Object:  Index [IX_RolUser_IdUser]    Script Date: 11/02/2022 16:46:52 ******/
CREATE NONCLUSTERED INDEX [IX_RolUser_IdUser] ON [Security].[RolUser]
(
	[IdUser] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_User_Email]    Script Date: 11/02/2022 16:46:52 ******/
CREATE UNIQUE NONCLUSTERED INDEX [IX_User_Email] ON [Security].[User]
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [Library].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_State_IdState] FOREIGN KEY([IdState])
REFERENCES [Master].[State] ([IdState])
ON DELETE CASCADE
GO
ALTER TABLE [Library].[Book] CHECK CONSTRAINT [FK_Book_State_IdState]
GO
ALTER TABLE [Library].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_TypeBook_IdTypeBook] FOREIGN KEY([IdTypeBook])
REFERENCES [Library].[TypeBook] ([Id])
ON DELETE CASCADE
GO
ALTER TABLE [Library].[Book] CHECK CONSTRAINT [FK_Book_TypeBook_IdTypeBook]
GO
ALTER TABLE [Library].[Book]  WITH CHECK ADD  CONSTRAINT [FK_Book_User_IdUserLibrary] FOREIGN KEY([IdUserLibrary])
REFERENCES [Security].[User] ([IdUser])
GO
ALTER TABLE [Library].[Book] CHECK CONSTRAINT [FK_Book_User_IdUserLibrary]
GO
ALTER TABLE [Library].[UserBook]  WITH CHECK ADD  CONSTRAINT [FK_UserBook_Book_IdBook] FOREIGN KEY([IdBook])
REFERENCES [Library].[Book] ([IdBook])
ON DELETE CASCADE
GO
ALTER TABLE [Library].[UserBook] CHECK CONSTRAINT [FK_UserBook_Book_IdBook]
GO
ALTER TABLE [Library].[UserBook]  WITH CHECK ADD  CONSTRAINT [FK_UserBook_User_IdUser] FOREIGN KEY([IdUser])
REFERENCES [Security].[User] ([IdUser])
ON DELETE CASCADE
GO
ALTER TABLE [Library].[UserBook] CHECK CONSTRAINT [FK_UserBook_User_IdUser]
GO
ALTER TABLE [Master].[State]  WITH CHECK ADD  CONSTRAINT [FK_State_TypeStateEntity_IdTypeState] FOREIGN KEY([IdTypeState])
REFERENCES [Master].[TypeStateEntity] ([IdTypeState])
ON DELETE CASCADE
GO
ALTER TABLE [Master].[State] CHECK CONSTRAINT [FK_State_TypeStateEntity_IdTypeState]
GO
ALTER TABLE [Security].[Permission]  WITH CHECK ADD  CONSTRAINT [FK_Permission_TypePermission_IdTypePermission] FOREIGN KEY([IdTypePermission])
REFERENCES [Security].[TypePermission] ([IdTypePermission])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[Permission] CHECK CONSTRAINT [FK_Permission_TypePermission_IdTypePermission]
GO
ALTER TABLE [Security].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Permission_IdPermission] FOREIGN KEY([IdPermission])
REFERENCES [Security].[Permission] ([IdPermission])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Permission_IdPermission]
GO
ALTER TABLE [Security].[RolesPermissions]  WITH CHECK ADD  CONSTRAINT [FK_RolesPermissions_Rol_IdRol] FOREIGN KEY([IdRol])
REFERENCES [Security].[Rol] ([IdRol])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[RolesPermissions] CHECK CONSTRAINT [FK_RolesPermissions_Rol_IdRol]
GO
ALTER TABLE [Security].[RolUser]  WITH CHECK ADD  CONSTRAINT [FK_RolUser_Rol_IdRol] FOREIGN KEY([IdRol])
REFERENCES [Security].[Rol] ([IdRol])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[RolUser] CHECK CONSTRAINT [FK_RolUser_Rol_IdRol]
GO
ALTER TABLE [Security].[RolUser]  WITH CHECK ADD  CONSTRAINT [FK_RolUser_User_IdUser] FOREIGN KEY([IdUser])
REFERENCES [Security].[User] ([IdUser])
ON DELETE CASCADE
GO
ALTER TABLE [Security].[RolUser] CHECK CONSTRAINT [FK_RolUser_User_IdUser]
GO
USE [master]
GO
ALTER DATABASE [BdMyLibrary] SET  READ_WRITE 
GO
