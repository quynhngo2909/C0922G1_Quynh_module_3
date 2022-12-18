use furama_database;
alter table hop_dong_chi_tiet 
	modify column ma_hop_dong_chi_tiet int auto_increment; 
lock tables 
	bo_phan write,
	dich_vu write,
	dich_vu_di_kem write,
	hop_dong write,
	hop_dong_chi_tiet write,
	khach_hang write,
	kieu_thue write,
	loai_dich_vu write,
	loai_khach write,
	nhan_vien write,
	trinh_do write,
	vi_tri write;

alter table hop_dong_chi_tiet    
	drop foreign key hop_dong_chi_tiet_ibfk_1,
    drop foreign key hop_dong_chi_tiet_ibfk_2;
alter table hop_dong 
	modify column ma_hop_dong int auto_increment;
alter table dich_vu_di_kem
	modify column ma_dich_vu_di_kem int auto_increment;
alter table hop_dong_chi_tiet 
	add constraint hop_dong_chi_tiet_ibfk_1 foreign key (ma_hop_dong)
		references hop_dong(ma_hop_dong),
    add constraint hop_dong_chi_tiet_ibfk_2 foreign key (ma_dich_vu_di_kem)
		references dich_vu_di_kem(ma_dich_vu_di_kem);

alter table dich_vu
	drop foreign key dich_vu_ibfk_1,
	drop foreign key dich_vu_ibfk_2;
alter table kieu_thue
	modify column ma_kieu_thue int auto_increment;
alter table loai_dich_vu
    modify column ma_loai_dich_vu int auto_increment;
alter table dich_vu
	add constraint dich_vu_ibfk_1 foreign key (ma_kieu_thue)
		references kieu_thue(ma_kieu_thue),
    add constraint dich_vu_ibfk_2 foreign key (ma_loai_dich_vu)
		references loai_dich_vu(ma_loai_dich_vu);
    
alter table khach_hang  
	drop foreign key khach_hang_ibfk_1;
alter table loai_khach
	modify column ma_loai_khach int auto_increment;
alter table khach_hang
	add constraint khach_hang_ibfk_1 foreign key (ma_loai_khach)
    references loai_khach(ma_loai_khach);

alter table nhan_vien
	drop foreign key nhan_vien_ibfk_1,
	drop foreign key nhan_vien_ibfk_2,
	drop foreign key nhan_vien_ibfk_3;
alter table vi_tri
	modify column ma_vi_tri int auto_increment;
alter table trinh_do
	modify column ma_trinh_do int auto_increment;
alter table bo_phan
	modify column ma_bo_phan int auto_increment;
alter table nhan_vien
	add constraint nhan_vien_ibfk_1 foreign key (ma_vi_tri)
		references vi_tri (ma_vi_tri),
	add constraint nhan_vien_ibfk_2 foreign key (ma_trinh_do)
		references trinh_do (ma_trinh_do),
	add constraint nhan_vien_ibfk_3 foreign key (ma_bo_phan)
		references bo_phan (ma_bo_phan);
    
alter table hop_dong
	drop foreign key hop_dong_ibfk_1,
	drop foreign key hop_dong_ibfk_2,
	drop foreign key hop_dong_ibfk_3;
    
alter table nhan_vien
	modify column ma_nhan_vien int auto_increment;
alter table khach_hang
	modify column ma_khach_hang int auto_increment;
alter table dich_vu
	modify column ma_dich_vu int auto_increment;   
    
alter table hop_dong
	add constraint hop_dong_ibfk_1 foreign key (ma_nhan_vien)
		references nhan_vien (ma_nhan_vien),
	add constraint hop_dong_ibfk_2 foreign key (ma_khach_hang)
		references khach_hang (ma_khach_hang),
	add constraint hop_dong_ibfk_3 foreign key (ma_dich_vu)
		references dich_vu (ma_dich_vu);
    
unlock tables;
