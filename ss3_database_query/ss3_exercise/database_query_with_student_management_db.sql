use quan_ly_sinh_vien;
select * from student where student_name like 'h%';
select * from class where extract(month from start_date) = '12';
select * from subject where credit between 3 and 5;
  
set sql_safe_updates = 0;
update student set class_ID = 2 where student_name = 'Hung';
  
set sql_safe_updates = 1;
select 
  S.student_name, 
  Sub.sub_name, 
  M.mark 
from 
  mark M 
  join student S on M.student_ID = S.student_ID 
  join subject Sub on Sub.sub_ID = M.sub_ID 
order by 
  M.mark desc, 
  S.student_name;















