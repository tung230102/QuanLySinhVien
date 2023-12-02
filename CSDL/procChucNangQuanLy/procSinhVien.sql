/* ================================================== Tạo PROCEDURE cho sinh viên ================================================== */
USE QuanLySinhVien
-- Tạo proc selectAllSinhVien
CREATE PROC selectAllSinhVien
	@tukhoa nvarchar(50)
AS
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	select 
		masinhvien,
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) as ngaysinh,
		CASE WHEN gioitinh = 1 THEN 'Nam' ELSE N'Nữ' END AS gioitinh,
		quequan, diachi, dienthoai, email
	FROM tblSinhVien
	WHERE LOWER(hoten) LIKE '%'+@tukhoa+'%'
	OR LOWER(email) LIKE '%'+@tukhoa+'%'
	OR LOWER(diachi) LIKE '%'+@tukhoa+'%'
	OR LOWER(dienthoai) LIKE '%'+@tukhoa+'%'
	ORDER BY hoten;

--  Tạo proc insertSinhVien
CREATE PROC insertSinhVien
	@hoten nvarchar(50), @ngaysinh date, 
	@gioitinh tinyint, @quequan nvarchar(150),
	@diachi nvarchar(150), @dienthoai varchar(30), 
	@email varchar(150)
AS
BEGIN
	INSERT INTO tblSinhVien(masinhvien, hoten, ngaysinh, gioitinh, quequan, diachi, dienthoai, email)
	VALUES('SV' + CAST(NEXT VALUE FOR sinhvienSeq AS varchar(30)), @hoten, @ngaysinh, @gioitinh, @quequan, @diachi, @dienthoai, @email);
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END;

--  Tạo proc updateSinhVien
CREATE PROC updateSinhVien
	@masinhvien varchar(50),
	@hoten nvarchar(50),
	@ngaysinh date,
	@gioitinh tinyint,
	@quequan nvarchar(150),
	@diachi nvarchar(150),
	@dienthoai varchar(30),
	@email varchar(150)
AS
BEGIN
	UPDATE tblSinhVien
	SET 
		hoten = @hoten,
		ngaysinh = @ngaysinh, gioitinh = @gioitinh,
		quequan = @quequan, diachi = @diachi,
		dienthoai = @dienthoai, email = @email
	WHERE masinhvien = @masinhvien;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END 
	ELSE BEGIN RETURN 0 END;
END;

--  Tạo proc selectSinhVien
CREATE PROC selectSinhVien
	@masinhvien varchar(50)
AS
BEGIN
	SELECT
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) AS ngaysinh,
		gioitinh,
		quequan, diachi, dienthoai, email
	FROM tblSinhVien
	WHERE masinhvien = @masinhvien;
END

--  Tạo proc deleteSinhVien
CREATE PROC deleteSinhVien
    @masinhvien varchar(50)
AS
BEGIN
    BEGIN TRY
		delete from tblSinhVien where masinhvien = @masinhvien
		delete from tblDiem where masinhvien = @masinhvien
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END