USE [master]
GO

/****** Object:  Database [CodeChallenge]    Script Date: 6/2/2022 11:43:42 PM ******/
CREATE DATABASE [CodeChallenge]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'CodeChallenge', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CodeChallenge.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'CodeChallenge_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\CodeChallenge_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [CodeChallenge] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [CodeChallenge].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [CodeChallenge] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [CodeChallenge] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [CodeChallenge] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [CodeChallenge] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [CodeChallenge] SET ARITHABORT OFF 
GO
ALTER DATABASE [CodeChallenge] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [CodeChallenge] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [CodeChallenge] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [CodeChallenge] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [CodeChallenge] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [CodeChallenge] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [CodeChallenge] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [CodeChallenge] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [CodeChallenge] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [CodeChallenge] SET  DISABLE_BROKER 
GO
ALTER DATABASE [CodeChallenge] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [CodeChallenge] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [CodeChallenge] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [CodeChallenge] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [CodeChallenge] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [CodeChallenge] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [CodeChallenge] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [CodeChallenge] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [CodeChallenge] SET  MULTI_USER 
GO
ALTER DATABASE [CodeChallenge] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [CodeChallenge] SET DB_CHAINING OFF 
GO
ALTER DATABASE [CodeChallenge] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [CodeChallenge] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [CodeChallenge] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [CodeChallenge] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [CodeChallenge] SET QUERY_STORE = OFF
GO
USE [CodeChallenge]
GO
/****** Object:  Table [dbo].[AccessRules]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[AccessRules](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserGroupID] [int] NULL,
	[RuleName] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Admins]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Admins](
	[PersonID] [int] NULL,
	[Privilege] [int] NOT NULL,
	[Id] [int] IDENTITY(1,1) NOT NULL,
 CONSTRAINT [PK_Admins] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Employees]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Employees](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](512) NOT NULL,
	[Email] [nvarchar](128) NOT NULL,
	[Department] [int] NOT NULL,
 CONSTRAINT [PK_Employees] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Persons]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Persons](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[FirstName] [nvarchar](100) NOT NULL,
	[LastName] [nvarchar](100) NOT NULL,
	[EmailAddress] [nvarchar](512) NOT NULL,
 CONSTRAINT [PK_Persons] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[UserGroups]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[UserGroups](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NOT NULL,
	[GroupId] [int] NOT NULL,
 CONSTRAINT [PK_UserGroups] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Users]    Script Date: 6/2/2022 11:43:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[PersonID] [int] NULL,
	[AttachedCustomerId] [int] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Admins] ON 
GO
INSERT [dbo].[Admins] ([PersonID], [Privilege], [Id]) VALUES (1, 1, 1)
GO
INSERT [dbo].[Admins] ([PersonID], [Privilege], [Id]) VALUES (2, 1, 2)
GO
SET IDENTITY_INSERT [dbo].[Admins] OFF
GO
SET IDENTITY_INSERT [dbo].[Employees] ON 
GO
INSERT [dbo].[Employees] ([Id], [Name], [Email], [Department]) VALUES (1, N'Ion Nissanka', N'ionnissanka@gmail.com', 1)
GO
SET IDENTITY_INSERT [dbo].[Employees] OFF
GO
SET IDENTITY_INSERT [dbo].[Persons] ON 
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (1, N'Ion', N'Nissanka', N'ionnissanka@gmail.com')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (2, N'Thilini', N'Fernando', N'thilinifernando@gmail.com')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (4, N'Asitha', N'Kumara', N'asithakumara1@gmail.com')
GO
INSERT [dbo].[Persons] ([Id], [FirstName], [LastName], [EmailAddress]) VALUES (7, N'Aloma', N'Nissanka', N'alomanissanka@gmail.com')
GO
SET IDENTITY_INSERT [dbo].[Persons] OFF
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Employee__A9D10534936F976D]    Script Date: 6/2/2022 11:43:42 PM ******/
ALTER TABLE [dbo].[Employees] ADD UNIQUE NONCLUSTERED 
(
	[Email] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Persons__49A14740110BE050]    Script Date: 6/2/2022 11:43:42 PM ******/
ALTER TABLE [dbo].[Persons] ADD UNIQUE NONCLUSTERED 
(
	[EmailAddress] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
GO
ALTER TABLE [dbo].[AccessRules]  WITH CHECK ADD FOREIGN KEY([UserGroupID])
REFERENCES [dbo].[UserGroups] ([Id])
GO
ALTER TABLE [dbo].[Admins]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([Id])
GO
ALTER TABLE [dbo].[UserGroups]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([Id])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([PersonID])
REFERENCES [dbo].[Persons] ([Id])
GO
USE [master]
GO
ALTER DATABASE [CodeChallenge] SET  READ_WRITE 
GO