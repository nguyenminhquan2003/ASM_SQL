-- Câu 8 ASM 1
USE Task04
GO
--8.1.Đặt chỉ mục (index) cho cột Tên hàng và Người đặt hàng để tăng tốc độ truy vấn dữ liệu trên các cột này.

CREATE INDEX IX_ProductName ON Product(ProductName)

CREATE INDEX IX_CustomerName ON Customer(CustomerName)
GO

/*8.2.Xây dựng các view sau đây:
◦ View_KhachHang với các cột: Tên khách hàng, Địa chỉ, Điện thoại
◦ View_SanPham với các cột: Tên sản phẩm, Giá bán
◦ View_KhachHang_SanPham với các cột: Tên khách hàng, Số điện thoại, Tên sản
phẩm, Số lượng, Ngày mua */

CREATE VIEW View_KhachHang AS
SELECT CustomerName, CustomerAddress, Tel
FROM Customer
GO

CREATE VIEW View_SanPham AS
SELECT ProductName, Price
FROM Product
GO

CREATE VIEW View_Orders_OrdersDetails1 AS
SELECT p.ProductID,p.Quantity,e.CustomerID FROM Orders e
JOIN OrderDetails AS p ON e.OrderID = p.OrderID
GO

CREATE VIEW View_Product_OrdersDetails AS
SELECT p.ProductName,p.Quantity ,e.CustomerID FROM View_Orders_OrdersDetails1 e
JOIN Product AS p ON e.ProductID = p.ProductID
GO

CREATE VIEW View_KhachHang_SanPham AS
SELECT p.CustomerName, p.Tel,  e.ProductName, e.Quantity FROM View_Product_OrdersDetails e
JOIN Customer AS p ON e.CustomerID = p.CustomerID
GO

--Câu 8 ASM2
/*8.1.Thiết lập chỉ mục (Index) cho các cột sau: Tên hàng và Mô tả hàng để tăng hiệu suất truy vấn
dữ liệu từ 2 cột này */

USE ASM
CREATE INDEX IX_TenSanPham ON SanPham(TenSanPham)
GO
CREATE INDEX IX_Motahang ON SanPham(MoTaSanPham)

GO
/*8.2.◦ View_SanPham: với các cột Mã sản phẩm, Tên sản phẩm, Giá bán
      ◦ View_SanPham_Hang: với các cột Mã SP, Tên sản phẩm, Hãng sản xuất */
CREATE VIEW View_SanPham AS
SELECT MaSanPham,TenSanPham,GiaTien FROM SanPham
GO

CREATE VIEW View_SanPham_Hang AS
SELECT p.MaSanPham,p.TenSanPham,e.MaHangSanXuat FROM Kho1 e
JOIN SanPham AS p ON e.MaSanPham = p.MaSanPham
GO

--Câu 8 ASM3
/*8.1.Đặt chỉ mục (Index) cho cột Tên khách hàng của bảng chứa thông tin khách hàng*/
CREATE INDEX IX_TenKhachHang ON KhachHang1(Ten_Khach_Hang)
CREATE INDEX IX_ThongTinKhachHang ON KhachHang1(ID_Khach_Hang,Ten_Khach_Hang,So_CMT,Dia_Chi)
GO
/*8.2.Viết các View sau:
◦ View_KhachHang: Hiển thị các thông tin Mã khách hàng, Tên khách hàng, địa chỉ
◦ View_KhachHang_ThueBao: Hiển thị thông tin Mã khách hàng, Tên khách hàng, Số
thuê bao*/
CREATE VIEW View_KhachHang AS
SELECT ID_Khach_Hang,Ten_Khach_Hang,Dia_Chi
FROM KhachHang1
GO

CREATE VIEW View_KhachHang_ThueBao AS
SELECT p.ID_Khach_Hang,p.Ten_Khach_Hang,e.So_Dien_Thoai
FROM ThueBao1 e
JOIN KhachHang1 AS p ON e.ID_Khach_Hang = p.ID_Khach_Hang
GO

--Câu 8 ASM4
/*1.Đặt chỉ mục (index) cho cột tên người chịu trách nhiệm*/
CREATE INDEX IX_NguoiChiuTrachNhiem ON NhanVien01(MaNhanVien,TenNhanVien,NgaySinh,DiaChi,SoDienThoai)
GO
/*2.Viết các View sau:
◦ View_SanPham: Hiển thị các thông tin Mã sản phẩm, Ngày sản xuất, Loại sản phẩm
◦ View_SanPham_NCTN: Hiển thị Mã sản phẩm, Ngày sản xuất, Người chịu trách nhiệm
◦ View_Top_SanPham: Hiển thị 5 sản phẩm mới nhất (mã sản phẩm, loại sản phẩm, ngày
sản xuất)*/
CREATE VIEW View_SanPham1 AS
SELECT p.MaSanPham,p.NgaySanXuat,e.TenLoaiSanPham
FROM LoaiSanPham01 e
JOIN SanPham1 AS p ON e.MaLoaiSanPham = p.MaLoaiSanPham
GO

CREATE VIEW View_SanPham_NCTN AS
SELECT p.MaSanPham,p.NgaySanXuat,e.TenNhanVien
FROM NhanVien01 e
JOIN SanPham1 AS p ON e.MaNhanVien = p.MaNhanVien
GO
