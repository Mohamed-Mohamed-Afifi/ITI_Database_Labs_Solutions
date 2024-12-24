(select D.Dependent_name ,D.Sex
from Employee E join Dependent D
on E.SSN=D.ESSN and E.Sex='F' and D.Sex='F')
union
(select D.Dependent_name ,D.Sex
from Employee E join Dependent D
on E.SSN=D.ESSN and E.Sex='M' and D.Sex='M')

select Sum(Hours) as [Total_Hours],P.Pname
from Project P join Works_for W
on P.Pnumber=W.Pno
Group by P.Pname

select D.*
from Employee E join Departments D
on D.Dnum=E.Dno and E.SSN=(select MIN(SSN) 
from Employee E join Departments D
on D.Dnum=E.Dno
);
SELECT D.* 
FROM Employee E 
JOIN Departments D 
ON D.Dnum = E.Dno 
WHERE E.SSN = (
    SELECT MIN(E1.SSN)
    FROM Employee E1
    WHERE E1.Dno IS NOT NULL
);
select D.Dname,MIN(E.Salary) as [min_salary],MAX(E.Salary) as [max_salary] ,AVG(E.Salary) as[Avarage]
from Employee E join Departments D
on D.Dnum=E.Dno
group by D.Dname;

/*
List the last name of all managers who have no dependents.
*/
select y.Lname
from Employee y join Employee x
on y.SSN=x.Superssn
where y.SSN not in(select Dependent.ESSN from Dependent);
/*
For each department-- if its average salary is less than the average salary of all employees-- display its number, name and number of its employees.
*/
select E.Dno,D.Dname,COUNT(E.SSN) as[number_of_emp]
from Employee E join Departments D
on D.Dnum=E.Dno
group by E.Dno,D.Dname
Having Avg(E.Salary)<(select AVG(Salary) from Employee);

/*
 Retrieve a list of employees and the projects they are working on ordered by department and within each department, ordered alphabetically by last name, first name.
*/
select *
from Employee E join Works_for W
on E.SSN=W.ESSn
join
Project P
on P.Pnumber=W.Pno
order by E.Dno,E.Lname,E.Fname;

/*
	Try to get the max 2 salaries using subquery
*/
select MAX(Salary) ,(select MAX(Salary) from Employee
where Salary not in(select MAX(Salary) from Employee)
) from Employee;



SELECT DISTINCT TOP 2 Salary 
FROM Employee
order by Salary desc;

select CONCAT(Employee.Fname,' ',Employee.Lname) from Employee
INTERSECT
select Dependent.Dependent_name from Dependent;

update E 
set E.Salary=E.Salary+.3*E.Salary
from Employee E join Works_for W
on E.SSN=W.ESSn
join 
Project P
on P.Pnumber=W.Pno and P.Pname='Al Rabwah'

select Employee.SSN,CONCAT(Employee.Fname,' ',Employee.Lname) from Employee
where exists(select Dependent.Dependent_name from Dependent where Employee.SSN=Dependent.ESSN) 

insert into Departments
values('DEPT IT',100,112233,'1-11-2006')

insert into Employee(SSN,Dno)
values(102660,20);
update Employee
set Fname='Eslam' , Lname='Ibrahim',Bdate='4-5-2000',Address='menouf,egypt',Sex='M',Salary=14000,Superssn=102672
where Employee.SSN=102660 

update Departments
set MGRSSN=102672
where Dnum=20;

select SSN from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed';

Delete Dependent
where ESSN=(select SSN from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed');

update x
set x.Superssn=102672
from Employee y join Employee x
on y.SSN=x.SSN and x.Superssn=(select SSN from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed')

update Departments
set MGRSSN=102672,[MGRStart Date]=GETDATE()
where MGRSSN=(select SSN from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed')

update Works_for
set ESSn=102672
where ESSn=(select SSN from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed')

Delete from Employee
where CONCAT(Fname,' ',Lname)='Kamel Mohamed'

select MIN(SSN) from Employee;
select * from Departments;
select * from Employee;
select * from Works_for;
select * from Project;
select * from Dependent;