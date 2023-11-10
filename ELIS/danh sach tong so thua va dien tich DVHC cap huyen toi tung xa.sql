BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), TongSoThua int, TongSoThua_GDC int,  DienTich_GDC float, ThuaDatCapGCN_GDC int,  DienTich_GCN_GDC float,  ThuaDat_NN_GDC int, DienTich_NN_GDC float, GCN_NN_GDC int,  DienTich_GCN_NN_GDC float, 
					ThuaDat_O_GDC int, DienTich_O_GDC float, GCN_O_GDC int,  DienTich_GCN_O_GDC float,  ThuaDat_K_GDC int, DienTich_K_GDC float, GCN_K_GDC int,  DienTich_GCN_K_GDC float, CoThongTinCu_T int, DienTich_thua_TT_Cu float, Tong_Giao_QL int);
DECLARE @MaHuyen int = 260
Insert into @TH_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0

DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0)
WHILE (@MaDVHC > 0)
BEGIN
	Update @TH_Table
	SET TongSoThua = (SELECT distinct  COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC),
	TongSoThua_GDC = (SELECT   distinct     Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)),

	DienTich_GDC = (SELECT   distinct    (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)),

	ThuaDatCapGCN_GDC = (SELECT   distinct     Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16) AND (((GCNQSDD.SoSerial <> '')))),

	DienTich_GCN_GDC = (SELECT   distinct    (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16) AND ((((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoVaoSo <> ''))))),

	ThuaDat_NN_GDC			= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  AND (MucDichSDD.KyHieu IN(N'LUC',N'LUK'))),
	DienTich_NN_GDC			= (SELECT distinct  (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  and (MucDichSDD.KyHieu IN(N'LUC',N'LUK'))),
	GCN_NN_GDC			= (SELECT   distinct     COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and (MucDichSDD.KyHieu IN(N'LUC',N'LUK',N'NTS',N'CLN'))),
	DienTich_GCN_NN_GDC			= (SELECT   distinct     (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and (MucDichSDD.KyHieu IN(N'LUC',N'LUK',N'NTS',N'CLN'))),

	GCN_O_GDC			= (SELECT   distinct     COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC)  AND (Chusudung.MaDoiTuong = 16) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and (MucDichSDD.KyHieu IN (N'ONT', N'ODT'))),

	DienTich_GCN_O_GDC			= (SELECT   distinct     (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and (MucDichSDD.KyHieu IN (N'ONT', N'ODT'))),

	ThuaDat_O_GDC			= (SELECT  distinct      COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  and (MucDichSDD.KyHieu IN (N'ONT', N'ODT'))),
	DienTich_O_GDC			= (SELECT distinct  (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16) and (MucDichSDD.KyHieu IN (N'ONT', N'ODT'))),
--<<K>>
	GCN_K_GDC			= (SELECT   distinct     COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC)  AND (Chusudung.MaDoiTuong <> 16) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0'))),

	DienTich_GCN_K_GDC			= (SELECT   distinct     (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong <> 16) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0'))),

	ThuaDat_K_GDC			= (SELECT  distinct      COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16)  and (MucDichSDD.KyHieu IN (N'TMD', N'SKK', N'SKC'))),
	DienTich_K_GDC			= (SELECT distinct  (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000 AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (Chusudung.MaDoiTuong = 16) and (MucDichSDD.KyHieu IN (N'TMD', N'SKK', N'SKC'))),
	CoThongTinCu_T		= (SELECT    distinct    COUNT(ThuaDatCu.MaThuaDat)
						FROM            ThuaDatCu INNER JOIN
                         ThuaDat ON ThuaDatCu.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
						Where (ToBanDo.SoTo <> ThuaDatCu.ToBDCu) and (Thuadat.ThuaDatSo <> ThuaDatCu.ThuaDatCu) AND (ThuaDatCu.SoGCNCu <>'') and (Tobando.MaDVHC = @MaDVHC) AND (MucDichSDD.KyHieu IN (N'ONT',N'ODT'))  and ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0'))),
	DienTich_thua_TT_Cu		= (SELECT  distinct      (SUM(GCNQSDD.DienTichRieng + GCNQSDD.DienTichChung))/10000 as DT_Thua_cu
						FROM            ThuaDatCu INNER JOIN
                         ThuaDat ON ThuaDatCu.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
						Where (ToBanDo.SoTo <> ThuaDatCu.ToBDCu) and (Thuadat.ThuaDatSo <> ThuaDatCu.ThuaDatCu) AND (ThuaDatCu.SoGCNCu <>'')  and (Tobando.MaDVHC = @MaDVHC) AND (MucDichSDD.KyHieu IN (N'ONT',N'ODT'))  and ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0'))),

	Tong_Giao_QL		= (SELECT   distinct     Count(ThuaDat.ThuaDatSo) as Tong_Thua
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((DoiTuongSDD.KyHieu IN ('TCN','UBQ'))) AND (MucDichSDD.KyHieu IN (N'DTL',N'DGT',N'MNC',N'DCS',N'BCS')))

	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_Table
END;