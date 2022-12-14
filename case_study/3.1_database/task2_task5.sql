use furama_database;
-- 2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” 
-- và có tối đa 15 kí tự.
select
    nv.ma_nhan_vien,
    nv.ho_ten
from
    nhan_vien nv
where
    left (substring_index(NV.ho_ten , ' ', -1), 1) in ( 'H', 'T', 'K')
    and char_length( nv.ho_ten) < 16;

-- 3.  Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
select
    kh.ma_khach_hang,
    kh.ho_ten,
    (year(curdate()) - year (KH.ngay_sinh) - (right (curdate(), 5) < right (KH.ngay_sinh, 5))) as `kh.age`
from
    khach_hang kh
where
      (kh.dia_chi like '% Đà Nẵng' or kh.dia_chi like '% Quảng Trị')
  and (year(curdate()) - year (KH.ngay_sinh) - (right (curdate(), 5) < right (KH.ngay_sinh, 5))) between 18 and 50;

-- 4.  Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần.
-- Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng. 
-- Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
set
sql_mode =(select REPLACE(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
select
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    count(hd.ma_hop_dong) as `so_lan_dat_phong`
from
    khach_hang kh
        join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where
    lk.ten_loai_khach = 'Diamond'
group by
    kh.ho_ten
order by
    `so_lan_dat_phong`;

-- 5.	Hiển thị ma_khach_hang, ho_ten, ten_loai_khach, ma_hop_dong, ten_dich_vu, ngay_lam_hop_dong, ngay_ket_thuc,
-- tong_tien (Với tổng tiền được tính theo công thức như sau: Chi Phí Thuê + Số Lượng * Giá, với Số Lượng 
-- và Giá là từ bảng dich_vu_di_kem, hop_dong_chi_tiet) cho tất cả các khách hàng đã từng đặt phòng. 
-- (những khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
select
    kh.ma_khach_hang,
    kh.ho_ten,
    lk.ten_loai_khach,
    hd.ma_hop_dong,
    dv.ten_dich_vu,
    hd.ngay_lam_hop_dong,
    hd.ngay_ket_thuc,
    ifnull(dv.chi_phi_thue, 0) + sum((ifnull(hdct.so_luong, 0) * ifnull(dvdk.gia, 0))) as tong_tien
from
    khach_hang kh
        left join hop_dong hd on kh.ma_khach_hang = hd.ma_khach_hang
        left join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
group by hd.ma_hop_dong;

set sql_mode=(select REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
