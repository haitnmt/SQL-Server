IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spAPILayDSChuSuDung_DDQG') DROP PROCEDURE spAPILayDSChuSuDung_DDQG;  
GO
CREATE PROCEDURE spAPILayDSChuSuDung_DDQG
     @MaTinh varchar(2),
	 @MaHuyen varchar(3),
	 @MaXa varchar(5)	 
AS
	  --Kiem tra tinh hop le cua tham so

    if (@MaXa is null)or(ltrim(rtrim(@MaXa))='') return	
	
	if (ISNUMERIC(ltrim(rtrim(@MaXa)))<>1) begin return end	--ma xa ko hop le

	if (cast(ltrim(rtrim(@MaXa)) as int) = 0) begin return end	--ma xa ko hop le

	if not exists (select * from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	   begin return end	--ma xa ko ton tai

	--Kiem tra Danh muc Xa cho phep lay du lieu
	--Chi lay dư lieu nhung xa da XD CSDL Dia chinh 
	--Cap Huyen: Tu Son, Luong Tai, Gia Binh; 
	--Cap Xa (Dai Phuc, Nam Son, Cho, Thuy Hoa, Hoan Son, Lim, Lien Bao, Mo Dao, Thanh Khuong, Dai Dong Thanh)
if ((@MaHuyen not in ('261','263','264')) AND (@MaXa not in ('09181','09286','09193','09208','09340','09319','09334','09307','09427','09406')))
	begin return end -- Ngoài DVHC đã XD CSDL
	declare @MaDVHC int
	set @MaDVHC = (select MaDVHC from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	 
	
	select ng.Ten1 as hoTen, ng.SoDinhDanh1 as SoGiayTo, null as LoaiGiayTo,

		   (case ng.NamSinh1 when 0 then NULL else ltrim(rtrim(str(ng.NamSinh1))) end) as NgaySinh,

		   (select ltrim(rtrim(str(MaTinh))) from DVHC where MaDVHC = ng.MaDVHC1) as MaTinh,
		   (select ltrim(rtrim(str(MaHuyen))) from DVHC where MaDVHC = ng.MaDVHC1) as MaHuyen,
		   (select ltrim(rtrim(str(MaXa))) from DVHC where MaDVHC = ng.MaDVHC1) as MaXa,
		      
		   ng.DiaChi1 as DiaChi			    

	from ChuSuDung ng
	where exists (
	                select gcn.MaChuSuDung from GCNQSDD gcn, DangKyQSDD dk, ThuaDat td, ToBanDo tbd
					where (gcn.MaChuSuDung=ng.MaChuSuDung)and(tbd.MaDVHC=@MaDVHC)and
					      (gcn.MaDangKy=dk.MaDangKy)and(dk.MaThuaDat=td.MaThuaDat)and(td.MaToBanDo=tbd.MaToBanDo)
				 )
	order by ng.Ten1
GO
GRANT EXECUTE ON OBJECT::dbo.spAPILayDSChuSuDung_DDQG
    TO ddqg;  
Go

