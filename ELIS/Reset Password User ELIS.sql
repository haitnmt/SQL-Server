DECLARE @TDN nvarchar(15) = N'dodac'
DECLARE @MK nvarchar(30) = N'UHnN/uBU9FXaubAOVmUTmA=='
DECLARE @KTK BIT = 0
DECLARE @MKC nvarchar(30) = N''
DECLARE @TH_ResetPassTbl TABLE (TenCSDL nVarchar(200), TenDangNhap nVarchar(200), MatKhauCu nVarchar(200), MatKhauMoi nVarchar(200))

use elisbacninh
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisbacninh', @TDN, @MKC, @MK);

use elisgiabinh
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisgiabinh', @TDN, @MKC, @MK);

use elisluongtai
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisluongtai', @TDN, @MKC, @MK);

use elisquevo
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisquevo', @TDN, @MKC, @MK);

use elisthuanthanh
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisthuanthanh', @TDN, @MKC, @MK);

use elistiendu
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elistiendu', @TDN, @MKC, @MK);

use elistienduda
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elistienduda', @TDN, @MKC, @MK);

use elistuson
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elistuson', @TDN, @MKC, @MK);

use elisyenphong
SET @MKC = (SELECT [MatKhau] FROM [NguoiDung] WHERE [TenDangNhap] = @TDN)
UPDATE [NguoiDung] SET [MatKhau] = @MK, [KhoaTaiKhoan] = @KTK WHERE [TenDangNhap] = @TDN
Insert into @TH_ResetPassTbl(TenCSDL,TenDangNhap,MatKhauCu,MatKhauMoi) 
VALUES (N'elisyenphong', @TDN, @MKC, @MK);

SELECT * FROM @TH_ResetPassTbl