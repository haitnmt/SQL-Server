SELECT        ThuaDat.MaToBanDo, ThuaDat.ThuaDatSo, ToBanDo.TyLe, ToBanDo.SoTo
FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE        (ThuaDat.MaToBanDo = 92800023)