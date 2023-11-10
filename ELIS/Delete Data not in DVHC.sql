--Chọn Cơ sở dữ liệu cần xóa
use elis_vilg_dp_ns


--Mã đơn vị hành chính giữ lại
DECLARE @DVHC_NOT_DEL Table (ID int)
Insert into @DVHC_NOT_DEL values (109181)
Insert into @DVHC_NOT_DEL values (109286)

--Xóa người sử dụng, Cập nhật mật khẩu admin = boe_UcRzM2zP
Delete NguoiDung Where LOWER(TenDangNhap) NOT IN (N'admin')
Update NguoiDung SET MatKhau = '6gWSnpeXpFEfmShrH08heg==      '
delete User_DVHC Where LOWER(TenDangNhap) NOT IN (N'admin')
delete ThamSoGCN2009 Where Ma != N'1'
print 'Da Xoa Nguoi Su Dung'

delete tblLog
print 'Da Xoa Log'

--Cập nhật cấu hình SDE
DECLARE @IP char(20) = N'1.1.1.1'
DECLARE @Pas char(20) = N'@@@@@@'
DECLARE @Acc  char(20) = N'@@@'
DECLARE @Port nvarchar(50) = N'5151'
DECLARE @DB char(20) = N'sde'
Delete CauHinhRieng Where LOWER(UserId) != N'admin'
UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @Port, SDE_DB = @DB, SDE_Password = @Pas, [SDE_Account] = @Acc
UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @Port, SDE_DB = @DB, SDE_Password = @Pas, [SDE_Account] = @Acc;
print 'Da Xoa  Config SDE'


-- Xóa Tờ bản đồ
Delete ToBanDo where MaDVHC NOT IN (Select ID From @DVHC_NOT_DEL) 
print 'Da Xoa TBD'

-- Xóa Thửa đất
Delete ThuaDat Where MaToBanDo NOT IN (Select MaToBanDo From ToBanDo)
Delete ThuaDatLS Where MaToBanDo NOT IN (Select MaToBanDo From ToBanDo)
Delete ThuaDatCu Where MaThuaDat NOT IN (Select MaThuaDat From ThuaDat)
print 'Da Xoa ThuaDat'



-- Xóa Đăng ký
Declare @ThuaDat_NOT_DEL Table (ID bigint)
Insert Into @ThuaDat_NOT_DEL Select MaThuaDat From ThuaDat
Insert Into @ThuaDat_NOT_DEL Select MaThuaDatLS From ThuaDatLS where MaThuaDatLS NOT IN (Select MaThuaDat From ThuaDat)

Delete DangKyQSDD Where MaThuaDat NOT IN (Select ID From @ThuaDat_NOT_DEL)
Delete DangKyQSDDLS Where MaThuaDatLS NOT IN (Select ID From @ThuaDat_NOT_DEL)

Declare @DangKyQSDD_NOT_DEL Table (ID bigint)
Insert Into @DangKyQSDD_NOT_DEL Select MaDangKy From DangKyQSDD
Insert Into @DangKyQSDD_NOT_DEL Select MaDangKyLS From DangKyQSDDLS  where MaDangKyLS NOT IN (Select MaDangKy From DangKyQSDD)
print 'Da Xoa Dang Ky'


--Xóa biến động
Delete CayLS where MaDangKyHT NOT IN (Select ID From @DangKyQSDD_NOT_DEL) AND MaDangKyLS NOT IN (Select ID From @DangKyQSDD_NOT_DEL) 

Declare @BienDong_NOT_DEL Table (ID nvarchar(36))
Insert Into @BienDong_NOT_DEL Select MaBienDong From CayLS

delete BienDong where MaBienDong NOT IN (Select ID From @BienDong_NOT_DEL)

delete DangKy_TheChap where MaDangKy Not In (Select ID From @DangKyQSDD_NOT_DEL)

print 'Da Xoa Bien Dong'


-- Xóa Giấy chứng nhận
Delete GCNQSDD Where MaDangKy NOT IN (Select ID From @DangKyQSDD_NOT_DEL)
Delete GCNQSDDLS Where MaDangKyLS NOT IN (Select ID From @DangKyQSDD_NOT_DEL)

Declare @GCNQSDD_NOT_DEL Table (ID bigint)
Insert Into @GCNQSDD_NOT_DEL Select MaGCN From GCNQSDD
Insert Into @GCNQSDD_NOT_DEL Select MaGCNLS From GCNQSDDLS where MaGCNLS NOT IN (Select MaGCN From GCNQSDD)
print 'Da Xoa GCN'

-- Xóa thông tin đợt cấp
delete DotCapGCN where MaDVHC Not In (Select ID From @DVHC_NOT_DEL)
delete NhomDotCap Where Ma Not In (Select MaNhomDotCap From DotCapGCN)
print 'Da Xoa Dot Cap GCN'


--Xóa thông tin đăng ký MDSD và NGSD
Delete DangKyMDSDD Where MaGCN NOT IN (Select ID From @GCNQSDD_NOT_DEL)
Delete DangKyMDSDDLS Where MaGCNLS  NOT IN (Select ID From @GCNQSDD_NOT_DEL)
print 'Da Xoa MDSD'
Delete DangKyNGSDD Where MaGCN NOT IN (Select ID From @GCNQSDD_NOT_DEL)
Delete DangKyNGSDDLS Where MaGCNLS  NOT IN (Select ID From @GCNQSDD_NOT_DEL)
print 'Da Xoa NGSD'

--Xóa Chủ sử dụng đất
Declare @ChuSuDung_NOT_DEL Table (ID bigint)
Insert Into @ChuSuDung_NOT_DEL Select MaChuSuDung From GCNQSDD
Insert Into @ChuSuDung_NOT_DEL Select MaChuSuDungLS From GCNQSDDLS where MaChuSuDungLS NOT IN (Select MaChuSuDung From GCNQSDD)
Delete ChuSuDung Where MaChuSuDung NOT IN (Select ID From @ChuSuDung_NOT_DEL)
Delete ChuSuDungLS Where MaChuSuDungLS  NOT IN (Select ID From @ChuSuDung_NOT_DEL)
print 'Da Xoa ChuSuDung'


