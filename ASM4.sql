USE ASM
GO
--Tạo bảng nhân viêm
CREATE TABLE NhanVien01(
   MaNhanVien nvarchar(9) PRIMARY KEY,
   TenNhanVien nvarchar(155),
   NgaySinh Date,
   DiaChi nvarchar(155),
   SoDienThoai nvarchar(38)
)
GO
--Tạo bảng loại sản phẩm
CREATE TABLE LoaiSanPham01(
   MaLoaiSanPham nvarchar(10) PRIMARY KEY,
   TenLoaiSanPham nvarchar(99)
)
GO
--Tạo bảng sản phẩm
CREATE TABLE SanPham1(
   MaSanPham nvarchar(10) PRIMARY KEY,
   MaLoaiSanPham nvarchar(10) FOREIGN KEY REFERENCES LoaiSanPham01(MaLoaiSanPham),
   MaNhanVien nvarchar(9) FOREIGN KEY REFERENCES NhanVien01(MaNhanVien),
   TenSanPham nvarchar(98),
   TenThuongHieu nvarchar(98),
   GiaTien Money,
   SoLuong int,
   NgaySanXuat Date,
   TinhTrang nvarchar(98)
)
GO

--Thêm dữ liệu vào bảng
INSERT INTO NhanVien01(MaNhanVien, TenNhanVien, NgaySinh, DiaChi, SoDienThoai) VALUES 
   ('NV101',N'PHẠM TUẤN ANH','1998/6/6',N'26 P.Yên Lãng, Láng Hạ, Đống Đa, Hà Nội','012-3456-7891'),
   ('NV102',N'ĐÀO ĐỨC ANH','1999/2/2',N'348 Kim Ngưu, Minh Khai, Hai Bà Trưng, Hà Nội','098-7654-3211'),
   ('NV103',N'NGUYỄN VĂN AN','1998/7/7',N'50 Nguyễn Văn Lộc, Quận Hà Đông, Hà Nội','087-6543-2198'),
   ('NV104',N'NGUYỄN DUY ANH','1989/8/8',N'74 Cửa Bắc, Quán Thánh, Ba Đình, Hà Nội','099-8765-4321'),
   ('NV105',N'ĐÀO THU TRANG','1999/6/6',N'54 Hàng Điếu, Hoàn Kiếm, Hà Nội','098-9876-5432'),
   ('NV106',N'NGUYỄN THU HẢI','2001/3/2',N'2/208 Nguyễn Văn Cừ, Long Biên, Hà Nội','091-2345-6789')
GO

INSERT INTO LoaiSanPham01(MaLoaiSanPham, TenLoaiSanPham) VALUES
   ('Z37E',N'Laptop'),
   ('Z161',N'Điện thoại'),
   ('Z97C',N'Ipad')
GO

INSERT INTO SanPham1(MaSanPham, MaLoaiSanPham, MaNhanVien, TenSanPham, TenThuongHieu, GiaTien, SoLuong, NgaySanXuat, TinhTrang)
   VALUES 
   ('M416','Z37E','NV101','Laptop Dell Vostro 3500 V5I3001W','DELL',14490000,16,'2021/10/8',N'Còn hàng'),
   ('M24','Z37E','NV102','Apple MacBook Air 13 inch 128GB MQD32','APPLE',20000000,9,'2021/8/8',N'Còn hàng'),
   ('M14A6','Z37E','NV103','Laptop ASUS Vivobook X512JA-211','ASUS',19590000,0,'2021/4/3',N'Hết hàng'),
   ('A12','Z161','NV104','OPPO Reno6 Z 5G','OPPO',9490000,3,'2021/6/6',N'Còn hàng'),
   ('A31','Z161','NV105','Samsung Galaxy A32','SAMSUNG',6190000,10,'2021/4/4',N'Còn hàng'),
   ('A8','Z161','NV106','Xiaomi 11T 5G 128GB','XIAOMI',10390000,0,'2021/3/2',N'Hết hàng'),
   ('D18','Z97C','NV103','Apple iPad mini 6 WiFi 64GB','APPLE',14990000,0,'2021/1/3',N'Hết hàng'),
   ('D24','Z97C','NV105','iPad Air 10.9 2020 4G 64GB','APPLE',18500000,10,'2021/3/3',N'Còn hàng'),
   ('D99','Z97C','NV103','iPad Air 5','APPLE',NULL,NULL,'2022/1/20',N'Sắp về')
GO

--4.1.Liệt kê danh sách loại sản phẩm của công ty.
SELECT * FROM LoaiSanPham01
GO

--4.2.Liệt kê danh sách sản phẩm của công ty.
SELECT * FROM SanPham1
GO

--4.3.Liệt kê danh sách người chịu trách nhiệm của công ty.
SELECT * FROM NhanVien01
GO

--5.1.Liệt kê danh sách loại sản phẩm của công ty theo thứ tự tăng dần của tên
SELECT * FROM LoaiSanPham01
ORDER BY TenLoaiSanPham ASC
GO

--5.2.Liệt kê danh sách người chịu trách nhiệm của công ty theo thứ tự tăng dần của tên.
SELECT * FROM NhanVien01
ORDER BY TenNhanVien ASC
GO

--5.3.Liệt kê các sản phẩm của loại sản phẩm có mã số là Z37E.
SELECT TenSanPham FROM SanPham1 WHERE MaLoaiSanPham='Z37E'
GO

--5.4.Liệt kê các sản phẩm Nguyễn Văn An chịu trách nhiệm theo thứ tự giảm dần của mã.
SELECT MaNhanVien, TenSanPham FROM SanPham1 WHERE MaNhanVien='NV103'
ORDER BY MaNhanVien ASC
GO

--6.1.Số sản phẩm của từng loại sản phẩm.
SELECT COUNT(*) AS N'Tổng Số Sản Phẩm Của Z37E ' FROM SanPham1 WHERE MaLoaiSanPham='Z37E'
GO

SELECT COUNT(*) AS N'Tổng Số Sản Phẩm Của Z161 ' FROM SanPham1 WHERE MaLoaiSanPham='Z161'
GO

SELECT COUNT(*) AS N'Tổng Số Sản Phẩm Của Z97C ' FROM SanPham1 WHERE MaLoaiSanPham='Z97C'
GO

--6.2.Hiển thị toàn bộ thông tin về sản phẩm và loại sản phẩm.
SELECT * FROM SanPham1
GO

SELECT * FROM LoaiSanPham01
GO

--6.3.Hiển thị toàn bộ thông tin về người chịu trách nhiêm, loại sản phẩm và sản phẩm.
SELECT * FROM NhanVien01
GO

SELECT * FROM SanPham1
GO

SELECT * FROM LoaiSanPham01
GO

--7.1.Viết câu lệnh để thay đổi trường ngày sản xuất là trước hoặc bằng ngày hiện tại.
ALTER TABLE SanPham1
ADD CONSTRAINT SP CHECK (NgaySanXuat <= GETDATE())
GO

--7.2.Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
GO

--7.3.Viết câu lệnh để thêm trường phiên bản của sản phẩm.
ALTER TABLE SanPham1
ADD PhienBan nvarchar(10)