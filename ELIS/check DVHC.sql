SELECT TOP 1000 [MaDVHC]
      ,[Ten]
      ,[MaTinh]
      ,[MaHuyen]
      ,[MaXa]
  FROM [dbo].[DVHC]
  where MaTinh = 27 and MaHuyen IN (259, 262)
  
