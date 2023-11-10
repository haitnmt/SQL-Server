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