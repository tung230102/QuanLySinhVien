/* ================================================== Tạo PROCEDURE cho giáo viên ================================================== */
--  Tạo proc selectAllGiaoVien
USE QuanLySinhVien
CREATE PROC selectAllGiaoVien
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	SELECT 
		magiaovien,
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) as ngaysinh,
		CASE WHEN gioitinh = 1 THEN 'Nam' ELSE N'Nữ' END AS gioitinh,
		dienthoai,
		email,
		diachi
	FROM tblGiaoVien
	WHERE LOWER(hoten) LIKE '%'+@tukhoa+'%'
	OR LOWER(email) LIKE '%'+@tukhoa+'%'
	OR LOWER(dienthoai) LIKE '%'+@tukhoa+'%'
	OR LOWER(magiaovien) LIKE '%'+@tukhoa+'%'
	ORDER BY hoten;
END

--  Tạo proc insertGiaoVien
CREATE PROC insertGiaoVien
	@nguoitao varchar(30),
	@hoten nvarchar(50),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
AS
BEGIN
	INSERT INTO tblGiaoVien(nguoitao, hoten, gioitinh, ngaysinh, email, dienthoai, diachi)
	VALUES(@nguoitao, @hoten, @gioitinh, @ngaysinh, @email, @dienthoai, @diachi);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0 ;
END;

--  Tạo proc updateGiaoVien
CREATE PROC updateGiaoVien
	@magiaovien int,
	@nguoicapnhat varchar(30),
	@hoten nvarchar(50),
	@gioitinh tinyint,
	@ngaysinh date,
	@email varchar(150),
	@dienthoai varchar(30),
	@diachi nvarchar(150)
AS
BEGIN
	UPDATE tblGiaoVien
	SET nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = GETDATE(),
		hoten = @hoten,
		gioitinh = @gioitinh, ngaysinh = @ngaysinh, email = @email, dienthoai = @dienthoai, diachi = @diachi
	WHERE magiaovien = @magiaovien;
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END;

--  Tạo proc selectGiaoVien
CREATE PROC selectGiaoVien
	@magiaovien int
AS
BEGIN
	SELECT
		hoten,
		CONVERT(varchar(10), ngaysinh, 103) AS ngaysinh,
		gioitinh, 
		dienthoai, email, diachi
	FROM tblGiaoVien
	WHERE magiaovien = @magiaovien;
END

--  Tạo proc deleteGiaoVien
CREATE PROC deleteGiaoVien
    @magiaovien INT
AS
BEGIN
    BEGIN TRY
        DELETE FROM tblDiem
        WHERE malophoc IN (SELECT malophoc FROM tblLopHoc WHERE magiaovien = @magiaovien);

        DELETE FROM tblLopHoc
        WHERE magiaovien = @magiaovien;

        DELETE FROM tblGiaoVien
        WHERE magiaovien = @magiaovien;

        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END