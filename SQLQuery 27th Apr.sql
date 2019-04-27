
/*
File System:
	.mdf, and .ldf file 
	-mdf : main data file  (data)
	-ldf : log data file (sql commands history, logs)

 To view these files:
	-> right click on database -> go to properties -> then go to file tab

SQL Command Types:
	DDL
		create
		alter
		drop 
		truncate   
				-remove all data from table, but structure will remain same
				-truncate doesn't support where clause 
			    -truncate reset the identity column(auto increment column)
	DML
		insert
		delete		
				-delete rows with and without condition
				-delete supports where clause (conditional remove)
				-delete doesn't rest identity column

		update 

	TCL
		begin tran
		rollback   *  
					-to cancel the transaction/process which has been recorded/stored into log
		commit

	DCL   **
		create user
		grant access 
		revoke access

	Operator :
			Arithmetic:
				+ - * / % 
			Conditional:
				>
				>=
				<
				<=
				=
				!=     not equal 
				<>     not equal
				
			
	Keywords : 
			in 
			not in 
			between 
			not between 
			is null 
			is not null
	Wild card/patter matching : %, _- need refresher *


	Having **
			-having can be allowed only with group by
			-filter the data after summarizing(group by)

	where:
			-filter data from raw table 
				
*/

	
/* truncate */
create table test_1
(
id int identity(1,1),
name varchar(100)
)
insert into test_1
values('nitin')

select * from test_1

truncate table test_1 --remove all data /rows

delete from test_1 --delete all data / rows 
delete from test_1  where id =6
delete from test_1  where id >6
delete from test_1  where id in (1,2,4,6)

/* transaction rollback */

select * from test_1

begin tran --trsansaction 

delete from test_1 

rollback 




select 12/2

---operator
select * from j_employee
where eid in (1,5,6)

select * from j_employee
where eid  not in (1,5,6)

select * from j_employee
where eid  between 2 and 10  --inclusive

select * from j_employee
where eid  not between 2 and 10 

select * from j_employee
where MGR_ID is null

select * from j_employee
where MGR_ID is not  null



from   1
where   2
group by  3
having    4
order by   5

select gender, count(gender) ,sum(eid)
from   j_employee
where   eid >1
group by gender 
having sum(eid) >13



--cusname , oid , region , zone , cat , subcate, sales,qty

Region 
-------------
East  c1  
      c2
	  c3
 
select cusname , oid , region , zone , cat , subcate , sum(qty), sum(sales)
from sales 
group by cusname , oid , region , zone , cat , subcate --, sales,qty



--wild card
select * from j_employee where name like 'n%'
select * from j_employee where name like '%n'

select * from j_employee where name like 'n%n'


-- Keyword: Top, Distinct
--top : return top given rows rows
select top 2 * from j_employee

select top 2 * from j_employee
order by eid desc 

--distinct : show unique rows
select distinct  * from j_employee
select distinct  gender from j_employee
