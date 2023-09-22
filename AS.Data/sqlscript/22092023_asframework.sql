USE [AsFramework]
GO
/****** Object:  Schema [AS]    Script Date: 22.09.2023 11:19:57 ******/
CREATE SCHEMA [AS]
GO
/****** Object:  Table [AS].[ActionStatus]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[ActionStatus](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](max) NOT NULL,
	[Description] [nvarchar](max) NOT NULL,
 CONSTRAINT [PK_ActionStatus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [AS].[Language]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[Language](
	[Id] [uniqueidentifier] NOT NULL,
	[Keyword] [nvarchar](max) NOT NULL,
	[Tr] [nvarchar](max) NOT NULL,
	[En] [nvarchar](max) NOT NULL,
	[Fr] [nvarchar](max) NULL,
	[Es] [nvarchar](max) NULL,
	[De] [nvarchar](max) NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_Language] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [AS].[Menus]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[Menus](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](512) NOT NULL,
	[MenuUrl] [varchar](512) NOT NULL,
	[Icon] [varchar](512) NOT NULL,
	[Description] [varchar](512) NOT NULL,
	[DisplayOrder] [int] NOT NULL,
	[ParentMenuId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_Menus] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[PermissionMenuLines]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[PermissionMenuLines](
	[Id] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
	[MenuId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_PermissionMenuLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[Permissions]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[Permissions](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](512) NOT NULL,
	[Description] [varchar](512) NOT NULL,
	[ControllerName] [varchar](512) NOT NULL,
	[ActionName] [varchar](512) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
	[ActionStatusId] [int] NULL,
	[CRUDActionType] [int] NOT NULL,
 CONSTRAINT [PK_Permissions] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[RolePermissionLines]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[RolePermissionLines](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[PermissionId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_RolePermissionLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[Roles]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[Roles](
	[Id] [uniqueidentifier] NOT NULL,
	[Name] [varchar](512) NOT NULL,
	[Description] [varchar](512) NOT NULL,
	[Level] [int] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_Roles] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[RoleUserLines]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[RoleUserLines](
	[Id] [uniqueidentifier] NOT NULL,
	[RoleId] [uniqueidentifier] NOT NULL,
	[UserId] [uniqueidentifier] NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_RoleUserLines] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [AS].[Users]    Script Date: 22.09.2023 11:19:58 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [AS].[Users](
	[Id] [uniqueidentifier] NOT NULL,
	[FirstName] [nvarchar](max) NOT NULL,
	[LastName] [nvarchar](max) NOT NULL,
	[Username] [varchar](512) NOT NULL,
	[Password] [char](128) NOT NULL,
	[Email] [varchar](512) NOT NULL,
	[CreationTime] [datetime2](7) NOT NULL,
	[CreatedById] [uniqueidentifier] NOT NULL,
	[UpdateTime] [datetime2](7) NOT NULL,
	[UpdatedById] [uniqueidentifier] NOT NULL,
	[IsApproved] [bit] NOT NULL,
 CONSTRAINT [PK_Users] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[__EFMigrationsHistory]    Script Date: 22.09.2023 11:19:58 ******/
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
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8e9a9fde-d6e9-4c59-a611-005a0ff7827f', N'TEXT.Archived', N'Arşivle', N'Archived', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4060622' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4060629' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f57cf504-cc3d-480a-a520-005db502e20e', N'TEXT.Filter', N'Filtre', N'Filter', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4830311' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4830322' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'14537246-73fd-4e2b-8a6d-00ea6b07cad8', N'TEXT.Participant_List', N'Katılımcı Listesi', N'Participant List', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5371381' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5371387' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e62c98de-ea95-474e-9e34-016aa74b70a1', N'TEXT.Email_Type', N'E-Posta Türü', N'E-Posta Türü', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4462502' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4462509' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f2788d01-76bc-48a5-9e8e-0199d8ce77bc', N'TEXT.Upgrade_Plan_Text_One', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6301258' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6301266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'40bec537-801a-4c23-a2d6-01c4faec03a4', N'TEXT.Add_New_Event', N'Yeni Etkinlik Ekle', N'Add New Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3961677' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3961684' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'03c1460a-08e5-4ddf-8e00-01c89fb910c0', N'TEXT.Team_Name', N'Takım adı', N'Team name', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6207126' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6207132' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'449461ed-9456-477c-b7f9-01d9bfd4c29a', N'TEXT.July', N'Temmuz', N'July', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3825989' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3825994' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dcb94128-bb9a-4235-aca7-0227aa19c034', N'TEXT.Menu', N'Menü', N'Menu', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5120101' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5120108' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'de088410-7b7a-4b1f-8c9d-033a74e4c24d', N'TEXT.Package_Promo_Code_Description', N'Herhangi bir promosyon kodunuz yok. Platin paket eklemek isterseniz lütfen butonuna tıklayınız.', N'You haven\''t any promotion code . If you want add platinium package please click button.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5349612' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5349621' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd3b803d4-365b-4dca-be81-037cfbf04e75', N'TEXT.Select_Package_Two_Text2', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5881384' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5881391' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3aefa687-3e2b-4016-a7dc-040d6346f746', N'TEXT.Add_User', N'Kullanıcı Ekle', N'Add User', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4003544' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4003550' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'124e3ffc-3ddf-4b59-b8d9-0423c8c844df', N'TEXT.File_Select_Contact', N'FileSelectContact', N'FileSelectContact', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4792583' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4792590' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7354f765-46d6-4cbc-a6a7-04d8d8ac680b', N'TEXT.Max_Program_Count', N'Maksimum Program Sayısı', N'Max Program Count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5095598' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5095605' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'adf53c17-92ef-4c28-8da8-05f10d80a642', N'TEXT.Doesnt_Match_Password', N'Şifreler eşleşmedi', N'Passwords didn''t match', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4353702' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4353709' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6e8cfa6b-f8ea-4ba1-8079-0663aa8decf5', N'TEXT.Time', N'Saat', N'Time', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6228840' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6228846' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'28f761a8-9e7c-4d4a-afcd-0666da1b4f45', N'TEXT.File_Add', N'Dosya eklendi', N'File added', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4754357' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4754364' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c0196c29-f0bd-4e64-92e3-07167443ba1f', N'TEXT.All_Rights_Reserved', N'Tüm hakları saklıdır', N'All rights reserved', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4029047' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4029054' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c2f47532-ec68-41cc-a284-07922e0646eb', N'TEXT.Required', N'Zorunlu Alan', N'Required', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5608968' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5608975' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9fe1620a-b0e5-4cfe-adba-07c0d0fc7b90', N'TEXT.Password_Again_Text', N'Şifre Tekrarı', N'Confirm Password ', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5391044' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5391050' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'00ba8360-3c67-4ee0-9896-081d2ce86a90', N'TEXT.Edit_Contact', N'Kişiyi Güncelle', N'Edit Contact', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4400256' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4400262' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'77fd498d-8e12-4d67-9516-085dce799461', N'TEXT.Are_You_Sure', N'Emin Misin?', N'Are you sure?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4076952' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4076959' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bf4a86c9-c7af-4650-95a8-0936e92682bb', N'TEXT.Email_Encryption', N'E-posta Şifreleme', N'E-mail Encryption', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4434526' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4434533' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e9878c17-fd89-4410-abe0-09cf6fd8dbac', N'TEXT.Choose_Payment_Method', N'Ödeme Yöntemini Seçin', N'Choose Payment Method', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4144292' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4144304' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'62e107db-c002-4058-b6ca-09de24633a6a', N'TEXT.Select_Ready_Messages', N'Hazır Mesaj Seç', N'Select Scripted Message', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5900575' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5900583' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'460e18a2-7518-4cf7-b951-0a500ee222a8', N'TEXT.Reports_Auths_Des', N'Kullanıcı, tüm ekiplerin ve bireylerin raporlarına erişebilir.', N'The user can access the reports of all teams and individuals.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5603971' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5603981' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b0bfe061-a808-4e2e-a010-0a7ab9949472', N'TEXT.Restored_Report', N'Yetkilendirme Raporu', N'Auth Report', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5633575' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5633582' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e92370da-cd14-421e-9bd0-0af3f37fd2dd', N'TEXT.Signup_Fairscope', N'Fairscope\''a kaydolun', N'Sign up to Fairscope', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6035048' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6035056' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'33378b02-9e49-4940-9cd5-0b327d2d9841', N'TEXT.Z_To_A', N'Z’den A’ya', N'From Z to A', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6459835' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6459841' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fa17a3cb-3c9f-4ab8-8f95-0ba421605374', N'TEXT.Recent', N'Mevcut', N'Recent', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5561140' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5561149' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c5cd2091-af73-43a1-b94e-0c674cb18bd0', N'TEXT.Minute_Short', N'MN', N'DK', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5129621' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5129629' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8744ae63-9f67-4905-ba1c-0ccca2245594', N'TEXT.Email_Settings', N'E-Posta ayarları', N'E-Mail Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4457840' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4457847' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1e487602-403f-4f31-a088-0cfcdac6b66b', N'TEXT.Library', N'Kütüphane', N'Library', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5007119' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5007126' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'721c2056-2331-4d85-9e28-0dcd9626509e', N'TEXT.Sector_Automotive', N'Otomotiv Sektörü', N'Sector Automative', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5711129' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5711139' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'535ced7c-313b-4cb4-a4d9-0debd85721cd', N'TEXT.Tue', N'Sal', N'Tue', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6275696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6275702' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dba6ea26-ab37-4aae-a4a3-0ed52fb02a47', N'TEXT.Select_Team_Member', N'Takım Üyesi Seç', N'Select Team Member', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5905313' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5905320' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd228e059-4cac-4ed4-86c5-0f4b0f3e71c9', N'TEXT.Current_Event', N'Mevcut Etkinlik', N'Current Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4265141' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4265150' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'47b21211-cc1b-4581-9bd4-0f97d693e058', N'TEXT.Notifications', N'Bildirimler', N'Notifications', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5284236' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5284243' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1825e14a-584d-4c49-b54b-11f1667c42f1', N'TEXT.Offical_Event', N'Resmi Etkinlik', N'Offical Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5288459' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5288466' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7303f6d9-1843-4601-92d1-12975ca4934c', N'TEXT.Share', N'Paylaş', N'Share', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6000552' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6000558' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a9b3260d-8305-499c-9e93-12eda2ef7f73', N'TEXT.Team_Auths', N'Takım Yetkileri', N'Team Auths', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6196264' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6196270' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'713c895d-1a10-466e-9b23-130ddeabd0ec', N'TEXT.Sector_Fruits_And_Vegetables', N'Meyve ve Sebze', N'Fruit and Vegetable', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5741266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5741273' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6a27c3f7-152a-4190-8514-131dad13c0ca', N'TEXT.Detail', N'Detay', N'Detail', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4333457' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4333463' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c9e9417d-fb3c-4d60-a137-13534c8af1c1', N'TEXT.Card', N'Kart', N'Card', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4124183' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4124190' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dea10e88-4c83-4ef8-a5b5-13ac4448284c', N'TEXT.Remember_Me', N'Beni hatırla', N'Remember Me', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5576603' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5576611' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'597e1c24-37bc-48e8-9c6c-146af3e547e6', N'TEXT.To_Do', N'Yapılacaklar', N'To do', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6246937' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6246944' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'29483fc3-1a94-4edf-8080-15097e10cdf4', N'TEXT.Event_Participant', N'Etkinlik Katılımcıları', N'Event Participants', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4726318' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4726325' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ac7f6747-42b6-43cd-98ba-157b583f5c8d', N'TEXT.Year_Short', N'Y', N'Y', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6441617' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6441624' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'42503b37-e197-4783-85aa-159df7aec632', N'TEXT.Password', N'Şifre', N'Password', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5386150' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5386159' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'38d53771-690a-4013-9265-15aec2e017b5', N'TEXT.Email_Return_Address', N'E-posta İade Adresi', N'Email Return Address', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4448389' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4448395' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd83a45ad-622e-4895-957c-162a60473a45', N'TEXT.Home', N'Ev', N'Home', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4872569' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4872577' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a1ac6f0b-5247-47ce-8c1e-175035f08ef6', N'TEXT.Upgrade_Plan_Title_Three', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6323078' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6323084' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd75869ad-6214-4fe6-84ea-175667a3410f', N'TEXT.Contact_Us_Descirption', N'Etkinliğinizi burada görmek istiyorsanız bizimle iletişime geçin.', N'Contact us if you want to see your event here', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4236083' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4236090' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7f841ec0-cfc4-48c3-8aba-1809c71b9255', N'TEXT.Select_Event_Date', N'Etkinlik Tarihi Seçiniz', N'Select Event Date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5825397' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5825403' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2e50aaa6-6f82-43bd-a6b0-19105a9b8931', N'TEXT.Error_Must_Contain_A_Valid_Email', N'Geçersiz E-Posta Formatı', N'Invalid Email Format', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3808589' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3808594' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c1c61bcc-0d13-455c-a7fb-19333edbd5b8', N'TEXT.Forget_Password', N'Şifrenizi mi unuttunuz?', N'Forget your password?', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4844613' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4844619' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6405d0cd-8e79-49de-8643-19539646963f', N'TEXT.Past', N'Geçmiş', N'Past', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5406135' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5406143' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'620fe3b6-4c28-498a-941f-197b38a4dcab', N'TEXT.Select_Package_One_Text3', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5846258' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5846264' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'45dd75d3-4807-47ff-9ece-19a3034d80f2', N'TEXT.Empty_File', N'Hiç dosya yok!', N'There is no file here!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4509754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4509761' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5230a81b-d497-4a9b-a749-19ede2d2290f', N'TEXT.Package_Definitions', N'Paket Tanımları', N'Package Definitions', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5331453' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5331460' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'25a9d2a1-80a0-4411-9651-1a1cd77b2f36', N'TEXT.Package_Premium_Description', N'Premium paketiniz yok. Premium paket eklemek istiyorsanız lütfen butonuna tıklayınız.', N'You haven\''t any premium package. If you want add premium package please click button.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5339761' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5339769' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8e880dca-756b-41bd-8ada-1a596954ec29', N'TEXT.Tutorial_Search', N'Arama sonuçlarını daraltabilir. <br>stediğiniz sonuçları hızlı bir şekilde <br> görüntüleyebilirsiniz.', N'Can narrow the search results. <br>You can quickly view <br> the results you want.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3870765' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3870769' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a32f3f8c-d2e4-4be5-bfcb-1a793efcab6b', N'TEXT.September', N'Eylül', N'September', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3841191' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3841195' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd1ea689f-6367-497b-b888-1b94be6f13eb', N'TEXT.Something_Went_Wrong', N'Yanlış giden bir şey var', N'There is something wrong', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6071117' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6071123' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'53e132da-e695-455e-b8a5-1bd3554bf239', N'TEXT.Terminated_Premium_Account', N'Sonlandırılan Premium Hesap', N'Terminated Premium Account', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6214397' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6214403' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'00e26ff3-b63b-4eed-a607-1cc4896b8d3f', N'TEXT.Sat', N'Cte', N'Sat', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5655611' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5655622' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'49df109e-c9e3-4f66-9f13-1d50b53b652e', N'TEXT.Settings_Suspend_Account_Text', N'Hesabı Askıya Al', N'Suspend the Account', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5996371' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5996376' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c86c655f-b9f6-488b-a790-1d53d4810dd0', N'TEXT.Restored_Kiosk', N'Yetki Kiosku', N'Auth Kiosk', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5624052' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5624061' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cff014e0-afb2-49b6-84ab-1d5e280396e5', N'TEXT.Not_Yet_Member', N'Henüz üye değil misiniz?', N'Not yet a member?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5243984' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5243991' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bb7e0d9e-0610-49a7-972a-1e6964ed1fea', N'TEXT.Restored_Team', N'Yetkilendirme Ekibi', N'Auth Team', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5639121' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5639131' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'74af7748-e86a-4a06-a27c-1ed123f975ca', N'TEXT.Empty_Sector_Error', N'Sektör boş olamaz', N'Sector cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4634360' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4634367' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'abda2ada-c744-4989-8252-1f3d5b828d06', N'TEXT.Not_Completed', N'Tamamlanmamış', N'Not Completed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5239242' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5239249' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c6b53b1f-4496-418d-af94-1f7bfbd2a0d9', N'TEXT.Settings_Notification_Text', N'Bildirim Ayarları', N'Notification Settings', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5981971' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5981979' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4b2f1277-00f2-4a40-b801-1fcb7f486b96', N'TEXT.Update', N'Güncelle', N'Update', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6286677' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6286683' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'71a90b01-8862-4670-93fe-206299d70d4a', N'TEXT.Settings_Confıdentıalıty_Agreement_Text', N'Gizlilik Anlaşması', N'Confidentiality Agreement', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5963742' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5963749' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1f11f733-20a4-4881-8b78-21a1ac8fbc44', N'TEXT.Max_Event_Count', N'Maksimum Etkinlik Sayısı', N'Max Event Count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5074685' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5074696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'666ba87a-5d15-4e59-9562-22f6b72555cc', N'TEXT.Payment_Settings', N'Ödeme Ayarları', N'Payment Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5433174' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5433180' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c9f2a784-761b-4125-8da3-241913e518de', N'TEXT.Team_Auth_Des', N'Kullanıcı bir ekip oluşturma, silme ve atama yetkisine sahiptir', N'The user has the authority to create, delete and assign a team', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6192637' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6192643' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'174fce95-8f3c-4c38-a231-24338ae3021c', N'TEXT.Qr_Text', N'Gerekli bilgileri indirmek ve girmek için QR kodunu tarayın', N'Scan the QR code to fill the form on your mobile phone', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5537895' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5537903' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a44712e2-cd1d-43f2-82ea-247a51ce691d', N'TEXT.Error_Select_Member', N'Select member cannot be empty!', N'Select member cannot be empty!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4671892' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4671901' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'729c230c-5471-4d42-a1aa-250778e231d2', N'TEXT.Select_Your_White_Logo', N'Beyaz logonuzu seçin', N'Select your white logo', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5924637' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5924645' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'307b1b7e-dc2a-495c-b452-25495d614626', N'TEXT.All', N'Tüm', N'All', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4024750' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4024756' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b868d1f7-9861-45da-bf7e-2615b568118c', N'TEXT.Empty_Mail2_Error', N'İkinci email adresi boş olamaz', N'Second email address cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4536156' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4536164' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5784d2fb-dc91-45ac-9740-26fcaefb8130', N'TEXT.Users', N'Kullanıcılar', N'Users', N'', N'', N'', CAST(N'2023-08-23T13:22:44.4567160' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:22:44.4567164' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c9e96784-bf0c-431a-a1fd-27141cf5af6c', N'TEXT.Premium_Account_Button_Text', N'Premium hesabınızın süresinin bitmesine gün kaldı.', N'Days left until your premium account expires.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5499423' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5499431' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7fc43bed-30f1-466d-8061-277faae0879b', N'TEXT.Tutorial_Finish', N'Sayfa eğitimleri tamamlandı. <br> Bu deneyimi beğendin mi?', N'Page tutorials finish. <br>Did you like this experience ?', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3848839' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3848844' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'73409b0f-3745-4906-9f3e-28afb8a18ee7', N'TEXT.Kiosk_Auths', N'Kioks Yetkisi', N'KIOSK_AUTHS', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4947180' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4947187' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'64532a85-9338-47db-81ae-293de261cc5d', N'TEXT.Discountrate', N'İndirim oranı', N'Discount rate', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4337940' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4337946' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'26f0c904-d1dc-40c2-a4d3-29c013d607df', N'TEXT.Select_A_Team_Member', N'Lütfen Bir Ekip Üyesi Seçin', N'Please Select A Team Member', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5783970' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5783976' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b1ba53ff-87ac-4118-9d9a-2a0b8c062e23', N'TEXT.Archived_Team', N'Arşivlenmiş Ekip', N'archived team', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4068520' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4068527' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2860cee6-d4cd-4d2e-85db-2aa87f1b71f9', N'TEXT.Delete_Team_Confirm', N'Bu takımı silmek istediğinizden emin misiniz?', N'Are you sure want to delete this team?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4306838' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4306848' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f989bd64-3778-460f-8e4f-2accb71cec5a', N'TEXT.Info_Email', N'Eposta Bilgisi', N'Info Email', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4895729' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4895738' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd0351b68-cd62-4f00-b032-2bd29c2816c9', N'TEXT.Add_New_Team', N'Yeni Takım Ekle', N'Add New Team', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3965363' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3965369' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'41f895c9-59e2-42a3-a8e7-2c12d00aa295', N'TEXT.Sort', N'Sırala', N'Sort', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6075633' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6075639' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fb7e7ba9-e487-40de-a915-2d03eec28109', N'TEXT.Close', N'Kapat', N'Close', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4169265' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4169275' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dabe7e0f-3930-4b18-a99a-2d3cffb06c0e', N'TEXT.Select_Package_Two_Text5', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5895809' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5895817' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fa44b51d-d5c1-44c0-a3b5-2d78e30b5111', N'TEXT.I_Have_Promotion_Code', N'Promosyon kodum var.', N'I have promotion code.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4887204' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4887211' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'52ee0253-8fab-4eb3-aaa6-2dcbf043e6ec', N'TEXT.Remember', N'Hatırlıyor musun? Girişe geri dön', N'Do you remember? Back to login', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5571592' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5571599' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fa13fd2c-853f-4c1d-ba48-2de75845799a', N'TEXT.Menus', N'Menüler', N'Menus', N'', N'', N'', CAST(N'2023-08-23T13:24:25.9555451' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:24:25.9555454' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a82ec0ce-47ee-4409-bdcd-2e06e403cd7f', N'TEXT.Date', N'Tarih', N'Date', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4274225' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4274231' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5c1d04ad-ebb6-40eb-9066-2e39b07b2774', N'TEXT.Select_All', N'Hepsini Seç', N'Select All', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5788275' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5788282' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'81c667d2-9329-4d67-9eea-2ee7959d68bd', N'TEXT.Kiosk_Add_Step4', N'Dosya gönderme koşullarını seçin.', N'Select file submission conditions.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4937827' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4937835' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'306092d3-7d39-4645-ab9c-2fa1ade4d82c', N'TEXT.Empty_Notes', N'Hiç not yok. İstersen yeni bir tane ekleyebilirsin.', N'Hiç not yok. İstersen yeni bir tane ekleyebilirsin.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4550352' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4550360' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd8fe20dc-fac3-4b50-b3d1-2fa9cbc7681b', N'TEXT.Account_Expires_Text', N'Premium hesabınızın süresinin bitmesine gün kaldı.', N'days left until your premium account expires', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3890063' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3890068' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'18fd44e6-3872-4f2e-a39a-2fcd7ccbfaa3', N'TEXT.Search', N'Arama', N'Search', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5673035' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5673048' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd342b1b1-178d-443c-892e-314cab33805f', N'TEXT.Qr_Text2', N'Gelen kutunuza almak için e-postanızı girin', N'Enter your e-mail address to receive the form by e-mail', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5543832' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5543841' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e22f6ffa-f3dc-4fc0-98a2-315679ca5084', N'TEXT.January', N'Ocak', N'January', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3823483' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3823487' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7f307dec-4736-4bd7-8dfc-31b668738570', N'TEXT.Download_Count', N'İndirme Sayısı', N'Download Count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4367709' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4367716' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'53a0895b-1936-47a1-84e3-31cb14de9432', N'TEXT.Edit_User_Profile', N'Kullanıcı Profilini Düzenle', N'Edit User Profile', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4426286' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4426293' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7d7da059-1bc3-49d7-bae4-31fb2b4b6dca', N'TEXT.Start', N'Başla', N'Start', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6097700' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6097707' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2b24829d-a709-402a-8aa6-329690edb953', N'TEXT.Restored_Workers', N'Yetkilendirme Çalışanları', N'Auth Workers', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5645026' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5645034' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'381caec4-afd0-4e77-87b6-33134e982917', N'TEXT.Max_Participent_Count', N'Maksimum Katılımcı Sayısı', N'Max Participent Count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5090017' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5090030' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bf32f078-0488-43f1-a2e3-347ff10ff188', N'TEXT.Surname', N'Soyad', N'Surname', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6142304' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6142311' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f44361c1-faef-4024-b0fb-34923e666212', N'TEXT.Empty_Phone_Type2_Error', N'İkinci telefon tipi boş olamaz', N'Second phone type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4608916' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4608924' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7d1963d4-a93c-4b77-b215-34c108e457c8', N'TEXT.Edit_Event', N'Etkinliği Güncelle', N'Edit Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4409320' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4409328' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e3a5ae99-ff9d-4ae8-9750-34dd0172cf7f', N'TEXT.August', N'Ağustos', N'August', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3798027' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3798526' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3655470b-3a48-43c0-a89f-35554b2a9310', N'TEXT.Login_With_Linkedin', N'Linkedin ile giriş yap', N'Sign in with LinkedIn', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5027238' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5027247' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'60e45b6f-f6a4-4a7b-8870-3680f911d94e', N'TEXT.Info', N'Bilgi', N'Info', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4891499' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4891508' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'84242986-7a1f-4969-bccd-36cc1be77aa5', N'TEXT.Pay_Success_Text', N'Seçtiğiniz planı kullanmaya başlayabilirsiniz.', N'You can start using the plan you choose.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5424965' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5424972' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9bd79bfa-51ef-4898-a3e8-37094ed415ec', N'TEXT.Thank_You', N'Teşekkürler', N'Thank you', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6221571' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6221577' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a5225177-efb5-426d-b039-3747aafc710b', N'TEXT.Company', N'Şirket', N'Company', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4174712' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4174720' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8912e2d9-3f36-4db1-817c-37bb3ee27fef', N'TEXT.Or', N'Veya', N'Or', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5318289' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5318297' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0ffed3a3-a4dd-445e-80ad-38b34675d28f', N'TEXT.Reject', N'Reddet', N'Reject', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5566748' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5566758' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'386eabea-5815-478b-8485-396e15eb2ab0', N'TEXT.Event_Active', N'Buradasınız', N'You are here', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4692827' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4692836' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7e842f2b-f6d0-4342-8211-3a0488a861f7', N'TEXT.Empty_Company_Error', N'Şirket boş olamaz', N'Company cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4487443' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4487451' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'05561f6c-613f-443b-b884-3a672e92b4ba', N'TEXT.My_Task', N'Görevim', N'My Task', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5197448' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5197456' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0a840d55-9261-4290-a18c-3a8ab3bc6da5', N'TEXT.Add_Tag', N'Etiket Ekle', N'Add Tag', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3992533' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3992540' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ed78d264-77ac-47de-b05e-3aa0db07462f', N'TEXT.Event_Detail_Program_Card_Location', N'Fuar Konferans Merkezi', N'Fair Conferance Center', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4710606' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4710617' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c868a916-2d18-4222-81f8-3ade7fbc383d', N'TEXT.Location', N'Konum', N'Location', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5012276' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5012286' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7a351774-b3b2-4ac2-b051-3b1d8b7aba08', N'TEXT.Event_Area', N'Etkinlik Alanı', N'Event Area', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4704953' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4704963' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'09803002-f240-4db9-9ba7-3b5d3a31fddd', N'TEXT.Welcome_Back', N'Tekrar hoşgeldiniz', N'Welcome back', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6410021' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6410027' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ae84f30e-5b54-428f-b24b-3b7bde5bc87a', N'TEXT.User_Settings', N'Kullanıcı Ayarları', N'User Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6378014' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6378021' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c6ba286e-6040-496b-8dfb-3b8de50e3f18', N'TEXT.Accept', N'Kabul Et', N'Accept', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3881205' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3881210' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ac343992-01a6-4f9d-9a7f-3bccb026301d', N'TEXT.Maxusagecount', N'Maksimum kullanım sayısı', N'Max usage count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5110515' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5110526' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3e8c550a-d9c4-441e-bafc-3c00152f1a94', N'TEXT.Shared', N'Paylaşıldı', N'Shared', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6009259' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6009267' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5d7c8a26-9b6e-41f2-9e38-3dc1d914f0db', N'TEXT.Back', N'Geri', N'Back', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4100634' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4100641' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'866dc411-f7c1-4231-ab03-3ec412c9d67a', N'TEXT.Title_Name', N'Başlık Adı', N'Title Name', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6236029' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6236035' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c230c8b8-8914-4685-a71d-3fb036798a71', N'TEXT.Empty_Mail_Error', N'Email adresi boş olamaz', N'Email address cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4518054' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4518062' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0ce2a52b-5aba-4f32-9589-3fb4bb3c9e3e', N'TEXT.Empty_Phone_Type3_Error', N'Üçüncü telefon tipi boş olamaz', N'Third phone type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4614367' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4614377' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'16c791ad-2687-4a16-86e4-3fbd410774aa', N'TEXT.With_Qr_Code', N'QR Code ile', N'With QR Code', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6423385' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6423392' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'446dba4a-a087-48c8-b423-4152aa8ac550', N'TEXT.Created', N'Oluşturuldu', N'Created', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4255488' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4255496' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0ed75814-b046-4697-93df-42a5717a7222', N'TEXT.Day_Short', N'D', N'G', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4278688' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4278696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'64a238e7-8f7d-425c-9109-4319a4d1fd10', N'TEXT.Tutorial_Start', N'sayfa eğitimine başlayacağız.<br> Hazır mısın ?', N'we will start the page tutorial. <br>  Do you ready ?', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3875251' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3875256' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'310b8314-e5cf-4f06-b088-433c78245673', N'TEXT.Sectordefinitions', N'Sektör Tanımları', N'Sector Definitions', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5775101' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5775108' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c9ead413-99c9-46be-9b28-435a699d256e', N'TEXT.Select_Package_Two_Text4', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5890919' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5890927' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c735f441-f25a-4c77-88a7-43f919d57ec4', N'TEXT.Document_Share', N'Dosya Paylaş', N'Document Share', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4342807' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4342815' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'06aea092-7bfa-4862-ada3-443e2aae3733', N'TEXT.Error_Update_Version', N'Sürüm güncellemesi başarısız oldu', N'Version update failed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4676798' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4676807' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'326fadfe-9a9d-4f3a-b416-444c2b9a165d', N'TEXT.Add_Note', N'Not Ekle', N'Add Note', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3974736' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3974743' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5a9822b2-340b-43e6-b093-447290ba0e08', N'TEXT.Email', N'E-Posta', N'E-mail', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4430337' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4430344' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eb3feafc-228f-4a52-b86e-4472b6d03814', N'TEXT.Info_Phone', N'Telefon Bilgisi', N'Info Phone', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4900151' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4900158' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'126eef66-c230-48a8-997f-447d9d419134', N'TEXT.Add_Document', N'Dosya Ekle', N'Add Document', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3929752' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3929758' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a9d208f7-e63c-4d0e-8710-44c704a84ad8', N'TEXT.Select_Package_Two_Text3', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5886114' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5886122' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a431d207-ba80-49ab-acb2-44d7e2c43d04', N'TEXT.Select_Event', N'Etkinlik Seç', N'Select Event', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5820986' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5820992' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'789b1da1-1a25-49b4-b6aa-44fd5b4186ef', N'TEXT.Participants', N'Katılımcılar', N'Participants', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5375887' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5375894' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8a3d2e71-527e-43c2-af29-45375fb7e65a', N'TEXT.Program', N'Program', N'Program', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5522318' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5522325' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5294a443-d5d7-4b32-93c1-45ef6c8c86ae', N'TEXT.New_Password', N'Yeni Şifre', N'New Password', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5215966' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5215974' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ed2c21a-7c76-4702-9292-462bd442df4e', N'TEXT.Contacts', N'Kişiler', N'Contacts', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4241059' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4241067' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'56b6e43b-206b-47e7-8732-4637b9fc2f64', N'TEXT.Complete', N'Tamamla', N'Complete', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4204689' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4204696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8287afbb-46e1-4ed0-acb7-468eb8c2a579', N'TEXT.To', N'Tarafına', N'To', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6243282' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6243288' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fe6e28a4-0c5b-4689-9bf0-47233e678733', N'TEXT.Select_Package_One_Text4', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5850367' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5850374' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b5578ec8-74db-4a34-8e28-47bc90201228', N'TEXT.Teams_Title', N'TAKIMLAR', N'TEAMS', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6210736' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6210742' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4518108c-0a42-4d85-8781-47ea0d4ed899', N'TEXT.Create_Text', N'Oluştur', N'Create', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4250752' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4250760' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2ca8e59a-1a37-43ca-bae0-48bbc6d5001c', N'TEXT.Upgrade_Plan_Title_Two', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6327749' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6327755' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dd5723b1-0dc1-4b8b-9392-48f6f496f185', N'TEXT.New_Contact', N'Yeni Kişi', N'New User', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5211471' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5211479' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'92b5d329-2423-45b5-bbcf-4965a8b31fa0', N'TEXT.Text', N'Metin', N'Text', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6217978' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6217984' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'266c1c16-89c4-4df4-b851-49922038ab86', N'TEXT.Successfully_Set_Attendance_Status', N'Katılım Durumu Başarıyla Ayarlandı', N'Attendance Status Set Successfully ', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6128495' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6128500' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2b270b99-f66b-4300-8171-499a40c745a4', N'TEXT.Archive_Success', N'Başarıyla Arşive Taşındı', N'Succesfully Moved to Archive', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4052783' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4052790' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7d3d6e68-7028-451e-a2e4-49a9d420e323', N'TEXT.Empty_Name_Error', N'İsim boş olamaz', N'Name cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4545633' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4545641' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5c096e4a-1b8a-4f46-b08d-49c1fd0c66c0', N'TEXT.Total_File', N'Toplam Dosya', N'Total File', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6261291' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6261297' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'345fc164-57be-4514-8544-49ccdb500688', N'TEXT.Team_Add_Step2', N'Takımınız için bir takım arkadaşı seçin.', N'Choose a teammate for your team.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6185644' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6185650' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'be961d31-2b43-4485-abc4-49ebc8091b1f', N'TEXT.Waiting_Message', N'Bekleme Mesajı', N'Waiting Message', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6387070' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6387076' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f76f2b0b-4e90-45c3-bbb2-4a7280fae1cd', N'TEXT.Processing_Please_Wait', N'İşlem gerçekleştiriliyor lütfen bekleyin.', N'Processing please wait', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5513494' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5513500' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'06636d77-67c8-442b-b09b-4bc6cbc7fbc4', N'TEXT.Empty_Tags', N'Hiç tag yok. İstersen yeni bir tane ekleyebilirsin', N'There are no tags. You can add a new one if you want.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4640057' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4640069' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5800f48b-c6e8-4a68-976f-4c3c021aadf3', N'TEXT.Country', N'Ülke', N'Country', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4245834' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4245841' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'875e0a1a-4a77-480a-9117-4cb538decc79', N'TEXT.Upgrade_Plan_Text_Two', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6312218' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6312227' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ba7ade72-ef6e-4c2c-b95a-4cb95203fc04', N'TEXT.My_Company', N'Benim Şirketim', N'My Company', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5178411' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5178419' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3351d6a2-80b8-4b57-ba8b-4d128ea1dc42', N'TEXT.Sifre_Degistirme_Mesaj', N'Şifre değiştirme için mail gitmiştir.', N'.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6019470' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6019478' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8227b679-faa6-4f58-bfe5-4dd23a380f8f', N'TEXT.Organizer', N'Organizatör', N'Organizer', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5322838' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5322845' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e5047c3d-779f-4d9d-aef3-4e49011b3f6a', N'TEXT.Sector_Packed_Meat', N'Paketlenmiş Et', N'Packed Meat', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5750466' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5750472' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c1ef2054-b617-4b25-b779-4e60b0351252', N'TEXT.Delete', N'Sil', N'Delete', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4287504' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4287512' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2d2e07f8-f915-468a-8413-4e6d6444d5f6', N'TEXT.Example_Mail', N'ornek@ornek.com', N'example@example.com', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4731164' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4731174' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd9fc3808-dbfe-41ab-b86b-4e7afff30c99', N'TEXT.Sector_Ios', N'Ios', N'Ios', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5746224' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5746231' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1a58528d-4a1c-4abc-9979-4f0f160b9000', N'TEXT.Background', N'Arka Plan', N'Background', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4108497' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4108503' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1d8128ff-cb19-4ecb-bacf-4f538c430e95', N'TEXT.Settings_Notification_Item1', N'Uygulama için bildirimlere izin ver', N'Allow notifications for the application', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5976549' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5976559' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'96da2d29-a764-4a41-8509-4fc415e57360', N'TEXT.Not_Account', N'Hesabınız yok mu', N'Don\''t have an account', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5234685' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5234692' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd20e743c-641a-481b-8ebf-4fc618b36df6', N'TEXT.My_Files', N'Dosyalarım', N'My Files', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5192448' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5192456' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b6c2c9f7-f0a6-4004-8dd6-4fde8749b2ea', N'TEXT.Deletionsuccessful', N'Silme başarılı', N'Deletion successful', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4324578' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4324585' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd5e3d5f3-78e3-4eaf-bade-502f9e68c357', N'TEXT.Max_Team_Member', N'Maksimum ekip üyesi', N'Max team member', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5105252' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5105259' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4e9fac87-183c-4bcb-bbf7-514954d3c120', N'TEXT.Send_File', N'Dosya Gönder', N'Send File', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5934286' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5934293' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'18c540c7-4d80-4322-9e08-52b81cf23d38', N'TEXT.Select_Package_Three_Text2', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5863140' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5863147' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'10a32772-e9f0-4bdc-a772-52e486c9aaa7', N'TEXT.Tutorial_Notification', N'Anlık bildirimlerinizi görebilir  <br> ve etkileşim hızınızı artırabilirsiniz.', N'You can see your instant notifications <br> and increase your interaction speed.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3859574' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3859579' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f2cef7a6-fb29-441b-b6a4-5355eea5c7c9', N'TEXT.Remote_Time', N'Uzak Zaman', N'Remote Time', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5588260' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5588269' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c16f8461-1574-4fde-a7c9-53a5204c907b', N'TEXT.Leave_Comment', N'Yorum yap', N'Leave a comment', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4997960' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4997969' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3e931179-1e00-4b2b-acc6-53dab0ee1a0f', N'TEXT.Empty_Timeline', N'Oluşturulmuş zaman akışı yok.', N'There is no timeline created.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4646213' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4646221' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'85e34bb0-caf4-4807-9a7e-54cbe4d38713', N'TEXT.Max_Kiosk', N'Maksimum Kiosk', N'Max Kiosk', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5079420' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5079427' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8714b05a-bf43-48a0-b734-5533e702b964', N'TEXT.Successfully_Updated', N'Başarıyla Güncellendi', N'Successfully Updated', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6132308' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6132313' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'70cab108-242c-40ff-bd9c-55d84dbd1446', N'TEXT.Task_Type', N'Görev Türü', N'Task Type', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6175148' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6175154' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b1d91993-ed1b-4cfc-8e02-56578071b66a', N'TEXT.Active', N'Aktif', N'Active', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3895968' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3895973' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a01f6b71-0567-4d23-97cf-56a7aef0c78e', N'TEXT.Error_Required_Field', N'Zorunlu Alan', N'Required Field', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3813684' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3813688' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0d732f83-8433-47fa-8407-5730e2a9048d', N'TEXT.Select_Package_One_Text1', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5837970' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5837976' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dde0c39a-2f6b-4ed1-8a38-57b2fcf14981', N'TEXT.User_Auths', N'Kullanıcı Yetkileri', N'User Auths', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6359701' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6359707' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd8ee617d-4c8f-4a58-af8c-57de07f12016', N'TEXT.Total_Contact', N'Toplam  Bağlantı', N'Total Contact', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6254083' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6254089' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f15e9fe9-6f33-4ba4-be5c-57e253dd777d', N'TEXT.Empty_Phone_Number2_Error', N'İkinci telefon numarası boş olamaz', N'Second phone number cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4594518' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4594525' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'02e89ee5-f1b8-427b-a1bc-5866a27fc56a', N'TEXT.Short_Pasword', N'Şifren çok kısa', N'Your password is too short', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6014835' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6014843' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8e96112b-8979-430e-a349-587ce550e649', N'TEXT.Description', N'Açıklama', N'Description', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4328915' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4328921' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a63e069b-8e41-460e-a3d6-5881b4d865a0', N'TEXT.Lutfen_Kullanici', N'Lütfen kullanıcı seçiniz!', N'.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5036612' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5036619' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4a6a4c3d-f7c8-4d83-a363-58cdf4cceabd', N'TEXT.Smtp_Username', N'SMTP Kullanıcı Adı', N'SMTP Username', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6066199' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6066208' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e5bfd4ba-b3aa-42e3-a4bf-58dd06204586', N'TEXT.Sirket_Acma_Aciklama', N'Bir şirketiniz bulunmamaktadır. <br> Şirket tanımlamak istiyorsanız lüften şirket ekleye tıklayınız.', N'.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6045281' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6045289' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c936d3f0-3f02-4d14-8cbe-595035e198fc', N'TEXT.Doyou_Attend', N'Bu etkinliğe katılıyor musunuz?', N'Do you attend this event ?', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4371668' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4371676' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'52f4bf74-0a32-4d92-a889-596251a1e4a6', N'TEXT.Password_Changed_Successfully', N'Şifre başarılı bir şekilde değiştirildi.', N'Password changed successfully.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5395410' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5395417' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd8c56165-170f-479a-80de-5a117f19db67', N'TEXT.Used_Storage', N'Kullanılmış alan', N'used storage', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6346064' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6346070' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cd358146-42af-4deb-8d55-5a7869ed5299', N'TEXT.File_Ext', N'Dosya Uzantısı', N'File Extension', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4782290' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4782299' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a0179069-614b-4c36-8ab7-5afc0a5ec8a4', N'TEXT.Dashboard', N'Gösterge Paneli', N'Dashboard', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4269887' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4269895' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e9b2fe54-c4af-4127-a412-5c0bbe5f3c08', N'TEXT.Logo_File_Data', N'Logo Dosyasının Verisi', N'Logo File Data', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5032300' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5032306' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'728c9093-ec3d-4c0e-9d4f-5c49c47b0d54', N'TEXT.Account_Setting', N'Hesap Ayarları', N'Account Setting', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3892971' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3892976' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0f646868-1715-4b85-9bce-5c65fd761812', N'TEXT.Must_Select_User', N'En az bir kullanıcı seçilmelidir.', N'At least one user must be selected.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5164598' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5164606' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'043e0835-abb2-4700-b8d9-5c9c241d7e0b', N'TEXT.Optional', N'İsteğe Bağlı', N'Optional', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5314034' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5314041' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b04fd020-d0fe-4834-b54c-5d0439d35405', N'TEXT.Team_File', N'Takım Dosyası', N'Team File', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6199855' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6199861' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'738e0db8-39b8-41c9-8f86-5d0ef10a4cfd', N'TEXT.Edit_Team', N'Ekip Düzenle', N'Edit Team', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4422058' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4422065' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'34d22557-b505-4634-a698-5e0042db982a', N'TEXT.Pkg_Standard', N'Standart Paket', N'Standard Package', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5465071' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5465078' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e1d4a90f-c798-4c62-93d0-5eee639d7a4e', N'TEXT.Select_Your_Black_Logo', N'Siyah logonuzu seçin', N'Select your black logo', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5919888' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5919895' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6e28733f-7b2d-4019-97f0-5fbf7d807c00', N'TEXT.User', N'Kullanıcı', N'User', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6350629' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6350635' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1b817ccd-3924-4cde-899e-60510aae36ac', N'TEXT.Past_Event', N'Geçmiş Etkinlik', N'Past Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5411590' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5411600' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'832549ac-a2ce-4d55-91ec-60e474c77967', N'TEXT.Add_Contact_Success', N'Kişi Başarıyla Eklendi', N'Contact Added Successfully', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3920279' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3920284' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0bb612bb-f47a-4afe-9904-6228af521dd6', N'TEXT.Empty_Page_Text_Search', N'Hiçbir şey bulamadık.', N'We couldn''t find anything.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4570408' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4570416' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b2bb2cda-1a06-4ec2-9bfe-630a0cbf6971', N'TEXT.Are_You_At', N'Şu an ', N'Now', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4072625' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4072632' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3bcf42b0-5550-41be-85da-633d9f1b4738', N'TEXT.Yes', N'Evet', N'Yes', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6446221' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6446228' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'28ee5375-2805-4220-a14a-63656976daa8', N'TEXT.Position', N'Pozisyon', N'Position', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5480371' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5480378' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ea8aa117-b2be-448a-89d5-64081f460af9', N'TEXT.Notification', N'Bildirim', N'Notification', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5275429' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5275436' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1041f554-ea01-4403-9e9b-641b1223cd68', N'TEXT.Empty_Mail_Type_Error', N'Email tipi boş olamaz', N'Email type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4522304' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4522314' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'43bb13f6-e511-45e2-a7cf-641d17c675d8', N'TEXT.File_Data', N'Dosya Verisi', N'File Data', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4771312' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4771322' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b6d4d509-fa54-4555-9832-64672362ed60', N'TEXT.Tasks', N'Görevler', N'Tasks', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6178677' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6178683' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'46f19f4e-78b9-4b99-be8d-650615059cf4', N'TEXT.Tutorials', N'Eğitici', N'Tutorials', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6279383' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6279390' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8695fd52-95af-4924-9c42-651344539f88', N'TEXT.Empty_Contact_Error', N'Lütfen kişi seçiniz', N'Please select a user', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4497243' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4497250' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c22c06aa-945c-4e61-81a6-656bff6aa93d', N'TEXT.With_Ocr', N'OCR ile', N'With OCR', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6418959' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6418965' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd5f7c349-9829-48b1-bf68-65f0976e3b74', N'TEXT.Yes_Delete', N'Evet, Silin!', N'Yes, delete it!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6450801' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6450807' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'807039e0-7896-4356-8e0b-66a1d4c89449', N'TEXT.Error_Login_Message', N'Kullanıcı ve şifre hatalı', N'User and password are incorrect', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4666578' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4666588' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4508e303-feb9-462c-ad31-66a64c33af64', N'TEXT.Max_Team_Count', N'Maksimum takım sayısı', N'Max team count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5100422' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5100433' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bdbebf08-76bb-4cdc-bde9-6766492fc743', N'TEXT.Add_Block', N'Blok Metin Ekle', N'Add Block Text', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3907981' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3907986' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9182b517-06d4-4df4-b758-67b7ca759f6a', N'TEXT.End_Hour', N'Bitiş Saati', N'End Hour', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4657309' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4657316' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ca9e015-cc2c-478e-b39b-67c1c6daf1db', N'TEXT.Log_In', N'Giriş Yap', N'Log in', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5017398' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5017405' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0217e84c-fb91-4461-b8a5-67dab985a9db', N'TEXT.Assigned_Task', N'Atanmış Görev', N'Assigned Task', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4080943' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4080950' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ca2e040-5a5e-4d09-9dd4-6898aa9fffbd', N'TEXT.Save', N'Kaydet', N'Save', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5661359' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5661370' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'00a7b2e4-3faa-40e3-a537-68c9c9ff5dba', N'TEXT.Write_Position', N'Pozisyon Yaz', N'Write Position', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6432579' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6432585' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'90f30b77-4c33-4af6-b195-6969008812ee', N'TEXT.Select_Authority', N'Yetkili Seç', N'Select Authority', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5792882' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5792889' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'327c303c-5ee8-43ad-84d8-6a150231fc55', N'TEXT.Sector_Text', N'Sektör Seç', N'Select Sector', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5766760' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5766766' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'208f23f1-08be-4a09-b1ee-6a1db95d80ab', N'TEXT.Search_Result_Contact', N'SearchResultContact', N'SearchResultContact', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5685631' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5685645' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5c9d7078-bd90-4428-8ebe-6a5fb70e06df', N'TEXT.Select_Package_Three_Text3', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5867638' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5867645' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4f872623-d47c-45ea-b509-6ac7d35cc692', N'TEXT.My_Event', N'Etkinliğim', N'My Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5183275' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5183282' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9f847e8f-0e04-4734-b6d0-6b9cad0f7294', N'TEXT.Task', N'Görev', N'Task', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6156204' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6156210' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e90617fa-ddbf-4086-a1bc-6c5180e157a6', N'TEXT.Active_Event_Cannot_Deleted', N'Aktif etkinlik silinemez', N'Active activity cannot be deleted', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3901854' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3901860' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'30106edb-df97-4fb3-a925-6c9ddcb9a5cb', N'TEXT.Sector_Electronic', N'Elektronik', N'Electronic', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5727428' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5727436' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0feb5a07-c4de-4ddc-9a33-6d1898d563b3', N'TEXT.Sector_Printers_Iknjet', N'Mürekkepli Yazıcılar', N'Sector Inkjet Printer', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5759003' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5759012' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fbd9dacd-e89f-4779-a8b6-6dcb7000b463', N'TEXT.Main_Tag', N'Ana Etiket', N'Main Tag', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5047205' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5047213' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ca814ea0-6ba3-4513-9b16-6e086d12fd28', N'TEXT.Add', N'Ekle', N'Add', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3904929' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3904934' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8a1b3491-8bcf-4ff7-9e5f-6ecfe8ce466a', N'TEXT.June', N'Haziran', N'June', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3828547' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3828551' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd1801a81-e379-4d66-9cb4-6eea1d2bd963', N'TEXT.Attend', N'Katıl', N'Attend', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4088812' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4088820' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b227bdf8-7524-46ba-8e24-6ef9a8dd13d9', N'TEXT.Phone', N'Telefon', N'Phone', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5447744' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5447752' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'32dcd086-9dd9-4223-9f89-6f2bae1d12f4', N'TEXT.City', N'Şehir', N'City', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4152437' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4152447' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4f753fa4-93e5-42c6-b201-6f6cf1a47924', N'TEXT.Select_Team_Or_Member', N'Takım veya Üye Seçin', N'Select Team or Member', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5910154' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5910162' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'128f54c9-cde9-4d44-96d6-700faaff92ce', N'TEXT.Starf_Contact_Form', N'Yıldız İletişim Formu', N'Starf Contact Form', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6093115' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6093121' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b31723e7-a776-4c24-9759-70e98cccb1ff', N'TEXT.Passive', N'Pasif', N'Passive', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5380898' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5380907' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'de636cfc-2ff0-4b11-9934-70edb81e8807', N'TEXT.Week_Short', N'W', N'H', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6400731' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6400737' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f65ea5fe-fa18-47e0-9c7d-70f1a3e56a16', N'TEXT.Empty_Phone_Type_Error', N'Telefon tipi boş olamaz', N'Phone type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4603859' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4603868' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5e165dad-c7b6-4422-8bab-71691dbbedd7', N'TEXT.Kiosk_File_Download_Comment', N'QR Kodu Okutunuz', N'Read QR Code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4951991' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4951999' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8c61428c-11ae-44ec-9fa0-7193343c7076', N'TEXT.Sector_Cell_Phones', N'Mobil Cihaz Sektörü', N'Sector Mobile Phone', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5716588' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5716598' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'377ad381-500c-4930-9e8d-71a4f73f89b7', N'TEXT.April', N'Nisan', N'April', N'fr', NULL, N'de', CAST(N'2023-08-23T13:19:25.3736223' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3736735' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cd25f985-6169-4cfd-a0c0-71aeb423cdaa', N'TEXT.Kayit_Mesaj', N'Kayıt İşlemi Başarılıdır. mail adresine gidip aktivasyon linkine tıklamanız gerekmektedir.', N'Registration Successful. You need to go to your e-mail address and click on the activation link.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4908657' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4908666' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b24eddba-abae-4901-b431-723ac93a7084', N'TEXT.Upgrade_Package', N'Paketi Yükselt', N'Upgrade Package', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6293855' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6293861' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ec92257-421c-421d-b8ad-725458212038', N'TEXT.Programs', N'Programlar', N'Programs', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5526785' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5526794' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6f08b99e-fb4a-49ee-b6f4-7257891870f8', N'TEXT.Reminder', N'Hatırlatma', N'Reminder', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5582400' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5582412' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3516128b-042b-4206-b809-7339bfae6748', N'TEXT.Select_Language', N'Dil Seçiniz', N'Select Language', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5829591' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5829598' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1265134d-32c9-4167-ba26-73aa7338ec94', N'TEXT.Filters', N'Filtreler', N'Filters', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4835259' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4835268' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'837d0197-c043-4eff-867e-73cacb848160', N'TEXT.Sector_Computers', N'Bilgisayar Sektörü', N'Sector Computers', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5721368' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5721379' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8851115f-6531-45a3-958a-73d076f7c9d6', N'TEXT.Settings_Ready_Messages_Title', N'Hazır Mesajlar', N'Scripted Messages', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5991027' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5991036' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1df9d0f2-f7f5-43f3-b105-743d4cef080f', N'TEXT.My_File', N'Dosyalarım', N'My File', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5188005' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5188013' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6a7f4556-a302-4678-aad3-745c2987b72d', N'TEXT.Add_Manuel', N'Manuel Ekle', N'Add Manuel', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3954606' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3954612' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'53709c54-be41-47b5-bdb7-74dfd7664380', N'TEXT.Edit_Contact_Profile', N'Bağlantı Profili Düzenle', N'Edit Contact Profile', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4404491' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4404498' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a2acbd6c-e39d-4ed4-b5f3-75043808439e', N'TEXT.Kioskinfo', N'Kiosk Bilgisi', N'Kiosk İnfo', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4973477' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4973487' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8c32702e-8f89-444d-86e0-75483b25419e', N'TEXT.Empty_Position_Error', N'Pozisyon boş olamaz', N'Position cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4619054' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4619062' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd5c79d54-41dd-4bdb-9f21-760f7ad1dc5a', N'TEXT.Invalid_Mail', N'Geçersiz email!', N'Invalid email!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4904409' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4904416' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8ad41206-7edc-4b57-a4df-761f707a1009', N'TEXT.Tutorial_Page_Name', N'Tüm sayfada sayfa adını görebilirsiniz.', N'You can see page name in all page.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3862217' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3862222' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3495804b-0bad-44d5-8f05-7643cd19f933', N'TEXT.Error_Passwords_Dont_Match', N'Şifreniz yanlış', N'Current password is wrong', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3811186' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3811190' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1092097d-d41e-4365-be82-767851cee5e4', N'TEXT.Add_Premium_Package', N'Premium Paket Ekle', N'Add Premium Package', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3980387' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3980394' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'28a916d5-adb8-4ca5-86e7-7678cf9c6259', N'TEXT.Company_Users', N'Şirket Kullanıcıları', N'Company Users', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4193989' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4193997' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd0aec861-ce09-46f2-baef-769aa6df2b75', N'TEXT.Select_Time', N'Zaman Seç', N'Select Time', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5914985' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5914992' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ae71dcff-147e-4dae-bd8c-77370a287791', N'TEXT.Configuration', N'Yapılandırma', N'Configuration', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4213780' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4213787' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b4e549e0-54e9-487f-8a48-77e549f6e6e7', N'TEXT.Add_New_Contact', N'Yeni Kişi Ekle', N'Add New Contact', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3958123' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3958129' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2f6973db-bd5a-44de-913e-781aec19b8b1', N'TEXT.Package', N'Paket', N'Package', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5327125' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5327132' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8f9d3c07-e7ed-4a14-83ec-78896360723f', N'TEXT.Event_Name', N'Etkinlik Adı', N'Event Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4721127' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4721136' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'90af78da-4040-4789-aea3-79afc3a1ef05', N'TEXT.Use_Media', N'Medya slaydır kullan', N'use media slider', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6341517' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6341523' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'70c5d2c6-69ce-4bdd-9146-79fdacaa03e3', N'TEXT.Home_Page', N'Ana Sayfa', N'Home Page', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4877756' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4877763' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'04731535-ddba-4019-82df-7adcca7add8d', N'TEXT.Languages', N'Diller', N'Languages', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4983688' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4983696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b3ba0cc9-1413-4812-b841-7b1a1ddb8d72', N'TEXT.Duplicate_Team', N'Takımı Çiftle', N'Duplicate Team', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4386198' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4386207' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4bd3541c-214c-4156-9ada-7b25c6dfd8ec', N'TEXT.Company_Teams', N'Şirket Takımları', N'Company Teams', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4188905' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4188912' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'56bcb795-9c8e-4474-8436-7b33f15f9ec9', N'TEXT.Upload_Info', N'Dosya “.png .jpg .jpeg” olmalı ve Max. Boyut : 50 MB', N'File should be “.png .jpg .jpeg” and Max. Size : 50 MB', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6337018' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6337024' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cc175f90-a365-452b-9208-7ba807ceee25', N'TEXT.Pkg_Premium', N'Premium Paket', N'Premium Package', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5459739' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5459748' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f489792a-edcc-4b66-b5f5-7c869bb422f9', N'TEXT.November', N'Kasım', N'November', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3836250' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3836258' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8caa6c84-ea55-4f69-a39c-7d45a47970ad', N'TEXT.October', N'Ekim', N'October', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3838705' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3838709' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c70ba638-6cc9-4b6b-88f6-7d74f1671716', N'TEXT.Email_Format_Not_Supported', N'E-posta biçimi desteklenmiyor', N'Email format not supported', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4439454' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4439462' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'79e37881-2c33-4a59-8b06-7e1e8cf17c7c', N'TEXT.Kiosk_Add_Step5', N'Giden postada görünmesini istediğiniz kişi kartını seçebilirsiniz.', N'You can select the contact card you want to appear in outgoing mail.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4942799' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4942806' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'06d4cc0e-7382-48ad-acc7-7e8129f37dab', N'TEXT.File_Type', N'Dosya Tipi', N'File Type', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4803870' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4803878' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f0de56d4-9a0f-4b7b-bc1d-7ec7a942a40c', N'TEXT.Pay_Via_Bank_Transfer', N'Banka Havalesi ile Ödeme', N'Pay via Bank Transfer', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5429215' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5429222' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7e459718-f15f-45f3-a202-7f209b68719f', N'TEXT.My_Bag', N'Sepetim', N'My Bag', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5173346' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5173354' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'86323e57-bc7c-4e85-a478-7f546a93dab1', N'TEXT.Upgrade_Plan_Title_One', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6318109' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6318116' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd51f6de6-2a08-4955-adf9-7fa2b2336572', N'TEXT.Kiosk_Add_Step2', N'Kiosk arka plan resminizi yükleyebilir veya seçebilirsiniz.', N'You can upload or choose your kiosk background image.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4927289' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4927299' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6c97dadc-27c8-46ae-a70f-80f4e13acc61', N'TEXT.Edit_Package', N'Paketi Düzenle', N'Edit Package', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4417656' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4417662' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'63527808-1b3a-4fbf-bec5-810080f7d523', N'TEXT.Select_Package', N'Paket Seç', N'Select Package', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5833738' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5833745' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7c1056d5-c270-43bf-995d-81390dbf9943', N'TEXT.Tutorial_Contact', N'Kişi listenize yeni kişiler <br> ekleyebilirsiniz.', N'You can add new contacts <br> to your contact list.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3843580' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3843585' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8d2f9732-e10b-4e31-9e94-81528d25a6fe', N'TEXT.Select', N'Seç', N'Select', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5779715' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5779722' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6281c81a-4cb5-4fb2-b2b6-8184e4ba56cb', N'TEXT.User_Auths_Des', N'Kullanıcı, şirkete yeni personel ekleme, silme ve yeni personel ekleme yetkisine sahiptir.', N'The user has the authority to add, delete and add new employees to the company.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6364266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6364273' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd1a5f806-4f52-4480-9bc1-81db8030c7ab', N'TEXT.Note_Completed', N'Not Tamamlandı', N'Note Completed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5253488' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5253496' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eea67145-6cf6-4e7f-97d9-821952472351', N'TEXT.Promo_Code', N'Promosyon Kodu', N'Promo Code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5532966' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5532976' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5eb14f8c-cb63-4cb6-af71-82e2d3363e8d', N'TEXT.Empty_Password_Error', N'Şifren boş olamaz', N'Your password cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4585036' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4585045' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a01db383-10d4-4110-b670-83031ee14b86', N'TEXT.Change_Password', N'Şifre değiştir', N'Change Password', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4132095' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4132103' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'58ff1927-76d8-43ad-a798-83260764c352', N'TEXT.Files', N'Dosyalar', N'Files', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4810193' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4810200' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2b8e9361-e367-4db8-b7df-835f27aa9723', N'TEXT.Package_Properties', N'Paket Özellikleri', N'Package Properties', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5354511' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5354518' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f17f2ff6-2367-4306-8948-83bc4511ce1e', N'TEXT.Kiosk_Add_Step3', N'Ziyaretçilerin görüntüleyebileceği dosyaları ve medyayı seçin.', N'Select the files and media that visitors can view.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4932683' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4932691' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9eeb5db2-fe7b-4ace-81b8-84243aa75f78', N'TEXT.Okay', N'Tamam', N'Okay', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5292695' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5292703' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'09409efe-2759-40bd-9b4b-84c3dd603eb4', N'TEXT.Autocreatecode', N'Otomatik kod oluştur', N'Auto create code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4092831' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4092838' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ee5828d5-452a-4b1b-99c0-85f1ee5f93ea', N'TEXT.Pay', N'Ödemek', N'Pay', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5420689' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5420696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2706003b-f0b7-4737-a9df-860a44a3d94d', N'TEXT.Package_Name', N'Paket İsmi', N'Package Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5335872' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5335879' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1e6d718b-fe91-40cf-a6e6-865e6b60c667', N'TEXT.Kioskfiles', N'Kiosk Dosyaları', N'Kiosk Files', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4968430' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4968437' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6ca84b19-e073-4af3-8875-87029384616a', N'TEXT.Empty_Page_Text_Todo_T1', N'Yeni bir planınız yok. Şimdi yeni bir plan ekleyin.', N'You don''t have a new plan. Add a new plan now.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4575196' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4575205' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd825797d-4f42-423c-86a7-8739e74d009d', N'TEXT.Block_Text', N'Blok Metin', N'Block Text', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4112474' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4112481' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ed06ac9b-0bc7-4e8f-9456-8839d0ccffdf', N'TEXT.Success_Update_Version', N'Versiyon başarı ile güncellendi', N'Version successfully updated', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6120462' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6120468' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'118a66a5-dfc7-47a5-98ae-883fabf05f4a', N'TEXT.Welcome', N'Hoşgeldiniz', N'Welcome', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6405322' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6405328' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3d5e9862-5a6d-4d36-88c7-885924317031', N'TEXT.Category', N'Kategori', N'Category', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4128197' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4128204' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'72afa599-4048-4ba7-b15f-88a369abfdc5', N'TEXT.Fair', N'Fuar', N'Fair', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4742629' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4742639' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0c9d384f-8957-49a4-b480-8906954cffeb', N'TEXT.Person', N'Kişi', N'Person', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5442194' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5442202' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2e5a9bbc-1b89-475d-b7ef-89552ed91c86', N'TEXT.Postpone', N'Ertelemek', N'Postpone', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5484868' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5484875' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'57e38d03-4a68-48b0-9f40-89edbf90edc9', N'TEXT.Sort_Date', N'Yeniden Eskiye', N'New To Old', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6084760' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6084766' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7dc7a6f5-17e9-4a71-ad4e-8af1a58c0165', N'TEXT.Menu_Expansion', N'Menü Genişletme', N'Menu Expansion', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5124938' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5124946' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd0a4aae0-6696-467d-a0c1-8b2012cd824c', N'TEXT.Todo', N'Yapılacaklar', N'ToDo', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6250492' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6250498' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1e00faf0-d077-44b7-886d-8b8fefeb9785', N'TEXT.Add_To_Activity_List', N'Etkinlik listesine ekle', N'Add to activity list', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3999865' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3999871' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'431fbcc7-e8dc-4a7f-9512-8cbf755a69ec', N'TEXT.DENEME', N'SF', N'SF', N'', N'', N'', CAST(N'2023-09-21T15:28:42.7221408' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:28:42.7221734' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4de935a6-ccf2-494d-9d80-8ccea171efef', N'TEXT.Restored_File', N'Yetkilendirme Dosyası', N'Auth File', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5618487' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5618497' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'136b911e-157a-46ea-b67d-8cd54b7b235a', N'TEXT.Sector_Printers', N'Sector Printers', N'Yazıcı', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5754424' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5754431' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dd4dd230-bb09-4ef7-a735-8da0d31a8b46', N'TEXT.Fax', N'Faks', N'Fax', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4748664' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4748675' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9f912374-acf0-426c-9b7b-8eeb2aaf3f4c', N'TEXT.Quit', N'Çıkış', N'Quit', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5549638' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5549650' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'01e63c74-2c26-4c0e-87a7-8f0c4b320549', N'TEXT.Note_Reminder_Notification_En', N'[text]', N'[text]', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5267013' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5267020' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bc122ec3-b383-4648-89eb-8f5c3260c5f0', N'TEXT.Mobile', N'Mobil', N'Mobile', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5134684' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5134692' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'76554948-42ab-4dbc-8faf-9000ae56992f', N'TEXT.Package_Priority', N'Paket Önceliği', N'Package Priority', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5344274' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5344285' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2817434a-1e36-4e19-b8b0-9030c754314f', N'TEXT.Add_With_Qr_Code', N'Qr Kod ile Ekle', N'Add With Qr Code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4007101' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4007108' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c8956a12-6142-4ef1-ac87-904464ff217e', N'TEXT.Upgrade_Plan', N'Paket Yükseltin', N'Upgrade Plan', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6297447' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6297454' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'54978366-b009-4849-85ba-9120869378fc', N'TEXT.You_Are_At_The', N'Şu an', N'Now', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6455280' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6455286' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9dbbed77-016d-4bea-b8da-913bd79147c7', N'TEXT.Empty_Page_Text_Contact', N'Ağınızda kimse yok. Hemen katılarak yeni kişiler ekleyin.', N'There is no one in your network. Add new contacts immediately by joining.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4560963' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4560972' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ad73e7a0-e7c8-43d4-9630-91496e7e65f4', N'TEXT.Why_Are_You_Canceling', N'Neden İptal Ediyorsunuz?', N'Why Are You Canceling ?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6414466' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6414472' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dd461dfb-e27b-4e65-bd1d-917aada8856c', N'TEXT.Smtp_Password', N'SMTP Şifresi', N'SMTP Password', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6050026' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6050033' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4db7cfce-cb59-48af-bf98-941e032a7b56', N'TEXT.Next', N'İleri', N'Next', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5224920' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5224927' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3fa36261-a2ec-4682-be37-94286b97ed64', N'TEXT.Settings_Ready_Messages_Text', N'Hazır Mesajlar', N'Scripted Messages', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5986374' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5986381' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8831b74a-922b-497d-8991-94ec978ac1de', N'TEXT.Web_Adress', N'İnternet Adresi', N'Web adress', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6391650' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6391657' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'971385f9-4887-4d7e-9769-9524f223a7b0', N'TEXT.Send_Password', N'Şifreyi Gönder', N'Send Password', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5944436' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5944443' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'56c223cf-1b78-44fd-bf0f-9545935dd429', N'TEXT.Premium_Package_Definitions', N'Premium Paket Tanımları', N'Premium Package Definitions', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5503543' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5503550' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ba3ed8bd-cf70-4b6d-a941-9603720690f3', N'TEXT.Files_Shared', N'Dosyalar paylaşıldı', N'Files Shared', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4819483' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4819490' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f6ecd6af-d5cc-4df7-b251-9661751983b5', N'TEXT.Sifre_Hatali', N'Şifre Hatalı', N'Password Incorrect', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6024996' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6025004' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'98c07d87-ed17-4533-9413-96ae4f567879', N'TEXT.Title_Reminder_Notification_En', N'Fairscope Reminder', N'Fairscope Hatırlatıcısı', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6239629' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6239636' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'819defc0-9145-4999-a1d7-979d9376016b', N'TEXT.Month', N'Ay', N'Month', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5146655' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5146662' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'984cf9f1-35d2-4ccc-a9d8-97fc5c281193', N'TEXT.Task_Reminder_Notification_En', N'[text]', N'[text]', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6171408' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6171414' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8c862b74-f902-4366-8504-9803d1a05c73', N'TEXT.Active_Event', N'Aktif  Etkinlik', N'Active Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3898880' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3898885' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'28c13f7d-08cd-4700-b904-986d2ab44fd0', N'TEXT.Good', N'İyi!', N'Good!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4859279' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4859286' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9bfc7e83-2375-4f30-a867-98ee2d7a05b5', N'TEXT.Assing_A_Task', N'Görev atayın', N'Assing a task', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4084888' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4084896' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'08c023c4-0114-46b6-9827-9a25b14825d8', N'TEXT.Archive_Team_Confirm', N'Bu ekibi arşivlemek istediğinizden emin misiniz?', N'Are you sure want to archive this team?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4056720' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4056727' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'46ee449f-f698-4ab3-b423-9a518c30209b', N'TEXT.Old_Password', N'Eski Şifre', N'Old Password', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5297382' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5297389' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a135e8af-60a4-40f0-9553-9a977c7c078e', N'TEXT.Keep', N'Sakla', N'Keep', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4912832' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4912839' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4fa13deb-8e52-40e1-8780-9b24517e3b33', N'TEXT.February', N'Şubat', N'February', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3821149' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3821154' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b299e25a-c909-490d-afa3-9bc4d6949362', N'TEXT.Delete_User_From_Company_Confirm', N'Bu kullanıcıyı şirketten silmek istediğinizden emin misiniz?', N'Are you sure want to delete this user from company?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4319301' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4319312' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4f952d59-5b58-4a73-bf94-9c129e2228b4', N'TEXT.Contact', N'İletişim', N'Contact', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4218126' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4218132' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ec49863a-34f5-4284-ae75-9c7298d02071', N'TEXT.Tutorial_Menu_Expansion', N'Menü çubuğunu genişletebilir <br> ve sayfa adlarını görebilirsiniz.', N'You can expand the menu bar <br> and see the page names.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3856943' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3856948' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3fcd24ba-15a4-48c1-bb51-9c8feffbb0c8', N'TEXT.Event_Info_Title', N'Etkinlik Bilgileri', N'Event Info', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4715941' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4715949' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2487a86e-0f5d-4d9c-863b-9cbdccd19709', N'TEXT.Empty_Already_Have_An_Account', N'Zaten bir hesabınız var mı?', N'Already have an account?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4468121' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4468133' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2ac34ab0-f65c-407b-9774-9cc7a7a9e54b', N'TEXT.Empty_First_Date', N'Lütfen ilk tarihi seçiniz', N'Please select the first date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4513801' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4513808' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'537d5e7c-ecb5-4f43-9714-9ced7a4ebd5d', N'TEXT.Sector_Vegetables', N'Sebze', N'Vegetable', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5770894' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5770902' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'01454e52-6e1e-4cfe-86fd-9e6567217d30', N'TEXT.Email_Protocol', N'E-posta Protokolü', N'Email Protocol', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4444033' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4444040' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6caecff2-dd5f-4848-a146-9eee563c2653', N'TEXT.Automated_Authentıcatıon', N'Otomatik Kimlik Doğrulama', N'Automated Authentication', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4096744' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4096751' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'80e7eebc-6803-45e7-a2e0-9f502bf8f604', N'TEXT.Hesap_Bitim_Suresi', N'Premium hesabınızın süresinin dolmasına sayılı günler kaldı.', N'Days left until your premium account expires.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4863772' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4863778' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'66f9fe43-4530-4205-93ec-a08c648492f7', N'TEXT.Add_Task', N'Görev Ekle', N'Add Task', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3996178' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3996185' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c9fed6f0-80c5-4600-8e44-a1f3f6544a1e', N'TEXT.Add_Contact_Successful', N'Kişi Başarılı Bir Şekilde Eklendi.', N'Contact Added Successful.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3923333' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3923338' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ed8b5682-89b4-4c10-bc1b-a234fbee891a', N'TEXT.Scan', N'Tara', N'Scan', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5667280' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5667292' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd2b761a3-867b-4c17-8641-a24afaa49d40', N'TEXT.File_Auths_Des', N'Kullanıcı, tüm dosyaları ekleme ve silme yetkisine sahiptir.', N'The user has the authority to add and delete all files.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4765291' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4765302' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'19152845-5835-46ef-ad2d-a2be0dc50b9d', N'TEXT.Account', N'Hesap', N'Account', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3887019' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3887024' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd8e73450-4b9b-4743-a514-a34467fd628b', N'TEXT.Document_Storage_Limit', N'Belge Depolama Sınırı', N'Document Storage Limit', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4348560' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4348568' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2ff3eb95-92a0-4d72-8968-a3c46cf04917', N'TEXT.Sender', N'Gönderen', N'Sender', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5954092' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5954098' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'aa9c688d-c487-47fb-bf83-a3e72c38f600', N'TEXT.Empty_Second_Date', N'Lütfen ikinci tarihi seçiniz', N'Please select the second date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4629453' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4629460' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bbe42bd8-2f63-4be4-858c-a3f7a2dcac04', N'TEXT.Add_Card', N'Kart Ekle', N'Add Card', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3910966' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3910971' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a2362755-de72-4bc4-8d20-a57bf0796197', N'TEXT.Less_Recent', N'Yeni', N'Less Recent', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5002484' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5002490' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd1ef430b-9640-4249-9512-a5fdc78f0521', N'TEXT.New_Team_Name', N'New Team Name', N'Yeni Takım Adı', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5220223' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5220230' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f581cadd-cde4-44ae-8cea-a72f0974da9f', N'TEXT.Password_Confirm', N'Şifre Onayla', N'Password Confirm', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5400422' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5400431' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'71fe4cfe-9dff-442a-9fa2-a850afa12529', N'TEXT.Empty_Mail3_Error', N'Üçüncü email adresi boş olamaz', N'Third email address cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4540889' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4540895' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'18a5a27e-b32f-4963-b85e-a8a44a68e94e', N'TEXT.Exit_Settings', N'Ayarlardan Çık', N'Exit Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4736421' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4736429' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'015252fc-402b-47b4-a7ef-a9d3c9a651c7', N'TEXT.Work', N'İş', N'Work', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6428012' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6428018' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'de9b5085-a60e-45f9-acb9-aa3a04943313', N'TEXT.Phone_Type', N'Telefon Türü', N'Phone Type', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5453946' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5453955' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'614660b6-0298-46b6-8991-aa9a3e3c0315', N'TEXT.Old_To_New', N'Eskiden Yeniye', N'Old to New', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5302112' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5302225' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ebe1eb7-d3b2-4a19-973c-aaa51831cea8', N'TEXT.Send_Text', N'Gönder', N'Send', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5949210' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5949218' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6799ca16-12b8-48f1-ae58-aaad36dc5817', N'TEXT.Language_Type', N'Dil Tİpi', N'Language Type', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4978338' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4978345' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0a5e3587-43e4-401b-87c6-ab0ae4459064', N'TEXT.Edit_Kiosk', N'Kiosk Düzenle', N'Edit Kiosk', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4413552' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4413560' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2e76aa8c-0e51-46ca-bc65-ab902d83d17e', N'TEXT.Name', N'Ad', N'Name', N'Nom', NULL, NULL, CAST(N'2023-08-23T13:19:25.5202308' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5202317' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ce69bc80-ea55-45fc-8a86-abfd7a98c784', N'TEXT.Per', N'Her', N'Per', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5437314' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5437322' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'caf59e62-11de-4397-a298-ac7784ab7ed7', N'TEXT.Upgrade_Plan_Text_Three', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6307433' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6307440' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'42fcfe35-ea96-4c51-ba88-ac8e40ee5236', N'TEXT.Profile', N'Profil', N'Profile', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5518001' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5518008' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a83d69fa-e1c8-44bb-a6a3-ad52a7c046af', N'TEXT.File_Deleted', N'Dosya Silinmiştir', N'File Deleted', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4777083' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4777094' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4ead1918-feb2-4ef5-82da-ad7334703828', N'TEXT.Duplicate', N'Kopyala', N'Duplicate', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4381611' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4381618' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4be0e567-2961-4063-9fde-adb7a9b60761', N'TEXT.Empty_Page_Definition', N'Henüz bir kaydınız bulunmamaktadır!', N'You have not registered yet!', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4556412' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4556419' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3f99bbd6-c0c8-4723-ba24-ae766f120f97', N'TEXT.Addpromotioncode', N'Promosyon Kodu Ekle', N'Add Promotion Code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4014267' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4014273' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'edd2c72d-0eb2-4a75-809a-ae9821f4855b', N'TEXT.Add_Date', N'Ekleme Tarihi', N'Add Date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3926568' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3926574' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9a4c9824-f8cd-41ad-88a4-aeb28a4148a8', N'TEXT.Cancel', N'İptal', N'Cancel', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4120301' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4120308' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'227ac79e-aef1-4afc-a70f-afb9de54165d', N'TEXT.Empty_Block_Text_Error', N'Lütfen hazır mesaj seçiniz', N'Please select a scripted message', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4474495' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4474510' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cf093edc-718c-4e56-9de0-afc43eed2027', N'TEXT.Delete_Event', N'Etkinliği Sil', N'Delete Event', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4296563' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4296570' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9347bb8d-de6d-4010-8e25-b05d4ee46bc7', N'TEXT.Task_Archived', N'Görev Arşivlendi', N'Task Archived', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6160260' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6160266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b8800b30-6445-42d3-ab82-b115bc9f2d61', N'TEXT.Add_Company', N'Şirket Ekle', N'Add Company', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3913959' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3913964' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f865be4b-99c4-45ca-8b40-b15b65b66053', N'TEXT.Sort_By', N'Sırala', N'Sort By', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6080228' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6080234' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'92a4047d-3791-4383-94fd-b168636ba65e', N'TEXT.Select_Contact', N'Kişileri Seç', N'Select Contacts', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5807403' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5807410' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6d9a1ede-6104-47bc-a325-b1e961047053', N'TEXT.Kiosk_Name', N'Kiosk Adı', N'Kiosk Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4957371' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4957380' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c4eb8c2c-653a-4d27-8ce5-b2cac802d263', N'TEXT.Done', N'Bitti', N'Done', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4358309' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4358316' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f7c1c6d5-7025-4394-973e-b3576b6f770e', N'TEXT.Completed', N'Tamamlandı', N'Completed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4208889' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4208897' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'95c4e246-4ce7-416c-bf96-b35e253fc629', N'TEXT.Hi', N'Merhaba', N'Hi', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4867910' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4867919' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bcf7920b-8e38-455c-a158-b38e8f41f5ed', N'TEXT.Add_New_User', N'Yeni Kullanıcı Ekle', N'Add New User', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3969353' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3969362' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c73741d6-6d87-45cc-aedf-b3c92905b8f0', N'TEXT.Company_Name', N'Şirket Adı', N'Company Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4179612' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4179620' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'51486c16-34e7-48ab-b443-b3d554025e69', N'TEXT.Delete_Card', N'Kartı Sil', N'Delete Card', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4291706' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4291713' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'353ddb0a-0964-4bae-b47b-b4adbd848493', N'TEXT.Make_Active', N'Aktif Yap', N'Make Active', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5052811' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5052820' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ec815698-29bb-4356-a676-b4d80502d057', N'TEXT.Empty_Phone_Number_Error', N'Telefon numarası boş olamaz', N'Phone number cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4589615' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4589624' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'41d64561-e49e-42d4-abbf-b531d8e7475e', N'TEXT.Page_Name', N'Sayfa Adı', N'Page Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5362785' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5362792' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a0d3dd05-402a-46e4-b548-b58c6e524b6f', N'TEXT.Empty_Phone_Number3_Error', N'Üçüncü telefon numarası boş olamaz', N'Third phone number cannot be blank', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4599060' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4599069' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd53856a4-d7a5-442c-bf1e-b5b965fbc944', N'TEXT.Start_Datetime', N'Başlama Tarihi', N'Start Datetime', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6102349' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6102356' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e132311d-33e9-4b5b-9d10-b70a033380e1', N'TEXT.Send_Me', N'Bana Gönderin', N'Send Me', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5939206' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5939214' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'263bca61-5f19-4916-af35-b7421dfb9aba', N'TEXT.Sun', N'Paz', N'Sun', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6136754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6136761' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bb92d65e-4953-4aa1-85d4-b76ca7f61c56', N'TEXT.Name_Surname', N'Ad Soyad', N'Name Surname', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5206922' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5206929' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'accf5181-c5f2-4763-8d1b-b7a59600b1cc', N'TEXT.Start_Hour', N'Başlama Saati', N'Start Hour', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6106978' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6106984' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0bd0d398-d5b8-4c39-8f6c-b8330569eaef', N'TEXT.Most_Recent', N'En Yeni', N'Most Recent', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5156050' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5156057' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'88e4373d-c3a8-4109-aaa2-b8821b62ff88', N'TEXT.Sector', N'Sektör', N'Sector', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5698199' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5698213' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e03c7c72-0f2c-4137-ba82-b8bf69378085', N'TEXT.User_Active_Pack', N'Aktif paketi olan kullanıcılar', N'Users with active pack', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6355165' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6355171' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eb4f01b1-e833-44ae-9e0f-b92971a420dc', N'TEXT.More', N'Daha Fazla', N'More', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5151149' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5151158' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f1619c0d-fcdc-42d8-a570-b98a439f52ba', N'TEXT.Error_Validation', N'Doğrulama Hatısı', N'Error Validation', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3818552' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3818556' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9b7eda36-ccec-496f-bc57-b9ca25831d2f', N'TEXT.Empty_Event', N'Hiç etkinlik yok!', N'There is no event!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4505617' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4505624' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'93fd1acf-1ed1-4a7c-bceb-b9e1d92ee271', N'TEXT.Mandatory', N'Zorunlu', N'Mandatory', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5058006' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5058015' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0f3f60d7-6803-4387-b815-ba1835e56790', N'TEXT.Participant', N'Katılımcı', N'Participant', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5367323' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5367330' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c61a256b-5add-4296-8ab6-ba18d99b0a2f', N'TEXT.Most_Recently_Added', N'En Son Eklenenler', N'Recently Added', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5160375' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5160382' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'69ee9a1c-f44f-42e3-b3bd-ba467879c175', N'TEXT.Add_Contact', N'Kişi Ekle', N'Add Contact', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3917214' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3917219' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8a3a8283-a1de-43ef-89d2-bb41230f0f1a', N'TEXT.File_Send_Me', N'Sadece e-postayı doldurun <br> ve diğer bilgiler daha sonra.', N'Just fill in the e-mail   <br> and fill in the  other information later.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4798204' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4798214' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'43b06afe-9e07-4dd1-b66f-bb55622f29bc', N'TEXT.Please_Select_Language', N'Lütfen Dil Seçiniz', N'Please Select Language', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5475732' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5475739' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'34d195a0-c448-4aae-b77d-bbfceea8d717', N'TEXT.Sector_Fruits', N'Meyve', N'Fruit', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5736621' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5736627' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1f398053-ef38-4edc-aa2f-bc25e12282c7', N'TEXT.Enter_Email', N'Lütfen giriş yapmak için kullandığınız e-posta adresini giriniz', N'Don\\\''t worry ! Please enter the e-mail you use to login', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4661713' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4661720' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3aa9332b-5b8d-4ef7-81cf-bc438b92602a', N'TEXT.File_Auths', N'Dosya Yetkileri', N'File Auths', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4759347' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4759355' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'30c1dcd3-fbdf-4604-9ce9-bc6d18cec7b3', N'TEXT.Download', N'İndir', N'Download', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4363414' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4363424' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a51c90a4-88b9-439a-8516-bcee3a86a2f4', N'TEXT.Contact_Detail', N'Kişi Detay', N'User Detail', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4222355' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4222364' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd3c83c25-8e66-4798-b17e-bdc3722381ac', N'TEXT.Empty_Country_Error', N'Ülke boş olamaz', N'Country cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4501524' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4501530' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'48437584-73fa-48d7-aa73-bde1167a7f15', N'TEXT.Max_Length_Field', N'Maksimum Karekter', N'Max Lenght', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5084424' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5084433' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9bb8217d-ad66-4385-bba2-be555aa7cde1', N'TEXT.Price', N'Fiyat', N'Price', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5508926' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5508933' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e5172236-daaa-44cb-b7ef-bf63faa4281e', N'TEXT.Add_Reminder', N'Hatırlatıcı Ekle', N'Add Reminder', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3988668' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3988674' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a4898e83-f6db-4e53-96e1-bfb69c8bd3a0', N'TEXT.My_Assigned_Task', N'Atanan Görevim', N'My Assigned Task', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5169229' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5169236' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3f275690-0148-40ba-810b-bff37e7a57a2', N'TEXT.Kiosk_Add_Step1', N'Kiosk adı, logosu ve bekleyen mesaj alanlarını doldurabilirsiniz.', N'You can fill in the kiosk name, logo and waiting message fields.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4922267' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4922274' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a65e17c2-2f94-493c-b5c0-bff78d93ba9e', N'TEXT.Empty_Participant', N'Katılan katılımcı yok.', N'There is no user participating.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4579865' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4579874' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5335cd77-d78d-496d-91ae-c10d3ea7a971', N'TEXT.Edit_Block', N'Blok Metni Güncelle', N'Edit Block Text', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4391002' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4391009' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'35b630f5-6987-4838-94f7-c11e1aad818a', N'TEXT.Aktivasyon_Mesaj', N'Aktivasyon İşleminiz Başarılıdır. Artık giriş yapabilirsiniz.', N'Your Activation Process is Successful.  You can now log in.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4021208' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4021214' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dbc04bdc-e680-4b26-b73c-c16b7dc6cc8e', N'TEXT.Timeline', N'Zaman Çizelgesi', N'Timeline', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6232414' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6232420' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'54dc0742-13cb-4e51-8cc7-c1ddad0b57a8', N'TEXT.Total_Event', N'Toplam Etkinlik', N'Total Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6257700' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6257706' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9844314d-b0d5-42ef-ac42-c2b893f6e03d', N'TEXT.Edit_Company', N'Şirketi Düzenle', N'Edit Company', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4395867' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4395877' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4fc3c1b0-a7f6-4bf4-b4ee-c2e8f17c21f8', N'TEXT.Finish', N'Bitir', N'Finish', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4840306' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4840313' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'88587b0e-5238-483e-a6e9-c327338574db', N'TEXT.User_Profile', N'Kullanıcı Profili', N'User Profile', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6373265' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6373271' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3a01dbc5-eb62-4cfb-a882-c479cf77ea98', N'TEXT.Tutorial_Languages', N'Dil tercihlerinizi değiştirebilir  <br> ve Fairscope\\\''u kendi dilinizde  <br> kullanabilirsiniz.', N'You can change your language <br> preferences and use Fairscope in your <br> language.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3851467' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3851472' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cc201b47-9c2b-4359-b881-c492a67863ce', N'TEXT.Select_Package_One_Text5', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5854470' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5854476' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd6c42c1c-67eb-4fde-a84e-c4db477d1259', N'TEXT.Add_Kiosk', N'Kiosk Ekle', N'Add Kiosk', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3943893' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3943899' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2fb1bde9-51fb-49ff-b195-c5504c11153e', N'TEXT.Smtp_Port', N'SMTP Port', N'SMTP Port', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6055594' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6055602' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'63466289-ca0b-42ed-8b6e-c57e76430fee', N'TEXT.Error_Upload', N'Dosya Yükleme Hatası', N'Error Upload', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3816163' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3816167' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e382180a-bdc9-4389-b84d-c5f64a5288c2', N'TEXT.Event_Active_Desc', N'Lütfen aktif olduğunuz etkinliği seçin', N'Please select the event you are active', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4698946' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4698956' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'222c9951-fec7-4c05-a5b2-c65ebb1c3fb4', N'TEXT.May', N'Mayıs', N'May', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3833665' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3833669' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a66e729e-80cb-4015-8cf8-c695fa3c45ec', N'TEXT.Log_Out', N'Çıkış Yap', N'Log Out', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5021876' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5021885' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'29fd8d55-afb1-4788-8e0e-c6b0018373ac', N'TEXT.Package_Validity_Period', N'Paket geçerlilik süresi (ay)', N'Package validity period (mounth)', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5358734' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5358741' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'538011b2-2c9c-4943-b7cb-c6ce351e3bf0', N'TEXT.Update_Lang_Version', N'Versiyon Güncelle', N'Update Version', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6290282' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6290288' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5c176f55-a6e0-4123-a750-c759d5c77a12', N'TEXT.Upload_Error', N'jpg, png, jpeg, pdf, docx, xlsx, mp4 haricinde dosya yükleyemezsiniz.', N'You cannot upload files except jpg, png, jpeg, pdf, docx, xlsx, mp4', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6332222' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6332228' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b6b22571-5bcc-458d-84cb-c7f95df335d8', N'TEXT.Remove', N'Sil', N'Remove', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5593506' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5593515' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eac7a021-e0b6-41c5-a274-c7fe0c43c69d', N'TEXT.Tutorial_Profile', N'Profilinize, ayarlarınıza, raporunuza, <br> premium ekranınıza ve çıkış ekranınıza <br> gidebilirsiniz.', N'You can go your profile , settings , report,  <br>premium screen and log out <br> screen.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3867997' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3868002' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a5ec4cc2-34c8-48ed-8325-c861dfeea19f', N'TEXT.Hour_Short', N'H', N'S', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4882887' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4882894' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'940ce151-8c5d-4054-8f6d-c885d1fe10bb', N'TEXT.Note_Deleted', N'Not Silindi', N'Note Deleted', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5262238' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5262245' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3be86690-5961-43fb-bbdc-c8c906b53c68', N'TEXT.Select_Package_One_Text2', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5842057' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5842063' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'de0f858e-bfd7-4ada-aac6-c9292a03d118', N'TEXT.Select_Package_Three_Text1', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5858871' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5858877' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd7293cc8-4a48-44f9-97a0-cb9b92614434', N'TEXT.Smtp_Server', N'SMTP Sunucusu', N'SMTP Server', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6060472' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6060479' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f61beb54-7605-4a0e-b974-ccf7271e4927', N'TEXT.Allow_File_Types', N'Dosya türlerine izin ver', N'Allow file types', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4032944' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4032952' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ebd3898f-45d8-4a2c-a8a2-cd6a57904bbb', N'TEXT.Empty_Mail_Type2_Error', N'İkinci email tipi boş olamaz', N'Second email type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4526903' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4526911' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bc634b65-3120-4cb9-b075-cdf792f65ffb', N'TEXT.Note_Date', N'Not Tarihi', N'Note Date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5257965' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5257972' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'543f51af-e984-4b8c-bbf5-cdfe2cda406b', N'TEXT.Choose_Company', N'Şirket Seç', N'Choose Company', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4138299' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4138308' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8c0df45d-81fc-4b5b-ae0c-ce21f29d3d48', N'TEXT.Notes', N'Notlar', N'Notes', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5271241' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5271248' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4586948a-b9a3-4641-8f0f-ce7772a6be76', N'TEXT.Team_Members', N'Takım Üyeleri', N'Team Members', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6203456' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6203463' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e35af4b5-aa7a-4e8e-89bf-cecc74ea53f7', N'TEXT.Reset_Password', N'Şifre Yenile', N'Reset Password', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5613508' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5613515' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'37d6f7fe-8fc5-417a-ad38-cee844a0f5f8', N'TEXT.Select_Package_Three_Text4', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5872138' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5872144' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3471d4a0-e081-46d0-96b6-cf9b1c2c736f', N'TEXT.Contact_Us', N'Bize Ulaşın', N'Contact Us', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4230697' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4230704' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7d1d48eb-e640-49e2-8dfb-d0026bd8a5a2', N'TEXT.Empty_Page_Text_Notification ', N'Yeni bildirim gösterilmiyor.', N'New notification not showing.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4565727' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4565735' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'47f3d1a1-cab4-4980-a82c-d011115849a0', N'TEXT.Ppd_Can_Share_Files', N'Dosya Paylaşımı', N'File Sharing', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5490018' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5490024' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9235edab-36ea-48d9-8992-d01337ce443a', N'TEXT.User_Deleting', N'Kullanıcı Siliniyor', N'User Deleting', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6368734' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6368740' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bfb2078c-dd8c-425f-9337-d055c56b0d98', N'TEXT.Archive', N'Arşiv', N'Archive', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4048717' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4048724' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3f1bd62f-f865-4b80-bed1-d058535ffdac', N'TEXT.Mon', N'Pts', N'Mon', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5140857' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5140864' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1c897769-86fb-4db6-89e3-d0c4fc70a263', N'TEXT.Status', N'Durum', N'Status', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6111703' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6111710' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fa92005a-7cf2-463c-b64a-d10f84f880fe', N'TEXT.Please_Choose_Correct_Matches', N'Lütfen doğru eşleşmeyi seçiniz', N'Please select the correct match', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5470374' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5470384' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'811caf10-1751-439d-b433-d1a7e35e48e8', N'TEXT.Fill_Form_Out', N'Form Doldur', N'Fill Out Form', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4824612' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4824620' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c10efc81-eb93-4582-ba3b-d1c8d95e08da', N'TEXT.Tags', N'Etiketler', N'Tags', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6152345' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6152350' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2ba1e84d-634d-4823-a202-d20aeffdb3c2', N'TEXT.By', N'Tarafından', N'By', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4116397' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4116404' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a8504ceb-4d90-4c53-b63b-d26cf9d3b4bf', N'TEXT.Storage', N'Depo', N'Storage', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6116111' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6116117' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'79b9d896-c5ab-41ff-bf8d-d2e646c66051', N'TEXT.Email_Sender_Name', N'E-posta Gönderen Adı', N'Email Sender Name', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4453054' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4453062' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cb1ed875-e0fd-4bc4-9a44-d3db64ee7e94', N'TEXT.Lutfen_Sirket_Seciniz', N'Lütfen yetkili olduğunuz şirketlerinizden birini seçiniz.', N'Please select one of your authorized companies.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5041497' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5041506' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eb92c7f9-c3f8-4c79-82bc-d3e036e6d6c9', N'TEXT.Last_Entry', N'Son Giriş', N'Last Entry', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4993192' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4993199' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'41633488-77cc-4ae5-94c0-d40eec0f00c9', N'TEXT.Event', N'Etkinlikler', N'Events', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4687531' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4687542' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a00c8ad2-63c4-488e-a73e-d4215cb08a5e', N'TEXT.Aktivasyon_Gerceklesmedi', N'Aktivasyon gerçekleşmedi', N'Activation did not occur', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4017759' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4017765' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3e720145-527a-4e1e-9d49-d44b08df031b', N'TEXT.Tutorial_Filter', N'Arama sonuçlarını daraltabilir. <br> İstediğiniz sonuçları <br>  hızlı bir şekilde görüntüleyebilirsiniz.', N'Can narrow the search results. You can <br>  quickly view the results you want.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3846228' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3846233' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a6d794fd-12b5-4889-9e4e-d4b92834ee83', N'TEXT.Empty_Mail_Type3_Error', N'Üçüncü email tipi boş olamaz', N'Third email type cannot be empty', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4531458' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4531465' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4d3bfaf2-53f1-4a50-bd42-d4e09023e9c1', N'TEXT.Team_Add_Step1', N'Takımınızın adını yazın ve takımınız için bir aktivite seçin.', N'Type your team name and select an activity for your team.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6182163' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6182169' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'81c0131f-f8dd-4189-9785-d5154a3b2dfe', N'TEXT.Add_Kiosk_Screen_Description', N'Kiosk ekranınız yok.<br> Kiosk ekranını açmak istiyorsanız lütfen kiosk ekle\''ye tıklayın.', N'You dont have Kiosk screen. If you want to open Kiosk screen please click add kiosk.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3947437' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3947444' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'73fe0e26-ead2-413c-984c-d51d0bbd0aa9', N'TEXT.Clear_All', N'Hepsini Temizle', N'Clear All', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4163160' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4163171' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6652f55f-47b5-48fd-935d-d571bdf29e12', N'TEXT.Note', N'Not', N'Note', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5248732' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5248739' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'92cafc68-c62a-4984-af7b-d6da9de2ab79', N'TEXT.Empty_Card', N'Hiç kart yok. İstersen yeni bir tane ekleyebilirsin', N'There are no cards. You can add a new one if you want.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4480853' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4480865' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'b7be6483-ff23-4f10-831e-d6ee39f1515a', N'TEXT.Task_Date', N'Görev Tarihi', N'Task Date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6167784' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6167790' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'60ec934b-59bd-476b-956b-d8034f818d0c', N'TEXT.Received_File', N'Alınan Dosyalarım', N'received file', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5555234' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5555242' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'828daeb0-904c-42df-b4aa-d8210cf0670d', N'TEXT.Version_No', N'Sürüm 1.0', N'Version 1.0', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6382509' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6382515' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5e170007-651f-47ee-8428-d863846843a8', N'TEXT.Send', N'Göndermek', N'Send', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5929533' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5929540' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fcca3165-c881-4a15-8e7f-d876af32a974', N'TEXT.Thu', N'Per', N'Thu', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6225187' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6225193' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0d82fa24-472f-40be-8c4e-d8de06f8184a', N'TEXT.Last_Contact', N'Son Bağlantılar', N'Last Contact', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4988909' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4988915' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'54c88264-f1aa-4f6b-a42f-da29bb224907', N'TEXT.Share_File', N'Dosyaları Paylaş', N'Share Files', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6004846' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6004852' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a3d9d098-df04-40ed-9ffc-da4ac379e8c1', N'TEXT.Team_Add_Step3', N'Ekibiniz için kullanabilecekleri dosyaları seçin.', N'Select the files that they can use for your team.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6189188' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6189194' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5459c298-149b-4fcf-9ea9-da79119506c9', N'TEXT.Search_Bar_Text', N'Neyi aramak istersin?', N'What would you like to search for?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5680064' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5680076' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7529a577-790c-4e21-b3fd-da7b39ab87a3', N'TEXT.Add_Logo', N'Logo Ekle', N'Add Logo', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3951096' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3951103' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3f3fcd97-12f3-45a5-8bbc-da89a061c4dd', N'TEXT.Delete_Modal_Text', N'Hesabı silmek istediğinden emin misin?', N'Are you sure you want to delete the account?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4301175' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4301182' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a2e4bf65-4ff5-4a04-8c25-da9437c5dfb5', N'TEXT.Successfully_Sended_Form', N'İletişim Formu Başarıyla Gönderildi', N'Contact Form Sended Successfully', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6124348' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6124354' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'376a2172-f5c8-4d02-b5a6-db5755198b77', N'TEXT.Transaction_Successful', N'İşlem başarılı', N'Transaction successful', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6272085' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6272091' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'72546801-eadc-4313-a3a2-db7f26fafb42', N'TEXT.Max_Contact_Count', N'Maksimum kişi sayısı', N'Max contact count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5063266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5063274' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'30c215be-8ce4-4125-94ef-dc76a824475b', N'TEXT.Tutorial_Premium', N'Arama sonuçlarını daraltabilir. <br> İstediğiniz sonuçları hızlı bir şekilde <br> görüntüleyebilirsiniz.', N'Can narrow the search results. <br>You can quickly view  <br> the results you want.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3865143' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3865148' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c97f77e1-f2de-42e6-82d9-dce6947106ae', N'TEXT.Search_Results', N'Arama Sonuçları', N'Search Results', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5691657' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5691670' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd99a7ce2-04b9-442e-9b8c-dd3c7b75fe36', N'TEXT.Open_Company_Description', N'Premium hesabınız yok. <br> Şirket oluşturmak istiyorsanız lütfen hesabı yükseltin.', N'You don\''t have premium account.  <br>If you want to create Company please upgrade account.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5308530' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5308538' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'95f771e1-87f0-4c54-990a-dd94c973a8e9', N'TEXT.Ppd_Can_Share_Received_Files', N'Alınan Dosyaların Paylaşımı', N'Received File Sharing', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5494533' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5494540' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd1a9a86c-16c6-47b5-beb9-dee17a4cc682', N'TEXT.Notificationdefinitions', N'Bildirim tanımları', N'Notification definitions', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5279647' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5279654' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1bfba804-69f6-40ed-b4f0-df307299a2fe', N'TEXT.File_Name', N'Dosya Adı', N'File Name', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4787481' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4787490' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'98da5af7-1b1d-48be-8105-dff01f8b5823', N'TEXT.Company_Settings', N'Şirket Ayarları', N'Company Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4184283' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4184290' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'202da3c2-e1e8-4d24-ad64-dff97b795aa2', N'TEXT.Contact_For_Offical', N'Resmi etkinlik için iletişim formu', N'Contact form for offical event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4226268' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4226276' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1d2817b5-7140-4f60-a05b-e0754ba35c09', N'TEXT.General_Settings', N'Genel Ayarlar', N'General Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4854689' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4854696' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7a2bafb6-c875-4b57-9b16-e0c664e6918e', N'TEXT.Silme_Aciklama', N'Bu işlemi geri alamazsınız!', N'You won\''t be able to revert this!', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6039754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6039762' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9bb76187-15d5-42c0-878b-e0f82da91331', N'TEXT.Accept_And_Register', N'Kabul Et ve Kayıt Ol', N'accept and register', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3884023' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3884028' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5f30a1c3-0a4f-4778-b39c-e15665467c9f', N'TEXT.Reports_Auths', N'Rapor Yetkileri', N'Reports Auths', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5598566' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5598574' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'86d8d3d6-ad41-4e48-b599-e2720f19522d', N'TEXT.Add_Event_Screen_Description', N'Senin için bir olay yok. İsterseniz yeni bir tane ekleyebilirsiniz. İsterseniz yeni bir tane ekleyebilir veya yaklaşan etkinlikleri takip edebilirsiniz.', N'There is no event for you. You can add a new one if you want. If you want, you can add a new one or follow the upcoming events.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3936411' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3936417' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7b77985f-9434-4ee8-b75b-e360c589a96f', N'TEXT.Upcoming', N'Yaklaşan', N'Upcoming', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6283075' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6283081' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1f9e92a2-d2d5-4840-8cac-e3b60a6a6067', N'TEXT.Delay', N'Erteleme', N'Delay', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4283094' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4283103' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cc4d8acb-a71b-4265-83d0-e3d78b77a2a9', N'TEXT.Select_Card', N'Kart Seçme', N'Select Card', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5802530' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5802540' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'0482b913-d73f-4964-9408-e41ae335b29c', N'TEXT.Files_Selected', N'Dosyalar Seçildi', N'Files Selected', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4815135' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4815142' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6516d86c-d0b4-40bd-a577-e4313328751a', N'TEXT.Task_Completed', N'Görev Tamamlandı', N'Task Completed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6164003' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6164009' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'77e1fa50-a421-4617-9078-e4e83d36cc28', N'TEXT.Select_Package_Two_Text1', N'', N'', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5876743' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5876750' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'4fe6d820-dec9-4162-a093-e4e9e67b5cbd', N'TEXT.Settings', N'Ayarlar', N'Settings', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5958933' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5958940' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6ec1193c-28b9-4f36-978d-e4ec54d4cb3b', N'TEXT.Sector_Printers_Laser', N'Lazır Yazıcılar', N'Laser Printers', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5763093' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5763099' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7bb92bda-3626-4e86-8a19-e64856d15f55', N'TEXT.Total_Users', N'Toplam Kullanıcı', N'Total Users', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6268519' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6268525' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3344b0c0-f4dc-4a44-9d7e-e6e326eb4ccd', N'TEXT.Write_Task', N'Görev Yazınız.', N'.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6437035' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6437041' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'248626e9-17f0-4e4e-90b1-e768cccbe845', N'TEXT.DENME', N'SFS', N'SFS', N'', N'', N'', CAST(N'2023-09-21T15:28:00.6146022' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:28:00.6146828' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6ee6f0f3-5011-4659-ad99-e88ccbb3249f', N'TEXT.Max_Digital_Business_Card_Count', N'Maksimum dijital kartvizit sayısı', N'Max digital business card count', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5068919' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5068930' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7242418f-366d-4878-b8aa-e8f984f4822f', N'TEXT.Select_Data_Range', N'Tarih aralığı seçiniz', N'Please select date range', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5811978' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5811985' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2052c6c2-e288-480d-b6d0-ea3dbf744dad', N'TEXT.Createpromotioncode', N'Promosyon Kodu Oluştur', N'Create Promotion Code', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4260648' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4260655' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a0c6bb25-6b45-4550-8760-eb66c3a95c33', N'TEXT.Add_Question', N'Soru Ekle', N'Add Question', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3984753' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3984760' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c42d1990-a471-4823-b3b6-edade9bd1373', N'TEXT.Stant_Number', N'Stant Numarası', N'Stant Number', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6088767' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6088773' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7e8434f9-bb32-45cc-abda-ee81f3439d50', N'TEXT.Permissions', N'Yetkiler', N'Permissions', N'', N'', N'', CAST(N'2023-08-23T13:22:32.4856245' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:22:32.4856254' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'cfb9aec2-d149-4a0e-93ed-eeba7ef6d871', N'TEXT.Select_Date', N'Tarih Seç', N'Select Date', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5817090' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5817096' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dab33d1e-eb38-490f-a47f-ef126b182674', N'TEXT.Clear', N'Temizle', N'Clear', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4158097' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4158106' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'005ee298-1b35-460a-9d76-efed37d5f8e2', N'TEXT.Erroroccurred', N'Bir hata oluştu', N'An error occurred', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4682467' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4682474' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'dec9303b-2a13-4519-992b-eff355bacc9a', N'TEXT.Sector_Android', N'Android', N'Android', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5704828' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5704843' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'586be856-43f8-4143-8e55-f0196076dbcc', N'TEXT.Addnewproperty', N'Yeni özellik ekle', N'Add new property', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4010770' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4010776' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'5766f871-a3b4-4b7f-b292-f03f29be9728', N'TEXT.Kiosk', N'Kiosk', N'Kiosk', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4917364' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4917371' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'885334e7-12a5-4929-92e5-f04ce287dec2', N'TEXT.Restored_Kiosk_Sub_Text', N'Kullanıcı Kiosk''a erişebilir.', N'The user can access the Kiosk.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5629101' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5629108' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e17e685f-5bba-4475-99fe-f11b05561414', N'TEXT.No', N'Hayır', N'No', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5229959' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5229966' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'75edd0f7-88c2-4135-9d16-f21833457cf6', N'TEXT.Delete_User', N'Kişiyi Sil', N'Delete User', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4312332' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4312345' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'36daf0a6-16eb-4b14-8fa8-f2ecc7ca0818', N'TEXT.Sector_Food', N'Gıda Sektörü', N'Sector Food', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5731980' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5731988' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'de4b2693-5ea1-4300-9a0a-f33c213c8839', N'TEXT.Add_From_Here', N'Buradan not giriniz', N'Please enter note here', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3939963' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3939970' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6f6ddd23-f6a9-454b-b257-f353c5797d05', N'TEXT.Approve', N'Onayla', N'Approve', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4044754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4044761' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'908c72ab-b8f2-4a88-ab79-f367cc4a227d', N'TEXT.Past_Todo', N'Geçmiş Yapılacaklar', N'Past Todo', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5416387' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5416394' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'32541e3f-cb53-408e-a669-f47b2a27c462', N'TEXT.Suspend_Modal_Text', N'Hesabı askıya almak istediğinden emin misin?', N'Are you sure you want to suspend the account?', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6148004' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6148012' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8d78bcfa-4938-48fb-89ac-f4ed886ec4a5', N'TEXT.Empty_Contact', N'Sizin için bir kişi yok.\nİsterseniz yeni bir kişi ekleyebilirsiniz.', N'There is no contact for you.\nYou can add a new one if you want.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4492503' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4492511' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a0508003-c386-4475-b86a-f54f3792c310', N'TEXT.March', N'Mart', N'March', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3830990' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3830994' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'57a83bb7-141d-4368-9a09-f5faae424597', N'TEXT.Wed', N'Çar', N'Wed', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6396127' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6396134' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'86ba7b45-12e5-4db1-acb5-f69a2c8b9242', N'TEXT.Complated_Contact_Request', N'Talebiniz alındı. Uzmanlarımız en kısa sürede sizinle iletişime geçecektir.', N'Your request has been received. Our experts will contact you as soon as possible.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4199839' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4199848' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c87b553d-9bdd-41c4-8b52-f6aafe93ba28', N'TEXT.Empty_Program', N'Oluşturulmuş program yok.', N'There is no program created.', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4623746' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4623754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a1ba1959-5360-4efd-b1ef-f6b7374769ea', N'TEXT.Drag_Drop', N'Dosyaları yüklemek için buraya sürükleyip bırakın veya', N'Drag & Drop files here to upload or', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4376746' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4376754' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'02240be8-6438-481f-88f5-f7651938e157', N'TEXT.Select_Auths', N'Yetki Seçiniz', N'Select Auths', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5797009' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5797016' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'932813c8-b20a-4741-ad74-f81a3822a93b', N'TEXT.Already_Account', N'Hesabınız var mı', N'Already have a account', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4040832' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4040839' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'fc36bbf2-3f7b-4f9a-ba8a-f82f6ba64547', N'TEXT.Settings_Delete_Account_Text', N'Hesabı Sil', N'Delete the Account', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5968549' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5968557' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'f03da399-a9a3-4d7f-8285-f89c291da395', N'TEXT.Tutorial_Menu', N'Menüden sayfalar arasında <br> gezinebilirsiniz.', N'You can navigate between pages <br> through the menu.', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3854249' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3854254' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'e94d2591-19fd-40b3-a0a6-f8dc0c3752fe', N'TEXT.Kioskbackground', N'Kiosk Arka Planı', N'Kiosk Background', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4962741' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4962750' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a765280f-834e-497b-b5b0-f91af5ad339b', N'TEXT.Fri', N'Cum', N'Fri', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4849804' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4849813' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ddfa6b8a-1ca5-481f-b393-f96291b0cb31', N'TEXT.Media', N'Medya', N'Media', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.5115670' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5115677' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eca1e135-f6c1-4c8e-9b3e-f9ca4d44365e', N'TEXT.Back_To_Old', N'Eskiye Dön', N'Back To Old', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4104582' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4104588' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3ee235a2-5bcf-41fc-ae34-fa0022561a6f', N'TEXT.December', N'Aralık', N'December', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3805347' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3805356' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'7b4d9dfe-9a5c-414a-9c4c-fb718af67dd1', N'TEXT.Sign_Up', N'Kayıt ol', N'Sign up', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.6029566' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6029573' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'1f093f6d-9ade-4fad-b26d-fd5f48700df1', N'TEXT.End_Datetime', N'Bitiş Tarihi', N'End Datetime', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4651539' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4651546' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'552739bb-c343-4d91-99a4-fd6694ea86d0', N'TEXT.Return', N'Geri', N'Return', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.5650265' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.5650272' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c2becc66-315d-44db-b956-fe43f3ae3302', N'TEXT.A_To_Z', N'A’dan Z’ye', N'From A to Z', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.3878249' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3878254' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'03409b6c-a2a8-4026-bde7-fe5c84b911b1', N'TEXT.Total_Premium', N'Toplam Premium', N'Total Premium', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.6264951' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.6264957' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'bcbb24bb-b4ca-4c40-bb33-feb737de7c1b', N'TEXT.Alls', N'Tümü', N'Alls', N'', NULL, N'', CAST(N'2023-08-23T13:19:25.4036894' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4036901' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ff2ef58b-88af-48b4-a9b8-fedc8f1dc5ac', N'TEXT.Archived_Tasks', N'Arşivlenmiş Görevler', N'Archived Tasks', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.4064543' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.4064550' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Language] ([Id], [Keyword], [Tr], [En], [Fr], [Es], [De], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'63d577d1-2bc3-4d42-914e-ffc86de4b8a8', N'TEXT.Add_Event', N'Etkinlik Ekle', N'Add Event', NULL, NULL, NULL, CAST(N'2023-08-23T13:19:25.3932986' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-08-23T13:19:25.3932992' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'a6dbbab6-20a9-4b4a-9f88-3792f102713b', N'PERMİSSİON_LİST', N'', N'Permission', N'list', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T16:48:36.7607999' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 1)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'ac3b5808-416c-45de-a524-38fb648e9a0c', N'ROLE_GETBYID', N'', N'Role', N'getById', CAST(N'2023-06-19T21:57:52.1462684' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-06-19T21:57:52.1462723' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1, NULL, 1)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'71743490-1df5-4f74-bfd3-5b41fc83e4f7', N'LANGUAGE_ADD', N'', N'Language', N'add', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T16:55:58.9968622' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 2)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'54e0c27a-ef86-4673-a867-6f6946c137e1', N'PERMİSSİON_DELETE', N'', N'Permission', N'delete', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:38:25.6118831' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 4)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'30f7b5df-0e9a-4413-9057-81ad806a6341', N'ROLE_UPDATE', N'', N'Role', N'update', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:36:09.0547521' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 3)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'311b3229-2b71-43f1-9b03-ba35add6f7f8', N'ROLE_DELETE', N'', N'Role', N'delete', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:29:10.7547081' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 4)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'0208df2c-f022-46fa-867b-bc13930f415e', N'USER_LİST', N'', N'User', N'list', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T16:50:29.9120752' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 1)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'5a6113a0-1549-479e-927d-bf4b1e21a264', N'ROLE_LİST', N'', N'Role', N'list', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T18:03:17.8039559' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 1)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'667a13e2-0c95-4412-92f3-c0f0ea3f8df2', N'PERMİSSİON_UPDATE', N'', N'Permission', N'update', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T18:03:38.4565060' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 3)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'326021ca-5db0-46fd-8315-cfd212dcac28', N'PERMİSSİON_ADD', N'', N'Permission', N'Add', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T18:03:23.7160547' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 2)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'3fd3dc4c-8bae-421f-9b64-d3b21d47ee29', N'ROLE_ADD', N'', N'Role', N'add', CAST(N'2023-09-21T15:18:19.6005199' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:18:19.6005800' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1, NULL, 0)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'9076b851-12c9-4940-8434-e7f59c401b53', N'LANGUAGE_ADDALL', N'', N'Language', N'AddAll', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T18:03:30.4404834' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 2)
GO
INSERT [AS].[Permissions] ([Id], [Name], [Description], [ControllerName], [ActionName], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved], [ActionStatusId], [CRUDActionType]) VALUES (N'a3ea0948-13ee-4758-8438-ec007040d59b', N'LANGUAGE_LİST', N'', N'Language', N'list', CAST(N'0001-01-01T00:00:00.0000000' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-19T18:03:44.0819792' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0, NULL, 1)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9fa7fc48-5d98-4334-7c43-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'71743490-1df5-4f74-bfd3-5b41fc83e4f7', CAST(N'2023-09-20T22:27:53.3232201' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:27:53.3233603' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c1dbdb49-25ca-4f62-7c44-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'9076b851-12c9-4940-8434-e7f59c401b53', CAST(N'2023-09-20T22:28:05.3706861' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:28:05.3708577' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'40290fae-5afd-4a00-7c45-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a3ea0948-13ee-4758-8438-ec007040d59b', CAST(N'2023-09-20T22:28:07.4907191' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:28:07.4907266' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'72f328ca-8e4b-4105-7c46-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a6dbbab6-20a9-4b4a-9f88-3792f102713b', CAST(N'2023-09-20T22:47:00.6394907' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:47:00.6394943' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'587908e7-d798-4203-7c47-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'54e0c27a-ef86-4673-a867-6f6946c137e1', CAST(N'2023-09-20T22:47:00.6495098' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:47:00.6495125' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'a439ad14-f462-481b-7c48-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'667a13e2-0c95-4412-92f3-c0f0ea3f8df2', CAST(N'2023-09-20T22:47:00.6506919' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:47:00.6506931' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'6934b714-6d01-4759-7c49-08dbba0fb31c', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'326021ca-5db0-46fd-8315-cfd212dcac28', CAST(N'2023-09-20T22:47:00.6515888' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-20T22:47:00.6515899' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'810fe7df-f9df-4615-41fc-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'71743490-1df5-4f74-bfd3-5b41fc83e4f7', CAST(N'2023-09-21T15:42:29.5723237' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.5723364' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ae05719d-cbef-49db-41fd-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'9076b851-12c9-4940-8434-e7f59c401b53', CAST(N'2023-09-21T15:42:29.6157823' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6157847' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c449e0e3-47bf-4e07-41fe-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a3ea0948-13ee-4758-8438-ec007040d59b', CAST(N'2023-09-21T15:42:29.6192587' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6192605' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'ca2742a0-661b-4e0e-41ff-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a6dbbab6-20a9-4b4a-9f88-3792f102713b', CAST(N'2023-09-21T15:42:29.6230505' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6230525' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'594a9893-f9c7-4555-4200-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'54e0c27a-ef86-4673-a867-6f6946c137e1', CAST(N'2023-09-21T15:42:29.6237129' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6237137' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'152d9181-edb7-4e47-4201-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'667a13e2-0c95-4412-92f3-c0f0ea3f8df2', CAST(N'2023-09-21T15:42:29.6241681' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6241687' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'62f64ba6-3975-4ecb-4202-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'326021ca-5db0-46fd-8315-cfd212dcac28', CAST(N'2023-09-21T15:42:29.6246214' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6246220' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'8e4ecf1d-faeb-4870-4203-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'30f7b5df-0e9a-4413-9057-81ad806a6341', CAST(N'2023-09-21T15:42:29.6272322' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6272343' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'40d1e98e-77f8-466e-4204-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'311b3229-2b71-43f1-9b03-ba35add6f7f8', CAST(N'2023-09-21T15:42:29.6281281' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:42:29.6281290' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'820f98ea-0910-4bdf-4205-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'71743490-1df5-4f74-bfd3-5b41fc83e4f7', CAST(N'2023-09-21T15:46:11.8507590' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8507621' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'd9f47495-dc75-4d10-4206-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'9076b851-12c9-4940-8434-e7f59c401b53', CAST(N'2023-09-21T15:46:11.8591410' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8591434' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'07dc0dc5-23ee-4a8a-4207-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a3ea0948-13ee-4758-8438-ec007040d59b', CAST(N'2023-09-21T15:46:11.8598080' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8598089' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9dcfb259-b8e1-48da-4208-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'a6dbbab6-20a9-4b4a-9f88-3792f102713b', CAST(N'2023-09-21T15:46:11.8622393' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8622410' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'eceaa570-175c-49cf-4209-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'54e0c27a-ef86-4673-a867-6f6946c137e1', CAST(N'2023-09-21T15:46:11.8631211' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8631220' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'525854f2-abd6-4c94-420a-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'667a13e2-0c95-4412-92f3-c0f0ea3f8df2', CAST(N'2023-09-21T15:46:11.8637055' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8637062' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c60313b2-c243-49f8-420b-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'326021ca-5db0-46fd-8315-cfd212dcac28', CAST(N'2023-09-21T15:46:11.8643547' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8643554' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'edd8435c-c734-4909-420c-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'30f7b5df-0e9a-4413-9057-81ad806a6341', CAST(N'2023-09-21T15:46:11.8668518' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8668531' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'9eda2ab9-5ddd-4035-420d-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'311b3229-2b71-43f1-9b03-ba35add6f7f8', CAST(N'2023-09-21T15:46:11.8676989' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8676997' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[RolePermissionLines] ([Id], [RoleId], [PermissionId], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'af473f09-89b3-4ef7-420e-08dbbaa037be', N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'0208df2c-f022-46fa-867b-bc13930f415e', CAST(N'2023-09-21T15:46:11.8703965' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8703980' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[Roles] ([Id], [Name], [Description], [Level], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'46524f7a-a2dd-4d1c-9214-2721578e3687', N'Yönetici', N'genel yetkili', 1, CAST(N'2023-06-14T18:08:38.7566313' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-09-21T15:46:11.8723053' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'3fa85f64-5717-4562-b3fc-2c963f66afa6', N'abdullah', N'dsarı', N'sfsf', N'sfs                                                                                                                             ', N'abdullahsari@gmail.com', CAST(N'2023-03-31T11:06:33.4220627' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-03-31T11:06:33.4221795' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'2880d032-ee50-40aa-8dd8-5a91560722a6', N'Nuri', N'katman', N'mustafaKatman', N'xvdgd4                                                                                                                          ', N'katman@gmail.com', CAST(N'2023-04-03T18:49:59.9846667' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-04-05T15:16:32.5955517' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 0)
GO
INSERT [AS].[Users] ([Id], [FirstName], [LastName], [Username], [Password], [Email], [CreationTime], [CreatedById], [UpdateTime], [UpdatedById], [IsApproved]) VALUES (N'c96b9f39-7e16-4666-aa9e-69fd8f54ff62', N'sarı', N'sarı', N'Ali', N'xvdgd4                                                                                                                          ', N'sar@gmail.com', CAST(N'2023-04-03T18:44:20.7646898' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', CAST(N'2023-04-03T18:44:20.7647360' AS DateTime2), N'3fa85f64-5717-4562-b3fc-2c963f66afa6', 1)
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230228125415_YeniDb', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230606081345_Vb-2', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230608064213_vb-3', N'7.0.1')
GO
INSERT [dbo].[__EFMigrationsHistory] ([MigrationId], [ProductVersion]) VALUES (N'20230915145637_Permission', N'7.0.1')
GO
ALTER TABLE [AS].[PermissionMenuLines] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsApproved]
GO
ALTER TABLE [AS].[Permissions] ADD  DEFAULT ((0)) FOR [CRUDActionType]
GO
ALTER TABLE [AS].[RolePermissionLines] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsApproved]
GO
ALTER TABLE [AS].[RoleUserLines] ADD  DEFAULT (CONVERT([bit],(0))) FOR [IsApproved]
GO
ALTER TABLE [AS].[Language]  WITH CHECK ADD  CONSTRAINT [FK_Language_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Language] CHECK CONSTRAINT [FK_Language_Users_CreatedById]
GO
ALTER TABLE [AS].[Language]  WITH CHECK ADD  CONSTRAINT [FK_Language_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Language] CHECK CONSTRAINT [FK_Language_Users_UpdatedById]
GO
ALTER TABLE [AS].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Menus_ParentMenuId] FOREIGN KEY([ParentMenuId])
REFERENCES [AS].[Menus] ([Id])
GO
ALTER TABLE [AS].[Menus] CHECK CONSTRAINT [FK_Menus_Menus_ParentMenuId]
GO
ALTER TABLE [AS].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Menus] CHECK CONSTRAINT [FK_Menus_Users_CreatedById]
GO
ALTER TABLE [AS].[Menus]  WITH CHECK ADD  CONSTRAINT [FK_Menus_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Menus] CHECK CONSTRAINT [FK_Menus_Users_UpdatedById]
GO
ALTER TABLE [AS].[PermissionMenuLines]  WITH CHECK ADD  CONSTRAINT [FK_PermissionMenuLines_Menus_MenuId] FOREIGN KEY([MenuId])
REFERENCES [AS].[Menus] ([Id])
GO
ALTER TABLE [AS].[PermissionMenuLines] CHECK CONSTRAINT [FK_PermissionMenuLines_Menus_MenuId]
GO
ALTER TABLE [AS].[PermissionMenuLines]  WITH CHECK ADD  CONSTRAINT [FK_PermissionMenuLines_Permissions_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [AS].[Permissions] ([Id])
GO
ALTER TABLE [AS].[PermissionMenuLines] CHECK CONSTRAINT [FK_PermissionMenuLines_Permissions_PermissionId]
GO
ALTER TABLE [AS].[PermissionMenuLines]  WITH CHECK ADD  CONSTRAINT [FK_PermissionMenuLines_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[PermissionMenuLines] CHECK CONSTRAINT [FK_PermissionMenuLines_Users_CreatedById]
GO
ALTER TABLE [AS].[PermissionMenuLines]  WITH CHECK ADD  CONSTRAINT [FK_PermissionMenuLines_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[PermissionMenuLines] CHECK CONSTRAINT [FK_PermissionMenuLines_Users_UpdatedById]
GO
ALTER TABLE [AS].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_ActionStatus_ActionStatusId] FOREIGN KEY([ActionStatusId])
REFERENCES [AS].[ActionStatus] ([Id])
GO
ALTER TABLE [AS].[Permissions] CHECK CONSTRAINT [FK_Permissions_ActionStatus_ActionStatusId]
GO
ALTER TABLE [AS].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users_CreatedById]
GO
ALTER TABLE [AS].[Permissions]  WITH CHECK ADD  CONSTRAINT [FK_Permissions_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Permissions] CHECK CONSTRAINT [FK_Permissions_Users_UpdatedById]
GO
ALTER TABLE [AS].[RolePermissionLines]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionLines_Permissions_PermissionId] FOREIGN KEY([PermissionId])
REFERENCES [AS].[Permissions] ([Id])
GO
ALTER TABLE [AS].[RolePermissionLines] CHECK CONSTRAINT [FK_RolePermissionLines_Permissions_PermissionId]
GO
ALTER TABLE [AS].[RolePermissionLines]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionLines_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [AS].[Roles] ([Id])
GO
ALTER TABLE [AS].[RolePermissionLines] CHECK CONSTRAINT [FK_RolePermissionLines_Roles_RoleId]
GO
ALTER TABLE [AS].[RolePermissionLines]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionLines_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[RolePermissionLines] CHECK CONSTRAINT [FK_RolePermissionLines_Users_CreatedById]
GO
ALTER TABLE [AS].[RolePermissionLines]  WITH CHECK ADD  CONSTRAINT [FK_RolePermissionLines_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[RolePermissionLines] CHECK CONSTRAINT [FK_RolePermissionLines_Users_UpdatedById]
GO
ALTER TABLE [AS].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Roles] CHECK CONSTRAINT [FK_Roles_Users_CreatedById]
GO
ALTER TABLE [AS].[Roles]  WITH CHECK ADD  CONSTRAINT [FK_Roles_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Roles] CHECK CONSTRAINT [FK_Roles_Users_UpdatedById]
GO
ALTER TABLE [AS].[RoleUserLines]  WITH CHECK ADD  CONSTRAINT [FK_RoleUserLines_Roles_RoleId] FOREIGN KEY([RoleId])
REFERENCES [AS].[Roles] ([Id])
GO
ALTER TABLE [AS].[RoleUserLines] CHECK CONSTRAINT [FK_RoleUserLines_Roles_RoleId]
GO
ALTER TABLE [AS].[RoleUserLines]  WITH CHECK ADD  CONSTRAINT [FK_RoleUserLines_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[RoleUserLines] CHECK CONSTRAINT [FK_RoleUserLines_Users_CreatedById]
GO
ALTER TABLE [AS].[RoleUserLines]  WITH CHECK ADD  CONSTRAINT [FK_RoleUserLines_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[RoleUserLines] CHECK CONSTRAINT [FK_RoleUserLines_Users_UpdatedById]
GO
ALTER TABLE [AS].[RoleUserLines]  WITH CHECK ADD  CONSTRAINT [FK_RoleUserLines_Users_UserId] FOREIGN KEY([UserId])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[RoleUserLines] CHECK CONSTRAINT [FK_RoleUserLines_Users_UserId]
GO
ALTER TABLE [AS].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_CreatedById] FOREIGN KEY([CreatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Users] CHECK CONSTRAINT [FK_Users_Users_CreatedById]
GO
ALTER TABLE [AS].[Users]  WITH CHECK ADD  CONSTRAINT [FK_Users_Users_UpdatedById] FOREIGN KEY([UpdatedById])
REFERENCES [AS].[Users] ([Id])
GO
ALTER TABLE [AS].[Users] CHECK CONSTRAINT [FK_Users_Users_UpdatedById]
GO
