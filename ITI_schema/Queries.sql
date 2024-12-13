
--update from anther table
update Department
	set Dept_Name='media'
from Instructor inner join Department
on Instructor.Ins_Id=Department.Dept_Manager and Instructor.Ins_Name='hany'
--multibule join
select concat(s.St_Fname,' ',s.St_Lname)[Student_Name],Dept_Name,Ins_Name[Department_Manager],Crs_Name[Course_Name]
from Department d inner join Student s
on d.Dept_Id=s.Dept_Id
inner join Instructor i
on i.Ins_Id=d.Dept_Manager
inner join Ins_Course
on i.Ins_Id=Ins_Course.Ins_Id
inner join Course
on Course.Crs_Id=Ins_Course.Crs_Id
--self join
select x.St_Fname+' '+ISNULL(x.St_Lname,'')[Student_name],y.St_Fname+' '+ISNULL(y.St_Lname,'')[SuperVisor_Name],y.St_Id,x.St_super
from Student y inner join Student x
on y.St_Id=x.St_super
order by y.St_Fname ,x.St_Fname
select x.St_Fname+' '+ISNULL(x.St_Lname,'')[Student_name],y.St_Fname+' '+ISNULL(y.St_Lname,'')[SuperVisor_Name],y.St_Id,x.St_super
from Student y inner join Student x
on y.St_Id=x.St_super

--update with self
update x
	set x.St_super=6
from Student y inner join Student x
on y.St_Id=x.St_super and x.St_Fname like 'mona'
--delete with join
ALTER TABLE Stud_Course
DROP CONSTRAINT FK_Stud_Course_Student;

ALTER TABLE Stud_Course
ADD CONSTRAINT FK_Stud_Course_Student
FOREIGN KEY (St_Id) REFERENCES Student(St_Id)
ON DELETE CASCADE;
delete Student
	from Student inner join Department
on Department.Dept_Id=Student.Dept_Id and Department.Dept_Desc='java'
select *from Student;
select * from Department;
select * from Stud_Course;