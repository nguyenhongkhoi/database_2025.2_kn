-- 1. Chuyển sang dùng database bạn đã tạo
USE HocTapMS;
GO

-- 2. Kiểm tra nếu bảng chưa có thì mới tạo (tránh lỗi Msg 2714)
IF NOT EXISTS (SELECT * FROM sys.tables WHERE name = 'DanhSachLop')
BEGIN
    CREATE TABLE DanhSachLop (
        ID_Lop INT PRIMARY KEY IDENTITY(1,1),
        TenLop NVARCHAR(50),
        PhongHoc VARCHAR(10)
    );
END
GO

-- 3. Thêm dữ liệu mới
INSERT INTO DanhSachLop (TenLop, PhongHoc)
VALUES (N'Lớp Cấu trúc dữ liệu', 'P.302'), (N'Lớp Cơ sở dữ liệu', 'P.405');
GO

-- 4. Lệnh quan trọng nhất để HIỆN BẢNG
SELECT * FROM DanhSachLop;
SELECT * FROM KhoaHoc; -- Hiện lại cả bảng cũ của bạn