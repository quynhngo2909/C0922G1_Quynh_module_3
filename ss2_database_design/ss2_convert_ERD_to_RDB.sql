create database if not exists product_management;
    use product_management;
    create table sđt (
            sđt_nhacc varchar(12) primary key
);

    create table nhacc (
            ma_ncc varchar(6) primary key,
    ten_ncc varchar(50),
    dia_chi varchar(50),
    sđt_nhacc varchar(12),
    foreign key (sđt_nhacc)
    references sđt (sđt_nhacc)
);

    create table don_dh (
            so_dh int primary key,
            ngay_dh date,
            ma_ncc varchar(6),
    foreign key (ma_ncc)
    references nhacc (ma_ncc)
);

    create table vat_tu (
            ma_vtu varchar(10) primary key,
    ten_vtu varchar(50)
);

    create table chi_tiet_don_dat_hang (
            so_dh int,
            ma_vtu varchar(10),
    primary key (so_dh , ma_vtu),
    foreign key (so_dh)
    references don_dh (so_dh),
    foreign key (ma_vtu)
    references vat_tu (ma_vtu)
);

    create table phieu_xuat (
            so_px int primary key,
            ngay_xuat date
    );

    create table chi_tiet_phieu_xuat (
            so_px int,
            ma_vtu varchar(10),
    dg_xuat varchar(100),
    sl_xuat varchar(100),
    primary key (so_px , ma_vtu),
    foreign key (so_px)
    references phieu_xuat (so_px),
    foreign key (ma_vtu)
    references vat_tu (ma_vtu)
);

    create table phieu_nhap (
            so_pn int primary key,
            ngay_nhap date
    );

    create table chi_tiet_phieu_nhap (
            so_pn int,
            ma_vtu varchar(10),
    dg_nhap varchar(100),
    sl_nhap varchar(100),
    primary key (so_pn , ma_vtu),
    foreign key (so_pn)
    references phieu_nhap (so_pn),
    foreign key (ma_vtu)
    references vat_tu (ma_vtu)
);