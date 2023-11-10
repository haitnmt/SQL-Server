IF (NOT EXISTS (SELECT * 
                 FROM INFORMATION_SCHEMA.TABLES 
                 WHERE TABLE_SCHEMA = 'dbo' 
                 AND  TABLE_NAME = 'NoiGiaiQuyet'))
BEGIN
CREATE TABLE [dbo].[NoiGiaiQuyet](
	[Ma] [nvarchar](50) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Ten] [nvarchar](150) COLLATE SQL_Latin1_General_CP1_CI_AS NULL,
	[Status] [int] NULL
) ON [PRIMARY]
END
Go
declare @soRow int
select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'NO'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('NO',N'Chọn nơi giải quyết',1)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Chọn nơi giải quyết',[Status] = 1 WHERE [Ma] = 'NO'
END
select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'XA'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('XA',N'Uỷ ban nhân dân cấp xã',2)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Uỷ ban nhân dân cấp xã',[Status] = 2 WHERE [Ma] = 'XA'
END
select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'UB'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('UB',N'UB Nhân dân cấp huyện,TP',3)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'UB Nhân dân cấp huyện,TP',[Status] = 3 WHERE [Ma] = 'UB'
END

select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'VP'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VP',N'Chi nhánh Văn phòng đăng ký đất đai',4)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Chi nhánh Văn phòng đăng ký đất đai',[Status] = 4 WHERE [Ma] = 'VP'
END

select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'VPCC'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VPCC',N'Văn phòng công chứng',0)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Văn phòng công chứng',[Status] = 0 WHERE [Ma] = 'VPCC'
END

select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'VS'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VS',N'Văn phòng đăng ký đất đai',5)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Văn phòng đăng ký đất đai',[Status] = 5 WHERE [Ma] = 'VS'
END

select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'CS'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('CS',N'Sở Tài Nguyên và Môi trường',6)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Sở Tài Nguyên và Môi trường',[Status] = 6 WHERE [Ma] = 'CS'
END

select @soRow= count(*) from NoiGiaiQuyet where [Ma] = 'TI'
--Thêm dữ liệu cho bảng Nơi giải quyết
IF (@soRow=0)
BEGIN
   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('TI',N'Ủy ban nhân dân cấp tỉnh',7)
END
ELSE
BEGIN
	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Ủy ban nhân dân cấp tỉnh',[Status] = 7 WHERE [Ma] = 'TI'
END
--BEGIN
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('NO',N'Chọn nơi giải quyết',1)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('XA',N'Uỷ ban nhân dân cấp xã',2)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('UB',N'UB Nhân dân cấp huyện,TP',3)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VP',N'Chi nhánh Văn phòng đăng ký đất đai',4)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VPCC',N'Văn phòng công chứng',0)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('VS',N'Văn phòng đăng ký đất đai',5)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('CS',N'Sở Tài Nguyên và Môi trường',6)
--   INSERT [dbo].[NoiGiaiQuyet] ([Ma], [Ten],[Status]) VALUES ('TI',N'Ủy ban nhân dân cấp tỉnh',7)
--END
--ELSE
--BEGIN
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Chọn nơi giải quyết',[Status] = 1 WHERE [Ma] = 'NO'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Uỷ ban nhân dân cấp xã',[Status] = 2 WHERE [Ma] = 'XA'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'UB Nhân dân cấp huyện,TP',[Status] = 3 WHERE [Ma] = 'UB'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Chi nhánh Văn phòng đăng ký đất đai',[Status] = 4 WHERE [Ma] = 'VP'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Văn phòng công chứng',[Status] = 0 WHERE [Ma] = 'VPCC'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Văn phòng đăng ký đất đai',[Status] = 5 WHERE [Ma] = 'VS'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Sở Tài Nguyên và Môi trường',[Status] = 6 WHERE [Ma] = 'CS'
--	UPDATE [dbo].[NoiGiaiQuyet] SET [Ten] = N'Ủy ban nhân dân cấp tỉnh',[Status] = 7 WHERE [Ma] = 'TI'
--END
GO