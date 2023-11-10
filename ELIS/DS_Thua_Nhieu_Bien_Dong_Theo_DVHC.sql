SELECT        ToBanDo.SoTo, ThuaDat.ThuaDatSo, ToBanDo.MaDVHC
FROM            ThuaDat INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         CayLS ON DangKyQSDD.MaDangKy = CayLS.MaDangKyHT
WHERE        (ToBanDo.MaDVHC = 109181) AND CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS where CayLS.MaDangKyLS in 
(Select CayLS.MaDangKyHT From CayLS where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS 
where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS
where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS
where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS
where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS
where CayLS.MaDangKyLS in (Select CayLS.MaDangKyHT From CayLS))))))))
order by Soto, ThuaDatSo