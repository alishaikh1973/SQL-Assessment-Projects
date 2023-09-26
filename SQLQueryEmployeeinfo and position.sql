create table EmployeeInfo(
empId int primary key,
empFname varchar(20),
empLname varchar(20),
department varchar(20),
project varchar(5),
address varchar(40),
dob date,
gender varchar(8)
)

create table EmployeePosition
(
empId int,
empPosition varchar(20),
doj date,
salary int
)

select * from EmployeeInfo
select * from EmployeePosition

insert into EmployeeInfo values(1,'Rohit','Gupta','Admin','P1','Delhi','1979/12/2','Male')
insert into EmployeeInfo values(2,'Rahul','Mahajan','Admin','P2','Mumbai','1986/10/10','Male')
insert into EmployeeInfo values(3,'Sonia','Banerjee','HR','P3','Pune','1983/6/5','Female')
insert into EmployeeInfo values(4,'Anikta','Kapoor','HR','P4','Chennai','1983/11/28','Female')
insert into EmployeeInfo values(5,'Swati','Garg','HR','P5','Delhi','1991/4/6','Female')

insert into EmployeePosition values(1,'Executive','2020/4/1',75000)
insert into EmployeePosition values(2,'Manager','2020/4/3',50000)
insert into EmployeePosition values(3,'Manager','2020/4/2',150000)
insert into EmployeePosition values(2,'Officer','2020/4/2',90000)
insert into EmployeePosition values(1,'Manager','2020/4/3',300000)

--1. Create a query to generate the first records from the EmployeeInfo table.

select top 1* from EmployeeInfo order by empid

--2. Create a query to generate the last records from the EmployeeInfo table.

select top 1 * from EmployeeInfo order by empId desc

--3. Create a query to fetch the third-highest salary from the EmpPosition table.

    select e1.*, p1.salary
	from EmployeeInfo e1
	inner join EmployeePosition p1 on p1.empId=e1.empId
	order by p1.salary desc
	offset 2 rows 
	fetch next 1 rows only

--4. Write a query to find duplicate records from a table.

select empid,count(empid) as 'count' from EmployeePosition 
	 group by empId
	 having count(empid)>1

--5. Create an SQL query to fetch EmpPostion and the total salary paid for each employee position.

select empPosition,sum(salary) from EmployeePosition
	 group by empPosition 

--6. find the employee who has max salary

      select top 1 e1.*, p1.salary from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   order by p1.salary desc

--7 find the employee who has max salary from Admin department

select top 1 e1.*, p1.salary from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   where e1.department='Admin'
	   order by p1.salary desc


--8 find the age of each employee

  select *, year(cast(GETDATE() as date))-year(cast(dob as date)) as 'Age' from EmployeeInfo

--9 display only female employee details

select * from EmployeeInfo where gender='Female'

--10 display employee whos position is executive

select  e1.*, p1.salary,p1.empPosition from EmployeeInfo e1
	   inner join EmployeePosition p1 on p1.empId=e1.empId
	   where p1.empPosition='Executive'

--11 display count of employee in each city

select address,count(empid) as 'count' from EmployeeInfo
 group by address



