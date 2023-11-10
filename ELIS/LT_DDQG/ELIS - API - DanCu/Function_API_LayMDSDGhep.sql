IF EXISTS (SELECT * FROM sys.objects WHERE type IN ( N'FN', N'IF', N'TF', N'FS', N'FT' ) AND object_id = OBJECT_ID(N'[dbo].[APILayMDSDGhep_DDQG]')) DROP FUNCTION [dbo].[APILayMDSDGhep_DDQG];  
GO
CREATE FUNCTION [dbo].[APILayMDSDGhep_DDQG]
(
	@MaGCN bigint
)
RETURNS nvarchar(500)
AS
BEGIN
    declare @strmd nvarchar(500)
	declare @tmp nvarchar(50)

	set @strmd = ''

	DECLARE curmd CURSOR FOR
	select (select KyHieu from MucDichSDD where MaMDSDD=dkmd.MaMDSDD) as KyHieu
	from DangKyMDSDD dkmd where MaGCN=@MaGCN

	OPEN curmd  
    FETCH NEXT FROM curmd INTO @tmp

	WHILE @@FETCH_STATUS = 0 
    begin  
			if (@strmd='') begin set @strmd=@tmp end
			else begin set @strmd = @strmd + '_' + @tmp end

			FETCH NEXT FROM curmd INTO @tmp
	end

	CLOSE curmd  
    DEALLOCATE curmd

	return @strmd
END
GO
GRANT EXECUTE ON OBJECT::dbo.APILayMDSDGhep_DDQG
    TO ddqg;  
Go