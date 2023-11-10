SELECT			ChuSuDung.Ten1 AS Tên_chủ_sử_dụng, ToBanDo.SoTo As Tờ_bản_đồ, TObando.TyLe as Tỷ_lệ, ThuaDat.ThuaDatSo as Thửa_đất, MucDichSDD.KyHieu as MDSD, 
				GCNQSDD.DienTichRieng as Diện_tích, GCNQSDD.SoSerial As Seri, GCNQSDD.SoVaoSo as SVS                      
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE        (ToBanDo.MaDVHC = 109382) AND (ToBanDo.TyLe = 1000)
order by ToBanDo.SoTo, ThuaDat.ThuaDatSo