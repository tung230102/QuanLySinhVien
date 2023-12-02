/* ================================================== Tạo PROCEDURE cho môn học ================================================== */
USE QuanLySinhVien
--  Tạo proc selectAllMonHoc
CREATE PROC selectAllMonHoc
	@tukhoa nvarchar(50)
AS
BEGIN
	SET @tukhoa = LOWER(LTRIM(RTRIM(@tukhoa)));
	SELECT 
		mamonhoc,
		tenmonhoc,
		sotinchi
	FROM tblMonHoc
	WHERE mamonhoc LIKE '%'+@tukhoa+'%'
	OR LOWER(tenmonhoc) LIKE '%'+@tukhoa+'%'
	ORDER BY tenmonhoc;	
END;

--  Tạo proc insertMonHoc
CREATE PROC insertMonHoc
	@nguoitao varchar(30),
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	INSERT INTO tblMonHoc(nguoitao,tenmonhoc,sotinchi)
	VALUES(@nguoitao,@tenmonhoc,@sotinchi);
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END

--  Tạo proc updateMonHoc
CREATE PROC updateMonHoc
	@nguoicapnhat varchar(30),
	@mamonhoc bigint,
	@tenmonhoc nvarchar(150),
	@sotinchi int
AS
BEGIN
	UPDATE tblMonHoc
	SET
		nguoicapnhat = @nguoicapnhat,
		ngaycapnhat = GETDATE(),
		tenmonhoc = @tenmonhoc,
		sotinchi = @sotinchi
	WHERE mamonhoc = @mamonhoc;
	IF @@ROWCOUNT > 0 RETURN 1 ELSE RETURN 0;
END

--  Tạo proc selectMonHoc
CREATE PROC selectMonHoc
	@mamh int
AS
BEGIN
	SELECT 
		tenmonhoc,
		sotinchi
	FROM tblMonHoc
	WHERE mamonhoc = @mamh;
END

--  Tạo proc deleteMonHoc
CREATE PROC deleteMonHoc
    @mamonhoc INT
AS
BEGIN
    BEGIN TRY
		DELETE FROM tblLopHoc
        WHERE mamonhoc = @mamonhoc;
		DELETE FROM tblMonHoc
        WHERE mamonhoc = @mamonhoc;
        RETURN 1;
    END TRY
    BEGIN CATCH
        RETURN 0;
    END CATCH
END