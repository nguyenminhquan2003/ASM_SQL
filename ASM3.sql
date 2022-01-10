USE ASM
GO
--Tạo bảng khách hàng
CREATE TABLE KhachHang1(
   ID_Khach_Hang int PRIMARY KEY,
   Ten_Khach_Hang nvarchar(155),
   So_CMT nvarchar(33),
   Dia_Chi nvarchar(255)
)
GO

--Tạo bảng loại thuê bao
CREATE TABLE LoaiThueBao(
   ID_Loai_Thue_Bao int PRIMARY KEY,
   Ten_Loai_Thue_Bao nvarchar(99),
   Phi_Moi_Thang Money
)
GO

--Tạo bảng thuê bao
CREATE TABLE ThueBao1(
   ID_Thue_Bao int PRIMARY KEY,
   ID_Khach_Hang int FOREIGN KEY REFERENCES KhachHang1(ID_Khach_Hang),
   So_Dien_Thoai nvarchar(20),
   ID_Loai_Thue_Bao int FOREIGN KEY REFERENCES LoaiThueBao(ID_Loai_Thue_Bao),
   Ngay_Dang_Ky Date, 
   Ngay_Ket_Thuc Date,
   Trang_Thai nvarchar(99)
)
GO

--Thêm dữ liệu vào trong bảng
INSERT INTO KhachHang1(ID_Khach_Hang, Ten_Khach_Hang, So_CMT, Dia_Chi) VALUES
   (101,N'PHẠM MINH ĐỨC','123456789',N'50 Nguyễn Văn Lộc, Quận Hà Đông, Hà Nội'),
   (102,N'TRẦN MINH TUÂN','001234567',N'8 Thái Hà, Quận Đống Đa, Hà Nội'),
   (103,N'LÊ HẢI YẾN','003456789',N'2/208 Nguyễn Văn Cừ, Long Biên, Hà Nội'),
   (104,N'ĐỖ HOÀNG THÚY QUỲNH','124567890',N'54 Hàng Điếu, Hoàn Kiếm, Hà Nội'),
   (105,N'PHẠM TUẤN MINH','123456780',N'68 Quán Sứ, Hoàn Kiếm, Hà Nội')
GO

--4.1.Hiển thị toàn bộ thông tin của các khách hàng của công ty.
SELECT * FROM KhachHang1
GO

INSERT INTO LoaiThueBao(ID_Loai_Thue_Bao, Ten_Loai_Thue_Bao, Phi_Moi_Thang) VALUES
   (1, N'Trả Trước', 200000),
   (2, N'Trả Sau', 350000)
GO
SELECT * FROM LoaiThueBao

INSERT INTO ThueBao1(ID_Thue_Bao , ID_Khach_Hang, So_Dien_Thoai, ID_Loai_Thue_Bao, Ngay_Dang_Ky, Ngay_Ket_Thuc, Trang_Thai)
   VALUES 
   (200,101,'123456789',2,'2021/9/9','2021/11/9',N'Ngưng Hoạt Động'),
   (201,102,'123456788',1,'2021/9/9','2022/3/9',N'Đang Hoạt Động'),
   (202,103,'123456778',1,'2012/12/9','2013/3/4',N'Ngưng Hoạt Động'),
   (203,104,'123456768',2,'2021/10/11','2022/1/11',N'Đang Hoạt Động'),
   (204,105,'123456669',1,'2021/12/12','2022/3/1',N'Đang Hoạt Động')
GO

--4.2.Hiển thị toàn bộ thông tin của các số thuê bao của công ty.
SELECT * FROM ThueBao1
GO

--5.1.Hiển thị toàn bộ thông tin của thuê bao có số: 123456789
SELECT ID_Thue_Bao , ID_Khach_Hang, So_Dien_Thoai, ID_Loai_Thue_Bao, Ngay_Dang_Ky, Ngay_Ket_Thuc, Trang_Thai FROM ThueBao1
WHERE So_Dien_Thoai='123456789'
GO

--5.2.Hiển thị thông tin về khách hàng có số CMTND: 123456789
SELECT ID_Khach_Hang, Ten_Khach_Hang, So_CMT, Dia_Chi FROM KhachHang1 WHERE So_CMT='123456789'
GO

--5.3.Hiển thị các số thuê bao của khách hàng có số CMTND: 123456789
SELECT ID_Thue_Bao , ID_Khach_Hang, So_Dien_Thoai, ID_Loai_Thue_Bao, Ngay_Dang_Ky, Ngay_Ket_Thuc, Trang_Thai FROM ThueBao1 WHERE ID_Khach_Hang=101
GO

--5.4.Liệt kê các thuê bao đăng ký vào ngày 12/12/09
SELECT ID_Thue_Bao , ID_Khach_Hang, So_Dien_Thoai, ID_Loai_Thue_Bao, Ngay_Dang_Ky, Ngay_Ket_Thuc, Trang_Thai FROM ThueBao1
WHERE Ngay_Dang_Ky='2012/12/9'
GO

--5.5.Liệt kê các thuê bao có địa chỉ tại Hà Nội
SELECT ThueBao1.ID_Thue_Bao, KhachHang1.Ten_Khach_Hang, ThueBao1.So_Dien_Thoai, KhachHang1.Dia_Chi
FROM ThueBao1, KhachHang1
WHERE ThueBao1.ID_Khach_Hang = KhachHang1.ID_Khach_Hang
GO

--6.1.Tổng số khách hàng của công ty.
SELECT COUNT(*) AS N'Tổng Số Khách Hàng Của Công Ty' FROM KhachHang1
GO

--6.2.Tổng số thuê bao của công ty.
SELECT COUNT(*) AS N'Tổng Số Thuê Bao Của Công Ty' FROM ThueBao1
GO

--6.3.Tổng số thuê bào đăng ký ngày 12/12/09.
SELECT COUNT(*) AS N'Tổng Số Thuê Bao Đăng Ký Ngày 12/12/09' FROM ThueBao1 WHERE Ngay_Dang_Ky ='2012/12/9'
GO

--6.4.Hiển thị toàn bộ thông tin về khách hàng và thuê bao của tất cả các số thuê bao.
SELECT KhachHang1.Ten_Khach_Hang, KhachHang1.So_CMT, KhachHang1.Dia_Chi, ThueBao1.ID_Thue_Bao, ThueBao1.So_Dien_Thoai
, ThueBao1.Trang_Thai FROM ThueBao1, KhachHang1
WHERE ThueBao1.ID_Khach_Hang = KhachHang1.ID_Khach_Hang
GO

--7.1.Viết câu lệnh để thay đổi trường ngày đăng ký là not null.
ALTER TABLE ThueBao1 
ALTER COLUMN Ngay_Dang_Ky nvarchar NOT NULL
GO

--7.2.Viết câu lệnh để thay đổi trường ngày đăng ký là trước hoặc bằng ngày hiện tại.
ALTER TABLE ThueBao1
ADD CONSTRAINT TB CHECK (Ngay_Dang_Ky <= GETDATE())
GO

--7.3.Viết câu lệnh để thay đổi số điện thoại phải bắt đầu 09
GO
--7.4.Viết câu lệnh để thêm trường số điểm thưởng cho mỗi số thuê bao.
ALTER TABLE ThueBao1
ADD So_Diem_Thuong int