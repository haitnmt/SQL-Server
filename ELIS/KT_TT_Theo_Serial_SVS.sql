DECLARE @DKTimKiem_Serial_tbl table (Seri nvarchar(50))
--Danh sách CMND hoặc CCCD--
Insert into  @DKTimKiem_Serial_tbl (Seri) VALUES 
(N'AE 625033'),
(N'DL 049574'),

(N'CS 000011')
---Bắt đầu tìm---
DECLARE @DKTimKiem_SVS_tbl table (SVS nvarchar(200))
--Insert into  @DKTimKiem_SVS_tbl (SVS) VALUES (N'Nguyễn Thị Thu Hồng'), (N'Trần Đình Trung')

DECLARE @KQTimKiem_tbl table (DVHC_CX nvarchar(50), ToBanDo nvarchar(50), ThuaDat char(250), MDSD nvarchar (50), Serial nvarchar(50), SoVaoSo nvarchar(50), DienTichRieng float, DienTichChung float, NamCap varchar(5),
								Ten_ChuSuDung nvarchar(200), NamSinh int, SoDinhDanh nvarchar(50), DiaChi nvarchar(500),Ten_VoChong nvarchar(200), NamSinh_VC int, SoDinhDanh_VC nvarchar(50))

use elisbacninh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elistuson
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elisgiabinh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elisluongtai
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elisquevo
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elisthuanthanh
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))


use elistiendu
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))
				
use elistienduda
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

use elisyenphong
Insert into @KQTimKiem_tbl
SELECT        DVHC.Ten AS DVHC_CX, ToBanDo.SoTo, ThuaDat.ThuaDatSo, MucDichSDD.KyHieu AS MDSD, GCNQSDD.SoSerial, GCNQSDD.SoVaoSo, GCNQSDD.DienTichRieng, GCNQSDD.DienTichChung, GCNQSDD.NamCap, ChuSuDung.Ten1, ChuSuDung.NamSinh1, 
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
WHERE			((GCNQSDD.SoSerial IN (Select Seri From @DKTimKiem_Serial_tbl))
				OR (GCNQSDD.SoVaoSo IN (Select SVS From @DKTimKiem_SVS_tbl)))

SELECT * FROM @KQTimKiem_tbl
----Kết thúc---