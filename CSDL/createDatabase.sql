/* ================================================== Tạo DATABASE và bảng ================================================== */
CREATE DATABASE QuanLySinhVien
USE QuanLySinhVien

CREATE TABLE tblTaiKhoan(
	tentaikhoan varchar(50) PRIMARY KEY,
    matkhau nvarchar(150) NOT NULL,
)

CREATE TABLE tblSinhVien (
    masinhvien varchar(50) PRIMARY KEY,
	matkhau varchar(50) NOT NULL DEFAULT '123',
    hoten nvarchar(50) NOT NULL,
    ngaysinh date NOT NULL,
    gioitinh tinyint NOT NULL,
    quequan nvarchar(150) NOT NULL,
    diachi nvarchar(150) NOT NULL,
    dienthoai varchar(30) NOT NULL,
    email varchar(150) NOT NULL,
    ngaytao datetime NOT NULL DEFAULT GETDATE(),
    nguoitao varchar(30) NOT NULL DEFAULT 'admin',
    ngaycapnhat datetime NOT NULL DEFAULT GETDATE(),
    nguoicapnhat varchar(30) NOT NULL DEFAULT 'admin'
);

CREATE TABLE tblGiaoVien (
    magiaovien int IDENTITY(1,1) PRIMARY KEY,
	matkhau varchar(50) NOT NULL DEFAULT '123',
    hoten nvarchar(50) NOT NULL,
    ngaysinh date NOT NULL,
    gioitinh tinyint NOT NULL,
	diachi nvarchar(150) NOT NULL,
    dienthoai varchar(30) NOT NULL,
    email varchar(150) NOT NULL,
    ngaytao datetime NOT NULL DEFAULT GETDATE(),
    nguoitao varchar(30) NOT NULL DEFAULT 'admin',
    ngaycapnhat datetime NOT NULL DEFAULT GETDATE(),
    nguoicapnhat varchar(30) NOT NULL DEFAULT 'admin'
);

CREATE TABLE tblMonHoc (
    mamonhoc int IDENTITY(1,1) PRIMARY KEY,
    tenmonhoc nvarchar(150) NOT NULL,
    sotinchi int NOT NULL,
    ngaytao datetime NOT NULL DEFAULT GETDATE(),
    nguoitao varchar(30) NOT NULL DEFAULT 'admin',
    ngaycapnhat datetime NOT NULL DEFAULT GETDATE(),
    nguoicapnhat varchar(30) NOT NULL DEFAULT 'admin'
);

CREATE TABLE tblLopHoc (
    malophoc bigint IDENTITY(1,1) PRIMARY KEY,
	magiaovien int,
    mamonhoc int,
	daketthuc tinyint NOT NULL DEFAULT 0,
    ngaytao datetime NOT NULL DEFAULT GETDATE(),
    nguoitao varchar(30) NOT NULL DEFAULT 'admin',
    ngaycapnhat datetime NOT NULL DEFAULT GETDATE(),
    nguoicapnhat varchar(30) NOT NULL DEFAULT 'admin'
);

CREATE TABLE tblDiem (
    masinhvien varchar(50),
	malophoc bigint,
    lanhoc int NOT NULL,
    diemthilan1 float,
    diemthilan2 float,
    ngaytao datetime NOT NULL DEFAULT GETDATE(),
    nguoitao varchar(30) NOT NULL DEFAULT 'admin',
    ngaycapnhat datetime NOT NULL DEFAULT GETDATE(),
    nguoicapnhat varchar(30) NOT NULL DEFAULT 'admin',
    PRIMARY KEY (masinhvien, malophoc)
);

ALTER TABLE tblLopHoc
ADD CONSTRAINT FK_tblLopHoc_tblGiaoVien
FOREIGN KEY (magiaovien)
REFERENCES tblGiaoVien (magiaovien);

ALTER TABLE tblLopHoc
ADD CONSTRAINT FK_tblLopHoc_tblMonHoc
FOREIGN KEY (mamonhoc)
REFERENCES tblMonHoc (mamonhoc);

ALTER TABLE tblDiem
ADD CONSTRAINT FK_tblLopHoc_tblDiem
FOREIGN KEY (malophoc)
REFERENCES tblLopHoc (malophoc);

ALTER TABLE tblDiem
ADD CONSTRAINT FK_tblDiem_tblSinhVien
FOREIGN KEY (masinhvien)
REFERENCES tblSinhVien (masinhvien);