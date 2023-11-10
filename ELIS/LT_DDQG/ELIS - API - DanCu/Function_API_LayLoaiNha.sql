IF EXISTS (SELECT * FROM sys.objects WHERE type IN ( N'FN', N'IF', N'TF', N'FS', N'FT' ) AND object_id = OBJECT_ID(N'[dbo].[APILayLoaiNha_DDQG]')) DROP FUNCTION [dbo].[APILayLoaiNha_DDQG];  
GO
CREATE FUNCTION [dbo].[APILayLoaiNha_DDQG]
(
	@Ten nvarchar(150)
)
RETURNS nvarchar(15)
AS
BEGIN
	if (@Ten is null)or(@Ten='') return null

	if (@Ten=N'nhà ở') return N'NhaORiengLe'	

	if (CHARINDEX(N'căn hộ chung cư', @Ten, 1) > 0)  return N'CanHo'
	if (CHARINDEX(N'nhà ở riêng lẻ', @Ten, 1) > 0)  return N'NhaORiengLe'
	
	return null
END
GO
GRANT EXECUTE ON OBJECT::dbo.APILayLoaiNha_DDQG
    TO ddqg;  
Go