/* ================================================== Tạo PROCEDURE cho môn học đăng ký chức năng sinh viên ================================================== */
USE QuanLySinhVien
--  Tạo proc monDaDKy --
CREATE PROC monDaDKy
	@masinhvien varchar(50)
AS
BEGIN
	SELECT 
		l.malophoc,
		m.tenmonhoc,
		g.hoten,
		m.sotinchi,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE l.daketthuc = 0
	AND d.masinhvien = @masinhvien
END

--  Tạo proc dKyHoc
CREATE PROC dKyHoc
	@masinhvien varchar(50),
	@malophoc bigint
AS
BEGIN
	DECLARE @v_lanhoc int,
			@v_mamonhoc int,
			@v_dadangky int;
	SELECT @v_mamonhoc = mamonhoc
	FROM tblLopHoc
	WHERE malophoc = @malophoc;

	SELECT @v_lanhoc = COUNT(*)
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 1
	AND d.masinhvien = @masinhvien
	AND l.mamonhoc = @v_mamonhoc;

	SELECT @v_dadangky = COUNT(*)
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 0
	AND l.mamonhoc = @v_mamonhoc
	AND d.masinhvien = @masinhvien; 

	IF @v_dadangky>0 RETURN -1;

	SET @v_lanhoc = @v_lanhoc + 1;

	INSERT INTO tblDiem(nguoitao, masinhvien, malophoc, lanhoc)
	VALUES(@masinhvien, @masinhvien, @malophoc, @v_lanhoc);
	
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END

-- Tạo proc dsLopChuaDKy
CREATE PROC dsLopChuaDKy
	@masinhvien varchar(50)
AS
BEGIN
	SELECT
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		g.hoten
	FROM tblLopHoc l
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	INNER JOIN tblMonHoc m on l.mamonhoc = m.mamonhoc
	WHERE l.daketthuc = 0
	AND l.malophoc NOT IN (SELECT malophoc FROM tblDiem WHERE masinhvien = @masinhvien);
END

-- Tạo proc traCuuDiem
CREATE PROC traCuuDiem
	@masinhvien varchar(50),
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);

	SELECT 
		m.mamonhoc,
		m.tenmonhoc,
		d.lanhoc,
		g.hoten,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblLopHoc l ON d.malophoc = l.malophoc
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE l.daketthuc = 1
	AND d.masinhvien = @masinhvien
	AND (LOWER(m.tenmonhoc) LIKE '%'+@tukhoa+'%' OR LOWER(g.hoten) LIKE '%'+@tukhoa+'%');
END