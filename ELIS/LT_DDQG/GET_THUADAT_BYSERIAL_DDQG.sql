USE [elisyenphong]
GO

/****** Object:  StoredProcedure [dbo].[GET_THUADAT_BYSERIAL_DDQG]    Script Date: 6/10/2021 2:17:41 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_THUADAT_BYSERIAL_DDQG]   
   @soserial nvarchar(50)
AS
	 declare @tong int
	 declare @i int
	 declare @MaGCN bigint
	 declare @MaDangKy bigint
	 declare @MaThuaDat bigint
	 declare @tmp nvarchar(100)
	 declare @strmd nvarchar(100)
	 declare @strng nvarchar(100)
	 declare @strts nvarchar(100)
  
     declare @tblThuaDat table(Ma bigint IDENTITY(1,1) PRIMARY KEY, SoToSX nvarchar(50), MaThuaDat bigint, SoTo nvarchar(50),
	                           ThuaDatSo nvarchar(50), DTPhapLy float, MucDichSD nvarchar(100), NguonGocSD nvarchar(100), 
							   TrangThai nvarchar(500), SoSerial nvarchar(50), HanCheSDD nvarchar(100), 
							   LoaiTaiSan nvarchar(200), MaDVHC int, MaGCN bigint, MaDangKy bigint)
							   
     insert into @tblThuaDat(SoToSX, MaThuaDat, SoTo, ThuaDatSo, DTPhapLy, MucDichSD, NguonGocSD,
	                         TrangThai, SoSerial, HanCheSDD, LoaiTaiSan, MaDVHC, MaGCN, MaDangKy)

	 select tbd.SoTo as SoToSX, td.MaThuaDat, (ltrim(rtrim(tbd.SoTo)) + ' (' + ltrim(rtrim(tbd.TyLe)) + ')') as SoTo,
			td.ThuaDatSo, ROUND((gcn.DienTichChung + gcn.DienTichRieng), 1) as DTPhapLy, 

			(
			   case (select count(*) from DangKyMDSDD where MaGCN=gcn.MaGCN) 
			   when 1 then (
			                  select (select KyHieu from MucDichSDD where MaMDSDD=dkmd.MaMDSDD)
							  from DangKyMDSDD dkmd where MaGCN=gcn.MaGCN
						   )
			   else ''
			   end
			) as MucDichSD,
			
			(
			   case (select count(*) from DangKyNGSDD where MaGCN=gcn.MaGCN) 
			   when 1 then (
			                  select (select KyHieu from NguonGocSDD where MaNGSDD=dkng.MaNGSDD)
							  from DangKyNGSDD dkng where MaGCN=gcn.MaGCN
						   )
			   else ''
			   end
			) as NguonGocSD,
			
			--(select TenTrangThai from TrangThaiThuaDat where MaTrangThai=dk.MaTrangThaiThuaDat) as TrangThai, 

			'' as TrangThai, gcn.SoSerial, 

			(
			   case (select loaiHanChe from DC_HanCheSuDungDat where (MaGCN=gcn.MaGCN)and(ltrim(rtrim(soVanBanPhapLy))<>''))
			   when 1 then N'Thu hồi'
			   when 2 then N'Hành lang'
			   when 3 then N'Xây dựng'
			   when 4 then N'Tranh chấp'
			   when 5 then N'Phong tỏa'
			   else ''
			   end
			) as HanCheSDD,			

			'' as LoaiTaiSan, tbd.MaDVHC, gcn.MaGCN, dk.MaDangKy
	        
	 from ToBanDo tbd, ThuaDat td, DangKyQSDD dk, GCNQSDD gcn
	 where (tbd.MaToBanDo=td.MaToBanDo)and(td.MaThuaDat=dk.MaThuaDat)and(dk.MaDangKy=gcn.MaDangKy)and
	       (gcn.SoSerial is not null)and(ltrim(rtrim(upper(gcn.SoSerial)))=ltrim(rtrim(upper(@soserial))))
	 
	        
	 set @tong = (select count(*) from 	@tblThuaDat)
	 set @i = 1
	 while (@i <= @tong)
	 begin	      
		   set @MaGCN = (select MaGCN from @tblThuaDat where Ma=@i)
		   set @MaDangKy = (select MaDangKy from @tblThuaDat where Ma=@i)
		   set @MaThuaDat = (select MaThuaDat from @tblThuaDat where Ma=@i)
		   set @strmd = ''
		   set @strng = ''
		   set @strts = ''

		   if exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TrangThaiThuaDat')
		     begin
			       update @tblThuaDat
				   set TrangThai = (
				                      select TenTrangThai from TrangThaiThuaDat 
									  where MaTrangThai=(select MaTrangThaiThuaDat from DangKyQSDD where MaDangKy=@MaDangKy)
								   )
				   where Ma=@i
			 end
		   else if exists (select * from GCNQSDD where (MaGCN=@MaGCN)and(SoSerial is not null)and(ltrim(rtrim(SoSerial))<>''))
		     begin
			       update @tblThuaDat
				   set TrangThai = N'Đã cấp GCN'
				   where Ma=@i
			 end


		   if exists (select * from @tblThuaDat where (Ma=@i)and(MucDichSD=''))
		      begin
			        DECLARE curmd CURSOR FOR
					select (select KyHieu from MucDichSDD where MaMDSDD=dkmd.MaMDSDD) as KyHieu
				    from DangKyMDSDD dkmd where MaGCN=@MaGCN

					OPEN curmd  
                    FETCH NEXT FROM curmd INTO @tmp

					WHILE @@FETCH_STATUS = 0 
                    begin  
					       if (@strmd='') begin set @strmd=@tmp end
						   else begin set @strmd = @strmd + ' + ' + @tmp end

						   FETCH NEXT FROM curmd INTO @tmp
					end

					update @tblThuaDat set MucDichSD=@strmd where Ma=@i

					CLOSE curmd  
                    DEALLOCATE curmd
			  end
	  
	       if exists (select * from @tblThuaDat where (Ma=@i)and(NguonGocSD=''))
		      begin
			        DECLARE curng CURSOR FOR 
		            select (select KyHieu from NguonGocSDD where MaNGSDD=dkng.MaNGSDD) as KyHieu
		            from DangKyNGSDD dkng where MaGCN=@MaGCN

					OPEN curng  
                    FETCH NEXT FROM curng INTO @tmp

					WHILE @@FETCH_STATUS = 0 
                    begin
					     if (@strng='') begin set @strng=@tmp end
						 else begin set @strng = @strng + ' + ' + @tmp end

						 FETCH NEXT FROM curng INTO @tmp
					end

					update @tblThuaDat set NguonGocSD=@strng where Ma=@i

					CLOSE curng  
                    DEALLOCATE curng
			  end

		 if exists (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'TS_ThongTinChiTiet')
		  BEGIN
		   DECLARE curts CURSOR FOR 
		   select distinct (case LoaiTaiSan when 1 then N'Nhà ở' when 2 then N'Công trình xây dựng' 
		                    when 3 then N'Rừng sản xuất' when 4 then N'Cây lâu năm' else '' end) as TaiSan 
		   from TS_ThongTinChiTiet 
		   where MaTaiSan in (select MaTaiSan from TS_ThuaDat where MaThuaDat=@MaThuaDat)

		   OPEN curts  
           FETCH NEXT FROM curts INTO @tmp

		   WHILE @@FETCH_STATUS = 0 
           begin
		         if ((@tmp is not null)and(@tmp<>''))
				 begin
		             if (@strts='') begin set @strts=@tmp end
			         else begin set @strts = @strts + ' + ' + @tmp end
				 end

				 FETCH NEXT FROM curts INTO @tmp
		   end
		  END
		 ELSE
		  BEGIN
		   DECLARE curts CURSOR FOR 
		   select distinct (case loaiTaiSan when 1 then N'Nhà ở' when 2 then N'Công trình xây dựng' 
		                    when 3 then N'Rừng sản xuất' when 4 then N'Cây lâu năm' else '' end) as TaiSan 
		   from TS_TaiSan 
		   where idTaiSan in (select idTaiSan from TS_ThuaDat_TaiSan where idThuaDat=@MaThuaDat)

		   OPEN curts  
           FETCH NEXT FROM curts INTO @tmp

		   WHILE @@FETCH_STATUS = 0 
           begin
		         if ((@tmp is not null)and(@tmp<>''))
				 begin
		             if (@strts='') begin set @strts=@tmp end
			         else begin set @strts = @strts + ' + ' + @tmp end
				 end

				 FETCH NEXT FROM curts INTO @tmp
		   end
		  END

		   if (@strts<>'')
		     begin
			      update @tblThuaDat set LoaiTaiSan=@strts where Ma=@i
			 end

		   CLOSE curts  
           DEALLOCATE curts

		   set @i = @i + 1
	 end

	 
     select ltrim(rtrim(str(MaThuaDat))) as id, SoTo as sohieutobando, ThuaDatSo as sothututhua, 
	        ltrim(rtrim(str((MaDVHC - 100000)))) as maxa,
	        MucDichSD as mucdichsudung, DTPhapLy as dientichphaply, NguonGocSD as nguongocgiaodat, 
			TrangThai as tinhtrangphaply, SoSerial as soserri_giaychungnhan, HanCheSDD as hanchequyen,
			'' as tinhtrangquyen, LoaiTaiSan as loaitaisan
	 from @tblThuaDat
	 ORDER BY (CASE WHEN SoToSX LIKE '%[^ 0-9]%' THEN 0 ELSE CAST(SoToSX AS INT) END), 
	          (CASE WHEN ThuaDatSo LIKE '%[^ 0-9]%' THEN 0 ELSE CAST(ThuaDatSo AS INT) END)
GO

