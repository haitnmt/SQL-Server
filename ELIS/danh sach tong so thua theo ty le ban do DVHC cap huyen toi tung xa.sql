BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), TongSoThua int, TTyLe500 int, DT500 float, TTyLe1000 int, DT1000 float, TTyLe2000 int,DT2000 float);
DECLARE @MaHuyen int = 256
Insert into @TH_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0

DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0)
WHILE (@MaDVHC > 0)
BEGIN
	Update @TH_Table
	SET TongSoThua = (SELECT distinct  COUNT(ThuaDat.MaThuaDat)
										FROM ThuaDat INNER JOIN ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo  
										WHERE ToBanDo.MaDVHC = @MaDVHC),
	
	TTyLe500		= (SELECT   distinct     Count(ThuaDat.MaThuaDat) as Tong
						FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo
						WHERE        (ToBanDo.TyLe = 500) AND (ToBanDo.MaDVHC = @MaDVHC)),
	DT500 = (SELECT   distinct    (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (ToBanDo.TyLe = 500)),
	TTyLe1000		= (SELECT   distinct     Count(ThuaDat.MaThuaDat) as Tong
						FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo
						WHERE        (ToBanDo.TyLe = 1000) AND (ToBanDo.MaDVHC = @MaDVHC)),
	DT1000 = (SELECT   distinct    (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (ToBanDo.TyLe = 1000)),
	TTyLe2000	= (SELECT   distinct     Count(ThuaDat.MaThuaDat) as Tong
						FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo
						WHERE        (ToBanDo.TyLe = 2000) AND (ToBanDo.MaDVHC = @MaDVHC)),
	DT2000 = (SELECT   distinct    (SUM(DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))/10000
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND (ToBanDo.TyLe = 2000))

	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_Table
END;