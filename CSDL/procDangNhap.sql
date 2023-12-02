/* ================================================== Tạo PROCEDURE cho đăng nhập ================================================== */
USE QuanLySinhVien
--  Tạo proc dangnhap
CREATE PROC dangnhap
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50),
	@matkhau varchar(50)
AS
BEGIN
	IF @loaitaikhoan = 'admin' 
		SELECT * FROM tblTaiKhoan WHERE tentaikhoan = @taikhoan AND matkhau = @matkhau
		ELSE IF @loaitaikhoan = 'gv' 
			SELECT * FROM tblGiaoVien WHERE CAST(magiaovien AS varchar(50)) = @taikhoan AND matkhau = @matkhau
		ELSE SELECT * FROM tblSinhVien WHERE masinhvien = @taikhoan AND matkhau = @matkhau ;
END

--  Tạo proc selectTaiKhoan
CREATE PROC selectTaiKhoan
	@loaitaikhoan varchar(10),
	@taikhoan varchar(50)
AS
BEGIN
	IF @loaitaikhoan = 'admin' 
		SELECT tentaikhoan, matkhau FROM tblTaiKhoan WHERE tentaikhoan = @taikhoan
		ELSE IF @loaitaikhoan = 'gv' 
			SELECT magiaovien, matkhau FROM tblGiaoVien WHERE CAST(magiaovien AS varchar(50)) = @taikhoan
		ELSE SELECT masinhvien, matkhau FROM tblSinhVien WHERE masinhvien = @taikhoan;
END

--  Tạo proc doiMatKhau
CREATE PROC doiMatKhau
    @loaitaikhoan varchar(10),
    @taikhoan varchar(50),
    @matkhau varchar(50)
AS
BEGIN 
    IF @loaitaikhoan = 'admin' 
        UPDATE tblTaiKhoan SET matkhau = @matkhau WHERE tentaikhoan = @taikhoan
    ELSE IF @loaitaikhoan = 'gv' 
        UPDATE tblGiaoVien SET matkhau = @matkhau WHERE CAST(magiaovien AS varchar(50)) = @taikhoan
    ELSE 
        UPDATE tblSinhVien SET matkhau = @matkhau WHERE masinhvien = @taikhoan;
END

