
select *  into order from orders

select  top 500 *  into order from orders

select  top 500 id,name  into order from orders

/*
	index :
	subquery 
	view options
	temp table #,##,
	system defined  function 
	user defined function	

*/

/*
index :  is storage technique which will store data in sorted order
There are following types of indx:
i. cluster index : primary key is cluster index 
		         : data will stored in sorted manner : physically sorted
				 : cluster index canbe only one on a table 	
ii. non-cluster index : virtually sorted
			   : can be multiple (999)

*/

--cluster index 
create table products 
(
pid int,
name varchar(100)
)

insert into products
values(10,'jatin')

insert into products
values(1,'jatin')


select * from products 

--with cluster index 
create table products2 
(
pid int primary key,
name varchar(100)
)

insert into products2
values(10,'jatin')

insert into products2
values(1,'jatin')

select * from products
select * from products2



--non-cluster inex
create index ix_name on products2
(
name 
)


sp_help products2

select * from products2



-- subquery : query inside query

use hrms

select * from employee
select max(slry) from employee

select top 1 * from 
				(select top 2 *  from employee
				order by slry desc
				) temp 
	order by slry asc 


2+3*4
(2+3)*4


---	view options : is virtual table
create view v_emps
as
	select * from Emp1


--insert will allow 
create view v_emps2
as
	select e.Eid,e.Name,b.country from Emp1 e inner join emp2 b 
				on e.Eid =b.eid



select * from v_emps
select * from emp1

insert into v_emps
values(10,'abcd')

insert into v_emps2
values(111,'nitin','india')  --not allowed 

select * from  sys.objects 
select * from [INFORMATION_SCHEMA].[CHECK_CONSTRAINTS]

--temp table #,##,@
--# : temp table for current session 
--## : temp table for all sessions , this table will exist till the db server will not be reboot 


create table #tbl
(
id int,
name varchar(10)
)

create table ##tbl
(
id int,
name varchar(10)
)


insert into #tbl 
values(1,'nitin')


insert into ##tbl 
values(1,'nitin')

select * from #tbl 

select * from ##tbl 

---system defined  function 
select getdate()


--
select @@version 

select @@servername



--user defined function 

alter function add_num
(
@n1 int,
@n2 int
)
returns int
as
begin
		declare @n  int 
		set @n = @n1+@n2

		return @n
end


	


select dbo.add_num(11,3)

