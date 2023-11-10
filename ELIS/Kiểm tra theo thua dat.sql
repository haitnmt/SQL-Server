SELECT        ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2, ChuSuDung.DiaChi1, DVHC.Ten, ToBanDo.SoTo, ThuaDat.ThuaDatSo, 
                         GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.NamCap
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung
WHERE			(ChuSuDung.SoDinhDanh1 = '125559694') OR
				(ChuSuDung.SoDinhDanh2 = '125559694') OR

				(ChuSuDung.SoDinhDanh1 = '038092000960') OR
				(ChuSuDung.SoDinhDanh2 = '038092000960') OR

				(ChuSuDung.SoDinhDanh1 = '122090782') OR
				(ChuSuDung.SoDinhDanh2 = '122090782') OR

				(ChuSuDung.SoDinhDanh2 = '168324832') OR
				(ChuSuDung.SoDinhDanh2 = '168324832') OR

				(ChuSuDung.SoDinhDanh2 = '001092016228') OR
				(ChuSuDung.SoDinhDanh2 = '001092016228') OR
				
				(ChuSuDung.SoDinhDanh2 = '112342619') OR
				(ChuSuDung.SoDinhDanh2 = '112342619') OR
				
				(ChuSuDung.SoDinhDanh2 = '017045915') OR
				(ChuSuDung.SoDinhDanh2 = '017045915') OR
				
				(ChuSuDung.SoDinhDanh2 = '091760250') OR
				(ChuSuDung.SoDinhDanh2 = '091760250') OR

				(ChuSuDung.SoDinhDanh2 = '026092002285') OR
				(ChuSuDung.SoDinhDanh2 = '026092002285') OR
				
				(ChuSuDung.Ten1 = '@@') OR
				(ChuSuDung.Ten2 = '@@') 