SELECT        ThuaDat.MaThuaDat, ThuaDat.ThuaDatSo, ToBanDo.SoTo, ToBanDo.MaDVHC
FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE        (ThuaDat.ThuaDatSo in ('192')) AND (ToBanDo.SoTo = '8') AND (ToBanDo.TyLe = 1000) AND (ToBanDo.MaDVHC = 109442)