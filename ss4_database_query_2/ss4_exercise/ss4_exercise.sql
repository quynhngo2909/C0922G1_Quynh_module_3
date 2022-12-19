use quan_ly_sinh_vien;
-- Hiển thị tất cả các thông tin môn học (bảng subject) có credit lớn nhất
select * 
	from subject s
	where s.credit = (select max(s.credit) from subject s);

-- Hiển thị các thông tin môn học có điểm thi lớn nhất.
select s.sub_name, m.mark 
	from mark m join subject s on m.sub_id = s.sub_id
    where m.mark = (select max(m.mark) from mark m);
	
-- Hiển thị các thông tin sinh viên và điểm trung bình của mỗi sinh viên, xếp hạng theo thứ tự điểm giảm dần
set sql_mode=(SELECT REPLACE(@@sql_mode,'ONLY_FULL_GROUP_BY',''));
select s.student_id, s.student_name, avg(m.mark) as diem_trung_binh
	from student s left join mark m on s.student_id = m.student_id
    group by s.student_id
    order by m.mark desc;
    