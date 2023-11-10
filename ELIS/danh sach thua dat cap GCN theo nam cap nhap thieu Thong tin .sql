DECLARE @TH_Table TABLE ( MaDVHC int, DVHC nVarchar(200), SoTo Nvarchar(50), ThuaDatSo Char(200), DienTich float, MDSD Nvarchar(50), SoSerial Nvarchar(50), SoVaoSo Nvarchar(50), 
						NgayVaoSo datetime, NgayKy datetime, NamCap Nvarchar(50), MaHSGoc Nvarchar(50), ChuSuDung Nvarchar(4000), MaDoiTuong int);
Insert into @TH_Table 
SELECT       DVHC.MaDVHC as MaDVHC, DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DienTich, MucDichSDD.KyHieu as MDSD, GCNQSDD.SoSerial, 
				GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NgayKy, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, ChuSuDung.Ten1, ChuSuDung.MaDoiTuong
				FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE        GCNQSDD.NamCap in (N'2015', N'2016', N'2017', N'2018',N'2019',N'2020',N'2021',N'2022') OR (len(GCNQSDD.SoSerial) > 8)
ORDER BY ToBanDo.MaDVHC, GCNQSDD.NamCap, GCNQSDD.NgayVaoSo, GCNQSDD.SoVaoSo
SELECT * FROM @TH_Table WHERE 
(NamCap IN (NULL,'')
OR MaHSGoc IN (NULL,'',N'0')
OR SoSerial IN ('',N'0',N'.',N'..',N'...',N'....',N'.....',N'......',N'.......',N'........',N'.........',N'..........',N'...........',N'...........',N'.............',N'..............',N'...............',N'................',N'.................',N'..................')
OR SoVaoSo IN('',N'0',N'.',N'..',N'...',N'....',N'.....',N'......',N'.......',N'........',N'.........',N'..........',N'...........',N'...........',N'.............',N'..............',N'...............',N'................',N'.................',N'..................')
OR NgayVaoSo IN ('1900-01-01 00:00:00.000')
OR NgayKy IN ('1900-01-01 00:00:00.000'))
--AND MDSD IN (N'LUC')
AND NamCap In(N'2015',N'2016',N'2017',N'2018',N'2019',N'2020',N'2021',N'2022')
--AND NamCap < 2018
--AND (NgayVaoSo In('1900-01-01') OR NgayKy In ('1900-01-01'))
AND LEN(SoSerial) > 0 
--AND MaDoiTuong NOT IN (16)
AND ChuSuDung NOT Like N'UBND%' AND ChuSuDung NOT LIKE N'Ủy Ban Nhân Dân%'
--AND MaDVHC = 109499
ORDER By MaDVHC,NamCap