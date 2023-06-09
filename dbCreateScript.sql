USE [master]
GO
/****** Object:  Database [Coolbooks]    Script Date: 2023-04-11 14:30:07 ******/
CREATE DATABASE [Coolbooks]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'Coolbooks', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Coolbooks.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'Coolbooks_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL15.SQLEXPRESS\MSSQL\DATA\Coolbooks_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
 WITH CATALOG_COLLATION = DATABASE_DEFAULT
GO
ALTER DATABASE [Coolbooks] SET COMPATIBILITY_LEVEL = 150
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [Coolbooks].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [Coolbooks] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [Coolbooks] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [Coolbooks] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [Coolbooks] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [Coolbooks] SET ARITHABORT OFF 
GO
ALTER DATABASE [Coolbooks] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [Coolbooks] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [Coolbooks] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [Coolbooks] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [Coolbooks] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [Coolbooks] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [Coolbooks] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [Coolbooks] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [Coolbooks] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [Coolbooks] SET  DISABLE_BROKER 
GO
ALTER DATABASE [Coolbooks] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [Coolbooks] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [Coolbooks] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [Coolbooks] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [Coolbooks] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [Coolbooks] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [Coolbooks] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [Coolbooks] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [Coolbooks] SET  MULTI_USER 
GO
ALTER DATABASE [Coolbooks] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [Coolbooks] SET DB_CHAINING OFF 
GO
ALTER DATABASE [Coolbooks] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [Coolbooks] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [Coolbooks] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [Coolbooks] SET ACCELERATED_DATABASE_RECOVERY = OFF  
GO
ALTER DATABASE [Coolbooks] SET QUERY_STORE = OFF
GO
USE [Coolbooks]
GO
/****** Object:  Table [dbo].[Author]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Author](
	[AuthorID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](250) NULL,
	[Lastname] [nvarchar](250) NULL,
	[Created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[AuthorID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Book]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Book](
	[BookID] [int] IDENTITY(1,1) NOT NULL,
	[UserID] [int] NULL,
	[AuthorID] [int] NULL,
	[GenreID] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
	[ISBN] [nvarchar](250) NULL,
	[Imagepath] [nvarchar](250) NULL,
	[IsDeleted] [bit] NULL,
	[Created] [date] NULL,
PRIMARY KEY CLUSTERED 
(
	[BookID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Genre]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genre](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Review]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Review](
	[ReviewID] [int] IDENTITY(1,1) NOT NULL,
	[BookID] [int] NULL,
	[UserID] [int] NULL,
	[Title] [nvarchar](250) NULL,
	[Text] [nvarchar](250) NULL,
	[Rating] [nvarchar](250) NULL,
	[Created] [datetime] NULL,
PRIMARY KEY CLUSTERED 
(
	[ReviewID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SiteUser]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SiteUser](
	[UserID] [int] IDENTITY(1,1) NOT NULL,
	[UserinfoID] [int] NULL,
	[Email] [nvarchar](50) NULL,
	[PasswordHash] [nvarchar](250) NULL,
	[SecurityStamp] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Userinfo]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Userinfo](
	[UserInfoID] [int] IDENTITY(1,1) NOT NULL,
	[Firstname] [nvarchar](50) NULL,
	[Lastname] [nvarchar](50) NULL,
	[Phone] [nvarchar](250) NULL,
	[Address] [nvarchar](250) NULL,
	[Created] [date] NULL,
	[Role] [nvarchar](50) NULL,
PRIMARY KEY CLUSTERED 
(
	[UserInfoID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Author] ([AuthorID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genre] ([GenreID])
GO
ALTER TABLE [dbo].[Book]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[SiteUser] ([UserID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Book] ([BookID])
GO
ALTER TABLE [dbo].[Review]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[SiteUser] ([UserID])
GO
ALTER TABLE [dbo].[SiteUser]  WITH CHECK ADD FOREIGN KEY([UserinfoID])
REFERENCES [dbo].[Userinfo] ([UserInfoID])
GO
/****** Object:  StoredProcedure [dbo].[spAddAuthor]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddAuthor]
AS

Insert into Author (Firstname, Lastname, Created)
values ('J.R.R', 'Tolkien', '2022-11-30');

Insert into Author (Firstname, Lastname, Created)
values ('William', 'Gibson', '2022-11-15');

Insert into Author (Firstname, Lastname, Created)
values ('Torey', 'Hayden', '2022-10-12');

Insert into Author (Firstname, Lastname, Created)
values ('Zadie', 'Smith', '2022-09-02');

Insert into Author (Firstname, Lastname, Created)
values ('A.A', 'Milne', '2022-02-01');

Insert into Author (Firstname, Lastname, Created)
values ('John', 'Milton', '2022-02-14');
GO
/****** Object:  StoredProcedure [dbo].[spAddBook]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create PROCEDURE [dbo].[spAddBook]
AS

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('The Fellowship of the Ring', 'First of the Lord of the Rings trilogy', '789456', 0, '2022-01-01')

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('Neuromancer', 'Birth of Cyberpunk', '456123', 0, '2022-01-01')

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('One Child', 'child psychopathology, child abuse', '456123', 0,'2022-04-02')

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('Grand Union: Stories', '10 short stories', '45612311', 0, '2022-09-11')

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('Winnie-The-Pooh', 'Our beloved Pooh Bear', '4561231145', 0, '2022-10-03')

Insert into Book (Title, Description, ISBN, IsDeleted, Created)
values ('Paradise Lost', 'Where the angles fear to tread', '456123666', 0, '2022-10-03')

GO
/****** Object:  StoredProcedure [dbo].[spAddGenre]    Script Date: 2023-04-11 14:30:07 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[spAddGenre]
AS
Insert into Genre (Name)
values ('Science Fiction')

Insert into Genre (Name)
values ('Fantasy')

Insert into Genre (Name)
values ('Children''s Books')

Insert into Genre (Name)
values ('Poetry')

Insert into Genre (Name)
values ('Short Stories')

Insert into Genre (Name)
values ('Non-Fiction')

GO
USE [master]
GO
ALTER DATABASE [Coolbooks] SET  READ_WRITE 
GO
