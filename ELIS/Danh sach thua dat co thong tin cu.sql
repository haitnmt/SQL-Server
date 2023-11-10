SELECT        ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu, 
                         DangKyMDSDD.DienTichRieng, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, ThuaDatCu.ToBDCu, ThuaDatCu.ThuaDatCu, ThuaDatCu.DTCu, ThuaDatCu.SoGCNCu, ThuaDatCu.NgayCapCu, ThuaDatCu.LoaiDatCu, 
                         ThuaDatCu.THSDCu, ToBanDo.MaDVHC
FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         ThuaDatCu ON ThuaDat.MaThuaDat = ThuaDatCu.MaThuaDat INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE        ((ToBanDo.SoTo <> ThuaDatCu.ToBDCu) and (Thuadat.ThuaDatSo <> ThuaDatCu.ThuaDatCu) and (ToBanDo.MaDVHC = 109343))