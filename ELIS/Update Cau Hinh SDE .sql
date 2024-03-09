DECLARE @IP char(20) = N'192.168.9.6'
DECLARE @Pas char(20) = N'3oU%6Vvvtpsedt%ts@T&bB&vVs'
DECLARE @Acc  char(20) = N'sde'


--use elis_vilg_dp;
--DECLARE @PortBN nvarchar(50) = N'5156'
--DECLARE @DBBN char(20) = N'sde_BN'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortBN, SDE_DB = @DBBN, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortBN, SDE_DB = @DBBN, SDE_Password = @Pas, [SDE_Account] = @Acc;

--use elisbacninh;
--DECLARE @PortBN nvarchar(50) = N'5156'
--DECLARE @DBBN char(20) = N'sde_BN'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortBN, SDE_DB = @DBBN, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortBN, SDE_DB = @DBBN, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elisgiabinh;
--DECLARE @PortGB nvarchar(50) = N'5163'
--DECLARE @DBGB char(20) = N'sde_GB'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortGB, SDE_DB = @DBGB, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortGB, SDE_DB = @DBGB, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elisluongtai;
--DECLARE @PortLT nvarchar(50) = N'5164'
--DECLARE @DBLT char(20) = N'sde_LT'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortLT, SDE_DB = @DBLT, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortLT, SDE_DB = @DBLT, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elisquevo;
--DECLARE @PortQV nvarchar(50) = N'5159'
--DECLARE @DBQV char(20) = N'sde_QV'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortQV, SDE_DB = @DBQV, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortQV, SDE_DB = @DBQV, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elisthuanthanh;
--DECLARE @PortTT nvarchar(50) = N'5162'
--DECLARE @DBTT char(20) = N'sde_TT'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortTT, SDE_DB = @DBTT, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortTT, SDE_DB = @DBTT, SDE_Password = @Pas, [SDE_Account] = @Acc;


use elistiendu;
DECLARE @PortTD nvarchar(50) = N'5160'
DECLARE @DBTD char(20) = N'sdetienduda'
UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortTD, SDE_DB = @DBTD, SDE_Password = @Pas, [SDE_Account] = @Acc
UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortTD, SDE_DB = @DBTD, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elistuson;
--DECLARE @PortTS nvarchar(50) = N'5161'
--DECLARE @DBTS char(20) = N'sde'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortTS, SDE_DB = @DBTS, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortTS, SDE_DB = @DBTS, SDE_Password = @Pas, [SDE_Account] = @Acc;


--use elisyenphong;
--DECLARE @PortYP nvarchar(50) = N'5158'
--DECLARE @DBYP char(20) = N'sde_YP'
--UPDATE CauHinhRieng SET SDE_IP = @IP, SDE_Port = @PortYP, SDE_DB = @DBYP, SDE_Password = @Pas, [SDE_Account] = @Acc
--UPDATE [HeThong] SET [SDE_IP] = @IP, SDE_Port = @PortYP, SDE_DB = @DBYP, SDE_Password = @Pas, [SDE_Account] = @Acc;