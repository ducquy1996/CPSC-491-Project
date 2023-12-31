USE [English]
GO
/****** Object:  Table [dbo].[Course]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Course](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[LanguageId] [varchar](2) NOT NULL,
	[Name] [nvarchar](500) NOT NULL,
	[Image] [varchar](250) NULL,
	[Description] [nvarchar](300) NOT NULL,
	[Content] [nvarchar](max) NOT NULL,
	[Benefits] [nvarchar](1000) NULL,
	[Requirements] [nvarchar](max) NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[Status] [bit] NOT NULL,
	[TopHot] [bit] NOT NULL,
 CONSTRAINT [PK_dbo.Course] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Lecture]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Lecture](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[UrlVideo] [varchar](250) NOT NULL,
	[TimeVideo] [float] NOT NULL,
	[IsTest] [bit] NOT NULL,
	[FileTest] [nvarchar](max) NULL,
	[TestTitle] [nvarchar](max) NULL,
 CONSTRAINT [PK_dbo.Lecture] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Rating]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Rating](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Point] [float] NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[CourseId] [int] NOT NULL,
 CONSTRAINT [PK_dbo.Rating] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Role]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Role](
	[Id] [int] NOT NULL,
	[Name] [nvarchar](255) NOT NULL,
 CONSTRAINT [PK_dbo.Role] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[StudentSubject]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[StudentSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[Status] [int] NOT NULL,
	[CreatedDate] [datetime] NOT NULL,
	[ApproveName] [nvarchar](250) NULL,
 CONSTRAINT [PK_dbo.StudentSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Subject]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Subject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](250) NOT NULL,
	[Content] [nvarchar](max) NULL,
	[Image] [varchar](250) NULL,
	[CreatedDate] [datetime] NOT NULL,
	[CreatedBy] [varchar](50) NOT NULL,
	[ModifiedDate] [datetime] NOT NULL,
	[ModifiedBy] [varchar](50) NOT NULL,
	[NumberStudent] [int] NOT NULL,
	[MaxStudent] [int] NOT NULL,
	[CourseId] [int] NOT NULL,
	[Status] [bit] NOT NULL,
	[Description] [nvarchar](300) NOT NULL,
 CONSTRAINT [PK_dbo.Subject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TeacherSubject]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TeacherSubject](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Username] [varchar](50) NOT NULL,
	[SubjectId] [int] NOT NULL,
	[StartTime] [date] NOT NULL,
	[FinishTime] [date] NULL,
 CONSTRAINT [PK_dbo.TeacherSubject] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[User]    Script Date: 10/12/23 17:38:33 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[User](
	[Username] [varchar](50) NOT NULL,
	[Password] [varchar](100) NOT NULL,
	[Status] [bit] NOT NULL,
	[RoleId] [int] NOT NULL,
	[FullName] [nvarchar](250) NOT NULL,
	[Email] [varchar](250) NOT NULL,
	[Phone] [varchar](50) NULL,
	[IsLocked] [bit] NOT NULL,
	[LinkAvata] [varchar](250) NULL,
	[DateOfBirth] [date] NOT NULL,
	[Gender] [int] NOT NULL,
 CONSTRAINT [PK_dbo.User] PRIMARY KEY CLUSTERED 
(
	[Username] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
SET IDENTITY_INSERT [dbo].[Course] ON 

INSERT [dbo].[Course] ([Id], [LanguageId], [Name], [Image], [Description], [Content], [Benefits], [Requirements], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TopHot]) VALUES (1, N'en', N'Program Javascript pro', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', N'Javascript language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, Javascript can create website applications and websites that can run on the server.', N'<p>Javascript language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, Javascript can create website applications and websites that can run on the server.</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>

<p>&nbsp;</p>
', N'Javascript language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, Javascript can create website applications and websites that can run on the server.', N'Javascript language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, Javascript can create website applications and websites that can run on the server.', CAST(N'2020-02-22T14:39:18.127' AS DateTime), N'Thùy Linh', CAST(N'2023-10-01T20:59:27.390' AS DateTime), N'Qu?n Tr?', 1, 0)
INSERT [dbo].[Course] ([Id], [LanguageId], [Name], [Image], [Description], [Content], [Benefits], [Requirements], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TopHot]) VALUES (26, N'en', N'Program .Net pro', N'/FileUploads/images/lg1.jpg', N'.Net language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, .Net can create website applications and websites that can run on the server.', N'<p>.Net language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, .Net can create website applications and websites that can run on the server.</p>
', N'.Net language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, .Net can create website applications and websites that can run on the server.', N'.Net language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, .Net can create website applications and websites that can run on the server.', CAST(N'2020-02-22T00:00:00.000' AS DateTime), N'Thùy Linh', CAST(N'2023-10-01T21:00:27.013' AS DateTime), N'Qu?n Tr?', 1, 0)
INSERT [dbo].[Course] ([Id], [LanguageId], [Name], [Image], [Description], [Content], [Benefits], [Requirements], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [Status], [TopHot]) VALUES (27, N'en', N'Program Php pro', N'/FileUploads/images/lg2.jpg', N'PHP language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, PHP can create website applications and websites that can run on the server', N'<p>PHP language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, PHP can create website applications and websites that can run on the server</p>
', N'PHP language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, PHP can create website applications and websites that can run on the server', N'PHP language is a code or scripting language used to develop applications written for servers. This language is run on the server, generating html code on the client. Thanks to that, PHP can create website applications and websites that can run on the server', CAST(N'2020-02-23T00:00:00.000' AS DateTime), N'Thùy Linh', CAST(N'2023-10-01T20:56:44.140' AS DateTime), N'Qu?n Tr?', 1, 0)
SET IDENTITY_INSERT [dbo].[Course] OFF
GO
SET IDENTITY_INSERT [dbo].[Lecture] ON 

INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (1, N' Lesson 1: Javascript program part 1', 1, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:22:32.117' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/video/1.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (2, N' Lesson 2: Javascript program part 2', 1, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:23:32.310' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (3, N' Lesson 3 :  Javascript program part 3', 1, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:24:41.703' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (4, N' Lesson 4: Javascript program part 4', 1, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:25:15.600' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (5, N'Lesson 1 :  .Net program part 1', 6, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:27:32.597' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (6, N'Lesson 2 : .Net program part 2', 6, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:27:06.163' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (7, N' Lesson 3 : .Net program part 3', 6, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:31:11.877' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (8, N'Lesson 4 : .Net program part 4', 6, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:28:46.463' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (9, N'Lesson 1 : Php program part 1', 7, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:30:29.783' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (10, N'Lesson 2 : Php program part 2', 7, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:30:12.703' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (11, N'Lesson 3 : Php program part 3', 7, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:32:02.913' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
INSERT [dbo].[Lecture] ([Id], [Name], [SubjectId], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [UrlVideo], [TimeVideo], [IsTest], [FileTest], [TestTitle]) VALUES (12, N'Lesson 4 :  Php program part 4', 7, CAST(N'2020-02-22T17:25:22.960' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:32:41.927' AS DateTime), N'Qu?n Tr?', N'/FileUploads/files/2020-02-10_18-40-46.mp4', 17.368526, 0, NULL, NULL)
SET IDENTITY_INSERT [dbo].[Lecture] OFF
GO
INSERT [dbo].[Role] ([Id], [Name]) VALUES (1, N'Admin')
GO
SET IDENTITY_INSERT [dbo].[StudentSubject] ON 

INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (1, N'phucnd', 1, 1, CAST(N'2019-01-01T00:00:00.000' AS DateTime), N'Thùy Linh')
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (2, N'phucnd', 7, 1, CAST(N'2020-02-22T23:42:44.323' AS DateTime), NULL)
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (3, N'sauanla', 1, 1, CAST(N'2021-04-05T21:18:44.910' AS DateTime), N'Quản Trị')
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (4, N'sauanla', 6, 1, CAST(N'2023-09-20T12:08:21.537' AS DateTime), N'Quản Trị')
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (5, N'phucnd2', 1, 1, CAST(N'2023-10-01T20:37:20.593' AS DateTime), N'Quản Trị')
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (6, N'phucnd', 6, 1, CAST(N'2023-10-02T21:47:27.653' AS DateTime), N'Quản Trị')
INSERT [dbo].[StudentSubject] ([Id], [Username], [SubjectId], [Status], [CreatedDate], [ApproveName]) VALUES (7, N'phucnd2', 6, 1, CAST(N'2023-10-02T22:45:05.057' AS DateTime), N'Quản Trị')
SET IDENTITY_INSERT [dbo].[StudentSubject] OFF
GO
SET IDENTITY_INSERT [dbo].[Subject] ON 

INSERT [dbo].[Subject] ([Id], [Name], [Content], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NumberStudent], [MaxStudent], [CourseId], [Status], [Description]) VALUES (1, N'Program Javascript ', N'<p>JavaScript is known as an object-oriented programming language. It works in many fields, while supporting scripts or programs optimally. As follows:</p>

<p>This is a cross-platform language that can be used on many different technology platforms. Including websites, Desktop applications, games or server systems,...</p>

<p>JavaScript has the ability to support scripts or programs for everyone using a supporting language (Scripting Language). In particular, it can quickly execute programmed content without having to go through the compilation stage.</p>

<p>It can be said that when learning about Javascript, people will see many concepts. However, in general, this is an object-oriented programming language. It has the optimal effect in supporting IT workers in their work process accurately, quickly and effectively.</p>
', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', CAST(N'2020-02-22T14:51:51.033' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:39:23.210' AS DateTime), N'Qu?n Tr?', 0, 200, 1, 1, N'JavaScript is known as an object-oriented programming language. It works in many fields, while supporting scripts or programs optimally.')
INSERT [dbo].[Subject] ([Id], [Name], [Content], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NumberStudent], [MaxStudent], [CourseId], [Status], [Description]) VALUES (6, N'Program .Net', N'<p>C# (also known as C Sharp, is a modern, object-oriented programming language developed by Microsoft as part of the .NET platform. It was first introduced in 2000 and has since become one of the most widely used programming languages in the industry.</p>
', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', CAST(N'2020-01-02T00:00:00.000' AS DateTime), N'Thùy Linh', CAST(N'2023-09-30T22:40:47.283' AS DateTime), N'Qu?n Tr?', 1, 201, 26, 1, N'C# (also known as C Sharp, is a modern, object-oriented programming language developed by Microsoft as part of the .NET platform. It was first introduced in 2000 and has since become one of the most widely used programming languages in the industry.')
INSERT [dbo].[Subject] ([Id], [Name], [Content], [Image], [CreatedDate], [CreatedBy], [ModifiedDate], [ModifiedBy], [NumberStudent], [MaxStudent], [CourseId], [Status], [Description]) VALUES (7, N'Program php', N'<p>Php&nbsp; (also known as Php&nbsp;, is a modern, object-oriented programming language developed by Microsoft as part of the Php platform. It was first introduced in 2000 and has since become one of the most widely used programming languages in the industry.</p>
', N'/FileUploads/images/mon-hoc-lap-trinh-vien-javascript.png', CAST(N'2020-01-03T00:00:00.000' AS DateTime), N'Thùy Linh', CAST(N'2023-10-01T21:02:35.680' AS DateTime), N'Qu?n Tr?', 1, 202, 27, 1, N'Php (also known as Php , is a modern, object-oriented programming language developed by Microsoft as part of the Php platform. It was first introduced in 2000 and has since become one of the most widely used programming languages in the industry.')
SET IDENTITY_INSERT [dbo].[Subject] OFF
GO
SET IDENTITY_INSERT [dbo].[TeacherSubject] ON 

INSERT [dbo].[TeacherSubject] ([Id], [Username], [SubjectId], [StartTime], [FinishTime]) VALUES (1, N'trangcho', 1, CAST(N'2020-01-01' AS Date), CAST(N'2020-01-02' AS Date))
SET IDENTITY_INSERT [dbo].[TeacherSubject] OFF
GO
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'admin', N'QUbfHrxLK0muGx2imsJH9vdbeEHDvmlS', 1, 1, N'Quản Trị', N'uim89127@zzrgg.com', N'0973 112 112', 0, N'/FileUploads/images/28618678.png', CAST(N'1997-01-01' AS Date), 0)
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'phucnd', N'bhGcNRtNdXOuGx2imsJH9vdbeEHDvmlS', 1, 3, N'kaka', N'kaka@gmail.com', N'0973652652', 0, N'/Content/images/team/2.png', CAST(N'1997-01-01' AS Date), 1)
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'phucnd2', N'bhGcNRtNdXOuGx2imsJH9vdbeEHDvmlS', 1, 3, N'kuku', N'kuku@gmail.com', N'0973652652', 0, N'/Content/images/team/2.png', CAST(N'1997-01-01' AS Date), 1)
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'sauanla', N'QUbfHrxLK0muGx2imsJH9vdbeEHDvmlS', 1, 3, N'Nathalie Riviere', N'fpy42833@zwoho.com', N'0465330288', 0, N'/Content/images/team/3.png', CAST(N'1998-01-01' AS Date), 0)
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'trangcho', N'QUbfHrxLK0muGx2imsJH9vdbeEHDvmlS', 1, 2, N'Trang ', N'uim89127@zzrgg.com', N'0973642632', 0, N'/FileUploads/images/28618678.png', CAST(N'1997-10-13' AS Date), 0)
INSERT [dbo].[User] ([Username], [Password], [Status], [RoleId], [FullName], [Email], [Phone], [IsLocked], [LinkAvata], [DateOfBirth], [Gender]) VALUES (N'trangchoooo', N'QUbfHrxLK0muGx2imsJH9vdbeEHDvmlS', 1, 3, N'Trang cực chó', N'link@gmail.com', N'0973652652', 0, N'/Content/images/team/2.png', CAST(N'1997-01-01' AS Date), 1)
GO
ALTER TABLE [dbo].[Lecture] ADD  DEFAULT ((0)) FOR [IsTest]
GO
ALTER TABLE [dbo].[Lecture]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Lecture_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[Lecture] CHECK CONSTRAINT [FK_dbo.Lecture_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[Rating]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Rating_dbo.Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Rating] CHECK CONSTRAINT [FK_dbo.Rating_dbo.Course_CourseId]
GO
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentSubject_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_dbo.StudentSubject_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[StudentSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.StudentSubject_dbo.User_Username] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[StudentSubject] CHECK CONSTRAINT [FK_dbo.StudentSubject_dbo.User_Username]
GO
ALTER TABLE [dbo].[Subject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.Subject_dbo.Course_CourseId] FOREIGN KEY([CourseId])
REFERENCES [dbo].[Course] ([Id])
GO
ALTER TABLE [dbo].[Subject] CHECK CONSTRAINT [FK_dbo.Subject_dbo.Course_CourseId]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TeacherSubject_dbo.Subject_SubjectId] FOREIGN KEY([SubjectId])
REFERENCES [dbo].[Subject] ([Id])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_dbo.TeacherSubject_dbo.Subject_SubjectId]
GO
ALTER TABLE [dbo].[TeacherSubject]  WITH CHECK ADD  CONSTRAINT [FK_dbo.TeacherSubject_dbo.User_Username] FOREIGN KEY([Username])
REFERENCES [dbo].[User] ([Username])
GO
ALTER TABLE [dbo].[TeacherSubject] CHECK CONSTRAINT [FK_dbo.TeacherSubject_dbo.User_Username]
GO
