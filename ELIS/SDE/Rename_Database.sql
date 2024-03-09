DECLARE @oldDatabaseH NVARCHAR(255) = N'SDETIENDUDA';
DECLARE @oldDatabaseT NVARCHAR(255) = N'sdetienduda';
DECLARE @newDatabaseH NVARCHAR(255) = N'SDE_TD';
DECLARE @newDatabaseT NVARCHAR(255) = N'sde_td';
UPDATE [sde].[SDE_geometry_columns] SET [f_table_catalog]= @newDatabaseH WHERE [f_table_catalog]=@oldDatabaseH
UPDATE [sde].[SDE_geometry_columns] SET [g_table_catalog]= @newDatabaseH WHERE [g_table_catalog]=@oldDatabaseH
UPDATE [sde].[SDE_column_registry] SET [database_name]= @newDatabaseH WHERE [database_name]=@oldDatabaseH
UPDATE [sde].[SDE_layers] SET [database_name]= @newDatabaseH WHERE [database_name]=@oldDatabaseH
UPDATE [sde].[SDE_table_registry] SET [database_name]= @newDatabaseH WHERE [database_name]=@oldDatabaseH
UPDATE [sde].[GDB_OBJECTCLASSES] SET [DatabaseName]= @newDatabaseT WHERE [DatabaseName]=@oldDatabaseT
UPDATE [sde].[GDB_FEATUREDATASET] SET [DatabaseName]= @newDatabaseT WHERE [DatabaseName]=@oldDatabaseT