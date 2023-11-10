DECLARE @MaDK  int = 928012934;
delete DangKyNGSDD where  maGCN = (SELECT MaGCN FROM GCNQSDD WHERE (MaDangKy = @MaDK))
delete DangKyMDSDD where maGCN = (SELECT MaGCN FROM GCNQSDD WHERE (MaDangKy = @MaDK))
delete GCNQSDD where maGCN = (SELECT MaGCN FROM GCNQSDD WHERE (MaDangKy = @MaDK))
delete DangKyQSDD where MaDangKy = @MaDK