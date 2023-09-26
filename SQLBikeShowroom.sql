drop table Model
create table Model
(
m_id int primary key,
m_name varchar(20),
cost numeric (10,2)not null,
)
insert into Model values(1,'activa5g',80000.00)
insert into Model values(2,'activa4g',60000.00)
insert into Model values(3,'activa3g',40000.00)
insert into Model values(4,'Dio',80000.00)
insert into Model values(5,'access125',90000.00)
select * from model

drop table customer1
create table Customer1
(
c_id int primary key,
f_name varchar(20),
l_name varchar(20),
m_no numeric (10,0)unique,
gender varchar(20),
email varchar(20)unique,
)
insert into Customer1 values(101,'ali','shaikh',8619423334,'male','ali@gmail.com')
insert into Customer1 values(102,'amay','sonar',9988223314,'male','amay@gmail.com')
insert into Customer1 values(103,'anmol','kamble',9834561822,'male','anmol@gmail.com')
insert into Customer1 values(104,'suyash','sarpe',9785102244,'male','suyash@gmail.com')
insert into Customer1 values(105,'akriti','negi',9876543210,'female','akriti@gmail.com')

select * from Customer1

drop table Purchase
create table Purchase
(
p_id int,
cust_id int,
m_id int,
foreign key (cust_id) references customer1(c_id),
foreign key (m_id) references model(m_id),
b_amt numeric(20,2),
pay_id numeric(20,2) primary key,
p_date varchar(20) not null,
r_id int not null,
)

insert into Purchase values(201,101,1,4000.00,80000.00,'2023-01-01',1)
insert into Purchase values(202,102,2,2000.00,40000.00,'2023-08-12',2)
insert into Purchase values(203,103,3,2000.00,120000.00,'2023-04-08',3)
insert into Purchase values(204,104,4,8000.00,30000.00,'2023-11-20',4)
insert into Purchase values(205,105,5,1000.00,20000.00,'2023-12-25',5)
select * from Purchase

create table Pay_mode
(
pay_id int primary key,
p_type varchar(20),
)

insert into Pay_mode values(11,'online')
insert into Pay_mode values(22,'cash')
insert into Pay_mode values(33,'cheque')
select* from Pay_mode

create table feedback_rating
(
r_id int primary key,
rating varchar(40),
)

insert into feedback_rating values(5,'Excellent')
insert into feedback_rating values(4,'Good')
insert into feedback_rating values(3,'Average')
insert into feedback_rating values(2,'Bad')
insert into feedback_rating values(1,'Complaint')
select * from feedback_rating


--1.WAQ to get the balance amount for customers who made cash payment 

select (m.cost - p.b_amt) as 'Balance' from model m join purchase p 
on m.m_id=p.m_id join Customer1 c1 on
c1.c_id=p.cust_id join Pay_mode pt
on pt.p_type=p.pay_id
where pt.p_type='cash'


--2.Delete all the records of customer who have paid complete amount as that of bike cost.
delete from customer1 where c_id =(
select cust_id ,* from model m inner join purchase p on m.m_id=p.m_id 
group by cust_id 
having count(cust_id)=0 )


--3.Create an index to have faster retrival of data on the basis of booking_amount.
create index A_index on purchase(b_amt)

--4.WAQ to change payment mode to cash for ‘activa5g’ purchased by customer with id 11. 
--5.Map where key is modelName and value is arraylist of ids of customers who purchased that model.
--6.Create a stored procedure to get the full name of customer whose cust_id is provided as input.
--7.WAQ to get the number of complaints registered for model activa 5G.
--8.WAQ to get all customer names who haven’t given ratings yet. 
--9.Delete all complaint records from purchase. 
--10.Update ratings given by Mr Vaibhav from good to excellent.
--11.Reduce cost of all bikes for which rating is bad by 10%. 
--12.Write a to display highest selling model along with name and count.
 









