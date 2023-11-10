-----Hàm tổng hợp Số Giấy chứng nhận chỉ có tên vợ hoặc chồng----------- 
--CREATE --- ALTER 
ALTER FUNCTION dbo.TongHop_GCN_Ten1Nguoi(@HoGiaDinh INT, @GioiTinh INT, @DVHC INT)
RETURNS  INT
AS
BEGIN
	DECLARE @returnvalue INT;
	If (@DVHC > 100000)
	BEGIN
		SELECT @returnvalue = COUNT(GCNQSDD.SoSerial)
		FROM            GCNQSDD INNER JOIN
							 ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
							 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
							 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
							 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
							 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
							 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
		WHERE		(MucDichSDD.KyHieu NOT IN ('SKC', 'TMD', 'SKX', 'SKS', 'SKN', 'SKK', 'ONT', 'ODT', 'T','LUC','TSN', 'NTS', 'LNK', 'BHK', 'CLN', 'CHN', 'SXN', 'HNK', 'NKH', 'LUK'))
					AND (ChuSuDung.MaDoiTuong = 16) AND (LEN(GCNQSDD.SoSerial) > 2) 
					AND (ChuSuDung.Hogiadinh = @HoGiaDinh) AND (LEN(ChuSuDung.Ten1) > 1) AND (ChuSuDung.GioiTinh1 = @GioiTinh) AND (LEN(ChuSuDung.Ten2) = 0)
					AND (ToBanDo.MaDVHC = @DVHC)
	END ELSE
	BEGIN
		SELECT @returnvalue = COUNT(GCNQSDD.SoSerial)
		FROM            GCNQSDD INNER JOIN
								ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
								DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
								MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
								DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
								ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
								ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
		WHERE       (MucDichSDD.KyHieu NOT IN ('SKC', 'TMD', 'SKX', 'SKS', 'SKN', 'SKK', 'ONT', 'ODT', 'T','LUC','TSN', 'NTS', 'LNK', 'BHK', 'CLN', 'CHN', 'SXN', 'HNK', 'NKH', 'LUK'))
					AND (ChuSuDung.MaDoiTuong = 16) AND (LEN(GCNQSDD.SoSerial) > 2) 
					AND (ChuSuDung.Hogiadinh = @HoGiaDinh) AND (LEN(ChuSuDung.Ten1) > 1) AND (ChuSuDung.GioiTinh1 = @GioiTinh) AND (LEN(ChuSuDung.Ten2) = 0)
	END
    RETURN @returnvalue;
END
GO
-----------------------
---Hàm tổng hợp số Giấy chúng nhận mạng tên cả 2 vợ trồng----
ALTER FUNCTION dbo.TongHop_GCN_Ten2Nguoi(@HoGiaDinh INT, @DVHC INT)
RETURNS  INT
AS
BEGIN
	DECLARE @returnvalue INT;
	If (@DVHC > 100000)
	BEGIN
		SELECT @returnvalue = COUNT(GCNQSDD.SoSerial)
		FROM            GCNQSDD INNER JOIN
							 ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
							 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
							 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
							 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
							 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
							 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
		WHERE       (MucDichSDD.KyHieu NOT IN ('SKC', 'TMD', 'SKX', 'SKS', 'SKN', 'SKK', 'ONT', 'ODT', 'T','LUC','TSN', 'NTS', 'LNK', 'BHK', 'CLN', 'CHN', 'SXN', 'HNK', 'NKH', 'LUK'))
					AND (ChuSuDung.MaDoiTuong = 16)  AND (LEN(GCNQSDD.SoSerial) > 2)  
					AND (ChuSuDung.Hogiadinh = @HoGiaDinh) AND (LEN(ChuSuDung.Ten1) > 0) AND (LEN(ChuSuDung.Ten2) > 0)
					AND (ToBanDo.MaDVHC = @DVHC)
	END
	ELSE BEGIN
		SELECT @returnvalue = COUNT(GCNQSDD.SoSerial)
		FROM            GCNQSDD INNER JOIN
								ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
								DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
								MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
								DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
								ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
								ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
		WHERE       (MucDichSDD.KyHieu NOT IN ('SKC', 'TMD', 'SKX', 'SKS', 'SKN', 'SKK', 'ONT', 'ODT', 'T','LUC','TSN', 'NTS', 'LNK', 'BHK', 'CLN', 'CHN', 'SXN', 'HNK', 'NKH', 'LUK'))
					AND (ChuSuDung.MaDoiTuong = 16)  AND (LEN(GCNQSDD.SoSerial) > 2)  
					AND (ChuSuDung.Hogiadinh = @HoGiaDinh) AND (LEN(ChuSuDung.Ten1) > 0) AND (LEN(ChuSuDung.Ten2) > 0)
	END
    RETURN @returnvalue;
END
GO
----------------------------

BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), Tong_HGD int, HGD_VC int, HGD_C int, HGD_V int, Tong_TSC int, TSC_VC int, TSC_C int, TSC_V int);
----Nhập Đơn vị hành chính ----
DECLARE @MaHuyen int = 263
------------------------------
Insert into @TH_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen
DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen)
WHILE (@MaDVHC > 0)
BEGIN
	DECLARE @HGD_VC INT = dbo.TongHop_GCN_Ten2Nguoi(1,@MaDVHC)
	DECLARE @HGD_C INT = dbo.TongHop_GCN_Ten1Nguoi(1,1,@MaDVHC)
	DECLARE @HGD_V INT = dbo.TongHop_GCN_Ten1Nguoi(1,0,@MaDVHC)
	DECLARE @Tong_HGD  INT = @HGD_VC + @HGD_C + @HGD_V
	DECLARE @TSC_VC INT = dbo.TongHop_GCN_Ten2Nguoi(0,@MaDVHC)
	DECLARE @TSC_C INT= dbo.TongHop_GCN_Ten1Nguoi(0,1,@MaDVHC)
	DECLARE @TSC_V INT= dbo.TongHop_GCN_Ten1Nguoi(0,0,@MaDVHC)
	DECLARE @Tong_TSC INT = @TSC_VC + @TSC_C + @TSC_V
	Update @TH_Table
	SET HGD_VC = @HGD_VC,
	HGD_C = @HGD_C,
	HGD_V = @HGD_V,
	Tong_HGD = @Tong_HGD,
	TSC_VC = @TSC_VC,
	TSC_C = @TSC_C,
	TSC_V = @TSC_V,
	Tong_TSC = @Tong_TSC
	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_Table
END;