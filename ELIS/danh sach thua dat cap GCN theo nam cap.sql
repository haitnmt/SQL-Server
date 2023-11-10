SELECT       DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DienTich, MucDichSDD.KyHieu as MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NgayKy, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, ChuSuDung.Ten1
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE        GCNQSDD.NamCap in (N'2016', N'2017', N'2018',N'2019',N'2020',N'2021',N'2022')
ORDER BY ToBanDo.MaDVHC, GCNQSDD.NamCap, GCNQSDD.NgayVaoSo, GCNQSDD.SoVaoSo
