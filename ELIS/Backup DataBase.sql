USE [master];
GO
Declare @Date Datetime = getdate()
declare @Name Nvarchar(500) = N'C:\Backup ELIS data\' + N'elis_vilg_dp_ns' + '_' + FORMAT(@date,'yyyy.MM.dd') + '.bak'
BACKUP DATABASE [elis_vilg_dp_ns]
TO DISK = @Name
WITH NOFORMAT, NOINIT,COMPRESSION,
NAME = N'SQLTestDB-Full Database Backup', SKIP, NOREWIND, NOUNLOAD, STATS = 10;
GO