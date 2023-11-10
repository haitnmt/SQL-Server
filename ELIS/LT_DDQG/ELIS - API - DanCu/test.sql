--id thua: 918128254 

select MaDVHC from ToBanDo where MaToBanDo=(select MaToBanDo from ThuaDat where MaThuaDat=918128254) 
--madvhc: 109181

select * from DVHC where MaDVHC=109181 --maxa: 9181, matinh: 27, mahuyen: 256

select * from DangKyQSDD where MaThuaDAt=918128254 --MaDK: 918130940

select * from GCNQSDD where MaDangKy=918130940  --MaCSD: 918163580, seri: BU 521502

select Ten1, NamSinh1, SoDinhDanh1 from ChuSuDung where MaChuSuDung=918163580 
--namsinh: 1972, cmnd: 125709147, Ten: Nguyễn Văn Hoà


--test
exec spAPILayThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', '', '', '1972'
exec spAPILayThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', '', '', '1972-12-17'
exec spAPILayThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', '', '125709147', ''
exec spAPILayThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', 'BU 521502', '', ''

exec spAPIXacThucThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', '', '', '1970'
exec spAPIXacThucThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', 'BU 521502', '', ''
exec spAPIXacThucThongTinDangKyDatDai_DDQG '27', '256', '9181', N'Nguyễn Văn Hoà', 'BU 521502', '12570147', ''

exec spAPILayDSChuSuDung_DDQG '27', '256', '9181'
