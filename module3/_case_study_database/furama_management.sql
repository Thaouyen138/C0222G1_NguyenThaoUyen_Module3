CREATE DATABASE furama_management;
USE furama_management;

CREATE TABLE vi_tri
(
    id_vi_tri INT PRIMARY KEY AUTO_INCREMENT,
    ten_vi_tri VARCHAR(45)
);

CREATE TABLE trinh_do
(
    id_trinh_do INT PRIMARY KEY AUTO_INCREMENT,
    ten_trinh_do VARCHAR(45)
);

CREATE TABLE bo_phan
( 
	id_bo_phan INT PRIMARY KEY AUTO_INCREMENT,
	ten_bo_phan VARCHAR(45)
);
CREATE TABLE nhan_vien
(
	id_nhan_vien INT PRIMARY KEY AUTO_INCREMENT,
    ho_va_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
    so_cmnd VARCHAR(45) NOT NULL,
    luong DOUBLE NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45),
	id_vi_tri INT,
	id_trinh_do INT,
    id_bo_phan INT,
    FOREIGN KEY (id_vi_tri) REFERENCES vi_tri(id_vi_tri),
    FOREIGN KEY (id_trinh_do) REFERENCES trinh_do(id_trinh_do),
    FOREIGN KEY (id_bo_phan) REFERENCES bo_phan(id_bo_phan)
);
CREATE TABLE loai_khach
( 
	id_loai_khach INT PRIMARY KEY AUTO_INCREMENT,
	ten_loai_khach VARCHAR(45)
);

CREATE TABLE khach_hang
(
	id_khach_hang INT PRIMARY KEY AUTO_INCREMENT,
	id_loai_khach INT,
    FOREIGN KEY (id_loai_khach) REFERENCES loai_khach(id_loai_khach),
	ho_va_ten VARCHAR(45) NOT NULL,
    ngay_sinh DATE NOT NULL,
	gioi_tinh BIT DEFAULT 1 NOT NULL,
	so_cmnd VARCHAR(45) NOT NULL,
    so_dien_thoai VARCHAR(45) NOT NULL,
    email VARCHAR(45),
    dia_chi VARCHAR(45)
);

CREATE TABLE dich_vu_di_kem
(
	id_dich_vu_di_kem INT PRIMARY KEY AUTO_INCREMENT,
	ten_dich_vu VARCHAR(45) NOT NULL,
	gia DOUBLE NOT NULL,
	don_vi VARCHAR(45) NOT NULL,
	trang_thai VARCHAR(45)
);
CREATE TABLE kieu_thue
(
id_kieu_thue INT PRIMARY KEY AUTO_INCREMENT,
ten_kieu_thue VARCHAR(45)
);

CREATE TABLE loai_dich_vu
(
id_loai_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_loai_dich_vu VARCHAR(45)
);

CREATE TABLE dich_vu
(
id_dich_vu INT PRIMARY KEY AUTO_INCREMENT,
ten_dich_vu VARCHAR(45) NOT NULL,
dien_tich INT, 
chi_phi_thue DOUBLE NOT NULL,
so_nguoi_toi_da INT,
id_kieu_thue INT,
FOREIGN KEY (id_kieu_thue) REFERENCES kieu_thue(id_kieu_thue),
id_loai_dich_vu INT,
FOREIGN KEY (id_loai_dich_vu) REFERENCES loai_dich_vu(id_loai_dich_vu),
tieu_chuan_phong VARCHAR(45),
mo_ta_tien_nghi_khac VARCHAR(45),
dien_dich_ho_boi DOUBLE,
so_tang INT
);
CREATE TABLE hop_dong
(
id_hop_dong INT PRIMARY KEY AUTO_INCREMENT,
ngay_lam_hop_dong DATETIME NOT NULL,
ngay_ket_thuc DATETIME NOT NULL,
tien_dat_coc DOUBLE NOT NULL,
id_nhan_vien INT, 
id_khach_hang INT,
id_dich_vu INT,
FOREIGN KEY (id_nhan_vien) REFERENCES nhan_vien(id_nhan_vien),
FOREIGN KEY (id_khach_hang) REFERENCES khach_hang(id_khach_hang),
FOREIGN KEY (id_dich_vu) REFERENCES dich_vu(id_dich_vu)
);

CREATE TABLE hop_dong_chi_tiet
(
	id_hop_dong_chi_tiet INT PRIMARY KEY AUTO_INCREMENT,
    id_hop_dong INT ,
    id_dich_vu_di_kem INT,
    FOREIGN KEY (id_hop_dong) REFERENCES hop_dong(id_hop_dong),
    FOREIGN KEY (id_dich_vu_di_kem) REFERENCES dich_vu_di_kem(id_dich_vu_di_kem),
    so_luong INT NOT NULL
);
-- SELECT * FROM furama_management.vi_tri;
-- SELECT * FROM furama_management.trinh_do;
-- SELECT * FROM furama_management.bo_phan;
-- SELECT * FROM furama_management.nhan_vien;
-- SELECT * FROM furama_management.loai_khach;
-- SELECT * FROM furama_management.khach_hang;
-- SELECT * FROM furama_management.kieu_thue;
-- SELECT * FROM furama_management.loai_dich_vu;
-- SELECT * FROM furama_management.dich_vu_di_kem;
-- SELECT * FROM furama_management.dich_vu;
-- SELECT * FROM furama_management.hop_dong;
-- SELECT * FROM furama_management.hop_dong_chi_tiet;
