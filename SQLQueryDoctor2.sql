use Doctor_patient
create table Doctor2
(
Did int primary key,
D_address varchar(20),
qualification varchar(40),
noofP_handled int,
)
 insert into Doctor2 values(401,'kothrud','MBBS',24)
 insert into Doctor2 values(402,'Karve nagar','MD',8)
 insert into Doctor2 values(403,'Bhelke nagar','Physician',12)
 insert into Doctor2 values(404,'KP','surgeon',4)
 select*from Doctor2

 create table PatientMaster
 (
 p_code int,
 p_name varchar(40),
 p_add varchar(40),
 age int,
 gender varchar(20),
 bloodgroup varchar(20),
 )

insert into PatientMaster values(1,'ali','kothrud',22,'male','O+')
insert into PatientMaster values(2,'amay','kothrud',24,'male','O-')
insert into PatientMaster values(3,'anmol','lohegoan',23,'male','A+')
insert into PatientMaster values(4,'suyash','mira road',25,'male','A-')
select* from PatientMaster

create table AdmittedPatient
(
pcode int,
entry_d varchar(20),
disc_d varchar(20),
ward_no int,
disease varchar(40),
did int,
)
insert into AdmittedPatient values(1,'2023-01-12','2023-02-12',121,'asthma',401)
insert into AdmittedPatient values(2,'2023-02-24','2023-04-24',122,'TB',402)
insert into AdmittedPatient values(3,'2023-04-12','2023-12-12',123,'cancer',403)
insert into AdmittedPatient values(4,'2023-08-08','2023-10-12',124,'Brainteumour',404)
select * from AdmittedPatient

create table Bill
(
pcode int,
bill_amt numeric(20,2)
)
insert into bill values(1,4000.00)
insert into bill values(2,8000.00)
insert into bill values(3,12000.00)
insert into bill values(4,24000.00)
select * from Bill

--1)write a queries to create all tables with primary key ,foreign key
constraints fk_did foreign key(did) references Doctor2(Did)

--2)write a query to describe above tables
exec sp_help doctor2
exec sp_help PatientMaster
exec sp_help AdmittedPatient
exec sp_help bill

--3)write a query to drop primary key from patientMaster
alter table patientmaster drop primary key

--4)Suppose Discharge _date is not present into AdmittedPatient write query to add Discharge_date column into the AdmittedPatient
update AdmittedPatient set disc_d ='2014-01-01'

--5)write a query to change the data type wardno int to varchar(10)
select cast(121 as varchar(10))

--6) write a query to drop one foreign key from AdmittedPatient
alter table AdmittedPatient drop foreign key 

--7)write a query to add foreign key such that if parent is delete or update child also delete or update 

--8)write a query to add primary key to patientMaster
alter table patientMaster add primary key(p_code)

--9) write a query to insert 5 records into the Doctor table
insert into Doctor2 values(401,'kothrud','MBBS',24)
 insert into Doctor2 values(402,'Karve nagar','MD',8)
 insert into Doctor2 values(403,'Bhelke nagar','Physician',12)
 insert into Doctor2 values(404,'KP','surgeon',4)
 
--10)write a query find the no. of doctors as per qualification
SELECT qualification, COUNT(*) AS no_of_doctors
FROM doctor2
GROUP BY qualification

--11)find the doctors whose qualification is MD or MBBS
select * from doctor2 where qualification='MD' or qualification='MBBS'

--12)find patients whose age is between 21to 27 with bloodgroup A+ 
select * from PatientMaster where age between 21 and 27 and bloodgroup='A+'

--13 )find the doctors whose address is mumbai and noofpatient_handle are 10
select * from doctor2 where D_address='KP' and noofP_handled='4'

--14)find the count of pateint as per the blood group
select bloodgroup,count(*) as 'total' from PatientMaster 
group by bloodgroup

--15)find the maximum bill amount
select max(bill_amt) as 'maximum' from bill

--16)find the doctors who has noofpatient_handle are more than 10;
SELECT Did, COUNT(*) AS no_of_doctors
FROM doctor2
GROUP BY Did  having count(noofP_handled)>10

--17)find the number of patients who live in pune
SELECT COUNT(*) AS 'Number of Patients'
FROM PatientMaster
WHERE p_add = 'Kothrud'
 
--18)find the patients whose bloodgroup is AB+ and gender is the female
select count (*) as 'Numbers of patients' from PatientMaster where bloodgroup='A+' and gender='male'

--19)find the no of patient with covid 19 as per the ward and display wardno with maxmum patient of covid 19
select ward_no ,count(*) as 'numbers of patients' from AdmittedPatient where disease ='asthma'
 group by ward_no having count(*) >1
 
--20)delete the patient whose wardno is 4 or 6 and Disease is covid 19
delete from Admittedpatient where ward_no in (4,6) and disease='asthma'

--21)remove all records from bill table
drop table Bill

--22) find the details of doctor who are treating the patient of wardno3
SELECT d.Did 
FROM  Doctor2 d
INNER JOIN AdmittedPatient p
ON d.Did = p.Did
WHERE p.Ward_No ='124'

--23)find details of patient who are discharge  within the date 12-12-18 to 25-12-18
select * from AdmittedPatient where disc_d ='2023-02-12' and disc_d= '2023-04-24'
 
--24)Give details of patient who are admited in hospital more than 5 days
SELECT *
FROM AdmittedPatient
WHERE DATEDIFF(DAY, entry_d, disc_d) > 5

--25)find the patient who are suffered from dengue and having age less than 30and bloodgroup is'A'
select * from AdmittedPatient where disease='asthma'and age=<30 and bloodgroup ='a+'

--26)find the patient who recover from dengue and  bill amount is greater than 10000
SELECT *
FROM AdmittedPatient
WHERE Disease ='TB' AND bill_Amt > 10000 AND disc_d IS NOT NULL

--27)find Patient whose doctors qualifiaction is M.b.b.s
SELECT p. p_code
FROM PatientMaster p
INNER JOIN Doctor2 d
ON p.p_code = d.Did
WHERE d.Qualification = 'MBBS'


