USE [master]
GO
/****** Object:  Database [UPPart2]    Script Date: 4/6/2019 12:14:39 AM ******/
CREATE DATABASE [UPPart2]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'UPPart2', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UPPart2.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'UPPart2_log', FILENAME = N'C:\Program Files\Microsoft SQL Server\MSSQL14.SQLEXPRESS\MSSQL\DATA\UPPart2_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [UPPart2] SET COMPATIBILITY_LEVEL = 140
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [UPPart2].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [UPPart2] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [UPPart2] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [UPPart2] SET ARITHABORT OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [UPPart2] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [UPPart2] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [UPPart2] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [UPPart2] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [UPPart2] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [UPPart2] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [UPPart2] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [UPPart2] SET  DISABLE_BROKER 
GO
ALTER DATABASE [UPPart2] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [UPPart2] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [UPPart2] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [UPPart2] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [UPPart2] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [UPPart2] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [UPPart2] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [UPPart2] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [UPPart2] SET  MULTI_USER 
GO
ALTER DATABASE [UPPart2] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [UPPart2] SET DB_CHAINING OFF 
GO
ALTER DATABASE [UPPart2] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [UPPart2] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [UPPart2] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [UPPart2] SET QUERY_STORE = OFF
GO
USE [UPPart2]
GO
/****** Object:  Table [dbo].[Calendar]    Script Date: 4/6/2019 12:14:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Calendar](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Title] [varchar](150) NOT NULL,
	[Day] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[Year] [int] NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[homework]    Script Date: 4/6/2019 12:14:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[homework](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[FilePath] [varchar](255) NULL,
	[Name] [varchar](max) NULL,
	[Day] [int] NULL,
	[Month] [int] NULL,
	[Year] [int] NULL,
 CONSTRAINT [PK_File] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Calendar] ON 

INSERT [dbo].[Calendar] ([ID], [Title], [Day], [Month], [Year]) VALUES (1, N'xxxx', 7, 4, 2562)
SET IDENTITY_INSERT [dbo].[Calendar] OFF
SET IDENTITY_INSERT [dbo].[homework] ON 

INSERT [dbo].[homework] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (11, N'Upload/34c560ca-5732-4c27-b853-569e4033b54c.jpg', N'39941032_789515734773410_5931825782576906240_n.jpg', 4, 10, 2019)
INSERT [dbo].[homework] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (14, N'Upload/2ce93c8b-6cbf-406b-aaec-f4a6b6b3da6f.jpg', N'img1.jpg', 5, 5, 2019)
INSERT [dbo].[homework] ([ID], [FilePath], [Name], [Day], [Month], [Year]) VALUES (15, N'Upload/e33d047b-e64e-4383-b562-3bd78944bce6.jpg', N'img01.jpg', 7, 4, 2019)
SET IDENTITY_INSERT [dbo].[homework] OFF
/****** Object:  StoredProcedure [dbo].[CalendarDetail]    Script Date: 4/6/2019 12:14:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[CalendarDetail]
	@day int,
	@month int,
	@year int
AS
BEGIN
	
	SET NOCOUNT ON;
	SELECT        FilePath, Name, Day, Month, Year, ID
FROM            homework
WHERE        (Day = @day) AND (Month = @month) AND (Year = @year)
   
END
GO
/****** Object:  StoredProcedure [dbo].[InsertFileFromDB]    Script Date: 4/6/2019 12:14:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[InsertFileFromDB]
	@Name varchar(MAX) ,
	@FilePath varChar(255),
	@day int ,
	@month int ,
	@year int 

AS
BEGIN
	
	SET NOCOUNT ON;
	INSERT INTO  homework(FilePath, Name, Day, Month, Year)
	VALUES  (@FilePath,@Name,@Day,@Month,@Year)
  
END
GO
/****** Object:  StoredProcedure [dbo].[spCalendar]    Script Date: 4/6/2019 12:14:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spCalendar]
	@Day int,
	@Month int,
	@Year int

AS
BEGIN
	
	SET NOCOUNT ON;

	SELECT  ID
	FROM     homework
	WHERE   (Day = @Day) AND (Month = @Month) AND (Year = @Year)
END
GO
/****** Object:  StoredProcedure [dbo].[spGetCalendarByID]    Script Date: 4/6/2019 12:14:40 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[spGetCalendarByID]
	@id int 

AS
BEGIN

	SET NOCOUNT ON;
	SELECT        TOP (200) ID, Title, Day, Month, Year
	FROM            Calendar
	WHERE        (ID = @id)
END
GO
USE [master]
GO
ALTER DATABASE [UPPart2] SET  READ_WRITE 
GO
