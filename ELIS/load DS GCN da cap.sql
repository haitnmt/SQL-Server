SELECT        ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, DotCapGCN.SoQD, GCNQSDD.DienTichRieng, MucDichSDD.KyHieu, ChuSuDung.Ten1, ChuSuDung.GioiTinh1, 
                         ChuSuDung.NamSinh1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.DiaChi1
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DotCapGCN ON GCNQSDD.MaDotCap = DotCapGCN.MaDotCap
WHERE        (ToBanDo.MaDVHC = 109505) AND (MucDichSDD.KyHieu <> 'LUC') AND (GCNQSDD.SoVaoSo <> '' 
				OR GCNQSDD.SoSerial <> '' OR GCNQSDD.NgayVaoSo > '01/01/1900' OR DotCapGCN.SoQD <> '')