SELECT        TblLibraryFolder.FolderName, TblHoSoVB.SoHoSo, TblHoSoVB.TenHoSo, TblHoSoVB.NguoiSuDung, TblHoSoVB.DiaChiChiTiet, MstViTriKho.TenKho, MstViTriGia.TenGia, TblHoSoVB.ViTriGhiChu
FROM            MstViTriGia INNER JOIN
                         MstViTriKho ON MstViTriGia.KhoID = MstViTriKho.KhoID INNER JOIN
                         TblHoSoVB ON MstViTriKho.KhoID = TblHoSoVB.ViTriKhoID INNER JOIN
                         TblLibraryFolder ON TblHoSoVB.LoaiHoSoID = TblLibraryFolder.FolderID
WHERE        (TblHoSoVB.LoaiHoSoID IN (6, 7, 8, 15, 16, 17, 18, 19, 20))
