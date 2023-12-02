/* ================================================== Tạo PROCEDURE chức năng giáo viên ================================================== */
USE QuanLySinhVien
-- Tạo proc traCuuLop
CREATE PROC traCuuLop
	@magiaovien int,
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);
	SELECT 
		tb.malophoc,
		tb.mamonhoc,
		tb.tenmonhoc,
		tb.sotinchi,
		COUNT(d.masinhvien) AS siso
	FROM
	(
		SELECT 
			l.malophoc,
			l.mamonhoc,
			m.tenmonhoc,
			m.sotinchi
		FROM tblLopHoc l
		INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
		WHERE daketthuc = 0
		AND magiaovien = @magiaovien
		AND LOWER(m.tenmonhoc) LIKE '%'+@tukhoa+'%'
	) as tb INNER JOIN tblDiem d ON d.malophoc = tb.malophoc
	GROUP BY tb.malophoc, tb.mamonhoc, tb.tenmonhoc,
		tb.sotinchi;
END

-- Tạo proc dssv
CREATE PROC dssv
	@malophoc bigint,
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);
	SELECT 
		d.masinhvien,
		s.hoten,
		d.lanhoc,
		d.diemthilan1,
		d.diemthilan2
	FROM tblDiem d
	INNER JOIN tblSinhVien s on d.masinhvien = s.masinhvien
	WHERE d.malophoc = @malophoc
	and LOWER(s.hoten) like '%'+@tukhoa+'%'
END

-- Tạo proc chamdiem
CREATE PROC chamdiem
	@magiaovien varchar(10),
	@malop bigint,
	@masinhvien varchar(30),
	@diemlan1 float,
	@diemlan2 float
AS
BEGIN
UPDATE tblDiem
SET
    ngaycapnhat = GETDATE(),
    nguoicapnhat = @magiaovien,
    diemthilan1 = @diemlan1,
    diemthilan2 = @diemlan2
	WHERE malophoc = @malop AND masinhvien = @masinhvien;
END

-- Tạo proc ketThucHocPhan
CREATE PROC ketThucHocPhan
	@magiaovien varchar(30),
	@malop bigint
AS
BEGIN
	UPDATE tblLopHoc
	SET
		nguoicapnhat = @magiaovien,
		ngaycapnhat = GETDATE(),
		daketthuc = 1
	WHERE malophoc = @malop;
	IF @@ROWCOUNT > 0 RETURN 1
	ELSE RETURN 0;
END