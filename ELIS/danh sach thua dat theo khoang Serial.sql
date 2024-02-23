SELECT       DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DienTich, MucDichSDD.KyHieu as MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NgayKy, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, ChuSuDung.Ten1, ChuSuDung.MaDoiTuong
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE        (GCNQSDD.SoSerial LIKE N'DN 073%') OR (GCNQSDD.SoSerial LIKE N'DN 074000')
ORDER BY GCNQSDD.SoSerial
