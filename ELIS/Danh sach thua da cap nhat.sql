SELECT        ToBanDo.SoTo, ToBanDo.TyLe,  ThuaDat.ThuaDatSo, ChuSuDung.Ten1, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, MucDichSDD.KyHieu, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo
FROM            ChuSuDung INNER JOIN
                         GCNQSDD ON ChuSuDung.MaChuSuDung = GCNQSDD.MaChuSuDung INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
WHERE       (GCNQSDD.SoVaoSo <> '') and (GCNQSDD.SoVaoSo != '0') AND  (ToBanDo.MaDVHC = 109490) AND (KyHieu != 'LUC')
						 order by SoTo, ThuaDatSo