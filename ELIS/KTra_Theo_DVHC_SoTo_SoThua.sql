SELECT        DVHC.Ten, ToBanDo.SoTo, ThuaDat.ThuaDatSo, DangKyQSDD.SoThuaPhu, DangKyMDSDD.DienTichRieng, MucDichSDD.KyHieu, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, ChuSuDung.Ten1, ToBanDo.MaDVHC, DangKyQSDD.MaDangKy
FROM            DangKyQSDD INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE         (SoTo IN (N'44')) AND (ThuaDat.ThuaDatSo IN (N'10')) AND (ToBanDo.MaDVHC IN (N'109265'))