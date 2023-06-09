USE [CoolBooks]
GO
/****** Object:  Table [dbo].[Authors]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Authors](
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
/****** Object:  Table [dbo].[Books]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Books](
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
/****** Object:  Table [dbo].[Genres]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Genres](
	[GenreID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NULL,
	[Description] [nvarchar](250) NULL,
PRIMARY KEY CLUSTERED 
(
	[GenreID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Reviews]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Reviews](
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
/****** Object:  Table [dbo].[Userinfo]    Script Date: 2023/04/11 11:02:23 ******/
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
/****** Object:  Table [dbo].[Users]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Users](
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
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([AuthorID])
REFERENCES [dbo].[Authors] ([AuthorID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([GenreID])
REFERENCES [dbo].[Genres] ([GenreID])
GO
ALTER TABLE [dbo].[Books]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([BookID])
REFERENCES [dbo].[Books] ([BookID])
GO
ALTER TABLE [dbo].[Reviews]  WITH CHECK ADD FOREIGN KEY([UserID])
REFERENCES [dbo].[Users] ([UserID])
GO
ALTER TABLE [dbo].[Users]  WITH CHECK ADD FOREIGN KEY([UserinfoID])
REFERENCES [dbo].[Userinfo] ([UserInfoID])
GO
/****** Object:  StoredProcedure [dbo].[spAddAuthors]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
Create PROCEDURE [dbo].[spAddAuthors]
AS

Insert into Authors (Firstname, Lastname, Created)
values ('J.R.R', 'Tolkien', '2022-11-30');

Insert into Authors (Firstname, Lastname, Created)
values ('William', 'Gibson', '2022-11-15');

Insert into Authors (Firstname, Lastname, Created)
values ('Torey', 'Hayden', '2022-10-12');

Insert into Authors (Firstname, Lastname, Created)
values ('Zadie', 'Smith', '2022-09-02');

Insert into Authors (Firstname, Lastname, Created)
values ('A.A', 'Milne', '2022-02-01');

Insert into Authors (Firstname, Lastname, Created)
values ('John', 'Milton', '2022-02-14');

GO
/****** Object:  StoredProcedure [dbo].[spAddBooks]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO




Create PROCEDURE [dbo].[spAddBooks]
AS

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('The Fellowship of the Ring', 'First of the Lord of the Rings trilogy', '789456', 0, '2022-01-01')

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('Neuromancer', 'Birth of Cyberpunk', '456123', 0, '2022-01-01')

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('One Child', 'child psychopathology, child abuse', '456123', 0,'2022-04-02')

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('Grand Union: Stories', '10 short stories', '45612311', 0, '2022-09-11')

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('Winnie-The-Pooh', 'Our beloved Pooh Bear', '4561231145', 0, '2022-10-03')

Insert into Books (Title, Description, ISBN, IsDeleted, Created)
values ('Paradise Lost', 'Where the angles fear to tread', '456123666', 0, '2022-10-03')


GO
/****** Object:  StoredProcedure [dbo].[spAddGenres]    Script Date: 2023/04/11 11:02:23 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO



Create PROCEDURE [dbo].[spAddGenres]
AS
Insert into Genres (Name)
values ('Science Fiction')

Insert into Genres (Name)
values ('Fantasy')

Insert into Genres (Name)
values ('Children''s Books')

Insert into Genres (Name)
values ('Poetry')

Insert into Genres (Name)
values ('Short Stories')

Insert into Genres (Name)
values ('Non-Fiction')


GO
