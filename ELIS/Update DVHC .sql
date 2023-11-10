DECLARE @Ma int = 109418
DECLARE @Ten nvarchar(50) = N'Phường An Bình'


use elisbacninh;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elisgiabinh;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma


use elisluongtai;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elisquevo;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elisthuanthanh;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elistiendu;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;

use elistienduda;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elistuson;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;


use elisyenphong;
UPDATE DVHC SET Ten = @Ten WHERE MaDVHC = @Ma;