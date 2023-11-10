DECLARE @Ma int = 109364
--DECLARE @Ten nvarchar(50) = N'Thành phố Từ Sơn'
DECLARE @MaHuyenO int = 260
DECLARE @MaHuyenN int = 266

UPDATE DVHC SET MaHuyen = @MaHuyenN WHERE MaDVHC = @Ma and MaHuyen = @MaHuyenO;