USE furama_management;
SELECT * FROM hop_dong;
SELECT * FROM nhan_vien;
SELECT * FROM khach_hang;
-- -----------------------------------------------------------------------------------------------------------------------------------------------
 
-- Task 2
SELECT * FROM nhan_vien WHERE( ho_va_ten LIKE '%H%' OR ho_va_ten LIKE '%K%' or ho_va_ten LIKE '%T%') AND length(ho_va_ten)<=15  ;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Task 3  
SELECT * FROM khach_hang WHERE (dia_chi like '%Đà Nẵng%' OR dia_chi like '%Quảng Trị%') AND (year(now()) - year(ngay_sinh)  BETWEEN 18 AND 50);
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Task 4
SELECT hd.id_hop_dong, hd.id_khach_hang, lk.ten_loai_khach, count(hd.id_hop_dong) as "so_lan_su_dung" FROM hop_dong AS hd
JOIN khach_hang kh ON hd.id_khach_hang=kh.id_khach_hang
JOIN loai_khach lk ON kh.id_loai_khach=lk.id_loai_khach
WHERE lk.ten_loai_khach= "Gold"
GROUP BY hd.id_khach_hang
ORDER BY so_lan_su_dung
;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Task 5
SELECT kh.id_khach_hang,kh.ho_va_ten, lk.ten_loai_khach ,hd.id_hop_dong,hd.ngay_lam_hop_dong, hd.ngay_ket_thuc,(dv.chi_phi_thue + hdct.so_luong * dvdk.gia) AS total_money
FROM hop_dong_chi_tiet hdct
JOIN hop_dong hd ON hd.id_hop_dong=hdct.id_hop_dong
JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem=dvdk.id_dich_vu_di_kem
JOIN dich_vu dv ON  hd.id_dich_vu=dv.id_dich_vu
JOIN khach_hang kh ON hd.id_khach_hang= kh.id_khach_hang
LEFT JOIN loai_khach lk ON lk.id_loai_khach=kh.id_khach_hang
GROUP BY kh.id_khach_hang;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- task 6
 SELECT DISTINCT dv.id_dich_vu, dv.ten_dich_vu, dv.dien_tich, dv.chi_phi_thue, ldv.ten_loai_dich_vu FROM dich_vu dv 
 JOIN hop_dong hd on dv.id_dich_vu=hd.id_dich_vu
 JOIN khach_hang kh on  hd.id_khach_hang= kh.id_khach_hang
 JOIN loai_dich_vu ldv ON dv.id_loai_dich_dich_vu_di_kemvu=ldv.id_loai_dich_vu
 WHERE hd.id_dich_vu NOT IN  (SELECT id_dich_vu FROM hop_dong hd WHERE year(hd.ngay_lam_hop_dong) =2021 AND quarter(hd.ngay_lam_hop_dong)=1) ;
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- task 7: Hiển thị thông tin ma_dich_vu, ten_dich_vu, dien_tich, so_nguoi_toi_da, chi_phi_thue, 
		   -- ten_loai_dich_vu của tất cả các loại dịch vụ đã từng được khách hàng đặt phòng trong năm 2020 
		   -- nhưng chưa từng được khách hàng đặt phòng trong năm 2021.
SELECT dv.id_dich_vu , dv.ten_dich_vu, dv.dien_tich, dv.so_nguoi_toi_da, dv.chi_phi_thue, ldv.ten_loai_dich_vu 
FROM dich_vu dv
JOIN loai_dich_vu ldv on dv.id_loai_dich_vu = ldv.id_loai_dich_vu
JOIN hop_dong hd on dv.id_dich_vu = hd.id_dich_vu
where dv.id_dich_vu in (SELECT id_dich_vu FROM hop_dong hd WHERE (year(hd.ngay_lam_hop_dong) = 2020))
AND dv.id_dich_vu not in (select id_dich_vu from hop_dong where (year(hd.ngay_lam_hop_dong) = 2021))
group by hd.id_dich_vu; 
-- -----------------------------------------------------------------------------------------------------------------------------------------------
-- Task 8: Hiển thị thông tin ho_ten khách hàng có trong hệ thống, với yêu cầu ho_ten không trùng nhau. 3 cach?

-- -------------------------------------------------------------------------Cách 1:--------------------------------------------------------------
 SELECT kh.ho_va_ten  FROM khach_hang kh GROUP BY kh.ho_va_ten; 
 
 -- ------------------------------------------------------------------------Cách 2:--------------------------------------------------------------
SELECT DISTINCT ho_va_ten FROM khach_hang;

-- -------------------------------------------------------------------------Cách 3---------------------------------------------------------------
SELECT ho_va_ten FROM khach_hang
UNION
SELECT ho_va_ten FROM khach_hang;
-- -----------------------------------------------------------------------------------------------------------------------------------------------

-- Task 9:Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2021 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT month(hd.ngay_lam_hop_dong) AS 'thang' , count(month(hd.ngay_lam_hop_dong))  AS 'so_luong_khach_dat_phong'
FROM hop_dong hd 
WHERE year(hd.ngay_lam_hop_dong)=2021
GROUP BY thang;

