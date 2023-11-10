SELECT        ToBanDo.MaDVHC, ToBanDo.SoTo, ToBanDo.TyLe, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, DangKyMDSDD.DienTichRieng AS DT_MDSD, DangKyMDSDD.DienTichChung AS DTC_MDSD, DangKyMDSDD.ThoiHan, 
                         DoiTuongSDD.KyHieu, ChuSuDung.Hogiadinh, ChuSuDung.Ten1, ChuSuDung.GioiTinh1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.NgayCap1, ChuSuDung.NoiCap1, ChuSuDung.SoHoKhau, 
                         ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2, ChuSuDung.NgayCap2, ChuSuDung.NoiCap2, ChuSuDung.DiaChi2, GCNQSDD.SoVaoSo, GCNQSDD.SoSerial, GCNQSDD.NgayVaoSo, 
                         GCNQSDD.NguoiKy, GCNQSDD.CapTinhHuyen, GCNQSDD.NamCap, GCNQSDD.MaHSGoc, GCNQSDD.MaVach, GCNQSDD.GhiChuTrang1, GCNQSDD.GhiChuTrang2
FROM            ToBanDo INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         DangKyQSDD ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         GCNQSDD ON DangKyQSDD.MaDangKy = GCNQSDD.MaDangKy INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DoiTuongSDD ON ChuSuDung.MaDoiTuong = DoiTuongSDD.MaDoiTuongSDD
WHERE        (ToBanDo.MaDVHC = 109487) AND (GCNQSDD.NamCap < 2016) AND (MucDichSDD.KyHieu = N'ONT')