BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), TongSoThua int, TongSoThua_Co_SVS_Ko_Seri int, ThuaDatCapGCN int, ThuaDatCapGCN_sau_2016 int,GCN_O_Truoc_2016 int, CoTaiSan int, 
						CoThongTinCu int, CoThongTinCu_T int, GCN_LUC int , GCN_O int, O int, LUC int, Tong_GCN_2016 int, Tong_GCN_2017 int, Tong_GCN_2018 int, Tong_GCN_2019 int, Tong_GCN_LUC_2018 int, 
						Tong_GCN_LUC_2019 int, Tong_Giao_QL int, Tong_Giao_QL_2 int,Tong_Giao_QL_3 int, Tong_Thua_HGD int, Tong_Thua_TC int, Tong_GCN_2016_nay int);
DECLARE @MaHuyen int = 264
Insert into @TH_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0

DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0)
WHILE (@MaDVHC > 0)
BEGIN
	Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC),
	TongSoThua_Co_SVS_Ko_Seri = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (GCNQSDD.SoVaoSo <> '') AND (GCNQSDD.SoVaoSo <> '0') And ((GCNQSDD.SoSerial = '') OR (GCNQSDD.SoSerial = '0')) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (((GCNQSDD.SoSerial <> '')))),
	LUC			= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) and (MucDichSDD.KyHieu = N'LUC')),
	GCN_LUC			= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and (MucDichSDD.KyHieu = N'LUC')),
	GCN_O			= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),
	O			= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT'))),

	ThuaDatCapGCN_sau_2016 = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND TRY_CAST(GCNQSDD.NamCap AS INT) >= 2016),
	GCN_O_Truoc_2016	= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) and ((MucDichSDD.KyHieu = N'ONT') or (MucDichSDD.KyHieu = N'ODT')) AND TRY_CAST(GCNQSDD.NamCap AS INT) < 2016),
	CoTaiSan			= (SELECT        COUNT(ThuaDat.ThuaDatSo)
						FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         TS_ThuaDat_TaiSan ON ThuaDat.MaThuaDat = TS_ThuaDat_TaiSan.idThuaDat
						WHERE        (ToBanDo.MaDVHC = @MaDVHC)),
	CoThongTinCu		= (SELECT        COUNT(ThuaDatCu.MaThuaDat)
						FROM            ThuaDatCu INNER JOIN
                         ThuaDat ON ThuaDatCu.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						Where (ToBanDo.SoTo <> ThuaDatCu.ToBDCu) and (Thuadat.ThuaDatSo <> ThuaDatCu.ThuaDatCu) and (Tobando.MaDVHC = @MaDVHC)),
	CoThongTinCu_T		= (SELECT        COUNT(ThuaDatCu.MaThuaDat)
						FROM            ThuaDatCu INNER JOIN
                         ThuaDat ON ThuaDatCu.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						Where (ToBanDo.SoTo <> ThuaDatCu.ToBDCu) and (Thuadat.ThuaDatSo <> ThuaDatCu.ThuaDatCu) and (Tobando.MaDVHC = @MaDVHC)),
	Tong_GCN_2016		= (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2016)),
	Tong_GCN_2017		= (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2017)),
	Tong_GCN_2018		= (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2018)),
	Tong_GCN_2019		= (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2019)),
	Tong_GCN_LUC_2018			= (SELECT        COUNT(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2018) and (MucDichSDD.KyHieu = N'LUC')),
	Tong_GCN_LUC_2019			= (SELECT        COUNT(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) = 2019) and (MucDichSDD.KyHieu = N'LUC')),
	Tong_Giao_QL		= (SELECT        COUNT(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND NOT(((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0'))) AND (MucDichSDD.KyHieu NOT IN (N'LUC',N'ONT',N'ODT',N'LUK', N'LNK'))),
	Tong_Giao_QL_2		= (SELECT        COUNT(ThuaDat.ThuaDatSo) AS Expr1
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) and ((MucDichSDD.KyHieu IN (N'DTL',N'DGT',N'MNC',N'DCS',N'BCS')))),
	Tong_Giao_QL_3		= (SELECT        Count(ThuaDat.ThuaDatSo) as Tong_Thua
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD AND DangKyMDSDD_1.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (DoiTuongSDD.KyHieu IN ('TCN','UBQ'))),
	Tong_Thua_TC		= (SELECT        Count(ThuaDat.ThuaDatSo) as Tong_Thua
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (DoiTuongSDD.KyHieu <> 'GDC')),
	Tong_Thua_HGD		= (SELECT        Count(ThuaDat.ThuaDatSo) as Tong_Thua
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyMDSDD AS DangKyMDSDD_1 ON GCNQSDD.MaGCN = DangKyMDSDD_1.MaGCN INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
						WHERE        (ToBanDo.MaDVHC = @MaDVHC) AND (DoiTuongSDD.KyHieu = 'GDC')),
    Tong_GCN_2016_nay		= (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoSerial = '0')) AND (TRY_CAST(GCNQSDD.NamCap AS INT) IN (2016,2017,2018,2019,2020,2021,2022,2023,2024)))
	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_Table
END;