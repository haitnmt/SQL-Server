IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spAPILayThongTinDangKyDatDai_DDQG') DROP PROCEDURE spAPILayThongTinDangKyDatDai_DDQG;  
GO

Create PROCEDURE spAPILayThongTinDangKyDatDai_DDQG
     @MaTinh varchar(2),
	 @MaHuyen varchar(3),
	 @MaXa varchar(5),
	 @HoTen nvarchar(150),
	 @SoPhatHanh nvarchar(10),
	 @SoGiayTo varchar(30),
	 @NgaySinh varchar(10)
	 --Theo yeu cau thi ma xa va ho ten chu buoc phai co. Neu ko co store se ko tra ve bang nao.
	 --SoPhatHanh, SoGiayTo, NgaySinh la tuy chon
	 --Neu co SoPhatHanh thi khong can SoGiayTo, NgaySinh va nguoc lai
	 --Neu ca SoPhatHanh, SoGiayTo, NgaySinh deu ko co store se ko tra ve bang nao.
AS
    --Kiem tra tinh hop le cua tham so


	--Neu ko hop le store ko tra ve ket qua nao

    if ((@MaXa is null)or(ltrim(rtrim(@MaXa))='')or(@HoTen is null)or(ltrim(rtrim(@HoTen))=''))
	  begin return end --Thieu ma xa hoac ho ten chu

	--Kiem tra Danh muc Xa cho phep lay du lieu
	--Chi lay du lieu nhung xa da XD CSDL Dia chinh 
	--Cap Huyen: Tu Son, Luong Tai, Gia Binh; 
	--Cap Xa (Dai Phuc, Nam Son, Cho, Thuy Hoa, Hoan Son, Lim, Lien Bao, Mo Dao, Thanh Khuong, Dai Dong Thanh)
	if ((@MaHuyen not in ('261','263','264')) AND (@MaXa not in ('09181','09286','09193','09208','09340','09319','09334','09307','09427','09406')))
	begin return end -- Ngoài DVHC đã XD CSDL


	if (((@SoPhatHanh is null)or(ltrim(rtrim(@SoPhatHanh))=''))and
	    ((@SoGiayTo is null)or(ltrim(rtrim(@SoGiayTo))=''))and
		((@NgaySinh is null)or(ltrim(rtrim(@NgaySinh))='')))
	  begin return end  -- Khong co ca so serial, so giay to và ngay sinh

	if (ISNUMERIC(ltrim(rtrim(@MaXa)))<>1) begin return end	--ma xa ko hop le, ko o dang so
	if (cast(ltrim(rtrim(@MaXa)) as int) = 0) begin return end	--ma xa ko hop le

	if not exists (select * from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	   begin return end	--ma xa ko hop le

	-----Lay ma DVHC va ten tinh huyen xa-----------
	declare @MaDVHC varchar(20)
	declare @tinhid int
	declare @huyenid int
	declare @thx nvarchar(150)

	set @MaDVHC = (select ltrim(rtrim(str(MaDVHC))) from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	set @tinhid = (select MaTinh from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	set @huyenid = (select MaHuyen from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))

	set @thx = (select Ten from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int)) + ', ' + 
	           (select Ten from DVHC where (MaTinh=@tinhid)and(MaHuyen=@huyenid)and(MaXa=0)) + ', ' + 
			   (select Ten from DVHC where (MaTinh=@tinhid)and(MaHuyen=0)and(MaXa=0))
    ---------------------
		 
	declare @idx smallint
	declare @vNgaySinh varchar(10)
	set @vNgaySinh = ''

	--Neu ngay sinh o dang (yyyy-mm-dd ) thi lay nam sinh 
	--Neu o dang yyyy thi kiem tra xem co o dang so ko
	if (@NgaySinh is not null)and(@NgaySinh<>'')    
	  begin
	      set @idx = CHARINDEX('-', @NgaySinh, 1) 
	      if (@idx is not null)and(@idx>0) set @vNgaySinh = ltrim(rtrim(year(@NgaySinh)))
		  else
		     begin
			       if (len(@NgaySinh)<>4)or(ISNUMERIC(@NgaySinh)<>1) begin return end --ko o dang nam sinh
				   else set @vNgaySinh=ltrim(rtrim(@NgaySinh)) 
			 end
	  end

	declare @vHoTen nvarchar(150)
	declare @vSoPhatHanh nvarchar(10)
	declare @vSoGiayTo varchar(30)
	declare @vSoGiayTo2 varchar(30)	

	set @vHoTen=ltrim(rtrim(@HoTen))
	set @vSoPhatHanh=ltrim(rtrim(@SoPhatHanh)) 
	set @vSoGiayTo=ltrim(rtrim(@SoGiayTo))
	set @vSoGiayTo2=''

	--Kiem tra TH so giay to dang: SoCCCD,SoCMTND
	
	set @idx=CHARINDEX(',', @vSoGiayTo, 1)

	if ((@vSoGiayTo is not null)and(@vSoGiayTo<>'')and(@idx is not null)and(@idx>0))
	  begin
	        set @vSoGiayTo2=ltrim(rtrim(SUBSTRING(@vSoGiayTo, @idx + 1, len(@vSoGiayTo) - @idx)))
			set @vSoGiayTo=ltrim(rtrim(SUBSTRING(@vSoGiayTo, 1, @idx - 1)))
	  end

	declare @sql nvarchar(max)
	set @sql =
	 'select distinct ng.Ten1 as HoTen, ng.DiaChi1 as DiaChi,			
			 ltrim(rtrim(tbd.SoTo)) as SoHieuToBanDo, 
			 ltrim(rtrim(td.ThuaDatSo)) as SoThuTuThua,
			 (gcn.DienTichRieng + gcn.DienTichChung) as DienTichPhapLy,

			 dbo.APILayMDSDGhep_DDQG(gcn.MaGCN) as MucDichSuDung,

			 ISNULL(ltrim(rtrim(td.DiaChi)) + '', '' + N''' + @thx + ''', N''' + @thx + ''') as DiaChiThuaDat,

			 dbo.APILayLoaiNha_DDQG(
			                          (select top 1 LOWER(ltrim(rtrim(ln.tenLoaiNha))) 
			                          from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts, TS_LoaiNha ln
			                          where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and
									        (ts.idLoaiNha=ln.idLoaiNha)and(ts.loaiTaiSan=''1''))								        
                                   ) as LoaiTaiSanGanLienVoiDat,
			 

			 (
				 select top 1 ts.diaChi from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts				   
				 where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			 ) as DiaChiNha,

			(
				select top 1 (select tenCapHangNha from TS_CapHangNha where idCapHangNha=ts.nIdCapHangNha)
				from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts					   
				where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			) as CapHang,

			(
				select top 1 nDienTichSan from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts		 				   
				where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			) as DienTichSan,

			(
				select top 1 nDientichXayDung from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts 				   
				where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			) as DienTichXayDung,
			
			(
				select top 1 nSoTang from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts 				   
				where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			) as SoTang,

			(
				select top 1 nKetCau from TS_ThuaDat_TaiSan tdts, TS_TaiSan ts 				   
				where (tdts.idThuaDat=td.MaThuaDat)and(tdts.idTaiSan=ts.idTaiSan)and(ts.loaiTaiSan=''1'')
			) as KetCau,

			null as TenKhu,
			null as TenChungCu,
			null as SoHieuCanHo,
			null as TangSo

	 from ChuSuDung ng, GCNQSDD gcn, DangKyQSDD dk, ThuaDat td, ToBanDo tbd
	 where (tbd.MaDVHC=' + @MaDVHC + ')and(ng.Ten1 like N''%' + @vHoTen + '%'')'	      

    if ((@vSoPhatHanh is not null)and(@vSoPhatHanh<>''))
	   begin
	         set @sql = @sql + 
				 'and(gcn.SoSerial is not null)and(upper(ltrim(rtrim(gcn.SoSerial)))=upper(N'''+ @vSoPhatHanh + '''))'
	   end

	if ((@vSoGiayTo is not null)and(@vSoGiayTo<>''))
	   begin
	         if ((@vSoGiayTo2 is null)or(@vSoGiayTo2=''))
	            set @sql = @sql + 'and(ng.SoDinhDanh1 like N''%' + @vSoGiayTo + '%'')'
			            				        
			 else
			    set @sql = @sql + 'and((ng.SoDinhDanh1 like N''%' + @vSoGiayTo + '%'')or
			                           (ng.SoDinhDanh1 like N''%' + @vSoGiayTo2 + '%''))'					
	   end
   
    if ((@vNgaySinh is not null)and(@vNgaySinh<>''))
	   begin
	         set @sql = @sql + 'and(ng.NamSinh1=cast(''' + @vNgaySinh + ''' as int))'			     
	   end

    set @sql = @sql + 'and(ng.MaChuSuDung=gcn.MaChuSuDung)and(gcn.MaDangKy=dk.MaDangKy)and
	                      (dk.MaThuaDat=td.MaThuaDat)and(td.MaToBanDo=tbd.MaToBanDo)'

    exec (@sql)
GO
GRANT EXECUTE ON OBJECT::dbo.spAPILayThongTinDangKyDatDai_DDQG
    TO ddqg;  
GO