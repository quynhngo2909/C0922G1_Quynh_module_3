create database if not exists student_management;
create table `student_management`.`student_table`(
  `id` int not null, 
  `name` varchar(45) null, 
  `age` int null, 
  `country` varchar(45), 
  primary key(`id`)
);