-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Task 10: Hiển thị thông tin tương ứng với từng hợp đồng thì đã sử dụng bao nhiêu dịch vụ đi kèm. Kết quả hiển thị bao gồm ma_hop_dong,
			-- ngay_lam_hop_dong, ngay_ket_thuc, tien_dat_coc, so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem).
 SELECT hd.id_hop_dong, hd.ngay_lam_hop_dong, hd.ngay_ket_thuc, hd.tien_dat_coc,SUM(hdct.so_luong) AS 'so_luong_dich_vu_di_kem'
 FROM hop_dong hd JOIN hop_dong_chi_tiet hdct ON hd.id_hop_dong=hdct.id_hop_dong
 GROUP BY id_hop_dong;
 
 -- -------------------------------------------------------------------------------------------------------------------------------------------------
 -- Task 11: Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng có ten_loai_khach là “Diamond” 
			 -- và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.
SELECT dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu,dvdk.gia, kh.ho_va_ten, lk.ten_loai_khach 
FROM  dich_vu_di_kem dvdk 
left JOIN hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem=hdct.id_dich_vu_di_kem
LEFT JOIN hop_dong hd ON hdct.id_hop_dong =hd.id_hop_dong
LEFT JOIN khach_hang kh ON  hd.id_khach_hang= kh.id_khach_hang 
LEFT JOIN loai_khach lk ON kh.id_loai_khach=lk.id_loai_khach
WHERE lk.ten_loai_khach='Gold'
AND (kh.dia_chi like '%Vinh%' OR kh.dia_chi LIKE '%quảng trị%');

-- -------------------------------------------------------------------------------------------------------------------------------------------------
-- Task 12: Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), so_dien_thoai (khách hàng), ten_dich_vu, so_luong_dich_vu_di_kem 
			-- (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
            -- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020
			-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.
SELECT hd.id_hop_dong, nv.ho_va_ten, kh.ho_va_ten, kh.so_dien_thoai, dv.ten_dich_vu, sum(hdct.so_luong) AS'so_luong_dich_vu_di_kem' , hd.tien_dat_coc
FROM dich_vu_di_kem dvdk 
JOIN hop_dong_chi_tiet hdct ON dvdk.id_dich_vu_di_kem =hdct.id_dich_vu_di_kem
JOIN hop_dong hd ON hdct.id_hop_dong =hd.id_hop_dong
JOIN dich_vu dv ON dv.id_dich_vu=hd.id_dich_vu
JOIN khach_hang kh ON kh.id_khach_hang=hd.id_khach_hang
JOIN nhan_vien nv ON nv.id_nhan_vien = hd.id_nhan_vien
WHERE dv.id_dich_vu  IN (SELECT hd.id_dich_vu FROM hop_dong hd WHERE month(ngay_lam_hop_dong)BETWEEN 10 AND 12 AND year(ngay_lam_hop_dong) =2020)
AND dv.id_dich_vu NOT IN(SELECT hd.id_dich_vu FROM hop_dong hd WHERE month(ngay_lam_hop_dong)BETWEEN 1 AND 6) AND year(ngay_lam_hop_dong) =2021
GROUP BY id_hop_dong;

-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Task 13:	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT  dvdk.id_dich_vu_di_kem, dvdk.ten_dich_vu, dvdk.gia, dvdk.don_vi , dvdk.trang_thai, sum(hdct.so_luong) AS 'so_luong_khach_dat_phong'
FROM hop_dong_chi_tiet hdct
JOIN dich_vu_di_kem dvdk ON hdct.id_dich_vu_di_kem = dvdk.id_dich_vu_di_kem
JOIN hop_dong hd ON hdct.id_hop_dong= hd.id_hop_dong
GROUP BY id_dich_vu_di_kem
HAVING sum(hdct.so_luong) >= (SELECT sum(hdct.so_luong)  FROM hop_dong_chi_tiet hdct GROUP BY id_dich_vu_di_kem  
ORDER BY sum(hdct.so_luong) DESC LIMIT 1)
;

-- --------------------------------------------------------------------------------------------------------------------------------------------------
-- Task 14: Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
			-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung 
            -- (được tính dựa trên việc count các ma_dich_vu_di_kem).
SELECT hd.id_hop_dong , ldv.ten_loai_dich_vu, dvdk.ten_dich_vu , count(hdct.id_dich_vu_di_kem) As 'so_lan_su_dung'
FROM hop_dong hd 
JOIN dich_vu dv ON dv.id_dich_vu= hd.id_dich_vu
JOIN loai_dich_vu ldv ON ldv.id_loai_dich_vu =dv.id_loai_dich_vu
JOIN hop_dong_chi_tiet hdct ON hdct.id_hop_dong =hd.id_hop_dong
JOIN dich_vu_di_kem dvdk ON dvdk.id_dich_vu_di_kem= hdct.id_dich_vu_di_kem
GROUP BY ten_loai_dich_vu
HAVING count(hdct.id_dich_vu_di_kem) =1;

-- -------------------------------------------------------------------------------------------------------------------------------------------
-- Task 15:	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do, ten_bo_phan, so_dien_thoai,
			-- dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

SELECT nv.id_nhan_vien , nv.ho_va_ten , td.ten_trinh_do , bp.ten_bo_phan, nv.so_dien_thoai , nv.dia_chi ,count(hd.id_nhan_vien) 
FROM nhan_vien nv
JOIN bo_phan bp ON nv.id_bo_phan =bp.id_bo_phan
JOIN trinh_do td ON nv.id_trinh_do= td.id_trinh_do
JOIN hop_dong hd ON nv.id_nhan_vien= hd.id_nhan_vien 
WHERE year(hd.ngay_lam_hop_dong) BETWEEN 2020 AND 2021
GROUP BY id_nhan_vien
HAVING count(hd.id_nhan_vien)  <=3;