BEGIN
DECLARE @TH_CapGCN_Table TABLE (MaDVHC int, DVHC nVarchar(200), TBD_500 int, TBD_1000  int, TongSoThua int, GCN_O int, DT_GCN_0 int, GCN_LUC int, DT_GCN_LUC int,GCN_TIN_TON int, DT_GCN_TIN_TON int, GCN_KHAC int, DT_GCN_KHAC int,
						Chua_GCN_O int, DT_Chua_GCN_O int, Chua_GCN_LUC int, DT_Chua_GCN_LUC int, Chua_GCN_KHAC int, DT_Chua_GCN_KHAC int);
DECLARE @MaHuyen int = 261
Insert into @TH_CapGCN_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0

DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0)
WHILE (@MaDVHC > 0)
BEGIN
	Update @TH_CapGCN_Table
	SET TBD_500 =			(SELECT Count(MaToBanDo) FROM ToBanDo WHERE (TyLe = 500) AND (MaDVHC = @MaDVHC)),
		TBD_1000 =			(SELECT Count(MaToBanDo) FROM ToBanDo WHERE (TyLe = 1000) AND (MaDVHC = @MaDVHC)),
		TongSoThua =		(SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC),
		GCN_O				= (SELECT        COUNT(ThuaDat.ThuaDatSo)
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),
		DT_GCN_0			= (SELECT        (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),
		GCN_LUC				= (SELECT        COUNT(ThuaDat.ThuaDatSo)
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and (MucDichSDD.KyHieu = N'LUC')),
		DT_GCN_LUC			= (SELECT        (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and (MucDichSDD.KyHieu = N'LUC')),
		GCN_TIN_TON				= (SELECT        COUNT(ThuaDat.ThuaDatSo)
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and ((MucDichSDD.KyHieu = N'TIN') or (MucDichSDD.KyHieu = N'TON'))),
		DT_GCN_TIN_TON			= (SELECT        (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and ((MucDichSDD.KyHieu = N'TIN') or (MucDichSDD.KyHieu = N'TON'))),
		GCN_KHAC				= (SELECT        COUNT(ThuaDat.ThuaDatSo)
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and (MucDichSDD.KyHieu NOT IN (N'TIN', N'TON', N'LUC', N'ONT', N'ODT'))),
		DT_GCN_KHAC		= (SELECT        (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) > 0) and (MucDichSDD.KyHieu NOT IN (N'TIN', N'TON', N'LUC', N'ONT', N'ODT'))),
		DT_Chua_GCN_O				= (SELECT        COUNT(ThuaDat.ThuaDatSo)
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) < 1) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),
		Chua_GCN_O			= (SELECT        (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
										FROM            GCNQSDD INNER JOIN
										 DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
										 DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
										 ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
										 ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
										 DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
										 MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
										WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Len(GCNQSDD.SoSerial) < 1) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT')))
	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_CapGCN_Table
END;