USE [IFocusMemDataMgmt]
GO

/****** Object:  StoredProcedure [dbo].[GetMemberID]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMemberID]
	
AS
BEGIN
	select isnull(max(MemberId),0)+ 1 as MemberId from MembersRegistration
END

GO

/****** Object:  StoredProcedure [dbo].[GetMembersDetails]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
create PROCEDURE [dbo].[GetMembersDetails]
@Name varchar(100)	
AS
BEGIN

	select MemberId,Name,Role,ContactNo,EmailID,City,DateofJoin from MembersRegistration where Name=@Name

END

GO

/****** Object:  StoredProcedure [dbo].[GetMembersNames]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetMembersNames]
@Name varchar(100)	
AS
BEGIN

	select Name from MembersRegistration where Name=@Name

END

GO

/****** Object:  StoredProcedure [dbo].[GetNamesList]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNamesList] 
@Name varchar(100)	
AS
BEGIN
	select Name from MembersRegistration where Name  like @Name +'%'
END

GO

/****** Object:  StoredProcedure [dbo].[GetNavigators]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		<Author,,Name>
-- Create date: <Create Date,,>
-- Description:	<Description,,>
-- =============================================
CREATE PROCEDURE [dbo].[GetNavigators]
	
AS
BEGIN
select * from Navigators order by navigatorname asc
END

GO

/****** Object:  StoredProcedure [dbo].[InesertMemberDetails]    Script Date: 3/14/2016 6:27:46 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO



CREATE PROCEDURE [dbo].[InesertMemberDetails]
@MemberId int,
@Name varchar(100),
@Surname varchar(80),
@Gender varchar(20),

@ContactNo Varchar(30),
@EmailID varchar(80),
@Address varchar(300),

@City varchar(50),

@District varchar(50),    
@Role varchar(50),
@DateofJoin varchar(50),
@Profession varchar(50) ,
@Navigator varchar(150),
@JointSecretory varchar(150),
@Mentor varchar(150),
@Secretory varchar(150),

@Qualification varchar(50),
@Specialization varchar(150),
@HomeTown varchar(80),
@PGQualification varchar(80),
@PGSpecialization varchar(120)



                            
AS
BEGIN
	insert into MembersRegistration(MemberId,Name,Surname,Gender,ContactNo,EmailID,Address,City,District,Role,DateofJoin,Profession,Navigator,JointSecrestary,Mentor,Secretory,Qualification,Specialization,HomeTown,PGQualification,PGSpecialization) 
values 
(@MemberId,@Name,@Surname,@Gender,@ContactNo,@EmailID,@Address,@City,@District,@Role,@DateofJoin,@Profession,@Navigator,@JointSecretory,@Mentor,@Secretory,@Qualification,@Specialization,@HomeTown,@PGQualification,@PGSpecialization)       
END
--convert(varchar,@DateofJoin,101)

GO

