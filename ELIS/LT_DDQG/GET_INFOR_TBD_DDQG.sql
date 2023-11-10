USE [elisyenphong]
GO

/****** Object:  StoredProcedure [dbo].[GET_INFOR_TBD_DDQG]    Script Date: 6/10/2021 2:17:32 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[GET_INFOR_TBD_DDQG]
    @maxa  varchar(10)
AS
    select ltrim(rtrim(str(MaToBanDo))) as id, @maxa as maxa, SoTo as soto, 
	       SoHieuGoc as sohieu, ltrim(rtrim(str(TyLe))) as tyle        
	from ToBanDo 
	where ((MaDVHC=100000 + cast(@maxa as int)) AND (MaDVHC IN (109208,109193)))
	ORDER BY (CASE WHEN SoTo LIKE '%[^ 0-9]%' THEN 0 ELSE CAST(SoTo AS INT) END)
GO

