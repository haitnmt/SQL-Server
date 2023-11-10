BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), TongSoThua int, ThuaDatCapGCN int, ThuaDatCapGCN_DenNgay int)

use elisbacninh
DECLARE @MaHuyen_BN int = 256
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_BN and DVHC.MaXa!=0
DECLARE @MaDVHC_BN int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_BN and DVHC.MaXa!=0)

WHILE (@MaDVHC_BN > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_BN),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_BN) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_BN) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_BN
	SET @MaDVHC_BN = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_BN and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_BN)
END



use elistuson
DECLARE @MaHuyen_TS int = 261
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TS and DVHC.MaXa!=0
DECLARE @MaDVHC_TS int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TS and DVHC.MaXa!=0)

WHILE (@MaDVHC_TS > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_TS),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TS) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TS) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_TS
	SET @MaDVHC_TS = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TS and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_TS)
END



use elisgiabinh
DECLARE @MaHuyen_GB int = 263
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_GB and DVHC.MaXa!=0
DECLARE @MaDVHC_GB int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_GB and DVHC.MaXa!=0)

WHILE (@MaDVHC_GB > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_GB),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_GB) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_GB) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_GB
	SET @MaDVHC_GB = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_GB and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_GB)
END



use elisluongtai
DECLARE @MaHuyen_LT int = 264
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_LT and DVHC.MaXa!=0
DECLARE @MaDVHC_LT int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_LT and DVHC.MaXa!=0)

WHILE (@MaDVHC_LT > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_LT),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_LT) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_LT) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_LT
	SET @MaDVHC_LT = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_LT and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_LT)
END




use elisthuanthanh
DECLARE @MaHuyen_TT int = 262
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TT and DVHC.MaXa!=0
DECLARE @MaDVHC_TT int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TT and DVHC.MaXa!=0)

WHILE (@MaDVHC_TT > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_TT),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TT) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TT) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_TT
	SET @MaDVHC_TT = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TT and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_TT)
END





use elisquevo
DECLARE @MaHuyen_QV int = 259
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_QV and DVHC.MaXa!=0
DECLARE @MaDVHC_QV int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_QV and DVHC.MaXa!=0)

WHILE (@MaDVHC_QV > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_QV),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_QV) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_QV) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_QV
	SET @MaDVHC_QV = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_QV and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_QV)
END




use elisyenphong
DECLARE @MaHuyen_YP int = 258
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_YP and DVHC.MaXa!=0
DECLARE @MaDVHC_YP int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_YP and DVHC.MaXa!=0)

WHILE (@MaDVHC_YP > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_YP),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_YP) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_YP) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_YP
	SET @MaDVHC_YP = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_YP and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_YP)
END




use elistienduda
DECLARE @MaHuyen_TD_da int = 260
Insert into @TH_Table(MaDVHC,DVHC)
        Select 10*MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD_da and DVHC.MaXa!=0
DECLARE @MaDVHC_TD_da int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD_da and DVHC.MaXa!=0)

WHILE (@MaDVHC_TD_da > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_TD_da),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TD_da) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TD_da) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = 10*@MaDVHC_TD_da
	SET @MaDVHC_TD_da = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD_da and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_TD_da)
END


use elistiendu
DECLARE @MaHuyen_TD int = 260
Insert into @TH_Table(MaDVHC,DVHC)
        Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD and DVHC.MaXa!=0
DECLARE @MaDVHC_TD int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD and DVHC.MaXa!=0)

WHILE (@MaDVHC_TD > 0)
BEGIN
Update @TH_Table
	SET TongSoThua = (SELECT COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC_TD),
	ThuaDatCapGCN = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TD) AND (GCNQSDD.SoSerial <> '')),
	ThuaDatCapGCN_DenNgay = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC_TD) AND (GCNQSDD.SoSerial <> '') AND GCNQSDD.NgayKy <'01/01/2023')
    WHERE MaDVHC = @MaDVHC_TD
	SET @MaDVHC_TD = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen_TD and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC_TD)
END


Select * from @TH_Table
END;
