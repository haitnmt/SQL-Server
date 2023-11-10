SELECT        ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, DangKyMDSDD.DienTichRieng, DangKyMDSDD.DienTichChung
FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN
WHERE ToBanDo.MaDVHC=109376 AND ((GCNQSDD.DienTichRieng + GCNQSDD.DienTichChung) != (DangKyMDSDD.DienTichRieng + DangKyMDSDD.DienTichChung))
ORDER BY SoTo, ThuaDatSo