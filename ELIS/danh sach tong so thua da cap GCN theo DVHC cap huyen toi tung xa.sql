Use ELISTuSon
GO
BEGIN
DECLARE @TH_Table TABLE (MaDVHC int, DVHC nVarchar(200), TongSoThua int);
DECLARE @MaHuyen int = 256;
Insert into @TH_Table(MaDVHC,DVHC)
Select MaDVHC, Ten FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0

DECLARE @MaDVHC int = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0)
WHILE (@MaDVHC > 0)
BEGIN
	Update @TH_Table
	SET TongSoThua = (SELECT        Count(ThuaDat.ThuaDatSo)
						FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
						WHERE (ToBanDo.MaDVHC = @MaDVHC) AND ((GCNQSDD.SoSerial <> '') OR (GCNQSDD.SoVaoSo <> '0' AND GCNQSDD.SoVaoSo <> ' ')) 
						)
	WHERE MaDVHC = @MaDVHC
	SET @MaDVHC = (Select MIN(MaDVHC) FROM DVHC WHERE DVHC.MaTinh=27 and DVHC.MaHuyen=@MaHuyen and DVHC.MaXa!=0 and DVHC.MaDVHC > @MaDVHC)
END
Select * from @TH_Table
END;