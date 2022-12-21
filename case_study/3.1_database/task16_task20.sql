use furama_database;
-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2019 đến năm 2021.

set SQL_SAFE_UPDATES = 0;

delete
nv from nhan_vien nv left join hop_dong hd on nv.ma_nhan_vien = hd.ma_nhan_vien
where 
nv.ma_nhan_vien not in 
	(select hd.ma_nhan_vien from hop_dong hd 
	where year(hd.ngay_lam_hop_dong) in ('2019', '2021', '2022')
    );
    
set SQL_SAFE_UPDATES = 1;

create table delete_empployee
(
    id            int primary key auto_increment,
    ma_nhan_vien  int unique,
    ho_ten        varchar(45),
    ngay_sinh     date,
    so_cmnd       varchar(45),
    so_dien_thoai varchar(45),
    email         varchar(45),
    ma_vi_tri     int,
    ngay_xoa      date
);

delimiter //
create trigger tr_delete_employee_history
    after delete
    on nhan_vien
    for each row
begin
    insert into delete_empployee (ma_nhan_vien, ho_ten, ngay_sinh, so_cmnd, so_dien_thoai, email, ma_vi_tri, ngay_xoa)
    values
        (old.ma_nhan_vien, old.ho_ten, old.ngay_sinh, old.so_cmnd, old.so_dien_thoai, old.email, old.ma_vi_tri, now());
end //
delimiter ;

-- 17.	Cập nhật thông tin những khách hàng có ten_loai_khach từ Platinum lên Diamond,
-- chỉ cập nhật những khách hàng đã từng đặt phòng với Tổng Tiền thanh toán trong năm 2021 là lớn hơn 10.000.000 VNĐ.


-- 18.	Xóa những khách hàng có hợp đồng trước năm 2021 (chú ý ràng buộc giữa các bảng).

alter table hop_dong drop constraint hop_dong_ibfk_2;
set sql_safe_updates = 0;

delete from
    khach_hang
where
        ma_khach_hang in (select ma_khach_hang from hop_dong hd 
                                                 where year (hd.ngay_lam_hop_dong) < '2021');

set sql_safe_updates = 1;
set foreign_key_checks = 0;
alter table hop_dong add constraint hop_dong_ibfk_2 foreign key (ma_khach_hang) references khach_hang (ma_khach_hang);

create table khach_hang_da_xoa
(
    id            int primary key auto_increment,
    ma_khach_hang int,
    ma_loai_khach int,
    ho_ten        varchar(50),
    ngay_sinh     date,
    gioi_tinh     bit(1),
    so_cmnd       varchar(50),
    so_dien_thoai varchar(50),
    email         varchar(50),
    dia_chi       varchar(50),
    ngay_xoa      date
);

delimiter //
create trigger tr_xoa_khach_hang
    after delete on khach_hang
    for each row
begin
    insert into khach_hang_da_xoa(ma_khach_hang, ma_loai_khach, ho_ten, ngay_sinh, gioi_tinh, so_cmnd, so_dien_thoai,
                                  email, dia_chi, ngay_xoa)
    values
        (old.ma_khach_hang, old.ma_loai_khach, old.ho_ten, old.ngay_sinh, old.gioi_tinh, old.so_cmnd, old.so_dien_thoai,
         old.email, old.dia_chi, now());
end //
delimiter ;

-- 19.	Cập nhật giá cho các dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2020 lên gấp đôi.
-- Còn update giá

set sql_safe_updates = 0;

update dich_vu_di_kem dvdk
set
    dvdk.gia = dvdk.gia * 2
where
        ma_dich_vu_di_kem in (select ma_dich_vu_di_kem
                              from v_dich_vu_di_kem);

set sql_safe_updates = 1;

create or replace view v_dich_vu_di_kem as
select
    hdct.ma_dich_vu_di_kem
from
    hop_dong_chi_tiet hdct
        join dich_vu_di_kem dvdk on hdct.ma_dich_vu_di_kem = dvdk.ma_dich_vu_di_kem
        join hop_dong hd on hdct.ma_hop_dong = hd.ma_hop_dong
where
    year (hd.ngay_lam_hop_dong) = '2020'
group by hdct.ma_dich_vu_di_kem
having
    sum (hdct.so_luong) > 10;

set sql_mode=(select replace(@@sql_mode,'ONLY_FULL_GROUP_BY',''));

-- 20.	Hiển thị thông tin của tất cả các nhân viên và khách hàng có trong hệ thống, 
-- thông tin hiển thị bao gồm id (ma_nhan_vien, ma_khach_hang), ho_ten, email, so_dien_thoai, ngay_sinh, dia_chi.

select
    nv.ma_nhan_vien as id,
    nv.ho_ten,
    nv.email,
    nv.so_dien_thoai,
    nv.ngay_sinh,
    nv.dia_chi
from
    nhan_vien nv

union

select
    kh.ma_khach_hang,
    kh.ho_ten,
    kh.email,
    kh.so_dien_thoai,
    kh.ngay_sinh,
    kh.dia_chi
from
    khach_hang kh;
