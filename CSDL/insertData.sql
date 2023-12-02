/* ================================================== Chèn dữ liệu vào bảng ================================================== */
-- Chèn dữ liệu bảng tài khoản
USE QuanLySinhVien
INSERT tblTaiKhoan(tentaikhoan, matkhau) VALUES('admin', 'admin');

-- Chèn dữ liệu bảng sinh viên
CREATE SEQUENCE sinhvienSeq
	START WITH 10
    INCREMENT BY 1;

INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Trần Thanh Tuấn', '2002-07-03', 1, N'Thái Bình', N'Hà Nội', '20111062342', '20111062342@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Nguyễn Huy Tùng', '2002-01-23', 1, N'Hà Nam', N'Hà Nội', '0917743489', '20111064266@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Lê Anh Tuấn', '2002-12-22', 1, N'Thanh Hóa', N'Hà Nội', '20111063724', '20111063724@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Đỗ Văn Tư', '2002-02-27', 1, N'Nam Định', N'Hà Nội', '20111063768', '20111063768@hunre.edu.vn');

INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Vũ Duy Việt', '2002-09-28', 1, N'Hà Nam', N'Hà Nội', '20111062379', '20111062379@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Phạm Văn Cường', '2000-12-1', 1, N'Thanh Hóa', N'Hà Nội', '20111062521', '20111062521@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Lê Thị Trà', '2002-12-22', 0, N'Thanh Hóa', N'Hà Nội', '20111063724', '20111063724@hunre.edu.vn');
INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
VALUES('sv' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), 
N'Trần Thị Hiền', '2002-01-01', 0, N'Nam Định', N'Hà Nội', '20111062317', '20111062317@hunre.edu.vn');

-- Chèn dữ liệu bảng giáo viên
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Nguyễn Văn Hách', '1999-01-01', 1, N'Hà Nội', '1111111111', 'nvhachh@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Đặng Thị Khánh Linh', '1999-02-02', 0, N'Hà Nội', '2222222222', 'dtklinh@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Lê Thị Vui', '1999-03-03', 0, N'Hà Nội', '3333333333', 'ltvui@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Thầy Quang', '1999-04-04', 1, N'Hà Nội', '4444444444', 'quang@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Đào Thị Phương Anh', '1999-05-05', 0, N'Hà Nội', '5555555555', 'dtpanh@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Lê Thị Thu Hà', '1999-06-06', 0, N'Hà Nội', '6666666666', 'lttha@hunre.edu.vn');
INSERT INTO tblGiaoVien(hoten, ngaysinh, gioitinh, diachi, dienthoai, email)
VALUES(N'Trương Mạnh Đạt', '1999-07-07', 1, N'Hà Nội', '7777777777', 'tmdat@hunre.edu.vn');

-- Chèn dữ liệu bảng môn học
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Phát triển ứng dụng mạng', 3);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Quản lý dự án phần mềm', 2);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Phát triển ứng dụng cho các thiết bị di động', 2);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Phát triển hệ thống thông tin Enterprise', 3);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Cơ sở dữ liệu phân tán và ứng dụng', 2);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Phát triển thông tin hệ thông tài nguyên và môi trường', 2);
INSERT INTO tblMonHoc(tenmonhoc, sotinchi)
VALUES(N'Phát triển phần mềm hướng dịch vụ', 3);

-- Chèn dữ liệu bảng lớp học
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(1, 1);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(2, 2);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(3, 3);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(4, 4);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(5, 5);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(6, 6);
INSERT INTO tblLopHoc(magiaovien, mamonhoc) VALUES(7, 7);

SELECT * FROM tblDiem
SELECT * FROM tblGiaoVien
SELECT * FROM tblLopHoc
SELECT * FROM tblMonHoc
SELECT * FROM tblSinhVien

DELETE FROM tblDiem
DELETE FROM tblLopHoc
DELETE FROM tblGiaoVien
DELETE FROM tblMonHoc
DELETE FROM tblSinhVien

DROP TABLE tblDiem
DROP TABLE tblLopHoc
DROP TABLE tblGiaoVien
DROP TABLE tblMonHoc
DROP TABLE tblSinhVien

DROP SEQUENCE sinhvienSeq
