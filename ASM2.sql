CREATE DATABASE ASM
GO

USE ASM
GO

CREATE TABLE HangSanXuat(
	MaHangSanXuat int PRIMARY KEY,
	TenHangSanXuat nvarchar(150),
	DiachiHang nvarchar(200),
	SoDienThoai nvarchar(40)
)
GO

CREATE TABLE LoaiSanPham(
   MaLoaiSanPham int IDENTITY PRIMARY KEY,
   DongSanPham nvarchar(55)
)
GO

CREATE TABLE SanPham(
	MaSanPham nvarchar(40) PRIMARY KEY,
	MaLoaiSanPham int FOREIGN KEY REFERENCES LoaiSanPham(MaLoaiSanPham),
	TenSanPham nvarchar(200),
	DonVi nvarchar(40),
	GiaTien money,
	MoTaSanPham nvarchar(300)
)
GO

CREATE TABLE Kho1(
	MaSanPham nvarchar(40) FOREIGN KEY REFERENCES SanPham(MaSanPham),
	MaHangSanXuat int FOREIGN KEY REFERENCES HangSanXuat(MaHangSanXuat),
	SoluongSanPham int,
	TinhTrangSanPham nvarchar(60),
	NgayNhapHang Date
)
GO

--3.Thêm Dữ Liệu Vào Bảng
INSERT INTO HangSanXuat(MaHangSanXuat,TenHangSanXuat,DiachiHang,SoDienThoai) VALUES
    (123,'ASUS',N'194/3 Nguyễn Trọng Tuyển , Phường 8, Quận Phú Nhuận','090 2567 5066'),
	(124,'DELL',N'26 P.Yên Lãng, Láng Hạ, Đống Đa, Hà Nội','024 3537 5858'),
	(125,'OPPO',N'348 Kim Ngưu, Minh Khai, Hai Bà Trưng, Hà Nội','024 3633 3737'),
	(126,'APPLE',N'228 P. Lê Thanh Nghị, Đồng Tâm, Hai Bà Trưng, Hà Nội',' 098 247 4488'),
	(127,'HP',N'74 Cửa Bắc, Quán Thánh, Ba Đình, Hà Nội',' 1800 588 868')
GO

INSERT INTO LoaiSanPham(DongSanPham) VALUES
    (N'Laptop'),
	(N'Điện thoại')
GO
SELECT * FROM LoaiSanPham
GO

INSERT INTO SanPham(MaSanPham,MaLoaiSanPham,TenSanPham,DonVi,GiaTien,MoTaSanPham) VALUES
    ('A21',2,'Asus Rog Phone 3',N'Chiếc',15900000,N'Còn hàng'),
	('A19',2,'ASUS ZenFone Go',N'Chiếc', 990000,N'Còn hàng'),
	('A271',1,'Laptop Asus Zenbook Duo UX482EA-KA274T',N'Chiếc',32690000,N'Còn hàng'),
	('B191',1,'Dell Precision 5510 Core i7',N'Chiếc',19500000,N'Hết hàng'),
	('B173',1,'Laptop Dell Inspiron 15 5000 I5502 1M9GD',N'Chiếc',19190000,N'Còn hàng'),
	('C24',2,'Điện thoại OPPO A94 8GB-128GB',N'Chiếc',2900000,N'Hết hàng'),
	('D21',2,'Apple iPhone 13',N'Chiếc',21790000,N'Hết hàng'),
	('D24',1,'MVVK2 - MacBook Pro 16 inch 2019',N'Chiếc',56000000,N'Còn hàng'),
	('E1',1,'Laptop HP 240 G8',N'Chiếc',16500000,N'Còn hàng')
GO

