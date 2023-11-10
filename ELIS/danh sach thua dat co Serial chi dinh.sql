SELECT        ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, GCNQSDD.DienTichRieng, MucDichSDD.KyHieu, ChuSuDung.Ten1, 
                         ChuSuDung.GioiTinh1, ChuSuDung.NamSinh1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.DiaChi1, DVHC.Ten, ChuSuDung.SoDinhDanh1, ChuSuDung.SoDinhDanh2
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE LEN(GCNQSDD.SoSerial) > 2 AND (MucDichSDD.KyHieu NOT IN ('SKC', 'TMD', 'SKX', 'SKS', 'SKN', 'SKK', 'ONT', 'ODT', 'T','LUC','TSN', 'NTS', 'LNK', 'BHK', 'CLN', 'CHN', 'SXN', 'HNK', 'NKH', 'LUK')) AND ChuSuDung.MaDoiTuong = 16
ORDER BY KyHieu