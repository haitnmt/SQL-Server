SELECT        ThuaDatLS.MaThuaDatLS, ToBanDo.MaDVHC, ToBanDo.SoTo, ThuaDatLS.ThuaDatSo, ToBanDo.MaToBanDo
FROM            ThuaDatLS INNER JOIN
                         ToBanDo ON ThuaDatLS.MaToBanDo = ToBanDo.MaToBanDo
WHERE         (ToBanDo.MaDVHC = 109418)  AND (ToBanDo.SoTo = '1') AND (ThuaDatLS.ThuaDatSo IN ('462','461','394')) and ToBanDo.TyLe  = 1000