INSERT INTO Kho1(MaHangSanXuat,MaSanPham,SoluongSanPham,TinhTrangSanPham,NgayNhapHang) VALUES
    ('123','A21',30,N'Còn hàng','2021-11-1'),
	('123','A19',12,N'Còn hàng','2021-12-3'),
	('123','A271',7,N'Còn hàng','2021-3-2'),
	('124','B191',0,N'Hết hàng','2021-10-12'),
	('124','B173',8,N'Còn hàng','2021-11-1'),
	('125','C24',0,N'Hết hàng','2021-9-8'),
	('126','D21',0,N'Hết hàng','2021-12-1'),
	('126','D24',10,N'Còn hàng','2021-12-1'),
	('127','E1',8,N'Còn hàng','2021-11-1')
GO

SELECT * FROM Kho1
GO
--4.1.Hiển Thị Các Hãng Sản Xuất
SELECT * FROM HangSanXuat
GO

--4.2.Hiển Thị Tất Cả Các Sản Phẩm
SELECT * FROM SanPham
GO

--5.1.Liệt kê danh sách hãng theo thứ tự ngược với alphabet của tên.
SELECT * FROM HangSanXuat
ORDER BY TenHangSanXuat DESC
GO

--5.2.Liệt kê danh sách sản phẩm của cửa hàng theo thứ tự giá giảm dần.
SELECT * FROM SanPham
ORDER BY GiaTien DESC
GO

--5.3.Hiển thị thông tin của hãng Asus.
SELECT MaHangSanXuat, TenHangSanXuat, DiachiHang, SoDienThoai 
FROM HangSanXuat WHERE TenHangSanXuat = 'ASUS'
GO

--5.4.Hiển thị danh sách sản phẩm còn ít hơn 11 chiếc trong kho 
SELECT MaHangSanXuat, MaSanPham,SoluongSanPham,TinhTrangSanPham,NgayNhapHang
FROM Kho1 WHERE SoluongSanPham < 11
GO

--5.5.Liệt kê danh sách sản phẩm của hãng Asus
SELECT MaSanPham FROM Kho1 WHERE MaHangSanXuat = 123
GO

--6.1.Số hãng sản phẩm mà cửa hàng có.
SELECT TenHangSanXuat FROM HangSanXuat
GO

--6.2.Số mặt hàng mà cửa hàng bán.
SELECT DongSanPham FROM LoaiSanPham 
GO

--6.3.Tổng số loại sản phẩm của mỗi hãng có trong cửa hàng.
SELECT COUNT(*) AS N'Tổng Số Loại Sản Phẩm Của Hãng ASUS Trong Cửa Hàng' FROM Kho1 WHERE MaHangSanXuat = 123
GO

SELECT COUNT(*) AS N'Tổng Số Loại Sản Phẩm Của Hãng DELL Trong Cửa Hàng' FROM Kho1 WHERE MaHangSanXuat = 124
GO

SELECT COUNT(*) AS N'Tổng Số Loại Sản Phẩm Của Hãng OPPO Trong Cửa Hàng' FROM Kho1 WHERE MaHangSanXuat = 125
GO

SELECT COUNT(*) AS N'Tổng Số Loại Sản Phẩm Của Hãng APPLE Trong Cửa Hàng' FROM Kho1 WHERE MaHangSanXuat = 126
GO

SELECT COUNT(*) AS N'Tổng Số Loại Sản Phẩm Của Hãng HP Trong Cửa Hàng' FROM Kho1 WHERE MaHangSanXuat = 127
GO

--6.4.Tổng số đầu sản phẩm của toàn cửa hàng.
SELECT COUNT(*) AS N'Tổng số đầu sản phẩm của toàn cửa hàng' FROM SanPham 
GO

--7.1.Viết câu lệnh để thay đổi trường giá tiền của từng mặt hàng là dương(>0).
ALTER TABLE SanPham
ADD CONSTRAINT Gia_Tien CHECK(GiaTien > 0)
GO

--7.2.Viết câu lệnh để thay đổi số điện thoại phải bắt đầu bằng 0.
GO
--7.3.Viết các câu lệnh để xác định các khóa ngoại và khóa chính của các bảng.
GO
