USE [master]
GO
/****** Object:  Database [DischiAlbum]    Script Date: 22/10/2021 13:34:48 ******/
CREATE DATABASE [DischiAlbum]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'DischiAlbum', FILENAME = N'C:\Users\Tatiana\DischiAlbum.mdf' , SIZE = 8192KB , MAXSIZE = UNLIMITED, FILEGROWTH = 65536KB )
 LOG ON 
( NAME = N'DischiAlbum_log', FILENAME = N'C:\Users\Tatiana\DischiAlbum_log.ldf' , SIZE = 8192KB , MAXSIZE = 2048GB , FILEGROWTH = 65536KB )
GO
ALTER DATABASE [DischiAlbum] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [DischiAlbum].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [DischiAlbum] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [DischiAlbum] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [DischiAlbum] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [DischiAlbum] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [DischiAlbum] SET ARITHABORT OFF 
GO
ALTER DATABASE [DischiAlbum] SET AUTO_CLOSE ON 
GO
ALTER DATABASE [DischiAlbum] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [DischiAlbum] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [DischiAlbum] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [DischiAlbum] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [DischiAlbum] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [DischiAlbum] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [DischiAlbum] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [DischiAlbum] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [DischiAlbum] SET  ENABLE_BROKER 
GO
ALTER DATABASE [DischiAlbum] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [DischiAlbum] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [DischiAlbum] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [DischiAlbum] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [DischiAlbum] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [DischiAlbum] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [DischiAlbum] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [DischiAlbum] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [DischiAlbum] SET  MULTI_USER 
GO
ALTER DATABASE [DischiAlbum] SET PAGE_VERIFY CHECKSUM  
GO
ALTER DATABASE [DischiAlbum] SET DB_CHAINING OFF 
GO
ALTER DATABASE [DischiAlbum] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [DischiAlbum] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [DischiAlbum] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [DischiAlbum] SET QUERY_STORE = OFF
GO
USE [DischiAlbum]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
USE [DischiAlbum]
GO
/****** Object:  Table [dbo].[Album]    Script Date: 22/10/2021 13:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Album](
	[IdAlbum] [int] IDENTITY(1,1) NOT NULL,
	[IdBand] [int] NOT NULL,
	[TitoloAlbum] [nvarchar](20) NULL,
	[AnnoUscita] [int] NULL,
	[CasaDiscografica] [nvarchar](30) NULL,
	[Genere] [nvarchar](20) NULL,
	[SupportoDistribuzione] [nvarchar](30) NULL,
 CONSTRAINT [PK_IdAlbum] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Band]    Script Date: 22/10/2021 13:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Band](
	[IdBand] [int] IDENTITY(1,1) NOT NULL,
	[NomeBand] [nvarchar](30) NULL,
	[NumeroComponenti] [int] NOT NULL,
 CONSTRAINT [PK_Band] PRIMARY KEY CLUSTERED 
(
	[IdBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Brano]    Script Date: 22/10/2021 13:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Brano](
	[IdBrano] [int] IDENTITY(1000,1) NOT NULL,
	[TitoloBrano] [nvarchar](30) NULL,
	[Durata] [time](0) NULL,
 CONSTRAINT [PK_IdBrano] PRIMARY KEY CLUSTERED 
(
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BranoAlbum]    Script Date: 22/10/2021 13:34:48 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BranoAlbum](
	[IdAlbum] [int] NOT NULL,
	[IdBrano] [int] NOT NULL,
 CONSTRAINT [PK_BranoAlbum] PRIMARY KEY CLUSTERED 
(
	[IdAlbum] ASC,
	[IdBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Album] ON 

INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (1, 1, N'Fuori di testa', 2021, N'Sony Music', N'Rock', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (2, 1, N'Fuori di testa', 2021, N'Sony Music', N'Rock', N'Vinile')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (4, 2, N'Nord sud ovest est', 1993, N'Sony Music', N'Pop', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (9, 2, N'Nord sud ovest est', 1993, N'Sony Music', N'Pop', N'Vinile')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (10, 2, N'Grazie mille', 1999, N'Sony Music', N'Pop', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (11, 2, N'Uno in più', 2001, N'Sony Music', N'Pop', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (12, 2, N'Inventato Oggi', 2020, N'Sony Music', N'Pop', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (13, 1, N'Perfetti sconosciuti', 2020, N'Sony Music', N'Rock', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (15, 1, N'Il ballo della vita', 2018, N'Sony Music', N'Rock', N'Streaming')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (16, 1, N'Il ballo della vita', 2018, N'Sony Music', N'Rock', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (17, 3, N'Vol.1', 2011, N'Music Record', N'Rock', N'Streaming')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (18, 3, N'Vecchio', 2012, N'Music Record', N'Pop', N'CD')
INSERT [dbo].[Album] ([IdAlbum], [IdBand], [TitoloAlbum], [AnnoUscita], [CasaDiscografica], [Genere], [SupportoDistribuzione]) VALUES (19, 3, N'Fuoricampo', 2014, N'Music Record', N'Pop', N'CD')
SET IDENTITY_INSERT [dbo].[Album] OFF
GO
SET IDENTITY_INSERT [dbo].[Band] ON 

INSERT [dbo].[Band] ([IdBand], [NomeBand], [NumeroComponenti]) VALUES (1, N'Maneskin', 4)
INSERT [dbo].[Band] ([IdBand], [NomeBand], [NumeroComponenti]) VALUES (2, N'883', 4)
INSERT [dbo].[Band] ([IdBand], [NomeBand], [NumeroComponenti]) VALUES (3, N'The Giornalisti', 3)
SET IDENTITY_INSERT [dbo].[Band] OFF
GO
SET IDENTITY_INSERT [dbo].[Brano] ON 

INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1000, N'Sono fuori di testa', CAST(N'03:23:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1001, N'Morirò da re', CAST(N'03:25:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1002, N'Torna a casa', CAST(N'03:23:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1003, N'Fear for nobody', CAST(N'04:23:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1004, N'Immagine', CAST(N'05:23:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1005, N'Siamo tutti marziani', CAST(N'03:23:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1006, N'Una canzone per Joss', CAST(N'03:53:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1007, N'Il tradimento', CAST(N'03:53:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1008, N'Per lei', CAST(N'02:53:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1009, N'Canzone senza album', CAST(N'02:53:00' AS Time))
INSERT [dbo].[Brano] ([IdBrano], [TitoloBrano], [Durata]) VALUES (1012, N'Canzone senza album 2', CAST(N'02:53:00' AS Time))
SET IDENTITY_INSERT [dbo].[Brano] OFF
GO
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (1, 1000)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (4, 1004)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (9, 1004)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (10, 1004)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (15, 1001)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (15, 1002)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (15, 1003)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (16, 1001)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (16, 1002)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (16, 1003)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (17, 1005)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (17, 1006)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (18, 1007)
INSERT [dbo].[BranoAlbum] ([IdAlbum], [IdBrano]) VALUES (19, 1008)
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Album]    Script Date: 22/10/2021 13:34:48 ******/
ALTER TABLE [dbo].[Album] ADD  CONSTRAINT [UK_Album] UNIQUE NONCLUSTERED 
(
	[TitoloAlbum] ASC,
	[AnnoUscita] ASC,
	[CasaDiscografica] ASC,
	[Genere] ASC,
	[SupportoDistribuzione] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UQ__Band__CFF324918BEA1B51]    Script Date: 22/10/2021 13:34:48 ******/
