use quan_ly_ban_hang;
insert into customer(c_name, c_age) 
values 
  ('Minh Quan', 10), 
  ('Ngoc Oanh', 20), 
  ('Hong Ha', 50);
  
insert into `order`(c_id, o_date) 
values 
  (1, '2006-03-21'), 
  (2, '2006-03-23'), 
  (1, '2006-03-16');
  
insert into product (p_name, p_price) 
values 
  ('May Giat', 3), 
  ('Tu Lanh', 5), 
  ('Dieu Hoa', 7), 
  ('Quat', 1), 
  ('Bep Dien', 2);
  
insert into order_detail (o_id, p_id, od_qty) 
values 
  (1, 1, 3), 
  (1, 3, 7), 
  (1, 4, 2), 
  (2, 1, 1), 
  (3, 1, 8), 
  (2, 5, 4), 
  (2, 3, 3);
  
-- Hiển thị các thông tin  gồm oID, oDate, oPrice của tất cả các hóa đơn trong bảng Order
select 
  O.o_id as `order id`, 
  O.o_date as `order date`, 
  O.o_total_price as `price` 
from 
  `order` O;
  
-- Hiển thị danh sách các khách hàng đã mua hàng, và danh sách sản phẩm được mua bởi các khách
select 
  C.c_name, 
  P.p_name 
from 
  customer C 
  join `order` O on C.c_id = O.c_id 
  join order_detail OD on O.o_id = OD.o_id 
  join product P on OD.p_id = P.p_id;

-- Hiển thị tên những khách hàng không mua bất kỳ một sản phẩm nào
select * 
from customer C 
where not exists ( select O.c_id from `order` O where O.c_id = C.c_id);
  
-- Hiển thị mã hóa đơn, ngày bán và giá tiền của từng hóa đơn 
-- (giá một hóa đơn được tính bằng tổng giá bán của từng loại mặt hàng xuất hiện trong hóa đơn. 
-- Giá bán của từng loại được tính = odQTY*pPrice)
set sql_mode = (select replace(@@sql_mode, 'ONLY_FULL_GROUP_BY', ''));
select 
  O.o_id, 
  O.o_date, 
  sum(OD.od_qty * P.p_price) as total_price 
from 
  `order` O 
  join order_detail OD on O.o_id = OD.o_id 
  join product P on OD.p_id = P.p_id 
group by 
  O.o_id;
