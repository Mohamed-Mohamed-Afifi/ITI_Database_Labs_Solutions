select D.Dname,D.Dnum,CONCAT(E.Fname,' ',E.Lname) as [manager_name],E.SSN
from Departments D join Employee E
on E.SSN=D.MGRSSN

select D.Dname,D.Dnum,P.Pname
from Departments D join Project P
on D.Dnum=P.Dnum

select D.Dependent_name,D.Bdate,D.Sex,CONCAT(E.Fname,' ',E.Lname)as [Employee]
from Dependent D join Employee E
on E.SSN=D.ESSN

select Pname,Pnumber,Plocation,City from Project
	where City in('Alex','Cairo');

select Pname,Pnumber,Plocation,City from Project
	where City like 'a%';

select D.Dname,D.Dnum,CONCAT(E.Fname,' ',E.Lname),E.Salary
from Departments D join Employee E
on E.SSN=D.MGRSSN and D.Dnum=30 and E.Salary between 1000 and 2000

select CONCAT(E.Fname,' ',E.Lname) AS[Emp_name],D.Dnum,P.Pname,W.Hours
from Departments D join Employee E
on D.Dnum=E.Dno
join 
Project P
on D.Dnum=P.Dnum
join
Works_for W
on P.Pnumber=W.Pno and P.Pname='Al Rabwah'  and D.Dnum=10 and W.Hours>=10

select CONCAT(x.Fname,' ',x.Lname) as[EmP_name],CONCAT(y.Fname,' ',y.Lname) as[Super_SSN]
from Employee y join Employee x
on y.SSN=x.Superssn and CONCAT(y.Fname,' ',y.Lname)='Kamel Mohamed'

select CONCAT(E.Fname,' ',E.Lname) AS[Emp_name],P.Pname
from Employee E join Works_for W
on E.SSN=W.ESSn
join
Project P
on P.Pnumber=W.Pno
order by P.Pname

select ISNULL(E.Lname,' ') AS[Manager_name],E.Bdate,E.Address , D.Dname
from Employee E join Departments D
on E.SSN=D.MGRSSN
join
Project P
on D.Dnum=P.Dnum and P.City='Cairo' 

select CONCAT(y.Fname,' ',y.Lname) as[manager],y.Address,y.SSN,D.Dependent_name
from Employee y join Employee x
on y.SSN=x.Superssn
join 
Dependent D
on y.SSN=D.ESSN


select * from Employee;
select * from Dependent;
select * from Project;
select * from Works_for;
select * from Departments;