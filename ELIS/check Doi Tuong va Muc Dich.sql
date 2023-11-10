SELECT        ThuaDat.ThuaDatSo, ToBanDo.SoTo, ToBanDo.TyLe, MucDichSDD.KyHieu, ChuSuDung.MaDoiTuong
FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung INNER JOIN
                         GCNQSDD ON ChuSuDung.MaChuSuDung = GCNQSDD.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy
WHERE ChuSuDung.MaDoiTuong = 4 and MucDichSDD.KyHieu = 'ONT' and ToBanDo.MaDVHC = 109376