SELECT       DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DienTich, MucDichSDD.KyHieu as MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NgayKy, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, ChuSuDung.Ten1, ChuSuDung.MaDoiTuong
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE        (MucDichSDD.KyHieu IN ('ONT', 'ODT', 'TMD', 'SKK')) AND ((LEFT(LTRIM(RTRIM(GCNQSDD.SoSerial)),2) LIKE N'% ') OR ((LEFT(LTRIM(RTRIM(GCNQSDD.SoSerial)),2) LIKE N'A%'))) 
ORDER BY ToBanDo.MaDVHC, GCNQSDD.NgayVaoSo, GCNQSDD.NamCap, GCNQSDD.SoVaoSo
