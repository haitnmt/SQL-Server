SELECT        ChuSuDung.MaDoiTuong, ChuSuDung.Hogiadinh, ChuSuDung.Ten1, ChuSuDung.GioiTinh1, ChuSuDung.Ten2, ChuSuDung.GioiTinh2, MucDichSDD.KyHieu, GCNQSDD.SoSerial
FROM            GCNQSDD INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE        (MucDichSDD.KyHieu = N'ONT' OR MucDichSDD.KyHieu = N'ODT') 
                         AND (ChuSuDung.MaDoiTuong = 16) AND (ChuSuDung.Hogiadinh = 1) AND (LEN(GCNQSDD.SoSerial) > 2) 
						 AND (LEN(ChuSuDung.Ten1) > 0) AND (ChuSuDung.GioiTinh1 = 0) AND (LEN(ChuSuDung.Ten2) > 0)
						 AND (ToBanDo.MaDVHC = 109181)