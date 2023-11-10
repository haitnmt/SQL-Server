SELECT        ChuSuDung.Hogiadinh, ChuSuDung.Ten1, ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.SoDinhDanh2, ToBanDo.SoTo, ToBanDo.TyLe, ThuaDat.ThuaDatSo, ThuaDat.DiaChi, MucDichSDD.KyHieu AS MDSD, 
                         DangKyMDSDD.DienTichRieng AS DT_MDSD, DangKyMDSDD.DienTichChung AS DTC_MDSD, GCNQSDD.SoVaoSo, GCNQSDD.SoSerial, GCNQSDD.MaHSGoc, GCNQSDD.GhiChuTrang1, GCNQSDD.GhiChuTrang2
FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
WHERE        (ToBanDo.MaDVHC = 109460) AND (ToBanDo.SoTo IN (6, 10, 19, 20, 36, 37, 38, 39, 40, 42, 43))
ORDER BY ToBanDo.SoTo, ToBanDo.TyLe, ThuaDat.ThuaDatSo