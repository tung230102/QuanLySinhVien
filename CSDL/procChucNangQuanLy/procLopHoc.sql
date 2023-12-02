/* ================================================== Tạo PROCEDURE cho lớp học ================================================== */
USE QuanLySinhVien
-- Tạo proc selectAllLopHoc
CREATE PROC selectAllLopHoc
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(@tukhoa);
	SELECT 
		l.malophoc,
		l.mamonhoc,
		m.tenmonhoc,
		m.sotinchi,
		g.hoten ,
		CASE WHEN l.daketthuc = 1 THEN N'Đã kết thúc'
				ELSE N'Đang mở' END trangthai
	FROM tblLopHoc l
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	WHERE  m.tenmonhoc LIKE '%'+@tukhoa+'%'
	OR LOWER(hoten) LIKE '%'+@tukhoa+'%';
END

-- Tạo proc insertLopHoc
CREATE PROC insertLopHoc
	@nguoitao varchar(30),
	@magiaovien int,
	@mamonhoc int
AS
BEGIN
	INSERT INTO tblLopHoc(nguoitao, mamonhoc, magiaovien)
	VALUES(@nguoitao, @mamonhoc, @magiaovien);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END

--  Tạo proc updateLopHoc
CREATE PROC updateLopHoc
	@nguoicapnhat varchar(30),
	@malophoc bigint,
	@magiaovien int,
	@mamonhoc int
AS
BEGIN
	UPDATE tblLopHoc
	SET
		ngaycapnhat = GETDATE(),
		nguoicapnhat = @nguoicapnhat,		
		magiaovien = @magiaovien,
		mamonhoc = @mamonhoc
	WHERE malophoc = @malophoc;
	IF @@ROWCOUNT > 0 BEGIN RETURN 1 END
	ELSE BEGIN RETURN 0 END;
END

--  Tạo proc selectLopHoc
CREATE PROC selectLopHoc
	@malophoc bigint
AS
BEGIN
	SELECT
		m.tenmonhoc,
		g.magiaovien,
		l.mamonhoc
	FROM tblLopHoc l
	INNER JOIN tblGiaoVien g ON l.magiaovien = g.magiaovien
	INNER JOIN tblMonHoc m ON l.mamonhoc = m.mamonhoc
	WHERE malophoc = @malophoc;
END

--  Tạo proc deleteLopHoc
CREATE PROC deleteLopHoc
    @malophoc bigint
AS
BEGIN
    BEGIN TRY
        DELETE FROM tblLopHoc
        WHERE malophoc = @malophoc;
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END