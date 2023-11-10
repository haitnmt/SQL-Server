SELECT        ToBanDo.SoTo, ToBanDo.TyLe, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.MaChuSuDung
FROM            GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE GCNQSDD.MaChuSuDung NOT IN (SELECT MaChuSuDung FROM ChuSuDung) AND ToBanDo.MaDVHC =109376