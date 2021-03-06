USE [master]
GO
/****** Object:  Database [MovieDemoDB]    Script Date: 29/1/2018 05:24:02 ******/
CREATE DATABASE [MovieDemoDB]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'MovieDemoDB', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieDemoDB.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'MovieDemoDB_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\MovieDemoDB_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [MovieDemoDB] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [MovieDemoDB].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [MovieDemoDB] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [MovieDemoDB] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [MovieDemoDB] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [MovieDemoDB] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [MovieDemoDB] SET ARITHABORT OFF 
GO
ALTER DATABASE [MovieDemoDB] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [MovieDemoDB] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [MovieDemoDB] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [MovieDemoDB] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [MovieDemoDB] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [MovieDemoDB] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [MovieDemoDB] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [MovieDemoDB] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [MovieDemoDB] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [MovieDemoDB] SET  ENABLE_BROKER 
GO
ALTER DATABASE [MovieDemoDB] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [MovieDemoDB] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [MovieDemoDB] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [MovieDemoDB] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [MovieDemoDB] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [MovieDemoDB] SET READ_COMMITTED_SNAPSHOT ON 
GO
ALTER DATABASE [MovieDemoDB] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [MovieDemoDB] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [MovieDemoDB] SET  MULTI_USER 
GO
ALTER DATABASE [MovieDemoDB] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [MovieDemoDB] SET DB_CHAINING OFF 
GO
ALTER DATABASE [MovieDemoDB] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [MovieDemoDB] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [MovieDemoDB] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [MovieDemoDB] SET QUERY_STORE = OFF
GO
USE [MovieDemoDB]
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
USE [MovieDemoDB]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 29/1/2018 05:24:04 ******/
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
/****** Object:  Table [dbo].[Categories]    Script Date: 29/1/2018 05:25:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Categories](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NULL,
 CONSTRAINT [PK_Categories] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Movies]    Script Date: 29/1/2018 05:25:52 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Movies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[CategoryID] [int] NOT NULL,
	[Name] [nvarchar](max) NULL,
	[Rating] [nvarchar](max) NULL,
 CONSTRAINT [PK_Movies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Index [IX_Movies_CategoryID]    Script Date: 29/1/2018 05:25:52 ******/
CREATE NONCLUSTERED INDEX [IX_Movies_CategoryID] ON [dbo].[Movies]
(
	[CategoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Movies]  WITH CHECK ADD  CONSTRAINT [FK_Movies_Categories_CategoryID] FOREIGN KEY([CategoryID])
REFERENCES [dbo].[Categories] ([ID])
ON DELETE CASCADE
GO
ALTER TABLE [dbo].[Movies] CHECK CONSTRAINT [FK_Movies_Categories_CategoryID]
GO
USE [master]
GO
ALTER DATABASE [MovieDemoDB] SET  READ_WRITE 
GO
