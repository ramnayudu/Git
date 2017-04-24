USE [IFocusMemDataMgmt]
GO

/****** Object:  Table [dbo].[MembersRegistration]    Script Date: 3/14/2016 6:27:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

SET ANSI_PADDING ON
GO

CREATE TABLE [dbo].[MembersRegistration](
	[MemberId] [int] NOT NULL,
	[Name] [varchar](100) NOT NULL,
	[Surname] [varchar](80) NULL,
	[Gender] [varchar](20) NOT NULL,
	[ContactNo] [varchar](30) NOT NULL,
	[EmailID] [varchar](80) NOT NULL,
	[Address] [varchar](300) NULL,
	[City] [varchar](50) NULL,
	[District] [varchar](50) NULL,
	[Role] [varchar](50) NULL,
	[DateofJoin] [varchar](50) NULL,
	[Profession] [varchar](50) NULL,
	[Navigator] [varchar](150) NULL,
	[JointSecrestary] [varchar](150) NULL,
	[Mentor] [varchar](150) NULL,
	[Secretory] [varchar](150) NULL,
	[Qualification] [varchar](50) NOT NULL,
	[Specialization] [varchar](150) NOT NULL,
	[HomeTown] [varchar](80) NULL,
	[PGQualification] [varchar](80) NULL,
	[PGSpecialization] [varchar](120) NULL,
 CONSTRAINT [PK_MembersRegistration] PRIMARY KEY CLUSTERED 
(
	[MemberId] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]

GO

SET ANSI_PADDING OFF
GO

