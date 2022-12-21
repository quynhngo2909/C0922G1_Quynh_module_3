use furama_database;
-- 11.	Hiển thị thông tin các dịch vụ đi kèm đã được sử dụng bởi những khách hàng
--  có ten_loai_khach là “Diamond” và có dia_chi ở “Vinh” hoặc “Quảng Ngãi”.

select
    kh.ho_ten               as customer,
    dvdk.ma_dich_vu_di_kem  as service_id,
    dvdk.ten_dich_vu_di_kem as services
from
    hop_dong hd
        join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
        join loai_khach lk on kh.ma_loai_khach = lk.ma_loai_khach
where
      lk.ten_loai_khach = 'Diamond'
  and (kh.dia_chi like '%Vinh%' or kh.dia_chi like '%Quảng Ngãi%');

-- 12.	Hiển thị thông tin ma_hop_dong, ho_ten (nhân viên), ho_ten (khách hàng), 
-- so_dien_thoai (khách hàng), ten_dich_vu, 
-- so_luong_dich_vu_di_kem (được tính dựa trên việc sum so_luong ở dich_vu_di_kem), 
-- tien_dat_coc của tất cả các dịch vụ đã từng được khách hàng đặt vào 3 tháng cuối năm 2020 
-- nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2021.

select
    hd.ma_hop_dong,
    nv.ho_ten                     as khach_hang,
    kh.ho_ten                     as nhan_vien,
    kh.so_dien_thoai              as so_dien_thoai_khach_hang,
    dv.ten_dich_vu                as ten_dich_vu,
    sum(ifnull(hdct.so_luong, 0)) as so_luong_dich_vu_di_kem,
    hd.tien_dat_coc
from
    hop_dong hd
        join nhan_vien nv on hd.ma_nhan_vien = nv.ma_nhan_vien
        join khach_hang kh on hd.ma_khach_hang = kh.ma_khach_hang
        join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        left join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        left join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where
        (year(hd.ngay_lam_hop_dong) = '2020' and quarter(hd.ngay_lam_hop_dong) = '4')
  and 
        (hd.ngay_lam_hop_dong 
            not in (
                    select hd.ngay_lam_hop_dong 
                    from hop_dong hd 
                    where year (hd.ngay_lam_hop_dong) = '2021' and quarter(hd.ngay_lam_hop_dong) in (1, 2) 
                    )
        )
group by hd.ma_hop_dong;


-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng.
-- (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).

select
    v.ma_dich_vu_di_kem  as service_id,
    v.ten_dich_vu_di_kem as services,
    v.total_usage_time   as total_usage
from
    v_count_services v
where
    v.total_usage_time = (select max(v.total_usage_time) from v_count_services v);

create or replace view v_count_services as
select
    dvdk.ma_dich_vu_di_kem  as ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem as ten_dich_vu_di_kem,
    sum(hdct.so_luong)      as total_usage_time
from
    hop_dong_chi_tiet hdct
        join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem;

-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. 
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select
    dvdk.ma_dich_vu_di_kem  as service_id,
    dvdk.ten_dich_vu_di_kem as services
from
    hop_dong_chi_tiet hdct
        join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
group by hdct.ma_dich_vu_di_kem
having
    sum(hdct.so_luong) = 1;

-- 14-2. Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất TRONG MỖI HỢP ĐỒNG
-- Thông tin hiển thị bao gồm ma_hop_dong, ten_loai_dich_vu, ten_dich_vu_di_kem, so_lan_su_dung (được tính dựa trên việc count các ma_dich_vu_di_kem).

select
    hd.ma_hop_dong,
    ldv.ten_loai_dich_vu,
    hdct.ma_dich_vu_di_kem,
    dvdk.ten_dich_vu_di_kem,
    hdct.so_luong
from
    hop_dong hd
        join dich_vu dv on hd.ma_dich_vu = dv.ma_dich_vu
        join loai_dich_vu ldv on dv.ma_loai_dich_vu = ldv.ma_loai_dich_vu
        join hop_dong_chi_tiet hdct on hd.ma_hop_dong = hdct.ma_hop_dong
        join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
where
    hdct.so_luong = 1
order by hd.ma_hop_dong;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm ma_nhan_vien, ho_ten, ten_trinh_do,
--  ten_bo_phan, so_dien_thoai, dia_chi mới chỉ lập được tối đa 3 hợp đồng từ năm 2020 đến 2021.

select
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
from
    nhan_vien nv
        join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
        join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
        join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
        join v_count_booking_by_employee_in_2020_2021 v on nv.ma_nhan_vien = v.ma_nhan_vien
where
    v.total_booking < 4

union

select
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi
from
    nhan_vien nv
        left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
        join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
        join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
where
        nv.ma_nhan_vien not in (select hd.ma_nhan_vien 
                                from hop_dong hd where year (hd.ngay_lam_hop_dong) in ('2020', '2021')
                                );

create
or replace view v_count_booking_by_employee_in_2020_2021 as
select
    nv.ma_nhan_vien,
    nv.ho_ten,
    td.ten_trinh_do,
    bp.ten_bo_phan,
    nv.so_dien_thoai,
    nv.dia_chi,
    count(ifnull(hd.ma_hop_dong, 0)) as total_booking
from
    nhan_vien nv
        join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
        join bo_phan bp on nv.ma_bo_phan = bp.ma_bo_phan
        join trinh_do td on nv.ma_trinh_do = td.ma_trinh_do
where
        nv.ma_nhan_vien in (select hd.ma_nhan_vien 
                            from hop_dong hd where year (hd.ngay_lam_hop_dong) in ('2020', '2021')
                            )
group by hd.ma_nhan_vien;
