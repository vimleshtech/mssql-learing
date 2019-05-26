/*
Trigger  :  is a type of stored procedure which executes automatically when DML(insert,update,delete) command will run on a table
Example:
	tbl:users
	id   uname  emailid      pwd
	1    nitin  ni@gmail.com 124

There are following types of trigger:
i.  after 
		-INSERT
		-UPDATE
		-DELETE
ii. instead of 
		-INSERT
		-UPDATE
		-DELETE


Triger maintin the logs and real time data transaction 
There are following virtual table (magic or dynamic table) which will create automatically :
	-inserted
				insert
				update 
	-deleted
				delete 
				update 


*/

USE HRMS
SELECT * FROM users

ALTER TABLE users
ADD PWD VARCHAR(100)

delete from users where id =1

UPDATE USERS 
SET PWD='sjsghs'
WHERE ID=4


UPDATE USERS 
SET PWD='XY@1236'
WHERE ID>=4

SELECT * FROM users_log
WHERE ID =1
ORDER BY ACTION_DATE ASC


create table users_log
(
id int,
name varchar(100),
email varchar(500),
time_stamp datetime,
pwd varchar(100),
action_type char(1),
action_date datetime
)
action_date VARBINARY 
create trigger user_update_log
on users
after update 
as
begin

	insert into users_log(id,name,email,time_stamp,pwd,action_type,action_date)
	select *,'U',GETDATE() from deleted 
	

end



create trigger user_insert_log
on users
after insert
as
begin

	insert into users_log(id,name,email,time_stamp,pwd,action_type,action_date)
	select *,'I',GETDATE() from inserted
	

end



create trigger user_delete_log
on users
after DELETE
as
begin

	insert into users_log(id,name,email,time_stamp,pwd,action_type,action_date)
	select *,'D',GETDATE() from deleted
	

end

--update one table from another table 
update u 
set u.PWD = l.pwd
from users as u inner join users_log as l
	on u.id = l.id 

/*
Cursor: is iterator of data 
       -forward 
Types : implicit  (automatic when update, delete)
      : explicit  


Loop: 
*/





CREATE TABLE C_Employee
(
 EmpID int PRIMARY KEY,
 EmpName varchar (50) NOT NULL,
 Salary int NOT NULL,
 Address varchar (200) NOT NULL,
)
GO
INSERT INTO C_Employee(EmpID,EmpName,Salary,Address)VALUES(15,'Mohan',12000,'Noida')
INSERT INTO C_Employee(EmpID,EmpName,Salary,Address) VALUES(20,'Pavan',25000,'Delhi')
INSERT INTO C_Employee(EmpID,EmpName,Salary,Address) VALUES(3,'Amit',22000,'Dehradun')
INSERT INTO C_Employee(EmpID,EmpName,Salary,Address) VALUES(4,'Sonu',22000,'Noida')
INSERT INTO C_Employee(EmpID,EmpName,Salary,Address) VALUES(5,'Deepak',28000,'Gurgaon')
GO
SELECT * FROM C_Employee 
----
DECLARE @Id int
DECLARE @name varchar(50)
DECLARE @salary int
DECLARE cur_emp CURSOR

STATIC FOR 
		SELECT EmpID,EmpName,Salary from c_Employee
OPEN cur_emp
IF @@CURSOR_ROWS > 0
BEGIN 
		 FETCH NEXT FROM cur_emp INTO @Id,@name,@salary
		 WHILE @@Fetch_status = 0 --if no failure
		 BEGIN
			      PRINT 'ID : '+ convert(varchar(20),@Id)+', Name : '+@name+ ', Salary : '+convert(varchar(20),@salary)
				  --email 
		
				FETCH NEXT FROM cur_emp INTO @Id,@name,@salary
		 END
END

CLOSE cur_emp
DEALLOCATE cur_emp


--
BACKUP DATABASE ECOMM
TO disk ='c:\ecom.bak'


--remove duplcicate 

select * from c_employee



--cte : common type expression 
WITH TempEmp (EMPName,COUT)
AS
(
	SELECT EMPName,
		   ROW_NUMBER() OVER(PARTITION by EMPName, Salary,ADDRESS ORDER BY EMPName, Salary,ADDRESS) 
	AS COUT
	FROM C_Employee
)
--SELECT * FROM TempEmp

--A 344 DL		1
--A 344 DL		2
--B 344 DL		1
--B 344 DL		2
--B 344 DL		3


	--Now Delete Duplicate Records
	DELETE FROM TempEmp
	WHERE COUT > 1



--XML
-- Create tables for later population using OPENXML.  
DROP TABLE Customers 
CREATE TABLE Customers (CustomerID varchar(20) primary key,  
                ContactName varchar(20),   
                CompanyName varchar(20));  
GO  
CREATE TABLE Orders( CustomerID varchar(20), OrderDate datetime)  
GO  


DECLARE @docHandle int;  
DECLARE @xmlDocument XML  -- nvarchar(max); -- or xml type  

SET @xmlDocument = N'<A>  
<Customers CustomerID="XYZAA" ContactName="Joe" CompanyName="Company1">  
<Orders CustomerID="XYZAA" OrderDate="2000-08-25T00:00:00"/>  
<Orders CustomerID="XYZAA" OrderDate="2000-10-03T00:00:00"/>  
</Customers>  
<Customers CustomerID="XYZBB" ContactName="Steve"  
CompanyName="Company2">No Orders yet!  
</Customers>  
</A>';  

EXEC sp_xml_preparedocument @docHandle OUTPUT, @xmlDocument;  
-- Use OPENXML to provide rowset consisting of customer data.  
INSERT Customers   
SELECT *   
FROM OPENXML(@docHandle, N'/ROOT/Customers')   
  WITH Customers;  


-- Use OPENXML to provide rowset consisting of order data.  
INSERT Orders   
SELECT *   
FROM OPENXML(@docHandle, N'//Orders')   
  WITH Orders;  
-- Using OPENXML in a SELECT statement.  
SELECT * FROM OPENXML(@docHandle, N'/ROOT/Customers/Orders') WITH (CustomerID nchar(5) '../@CustomerID', OrderDate datetime);  
-- Remove the internal representation of the XML document.  
EXEC sp_xml_removedocument @docHandle; 


select * from customers



