
Ramanji@456



/*
Day - 01 
Date: 23rd Mar 2019
Lession -01
*/

-- create new database 
create Database amazon

--chagne database  (go inside given dbname)
use amazon

--create table
create table customer
(id int, name varchar(40), 
gender varchar(30) ,salary int)

-- * : show all columns
select * from customer 

--show selected columns
select id,name from customer 

--save  data / insert data 
insert into customer(id,name,gender,salary)
values(2,'jatin','male',223434)


insert into customer(name,gender)
values('Monika','female')


insert into customer(id,name,gender,salary)
values(4,'vidhi','female',22343),
(5,'rahul','male',12343),
(7,'gaurav','male',33434),
(20,'kshitiz','male',123434),
(90,'ridhi','female',223434)



--- show all  data 
select * from customer

--show slected columns
select name, gender from customer

--show selected rows
select * from customer where id =4

 
 select id,name,salary from customer where id >4

select * from customer where id >4


--sort / order  by
select * 
from customer 
order by name desc 

select * 
from customer 
order by name asc

select * 
from customer 
order by id desc 
