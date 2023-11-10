SELECT        DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DT_Thua, MucDichSDD.KyHieu as MDSD, DangKyMDSDD.DienTichRieng AS DT_MDSD, DangKyMDSDD.ThoiHan
FROM            DVHC INNER JOIN
                         ToBanDo ON DVHC.MaDVHC = ToBanDo.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
Where (DVHC.MaDVHC <> 0 and DVHC.MaHuyen = 264 and MucDichSDD.KyHieu <> 'LUC') and (DangKyMDSDD.DienTichRieng <> GCNQSDD.DienTichRieng)
Order by DVHC.MaDVHC, SoTo, ThuaDatSo