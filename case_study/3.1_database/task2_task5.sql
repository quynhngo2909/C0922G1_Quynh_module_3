use furama_database;

-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
select NV.ma_nhan_vien, NV.ho_ten
	from nhan_vien NV
    where NV.ho_ten regexp '^[H|T|K].{0,14}$';

select NV.ma_nhan_vien, NV.ho_ten
	from nhan_vien NV
    where NV.ho_ten regexp '^[H|T|K]' and char_length(NV.ho_ten) <=15;

-- 3.	Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select 
	KH.ma_khach_hang, 
	KH.ho_ten, 
    (year(curdate()) - year(KH.ngay_sinh) - (right(curdate(), 5) < right(KH.ngay_sinh, 5))) as `KH.age`
	from khach_hang KH
    where (KH.dia_chi like '% Đà Nẵng' or KH.dia_chi like '% Quảng Trị')
		and (year(curdate()) - year(KH.ngay_sinh) - (right(curdate(), 5) < right(KH.ngay_sinh, 5))) between 18 and 50;
        
-- 4.	Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.

set sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select KH.ma_khach_hang, KH.ho_ten, LK.ten_loai_khach, count(HD.ma_hop_dong) as `so_lan_dat_phong`
	from khach_hang KH
		join hop_dong HD on KH.ma_khach_hang = HD.ma_khach_hang
        join loai_khach LK on KH.ma_loai_khach = LK.ma_loai_khach
	where LK.ten_loai_khach = 'Diamond'
    group by KH.ho_ten
    order by `so_lan_dat_phong`;
					
-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng 
-- và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).




