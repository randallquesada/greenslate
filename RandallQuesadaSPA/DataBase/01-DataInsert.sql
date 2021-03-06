/*
This script was created by Visual Studio on 1/2/2019 at 22:59.
Run this script on ..temp (sa) to make it the same as ..RandallQuesadaSPA (sa).
This script performs its actions in the following order:
1. Disable foreign-key constraints.
2. Perform DELETE commands. 
3. Perform UPDATE commands.
4. Perform INSERT commands.
5. Re-enable foreign-key constraints.
Please back up your target database before running this script.
*/
SET NUMERIC_ROUNDABORT OFF
GO
SET XACT_ABORT, ANSI_PADDING, ANSI_WARNINGS, CONCAT_NULL_YIELDS_NULL, ARITHABORT, QUOTED_IDENTIFIER, ANSI_NULLS ON
GO
/*Pointer used for text / image updates. This might not be needed, but is declared here just in case*/
DECLARE @pv binary(16)
BEGIN TRANSACTION
ALTER TABLE [dbo].[UserProject] DROP CONSTRAINT [FK_UserProject_Project]
ALTER TABLE [dbo].[UserProject] DROP CONSTRAINT [FK_UserProject_User]
SET IDENTITY_INSERT [dbo].[User] ON
INSERT INTO [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (1, N'U1', N'LastNameU1')
INSERT INTO [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (2, N'U2', N'LastNameU2')
INSERT INTO [dbo].[User] ([Id], [FirstName], [LastName]) VALUES (3, N'U3', N'LastNameU3')
SET IDENTITY_INSERT [dbo].[User] OFF
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (1, 1, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (1, 2, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (1, 3, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (1, 4, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (1, 5, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (2, 1, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (2, 2, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (2, 3, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (2, 4, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (2, 5, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (3, 1, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (3, 2, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (3, 3, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (3, 4, 1)
INSERT INTO [dbo].[UserProject] ([UserId], [ProjectId], [IsActive]) VALUES (3, 5, 1)
SET IDENTITY_INSERT [dbo].[Project] ON
INSERT INTO [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (1, '20190201 20:24:06.913', '20190215 20:24:06.913', 1)
INSERT INTO [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (2, '20190301 20:24:06.913', '20190315 20:24:06.913', 2)
INSERT INTO [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (3, '20190401 20:24:06.913', '20190415 20:24:06.913', 3)
INSERT INTO [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (4, '20190501 20:24:06.913', '20190515 20:24:06.913', 4)
INSERT INTO [dbo].[Project] ([Id], [StartDate], [EndDate], [Credits]) VALUES (5, '20190601 20:24:06.913', '20190615 20:24:06.913', 4)
SET IDENTITY_INSERT [dbo].[Project] OFF
ALTER TABLE [dbo].[UserProject]
    ADD CONSTRAINT [FK_UserProject_Project] FOREIGN KEY ([ProjectId]) REFERENCES [dbo].[Project] ([Id])
ALTER TABLE [dbo].[UserProject]
    ADD CONSTRAINT [FK_UserProject_User] FOREIGN KEY ([UserId]) REFERENCES [dbo].[User] ([Id])
COMMIT TRANSACTION
