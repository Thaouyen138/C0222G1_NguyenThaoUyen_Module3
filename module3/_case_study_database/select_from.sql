
USE furama_management;
SELECT * FROM hop_dong;
SELECT * FROM nhan_vien;
SELECT * FROM khach_hang;

-- Task 2
SELECT * FROM nhan_vien WHERE ho_va_ten LIKE 'H%' OR ho_va_ten LIKE '%K%' or ho_va_ten LIKE '%T%' AND length(ho_va_ten)<=15  ;

-- Task 3  
SELECT * FROM khach_hang WHERE (dia_chi like '%Đà Nẵng%' OR dia_chi like '%Quảng Trị%') AND (year(now()) - year(ngay_sinh)  BETWEEN 18 AND 50);