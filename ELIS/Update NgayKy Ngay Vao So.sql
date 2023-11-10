DECLARE @MaDVHC int = 109499
DECLARE @NgayVaoSo DateTime = '2016-12-22'
DECLARE @NgayKy DateTime = '2016-12-22'
DECLARE @NamCap int = 2016


--Lay Ma GCN theo Ngay vao so
DECLARE @DKTimKiem_GCN_NVS table (MaGCN bigint)
Insert into  @DKTimKiem_GCN_NVS
    SELECT GCNQSDD.MaGCN
    FROM            GCNQSDD INNER JOIN
                            DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                            ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                            ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
    WHERE        (GCNQSDD.NgayVaoSo = @NgayVaoSo) AND (GCNQSDD.NamCap = @NamCap) 
                AND (GCNQSDD.NgayKy = '1900-01-01') AND (ToBanDo.MaDVHC = @MaDVHC)


--Lay Ma GCN theo Ngay ky
DECLARE @DKTimKiem_GCN_NK table (MaGCN bigint)
Insert into  @DKTimKiem_GCN_NK
    SELECT GCNQSDD.MaGCN
    FROM            GCNQSDD INNER JOIN
                            DangKyQSDD ON GCNQSDD.MaDangKy = DangKyQSDD.MaDangKy INNER JOIN
                            ThuaDat ON DangKyQSDD.MaThuaDat = ThuaDat.MaThuaDat INNER JOIN
                            ToBanDo ON ThuaDat.MaToBanDo = ToBanDo.MaToBanDo
    WHERE        (GCNQSDD.NgayKy = @NgayKy) AND (GCNQSDD.NamCap = @NamCap) 
                AND (GCNQSDD.NgayVaoSo = '1900-01-01') AND (ToBanDo.MaDVHC = @MaDVHC)



--Cap Nhat Ngay Ky
UPDATE GCNQSDD SET NgayKy = @NgayKy WHERE MaGCN IN (SELECT MaGCN FROM @DKTimKiem_GCN_NVS)

--Cap nhật ngày vào so
UPDATE GCNQSDD SET NgayVaoSo = @NgayVaoSo WHERE MaGCN IN (SELECT MaGCN FROM @DKTimKiem_GCN_NK)