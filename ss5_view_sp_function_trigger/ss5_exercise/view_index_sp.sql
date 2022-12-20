create database ss5_exercise;
use ss5_exercise;
create table products_ss5
(
    id                  int primary key auto_increment,
    product_code        varchar(50),
    product_name        varchar(50),
    product_price       decimal(10, 2),
    product_pmount      decimal(10, 2),
    product_description text,
    product_status      boolean default (0)
);

insert into products_ss5 (product_code, product_name, product_description, product_pmount, product_price)
values
    ('S10_1678', '1969 Harley Davidson Ultimate Chopper',
     'This replica features working kickstand, front suspension, gear-shift lever, footbrake lever, drive chain, wheels and steering. All parts are particularly delicate due to their precise scale and require special care and attention.',
     7933, 89.67),

    ('S10_1949', '1952 Alpine Renault 1300',
     'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',
     7305, 98.58),

    ('S10_2016', '1996 Moto Guzzi 1100i',
     'Official Moto Guzzi logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',
     6625, 68.99),

    ('S10_4698', '2003 Harley-Davidson Eagle Drag Bike',
     'Model features, official Harley Davidson logos and insignias, detachable rear wheelie bar, heavy diecast metal with resin parts, authentic multi-color tampo-printed graphics, separate engine drive belts, free-turning front fork, rotating tires and rear racing slick, certificate of authenticity, detailed engine, display stand\r\n, precision diecast replica, baked enamel finish, 1:10 scale model, removable fender, seat and tank cover piece for displaying the superior detail of the v-twin engine',
     5582, 91.02),

    ('S10_4757', '1972 Alfa Romeo GTA',
     'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',
     3252, 85.68),

    ('S10_4962', '1962 LanciaA Delta 16V',
     'Features include: Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',
     6791, 103.42),

    ('S12_1099', '1968 Ford Mustang',
     'Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color dark green.',
     68, 95.34),

    ('S12_1108', '2001 Ferrari Enzo',
     'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',
     3619, 95.59),

    ('S12_1666', '1958 Setra Bus',
     'Model features 30 windows, skylights & glare resistant glass, working steering system, original logos', 1579,
     77.90),

    ('S12_2823', '2002 Suzuki XREO',
     'Official logos and insignias, saddle bags located on side of motorcycle, detailed engine, working steering, working suspension, two leather seats, luggage rack, dual exhaust pipes, small saddle bag located on handle bars, two-tone paint with chrome accents, superior die-cast detail , rotating wheels , working kick stand, diecast metal with plastic parts and baked enamel finish.',
     9997, 66.27),

    ('S12_3148', '1969 Corvair Monza',
     '1:18 scale die-cast about 10\" long doors open, hood opens, trunk opens and wheels roll', 6906, 89.14),

    ('S12_3380', '1968 Dodge Charger',
     '1:12 scale model of a 1968 Dodge Charger. Hood, doors and trunk all open to reveal highly detailed interior features. Steering wheel actually turns the front wheels. Color black',
     9123, 75.16),

    ('S12_3891', '1969 Ford Falcon',
     'Turnable front wheels; steering function; detailed interior; detailed engine; opening hood; opening trunk; opening doors; and detailed chassis.',
     1049, 83.05),

    ('S12_3990', '1970 Plymouth Hemi Cuda',
     'Very detailed 1970 Plymouth Cuda model in 1:12 scale. The Cuda is generally accepted as one of the fastest original muscle cars from the 1970s. This model is a reproduction of one of the orginal 652 cars built in 1970. Red color.',
     5663, 31.92),

    ('S12_4473', '1957 Chevy Pickup', '1:12 scale die-cast about 20\" long Hood opens, Rubber wheels', 6125, 55.70),

    ('S12_4675', '1969 Dodge Charger',
     'Detailed model of the 1969 Dodge Charger. This model includes finely detailed interior and exterior features. Painted in red and white.',
     7323, 58.73);

-- Index

alter table products_ss5
    add unique index i_product_code(product_code);
alter table products_ss5
    add index i_product_name_price(product_name, product_price);

explain
select * from products_ss5 where product_code = 'S12_4675';
explain
select * from products_ss5 where product_name = '1969 Dodge Charger' and product_price = 58.73;

-- View
-- Các thông tin: productCode, productName, productPrice, productStatus từ bảng products.

create view v_products as
select product_code, product_name, product_price, product_status from products_ss5;

create or replace view v_products as
select id, product_code, product_name, product_price, product_status from products_ss5;

update v_products
set
    product_name = 'updated name'
where
    id = 1;

delete
from
    v_products
where
    id = 2;

drop view v_products;

-- Stores procedure
-- Tạo store procedure lấy tất cả thông tin của tất cả các sản phẩm trong bảng product

delimiter //
create procedure get_all_products()
begin
select * from products_ss5;
end //
delimiter ;

call get_all_products();

-- Tạo store procedure thêm một sản phẩm mới

delimiter //
create procedure add_new_product(
    in product_code varchar (50),
    in product_name varchar (50),
    in product_price decimal (10,2),
    in product_pmount decimal (10,2),
    in product_description text
)
begin
insert into products_ss5(product_code, product_name, product_price, product_pmount, product_description)
values (product_code, product_name, product_price, product_pmount, product_description);
end //
    delimiter ;

call add_new_product('N_01', 'New product 01', 123.455, 12.5, '');

-- Tạo store procedure sửa thông tin sản phẩm theo id

delimiter //
create procedure update_product_info_by_id(
    in product_id int,
    in product_code varchar (50),
    in product_name varchar (50),
    in product_price decimal (10,2),
    in product_pmount decimal (10,2),
    in product_description text
)
begin
update products_ss5 p
set
    p.product_code        = product_code,
    p.product_name        = product_name,
    p.product_price       = product_price,
    p.product_pmount      = product_pmount,
    p.product_description = product_description
where
    p.id = product_id;
end //
delimiter ;

call update_product_info_by_id (5, 'N_02', 'New product 02', 123.455, 12.5, '');
-- Tạo store procedure xoá sản phẩm theo id

delimiter //
create procedure delete_productby_id(
    in product_id int
)
begin
delete from products_ss5 where id = product_id;
end //
delimiter ;

call delete_productby_id(4);