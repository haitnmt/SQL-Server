Use elisapi
--Thêm Bảng AppClient
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient')
BEGIN
    -- Tạo bảng mới nếu chưa tồn tại
    CREATE TABLE AppClient (
        -- Các cột trong bảng
        AccessKey uniqueidentifier DEFAULT NEWID() PRIMARY KEY,
		SecretKey VARCHAR(64),
        ClientName NVARCHAR(150),
		Origanization NVARCHAR(200),
		Domain NVARCHAR(150),
		IsActive bit DEFAULT 1,
		CreatedDate DateTime NOT NULL DEFAULT GETDATE(),
		ActiveDate DateTime,
		ExpriesDate DateTime,
		RegToken VARCHAR(128)
    )
END
ELSE
BEGIN
    -- Kiểm tra xem cột đã tồn tại hay chưa
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient' AND COLUMN_NAME = 'IsActive')
	BEGIN
		-- Thêm cột nếu chưa tồn tại
		ALTER TABLE AppClient
		ADD IsActive bit DEFAULT 1
	END
	IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient' AND COLUMN_NAME = 'RegToken')
	BEGIN
		-- Thêm cột nếu chưa tồn tại
		ALTER TABLE AppClient
		ADD RegToken VARCHAR(128)
	END
		IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient' AND COLUMN_NAME = 'CreatedDate')
	BEGIN
		-- Thêm cột nếu chưa tồn tại
		ALTER TABLE AppClient
		ADD CreatedDate DateTime NOT NULL DEFAULT GETDATE()
	END
		IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient' AND COLUMN_NAME = 'ActiveDate')
	BEGIN
		-- Thêm cột nếu chưa tồn tại
		ALTER TABLE AppClient
		ADD ActiveDate DateTime
	END
		IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'AppClient' AND COLUMN_NAME = 'ExpriesDate')
	BEGIN
		-- Thêm cột nếu chưa tồn tại
		ALTER TABLE AppClient
		ADD ExpriesDate DateTime
	END
END

--Thêm Bảng ApiRoles
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ApiRoles')
BEGIN
    -- Tạo bảng mới nếu chưa tồn tại
    CREATE TABLE ApiRoles (
        -- Các cột trong bảng
		ID INT IDENTITY(1,1) PRIMARY KEY,
        ApiRoleName NVARCHAR(50),
		ParentID INT,
		[Order] INT,
		Description NVARCHAR(255)
    )
END
ELSE
BEGIN
    -- Kiểm tra xem cột đã tồn tại hay chưa
    IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.COLUMNS WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ApiRoles' AND COLUMN_NAME = 'Description')
		BEGIN
			-- Thêm cột nếu chưa tồn tại
			ALTER TABLE ApiRoles
			ADD Description NVARCHAR (255)
		END
END
--Thêm bảng danh sách ApiRouters
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ApiRouters')
BEGIN
    -- Tạo bảng mới nếu chưa tồn tại
    CREATE TABLE ApiRouters (
        -- Các cột trong bảng
        ID INT IDENTITY(1,1) PRIMARY KEY,
		Template NVARCHAR(150) NOT NULL DEFAULT N'',
		Description NVARCHAR(255),
    )
END

--Thêm bảng quản lý AppClient - ApiRoles
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'ClientApiRoles')
BEGIN
    -- Tạo bảng mới nếu chưa tồn tại
    CREATE TABLE ClientApiRoles (
        -- Các cột trong bảng
        ID BIGINT IDENTITY(1,1) PRIMARY KEY,
        AppClientAccessKey uniqueidentifier, -- Thêm trường AppClientID để tham chiếu đến AppClient
        ApiRoleID INT, -- Thêm trường ApiRoleID để tham chiếu đến ApiRoles
		Description NVARCHAR(255),
        FOREIGN KEY (AppClientAccessKey) REFERENCES AppClient(AccessKey),
        FOREIGN KEY (ApiRoleID) REFERENCES ApiRoles(ID)
    )
END


--Thêm bảng nhật ký sử dụng API
IF NOT EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_SCHEMA = 'dbo' AND TABLE_NAME = 'LogClientApi')
BEGIN
    -- Tạo bảng mới nếu chưa tồn tại
    CREATE TABLE LogClientApi (
        -- Các cột trong bảng
        ID BIGINT IDENTITY(1,1) PRIMARY KEY,
		IPAddress NVARCHAR(100),
        AppAccessKey  uniqueidentifier, -- Thêm trường SecretKey để tham chiếu đến AppClient
		ApiRouterID INT, -- Thêm trường ApiControllerID để tham chiếu đến ApiControllers 
		EventTime DATETIME,
		EventMessage NVARCHAR(max),
        FOREIGN KEY (AppAccessKey) REFERENCES AppClient(AccessKey),
		FOREIGN KEY (ApiRouterID) REFERENCES ApiRouters(ID)
    )
END

--Tạo View xem Nhật ký sử dụng
CREATE VIEW ViewLogClientApi AS
SELECT	dbo.LogClientApi.ID, 
		CONVERT(DatetimeOffset, dbo.LogClientApi.EventTime) AT TIME ZONE 'UTC' AS EventTime,
		dbo.AppClient.AccessKey, 
		dbo.AppClient.ClientName, 
		dbo.AppClient.Origanization, 
		dbo.LogClientApi.IPAddress, 
		dbo.ApiRouters.Template, 
		dbo.ApiRouters.Description, 
        dbo.LogClientApi.EventMessage
FROM
		dbo.LogClientApi INNER JOIN
        dbo.AppClient ON dbo.LogClientApi.AppAccessKey = dbo.AppClient.AccessKey INNER JOIN
        dbo.ApiRouters ON dbo.LogClientApi.ApiRouterID = dbo.ApiRouters.ID;