ALTER TABLE [dbo].[Band] ADD UNIQUE NONCLUSTERED 
(
	[NomeBand] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [U_titolo]    Script Date: 22/10/2021 13:34:48 ******/
ALTER TABLE [dbo].[Brano] ADD  CONSTRAINT [U_titolo] UNIQUE NONCLUSTERED 
(
	[TitoloBrano] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [FK_IdBand] FOREIGN KEY([IdBand])
REFERENCES [dbo].[Band] ([IdBand])
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [FK_IdBand]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_BranoAlbum] FOREIGN KEY([IdAlbum])
REFERENCES [dbo].[Album] ([IdAlbum])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_BranoAlbum]
GO
ALTER TABLE [dbo].[BranoAlbum]  WITH CHECK ADD  CONSTRAINT [FK_BranoAlbum2] FOREIGN KEY([IdBrano])
REFERENCES [dbo].[Brano] ([IdBrano])
GO
ALTER TABLE [dbo].[BranoAlbum] CHECK CONSTRAINT [FK_BranoAlbum2]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [Chk_Distribuzione] CHECK  (([SupportoDistribuzione]='CD' OR [SupportoDistribuzione]='Vinile' OR [SupportoDistribuzione]='Streaming'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [Chk_Distribuzione]
GO
ALTER TABLE [dbo].[Album]  WITH CHECK ADD  CONSTRAINT [Chk_Genere] CHECK  (([Genere]='Classico' OR [Genere]='Jazz' OR [Genere]='Pop' OR [Genere]='Rock' OR [Genere]='Metal'))
GO
ALTER TABLE [dbo].[Album] CHECK CONSTRAINT [Chk_Genere]
GO
USE [master]
GO
ALTER DATABASE [DischiAlbum] SET  READ_WRITE 
GO
