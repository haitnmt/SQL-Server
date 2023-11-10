SELECT        count(Ten1)
FROM            ChuSuDung
WHERE        (MaDVHC1 = 109383) and (not (Ten1 like N'%Chưa Đăng Ký%' or Ten1 like N'%UBND%' or Ten1 like N'Ủy ban%')) and (ten2 != null or NamSinh1 != 0 or SoDinhDanh1 != null or SoHoKhau != null or MaDoiTuong not in(16, 2,12))