
SELECT       DVHC.Ten as DVHC, ToBanDo.SoTo, ThuaDat.ThuaDatSo, GCNQSDD.DienTichRieng as DienTich, MucDichSDD.KyHieu as MDSD,  GCNQSDD.SoSerial, GCNQSDD.NgayKy, 
				(case GCNQSDD.CapTinhHuyen
								when 0 then N'CH'
								when 1 then  N'CT' 
								when 2 then  N'CS' 
							else ''
						end
				) as CapKyGiay, 
				GCNQSDD.SoVaoSo, GCNQSDD.NgayVaoSo, GCNQSDD.NamCap, GCNQSDD.MaHSGoc,  ChuSuDung.Ten1, ChuSuDung.MaDoiTuong
FROM            GCNQSDD INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                         ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC
WHERE        (MucDichSDD.KyHieu IN ('ONT', 'ODT', 'TMD', 'SKK')) AND ((LEFT(LTRIM(RTRIM(GCNQSDD.SoSerial)),2) NOT LIKE N'% ') 
AND ((LEFT(LTRIM(RTRIM(GCNQSDD.SoSerial)),2) NOT LIKE N'A%')) AND GCNQSDD.SoSerial <> N'') 
AND ((DangKyQSDD.MaDangKy IN (SELECT MaDangKyHT FROM CayLS)))
ORDER BY ToBanDo.MaDVHC, GCNQSDD.NgayVaoSo, GCNQSDD.NamCap, GCNQSDD.SoVaoSo
