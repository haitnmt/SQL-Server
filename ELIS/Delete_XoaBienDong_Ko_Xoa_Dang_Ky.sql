DECLARE @Ma_BienDong varchar = N'abf5385d-8479-49d9-ad13-b1b3f223fa6b'
delete BienDong where mabiendong = @Ma_BienDong
delete CayLS where mabiendong = @Ma_BienDong