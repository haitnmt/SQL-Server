/****** Script for SelectTopNRows command from SSMS  ******/
SELECT [SOTO]
      ,[TYLE]
      ,[SOTHUA]
      ,[DIENTICH]
      ,[LOAIDAT]
      ,[KVHC_ID]
      ,[DOITUONG]
      ,[TENCHU]
  FROM [sde].[sde].[THUADAT]
  WHERE (KVHC_ID = 109499)
  order by SOTO, SoThua	