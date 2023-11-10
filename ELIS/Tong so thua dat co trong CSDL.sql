SELECT        COUNT(ToBanDo.MaDVHC) AS tong
FROM            ThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE        (ToBanDo.MaDVHC = 109526)