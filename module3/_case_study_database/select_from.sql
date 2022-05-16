
USE furama_management;
SELECT * FROM hop_dong;
SELECT * FROM nhan_vien;
SELECT * FROM nhan_vien WHERE ho_va_ten LIKE N'___%H%____' OR ho_va_ten LIKE N'_____%K%____' or ho_va_ten LIKE N'____%T%____'  ;
SELECT * FROM khach_hang;
SELECT * FROM khach_hang WHERE dia_chi like '%Đà Nẵng%' OR dia_chi like '%Quảng Trị%' HAVING ngay_sinh  BETWEEN 1972 AND 2004;