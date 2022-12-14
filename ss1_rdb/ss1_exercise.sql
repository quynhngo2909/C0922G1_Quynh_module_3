create schema if not exists `student_management`;
use `student_management`;
create table `student`(
  `id` int not null, 
  `name` varchar(45) null, 
  `age` int null, 
  `country` varchar(45), 
  primary key(`id`)
);

create table `class` (
  `id` int not null primary key, 
  `name` varchar(45) null
);

create table `teacher` (
  `id` int not null primary key, 
  `name` varchar(45) null, 
  `age` int null, 
  `country` varchar(45) null
);
