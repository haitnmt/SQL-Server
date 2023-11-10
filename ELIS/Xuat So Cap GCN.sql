SELECT        GCNQSDD.SoVaoSo, ChuSuDung.Ten1, ChuSuDung.GioiTinh1, ChuSuDung.GioiTinh2, ChuSuDung.Hogiadinh, ChuSuDung.DiaChi1, ChuSuDung.Ten2, GCNQSDD.SoSerial, GCNQSDD.NgayKy, ToBanDo.SoTo, ToBanDo.TyLe, 
                         ThuaDat.ThuaDatSo, Chusudung.DiaChi2
FROM            GCNQSDD INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE       (ToBanDo.MaDVHC = 109319) AND (GCNQSDD.NgayKy BETWEEN '2020-12-25' AND '2020-12-31') AND (GCNQSDD.SoVaoSo >= 1275) AND (GCNQSDD.SoVaoSo <= 3974)
ORDER BY GCNQSDD.SoVaoSo