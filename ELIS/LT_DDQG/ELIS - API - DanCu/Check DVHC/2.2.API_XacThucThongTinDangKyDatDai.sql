IF EXISTS (SELECT * FROM sys.objects WHERE type = 'P' AND name = 'spAPIXacThucThongTinDangKyDatDai_DDQG') DROP PROCEDURE spAPIXacThucThongTinDangKyDatDai_DDQG;  
GO
CREATE PROCEDURE spAPIXacThucThongTinDangKyDatDai_DDQG
     @MaTinh varchar(2),
	 @MaHuyen varchar(3),
	 @MaXa varchar(5),
	 @HoTen nvarchar(150),
	 @SoPhatHanh nvarchar(10),
	 @SoGiayTo varchar(30),
	 @NgaySinh varchar(10)
	 --Theo yeu cau thi ma xa va ho ten chu buoc phai co.
	 --SoPhatHanh, SoGiayTo, NgaySinh la tuy chon
	 --Neu co SoPhatHanh thi khong can SoGiayTo, NgaySinh va nguoc lai
AS
    --Kiem tra tinh hop le cua tham so
	
	--Thieu ma xa hoac ho ten chu
    if ((@MaXa is null)or(ltrim(rtrim(@MaXa))='')or(@HoTen is null)or(ltrim(rtrim(@HoTen))=''))
	  begin  
	     select 'False' 
		 return
	  end 


	--Kiem tra Danh muc Xa cho phep lay du lieu
	--Chi lay dư lieu nhung xa da XD CSDL Dia chinh 
	--Cap Huyen: Tu Son, Luong Tai, Gia Binh; 
	--Cap Xa (Dai Phuc, Nam Son, Cho, Thuy Hoa, Hoan Son, Lim, Lien Bao, Mo Dao, Thanh Khuong, Dai Dong Thanh)
if ((@MaHuyen not in ('261','263','264')) AND (@MaXa not in ('09181','09286','09193','09208','09340','09319','09334','09307','09427','09406')))
	begin return end -- Ngoài DVHC đã XD CSDL


	-- Khong co ca so serial, so giay to v� ngay sinh
	if (((@SoPhatHanh is null)or(ltrim(rtrim(@SoPhatHanh))=''))and
	    ((@SoGiayTo is null)or(ltrim(rtrim(@SoGiayTo))=''))and
		((@NgaySinh is null)or(ltrim(rtrim(@NgaySinh))='')))
	  begin  
	     select 'False' 
		 return
	  end  

	if (ISNUMERIC(ltrim(rtrim(@MaXa)))<>1)	--ma xa ko hop le
	   begin  
	     select 'False' 
		 return
	   end 

	if (cast(ltrim(rtrim(@MaXa)) as int) = 0)
	   begin  
	     select 'False' 
		 return
	   end

	if not exists (select * from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))
	   begin  
	     select 'False' 
		 return
	   end

	declare @MaDVHC varchar(20)
	set @MaDVHC = (select ltrim(rtrim(str(MaDVHC))) from DVHC where MaXa = cast(ltrim(rtrim(@MaXa)) as int))


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
			       if (len(@NgaySinh)<>4)or(ISNUMERIC(@NgaySinh)<>1) --ko o dang nam sinh
				       begin  
	                         select 'False' 
		                     return
	                   end
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
	 'if exists (select ng.Ten1 from ChuSuDung ng, GCNQSDD gcn, DangKyQSDD dk, ThuaDat td, ToBanDo tbd 
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

	set @sql = @sql + ') begin select ''True'' end else begin select ''False'' end'

    exec (@sql)
GO
GRANT EXECUTE ON OBJECT::dbo.spAPIXacThucThongTinDangKyDatDai_DDQG
    TO ddqg;  
Go