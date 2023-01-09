create database if not exists furama_database;
use furama_database;

create table position_emp (
  id int primary key auto_increment, 
 name varchar(45)
);

create table education_degree (
  id int primary key auto_increment, 
  name varchar(45)
);

create table division (
  id int primary key auto_increment, 
  name varchar(45)
);

create table employee (
  id int primary key auto_increment, 
  name varchar(45) not null, 
  birthday date not null, 
  id_card varchar(45) not null, 
  salary double not null, 
  phone_number varchar(45) not null, 
  email varchar(45), 
  address varchar(45), 
  position_id int, 
  education_degree_id int, 
  division_id int, 
  username varchar(255), 
  foreign key (position_id) references position_emp(id),
  foreign key (education_degree_id) references education_degree(id), 
  foreign key (division_id) references division(id)
);

create table customer_type (
  id int primary key auto_increment, 
  name varchar(45)
);
drop table customer;
create table customer (
  id int primary key auto_increment, 
  customer_type int, 
  name varchar(45) not null, 
  birthday date not null, 
  gender bit(1) not null, 
  id_card varchar(45) not null, 
  phone_number varchar(45) not null, 
  email varchar(45), 
  address varchar(45), 
  foreign key (customer_type) references customer_type(id)
);

create table rent_type (
  id int primary key auto_increment, 
  name varchar(45)
);

create table facility_type (
  id int primary key auto_increment, 
  name varchar(45)
);

create table facility (
  id int primary key auto_increment, 
  name varchar(45) not null, 
  area int, 
  cost double not null, 
  max_people int, 
  rent_type_id int, 
  facility_type_id int, 
  standard_room varchar(45), 
  description_other_convenience varchar(45), 
  pool_area double, 
  number_of_floors int, 
  facility_free text, 
  foreign key (rent_type_id) references rent_type(id), 
  foreign key (facility_type_id) references facility_type(id)
);

create table contract (
  id int primary key auto_increment, 
  start_date datetime, 
  end_date datetime, 
  deposit double, 
  employee_id int, 
  customer_id int, 
  facility_id int, 
  foreign key (employee_id) references employee(id), 
  foreign key (customer_id) references customer(id), 
  foreign key (facility_id) references facility(id)
);

create table attach_facility (
  id int primary key auto_increment, 
  name varchar(45) not null, 
  cost double not null, 
  unit varchar(10) not null, 
  status varchar(45)
);

create table contract_detail (
  id int primary key auto_increment, 
  contract_id int, 
  attach_facilty_id int, 
  quantity int not null, 
  foreign key (contract_id) references contract(id), 
  foreign key (attach_facilty_id) references attach_facility(id)
);








