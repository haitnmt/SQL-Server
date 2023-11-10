DECLARE @DKTimKiem_SDD_tbl table (SDD nvarchar(50))
--Danh sách CMND hoặc CCCD--
Insert into  @DKTimKiem_SDD_tbl (SDD) VALUES
('027087001603'),
('024186019792'),




(N'11111')
---Bắt đầu tìm---
DECLARE @DKTimKiem_Ten_tbl table (Ten nvarchar(200))
--Insert into  @DKTimKiem_Ten_tbl (Ten) VALUES (N'Nguyễn Xuân Ngọc'),(N'Nguyễn Thị Oanh')

DECLARE @KQTimKiem_tbl table (DVHC_CX nvarchar(50), ToBanDo nvarchar(50), ThuaDat char(250), MDSD nvarchar (50), 
                                Serial nvarchar(50), NgayKy_GCN nvarchar(50), SoVaoSo nvarchar(50), DienTichRieng float, DienTichChung float, NamCap varchar(5),
								Ten_ChuSuDung nvarchar(200), NamSinh int, SoDinhDanh nvarchar(50), DiaChi nvarchar(500),Ten_VoChong nvarchar(200), NamSinh_VC int, SoDinhDanh_VC nvarchar(50))

use elisbacninh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
                GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, 
                ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elistuson
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
				--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, 
                ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elisgiabinh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
						--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, 
                ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elisluongtai
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
			--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, 
                ChuSuDung.Ten1, ChuSuDung.NamSinh1, ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elisquevo
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
				--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
                         ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elisthuanthanh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
				--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
                         ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))


use elistiendu
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
			--NguonGocSDD.KyHieu AS NGSD, 
			GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
                         ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))
				
use elistienduda
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
                         ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

use elisyenphong
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, 
				--NguonGocSDD.KyHieu AS NGSD, 
				GCNQSDD.SoSerial, GCNQSDD.NgayKy, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
                         ChuSuDung.SoDinhDanh1, ChuSuDung.DiaChi1, ChuSuDung.Ten2, ChuSuDung.NamSinh2, ChuSuDung.SoDinhDanh2
FROM            ToBanDo INNER JOIN
                         DVHC ON ToBanDo.MaDVHC = DVHC.MaDVHC INNER JOIN
                         ThuaDat ON ToBanDo.MaToBanDo = ThuaDat.MaToBanDo INNER JOIN
                         GCNQSDD INNER JOIN
                         DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy ON ThuaDat.MaThuaDat = DangKyQSDD.MaThuaDat INNER JOIN
                         ChuSuDung ON GCNQSDD.MaChuSuDung = ChuSuDung.MaChuSuDung INNER JOIN
                         DangKyMDSDD ON GCNQSDD.MaGCN = DangKyMDSDD.MaGCN INNER JOIN
                         --DangKyNGSDD ON GCNQSDD.MaGCN = DangKyNGSDD.MaGCN INNER JOIN
                         --NguonGocSDD ON DangKyNGSDD.MaNGSDD = NguonGocSDD.MaNGSDD INNER JOIN
                         MucDichSDD ON DangKyMDSDD.MaMDSDD = MucDichSDD.MaMDSDD
WHERE			(ChuSuDung.SoDinhDanh1 IN (Select SDD From @DKTimKiem_SDD_tbl) OR ChuSuDung.SoDinhDanh2 IN (Select SDD From @DKTimKiem_SDD_tbl))
				OR ((Chusudung.Ten1 IN (Select Ten From @DKTimKiem_Ten_tbl)) OR (Chusudung.Ten2 IN (Select Ten From @DKTimKiem_Ten_tbl)))

SELECT * FROM @KQTimKiem_tbl
----Kết thúc---