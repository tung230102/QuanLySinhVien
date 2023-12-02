/* ================================================== Tạo PROCEDURE cho thống kê ================================================== */
USE QuanLySinhVien
-- Tạo proc selectDiemTongKetHocPhan
drop proc selectDiemTongKetHocPhan
CREATE PROC selectDiemTongKetHocPhan
AS
BEGIN
	SELECT TOP 5
		d.masinhvien, AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)) AS DiemTrungBinh
	FROM tblDiem d
	JOIN tblLopHoc l ON d.malophoc = l.malophoc
	WHERE l.daketthuc = 1
	GROUP BY d.masinhvien
	HAVING AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)) >= 8
	ORDER BY DiemTrungBinh DESC;
END;

-- Tạo proc selectXepLoaiSinhVien
CREATE PROC selectXepLoaiSinhVien
AS
BEGIN
    WITH SinhVien AS (
        SELECT
            COALESCE(
                SUM(
                    CASE
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.5 THEN 4 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.5 THEN 3.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 7.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.0 THEN 3 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 6.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 7.0 THEN 2.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 6.5 THEN 2 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.5 THEN 1.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 4.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.0 THEN 1 * mh.sotinchi
						ELSE 0
                    END
                ) / NULLIF(SUM(mh.sotinchi), 0),
                0
            ) AS DTBC
        FROM
            tblDiem d
            INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
            INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
        WHERE
            lh.daketthuc = 1
        GROUP BY
            d.masinhvien
    )
    SELECT
        CASE
            WHEN DTBC >= 3.6 THEN N'Xuất sắc'
            WHEN DTBC >= 3.2 THEN N'Giỏi'
            WHEN DTBC >= 2.5 THEN N'Khá'
            WHEN DTBC >= 2.0 THEN N'Trung bình'
            WHEN DTBC >= 1.0 THEN N'Yếu'
            ELSE 'Kém'
        END AS XepLoai,
        COUNT(*) AS Count
    FROM
        SinhVien
    GROUP BY
        CASE
            WHEN DTBC >= 3.6 THEN N'Xuất sắc'
            WHEN DTBC >= 3.2 THEN N'Giỏi'
            WHEN DTBC >= 2.5 THEN N'Khá'
            WHEN DTBC >= 2.0 THEN N'Trung bình'
            WHEN DTBC >= 1.0 THEN N'Yếu'
            ELSE 'Kém'
        END;
END;

-- Tạo proc selectSVHocBong
CREATE PROC selectSVHocBong
AS
BEGIN
	WITH SinhVien AS (
	   SELECT TOP 5
			sv.masinhvien,
			sv.hoten,
			ROUND(AVG(ISNULL((d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6), 0)), 2) AS DiemHe10,
			CAST(
				SUM(
					CASE
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.5 THEN 4 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 8.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.5 THEN 3.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 7.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 8.0 THEN 3 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 6.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 7.0 THEN 2.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.5 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 6.5 THEN 2 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 5.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.5 THEN 1.5 * mh.sotinchi
						WHEN (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) >= 4.0 AND (d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) < 5.0 THEN 1 * mh.sotinchi
						ELSE 0
					END
				) / NULLIF(SUM(mh.sotinchi), 0) AS decimal(10, 2)
			) AS DTBC,
			SUM(mh.sotinchi) AS TongSoTinChi
		FROM
			tblSinhVien sv
			INNER JOIN tblDiem d ON sv.masinhvien = d.masinhvien
			INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
			INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
		WHERE
			lh.daketthuc = 1
		GROUP BY
			sv.masinhvien, sv.hoten
		ORDER BY
			DTBC DESC
	)
	SELECT
		masinhvien,
		hoten,
		DiemHe10,
		DTBC,
		CASE
			WHEN DTBC >= 3.6 THEN N'Xuất sắc'
			WHEN DTBC >= 3.2 THEN N'Giỏi'
		END AS XepLoai,
		TongSoTinChi,
		CASE
			WHEN DTBC >= 3.6 THEN CONCAT(FORMAT(433100, 'N0'), N' VND')
			WHEN DTBC >= 3.2 THEN CONCAT(FORMAT(407700, 'N0'), N' VND')
		END AS tien,
		CONCAT(FORMAT(
			CASE
				WHEN DTBC >= 3.6 THEN 433100 * TongSoTinChi
				WHEN DTBC >= 3.2 THEN 407700 * TongSoTinChi
				ELSE 0
			END, 'N0'), N' VND') AS TienThuong
	FROM
		SinhVien
	WHERE
		DTBC >= 3.6 OR DTBC >= 3.2;
END;

-- Tạo proc selectSinhVienMonHocChuaDat
CREATE PROC selectSinhVienMonHocChuaDat
AS
BEGIN
	WITH SinhVien AS (
		SELECT
			sv.masinhvien,
			sv.hoten,
			sv.ngaysinh,
			sv.quequan,
			sv.diachi,
			sv.dienthoai,
			sv.email,
			mh.tenmonhoc AS MonHoc,
			(d.diemthilan1 * 0.4 + d.diemthilan2 * 0.6) AS Diem
		FROM
			tblSinhVien sv
			INNER JOIN tblDiem d ON sv.masinhvien = d.masinhvien
			INNER JOIN tblLopHoc lh ON lh.malophoc = d.malophoc
			INNER JOIN tblMonHoc mh ON lh.mamonhoc = mh.mamonhoc
		WHERE
			lh.daketthuc = 1
	)
	SELECT
		masinhvien,
		hoten,
		ngaysinh,
		quequan,
		diachi,
		dienthoai,
		email,
		MonHoc,
		Diem,
		CASE
			WHEN Diem < 4 THEN N'Chưa đạt'
		END AS XepLoai
	FROM
		SinhVien
	WHERE
		Diem < 4;
END;
