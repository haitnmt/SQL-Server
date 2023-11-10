
DECLARE @MaDVHC int = 109334
DECLARE @LoaiTaiLieuDoDac nvarchar(255) = N'Bản đồ địa chính'
DECLARE @NamThucHienDoDac nvarchar(50) = N'2019'
DECLARE @DonViThucHienDoDac nvarchar(255) = N'Văn phòng đăng ký đất đai tỉnh Bắc Ninh'

--SELECT * FROM ThuaDat WHERE MaToBanDo IN(Select MaToBanDo FROM ToBanDo WHERE  MaDVHC = @MaDVHC)


Update Thuadat Set 
LoaiTaiLieuDoDac = @LoaiTaiLieuDoDac,
NamThucHienDoDac = @NamThucHienDoDac,
DonViThucHienDoDac =@DonViThucHienDoDac
Where
MaToBanDo IN (Select MaToBanDo FROM ToBanDo WHERE  MaDVHC = @MaDVHC)