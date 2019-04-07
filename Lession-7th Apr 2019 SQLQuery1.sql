
alter table users 
drop column id 



-- date
-- datetime 
-- convert to date 


select getdate()

--2019-04-07 11:54:00.390 
select convert(date, getdate())

update table 
set dob = convert(date, dob)


-- 2019-04-07
/*
-how to merge table?
Example:
-employee:
	eid 
	ename 
	email
	country

-salary 
	id 
	basic 

output:
---------
eid ename  basic 


Join: to merge two or more than two tables horizentally
======================	
-> At lease one column must be same in both the sources 
-> There are following types of join:   
	i. inner join / default join / equi join
			-return common/matching rows 
	ii. outer join / full outer join 
			-return all data from both sources (but not duplicate)
		a. left join / left outer join
			-return all rows from left table and matching from right 
		b. right join / right outer join 
			-return all rows from right table and matching from left table
Other types of join:
	-self join
	-cross join 
	-referential join 

*/

use hrms

create table j_employee
(
eid int identity(1,1),
name varchar(100),
email varchar(30),
gender varchar(1),
country varchar(100)
)

create table j_salary
(
id int,
sal int
)

--insert multiple rows
insert into j_employee(name,email,gender,country)
values('nitin','nitin@gamil.com','m','india'),
('jatin','jatin@gamil.com','m','uk'),
('divya','divya@gamil.com','f','india'),
('monika','monika@gamil.com','f','india'),
('ayush','ayush@gamil.com','m','india'),
('nitisha','nitisha@gamil.com','f','us')


select * from j_employee 
select * from j_salary 

insert into j_salary(id,sal)
values(1,560000),
(10,760000),
(2,960000),
(5,360000)

-- inner join 
select e.eid,e.name,e.email,s.sal  
from j_employee  e  inner join  j_salary  s		
on e.eid = s.id 

--default or equi 
select e.eid,e.name,e.email,s.sal  
from j_employee  e  join  j_salary  s		
on e.eid = s.id 


--left 
select e.eid,e.name,e.email,s.sal  
from j_employee  e  left  join  j_salary  s		
on e.eid = s.id 


--right 
select e.eid,e.name,e.email,s.sal  
from j_employee  e  right join  j_salary  s		
on e.eid = s.id 


select e.eid,e.name,e.email,s.sal  
from j_employee  e  right  outer join  j_salary  s		
on e.eid = s.id 


--full outer join
select e.eid,e.name,e.email,s.sal  
from j_employee  e  full outer join  j_salary  s		
on e.eid = s.id 


select e.eid,e.name,e.email,s.sal    , tax.name 
from j_employee  e   join  j_salary  s		
	on e.eid = s.id 
	
	inner join tabletax  tax 
	on  e.tid = tax.id 