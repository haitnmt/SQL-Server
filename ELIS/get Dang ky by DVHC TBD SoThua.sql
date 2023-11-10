SELECT        DangKyQSDD.MaDangKy, ThuaDat.ThuaDatSo, ToBanDo.SoTo, ToBanDo.MaDVHC
FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat
WHERE        (ThuaDat.ThuaDatSo = '78' or ThuaDat.ThuaDatSo = '79') AND (ToBanDo.SoTo = '70') AND (ToBanDo.MaDVHC = 109394)