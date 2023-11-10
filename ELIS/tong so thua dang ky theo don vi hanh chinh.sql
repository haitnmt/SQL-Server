SELECT        ChuSuDung.Ten1, ChuSuDung.NamSinh1, GCNQSDD.DienTichRieng, ThuaDat.ThuaDatSo, ToBanDo.SoTo, DVHC.Ten, DVHC.MaDVHC, MucDichSDD.KyHieu
FROM            ChuSuDung INNER JOIN
                         GCNQSDD ON ChuSuDung.MaChuSuDung = GCNQSDD.MaChuSuDung INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE        (DVHC.MaDVHC = 109383) AND (ChuSuDung.NamSinh1 > 1900) OR
                         (DVHC.MaDVHC = 109383) AND (ChuSuDung.Ten2 <> N'') OR
                         (DVHC.MaDVHC = 109383) AND (ChuSuDung.SoDinhDanh1 <> '')
ORDER BY ChuSuDung.Ten1, ChuSuDung.NamSinh1