USE ASM
GO

CREATE TABLE Nguoi(
   IDNguoiBan int PRIMARY KEY,
   TenNguoiBan nvarchar(99),
   NgaySinh Date,
   DiaChi nvarchar(188)
)
GO

CREATE TABLE DanhBa(
   IDNguoiBan int FOREIGN KEY REFERENCES Nguoi(IDNguoiBan),
   SoDienThoai nvarchar(20)
)
GO
--Thêm dữ liệu
INSERT INTO Nguoi(IDNguoiBan,TenNguoiBan,NgaySinh,DiaChi) VALUES
   (1,N'Phạm Đức Minh','2002/12/03',N'50 Nguyễn Văn Lộc, Quận Hà Đông, Hà Nội'),
   (2,N'Nguyễn Văn An','2012/12/09',N'8 Thái Hà, Quận Đống Đa, Hà Nội'),
   (3,N'Võ Tuấn Minh','2001/3/2',N'2/208 Nguyễn Văn Cừ, Long Biên, Hà Nội'),
   (4,N'Trần Trung Hiếu','2000/3/18',N'54 Hàng Điếu, Hoàn Kiếm, Hà Nội')
GO

INSERT INTO DanhBa(IDNguoiBan,SoDienThoai) VALUES
   (1,'987654321'),
   (2,'09873452'),
   (2,'123456789'),
   (3,'09434343'),
   (4,'012345678')
GO

--4.1.Liệt kê danh sách những người trong danh bạ
SELECT * FROM Nguoi
GO

--4.2.Liệt kê danh sách số điện thoại có trong danh bạ
SELECT * FROM DanhBa
GO

--5.1.Liệt kê danh sách người trong danh bạ theo thứ thự alphabet.
SELECT * FROM Nguoi
ORDER BY TenNguoiBan
GO

--5.2.Liệt kê các số điện thoại của người có thên là Nguyễn Văn An.
SELECT SoDienThoai FROM DanhBa WHERE IDNguoiBan = 2
GO

--5.3.Liệt kê những người có ngày sinh là 12/12/09
SELECT TenNguoiBan FROM Nguoi WHERE NgaySinh = '2012/12/09'
GO

--6.1.Tìm số lượng số điện thoại của mỗi người trong danh bạ.
SELECT COUNT(*) AS N'Số điện thoại của Phạm Đức Minh' FROM DanhBa WHERE IDNguoiBan = 1
GO

SELECT COUNT(*) AS N'Số điện thoại của Nguyễn Văn An' FROM DanhBa WHERE IDNguoiBan = 2
GO

SELECT COUNT(*) AS N'Số điện thoại của Võ Tuấn Minh' FROM DanhBa WHERE IDNguoiBan = 3
GO

SELECT COUNT(*) AS N'Số điện thoại của Trần Trung Hiếu' FROM DanhBa WHERE IDNguoiBan = 4
GO

--6.2.Tìm tổng số người trong danh bạ sinh vào thang 12 ***
SELECT COUNT(*) AS N'tổng số người trong danh bạ sinh vào thang 12' FROM Nguoi WHERE NgaySinh
GO

--6.3.Hiển thị toàn bộ thông tin về người, của từng số điện thoại.
SELECT Nguoi.TenNguoiBan, Nguoi.NgaySinh, Nguoi.DiaChi, DanhBa.SoDienThoai FROM Nguoi , DanhBa
WHERE Nguoi.IDNguoiBan = DanhBa.IDNguoiBan
GO

--6.4.Hiển thị toàn bộ thông tin về người, của số điện thoại 123456789.
SELECT Nguoi.TenNguoiBan, Nguoi.NgaySinh, Nguoi.DiaChi, DanhBa.SoDienThoai FROM Nguoi , DanhBa
WHERE Nguoi.IDNguoiBan = DanhBa.IDNguoiBan AND DanhBa.SoDienThoai = '123456789'
GO

--7.1.Viết câu lệnh để thay đổi trường ngày sinh là trước ngày hiện tại.
UPDATE Nguoi SET NgaySinh= GETDATE() 
GO

--7.2.Viết câu lệnh để xác định các trường khóa chính và khóa ngoại của các bảng.
GO

--7.3.Viết câu lệnh để thêm trường ngày bắt đầu liên lạc.
ALTER TABLE ThueBao1
ADD NgayBatDauLienLac Date