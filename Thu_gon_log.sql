USE acronis_cms_cards;

GO

ALTER DATABASE acronis_cms_cards SET RECOVERY SIMPLE;

GO

DBCC SHRINKFILE (acronis_cms_cards_Log, 1024);

GO

ALTER DATABASE acronis_cms_cards SET RECOVERY FULL;

GO
--Test