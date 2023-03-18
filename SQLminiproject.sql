----< drop all tables >----

DROP TABLE Orders cascade constraints;
DROP TABLE Payment cascade constraints;
DROP TABLE Reservation cascade constraints;
DROP TABLE Dish cascade constraints;
DROP TABLE Cashier cascade constraints;
DROP TABLE Waiter cascade constraints;
DROP TABLE Chief cascade constraints;
DROP TABLE Manager cascade constraints;
Drop TABLE Customer cascade constraints;
Drop Table Employee cascade constraints;

----< Create tables >----
Create table Employee(
 	ID number(20)NOT NULL,
 	Name varchar(15),
 	Role varchar(8),
    Salary number(5),
 	PRIMARY KEY (ID)
 );
Create table Manager(
 	m_ID number(20)NOT NULL,
 	Name varchar(65),
    SHIFT varchar(5),
    PRIMARY KEY (m_ID),
    FOREIGN KEY (m_ID) References Employee(ID) ON DELETE CASCADE
);


 Create table Chief(
 	c_ID number(20)NOT NULL,
    expertise varchar (100),
    PRIMARY KEY (c_ID),
    FOREIGN KEY (c_ID) References Employee(ID) ON DELETE CASCADE
 	);
 Create table Cashier(
 	cash_ID number(20)NOT NULL,
    sHIFT varchar(5),
    PRIMARY KEY (cash_ID),
    FOREIGN KEY (cash_ID) References Employee(ID) ON DELETE CASCADE
 	);
Create table Customer(
     Cust_ID Number (20) Not Null,
	cust_name varchar(22),
	Phone varchar(14),
    TableNo Number(5),
	PRIMARY KEY(Cust_id)
    );
 Create table Waiter(
    w_ID number(20)NOT NULL,
 	TableNO Number(5),
    Cust_ID Number (20) Not Null,
    PRIMARY KEY (w_ID),
    FOREIGN KEY (w_ID) References Employee(ID) ON DELETE CASCADE,
    FOREIGN KEY (Cust_id) References Customer(Cust_id) ON DELETE CASCADE
 );
Create table Dish(
    DishID number(5) NOT NULL,
      dish_name varchar(12),
    Price number(5),
	c_ID number(20)NOT NULL,
	PRIMARY KEY (DishID),
    FOREIGN KEY (c_ID) References Chief(c_ID) ON DELETE CASCADE
    );
Create table Payment(
    pay_id number(20) NOT NULL,
    amount number (6) ,
    Cust_ID Number (20) Not Null,
    cash_ID number(20)NOT NULL,
PRIMARY KEY(pay_id),
FOREIGN KEY (Cust_id) References Customer(Cust_id) ON DELETE CASCADE,
FOREIGN KEY (Cash_id) References Cashier(Cash_id) ON DELETE CASCADE
);


Create table Reservation(
    dateReserved DATE ,
    Cust_ID Number (20) Not Null,
    r_ID number(20)NOT NULL,
   	m_ID number(20) NOT NULL,
    payment_amount number(20),
     FOREIGN KEY (Cust_id) References Customer(Cust_id) ON DELETE CASCADE,
      FOREIGN KEY (m_id) References Manager(m_ID) ON DELETE CASCADE,
      PRIMARY KEY (r_id)
);

Create table Orders (
DishID number(5) NOT NULL,
 Cust_id number(20) NOT NULL,
   FOREIGN KEY (DishID) References Dish(DishID) ON DELETE CASCADE,
   FOREIGN KEY (Cust_id) References Customer(Cust_id) ON DELETE CASCADE,
   PRIMARY KEY(DishID,Cust_id)
);
----< Describe Table >----
DESCRIBE Orders;
DESCRIBE Payment;
DESCRIBE Reservation;
DESCRIBE Dish;
DESCRIBE Cashier;
DESCRIBE Waiter;
DESCRIBE Manager;
DESCRIBE Customer;
DESCRIBE EMPLOYEE;

----< Alter Table >----


ALTER TABLE CUSTOMER
ADD (LOCATION VARCHAR(25),
REVIEW VARCHAR(3));

ALTER TABLE CUSTOMER
DROP COLUMN LOCATION;
ALTER TABLE CUSTOMER
DROP COLUMN REVIEW;

ALTER TABLE Reservation 
RENAME COLUMN dateReserved TO Reserved_Date;

ALTER TABLE Reservation 
RENAME COLUMN Reserved_Date TO dateReserved;


----< Data Insertion >----

-- INSERT INTO EMPLOYEE VALUES (ID, Name,Role, Salary);
INSERT INTO Employee VALUES (0, 'Suzie Smith', 'Manager',45000);
INSERT INTO Employee VALUES (1, 'Jerry Miller','Manager',50000);
INSERT INTO Employee VALUES (2, 'George Hill', 'Chief',26000);
INSERT INTO Employee VALUES (3, 'Elaine Scott', 'Chief',30000);
INSERT INTO Employee VALUES (4, 'Jim Kramer',  'Chief',	17000);
INSERT INTO Employee VALUES (5, 'Michelle Garcia', 'Chief',59000);
INSERT INTO Employee VALUES (6, 'Jimy iKramer',  'waiter',	7000);
INSERT INTO Employee VALUES (7, 'Michellet arcia', 'waiter',9000);
INSERT INTO Employee VALUES (8, 'kim amer',  'waiter',	7000);
INSERT INTO Employee VALUES (9, 'Jim Arnold',  'Cashier',	37000);
INSERT INTO Employee VALUES (10, 'Hogol Garcia', 'Cashier',39000);
INSERT INTO Employee VALUES (11, 'Bim Emer',  'waiter',	7000);
INSERT INTO Employee VALUES (12, 'Tomas Muller',  'Manager',37000);
INSERT INTO Employee VALUES (13, 'Dim Grimmer',  'waiter',	8000);
INSERT INTO Employee VALUES (14, 'Havoc Grimmer',  'waiter',	8000);

-- INSERT INTO CUSTOMER VALUES (CustID, CUST_Name, Phone, TableNo);
INSERT INTO CUSTOMER VALUES (3000, 'Dan Hamberg', 	'0175550123', 100);
INSERT INTO CUSTOMER VALUES (3001, 'Phil Ivan', 	'0175550101', 101);
INSERT INTO CUSTOMER VALUES (3002, 'Joan Johnson',	'0175559021', 102);
INSERT INTO CUSTOMER VALUES (3003, 'Dani Doyle', 	'0175557821', 103);
INSERT INTO CUSTOMER VALUES (3004, 'IPhil ZIvan', 	'0175550101', 101);
INSERT INTO CUSTOMER VALUES (3005, 'XEBEX',	'0175559056', 101);
INSERT INTO CUSTOMER VALUES (3006, 'DRAKE', '0175557878', 100);
INSERT INTO CUSTOMER VALUES (3007, 'SPhil ZIvan', 	'0177550101', 104);
INSERT INTO CUSTOMER VALUES (3008, 'Rocks D XEBEC',	'017589056', 105);
INSERT INTO CUSTOMER VALUES (3009, 'Trafalgar Law', '0174557878', 103);

-- INSERT INTO MANAGER VALUES (M_ID, Name,SHIFT);
INSERT INTO MANAGER VALUES (0, 'Suzie Smith', 'DAY');
INSERT INTO Manager VALUES (1, 'Jerry Miller','NIGHT');
INSERT INTO Manager VALUES (12, 'Tomas Muller','NIGHT');

-- INSERT INTO Chief VALUES (C_ID, Expertise);
INSERT INTO Chief VALUES (2, 'Chinese');
INSERT INTO Chief VALUES (3, 'Continental');
INSERT INTO Chief VALUES (4, 'Thai');
INSERT INTO Chief VALUES (5, 'All');

-- INSERT INTO Cashier VALUES (Cashier_ID,SHIFT);
INSERT INTO Cashier VALUES (9,'DAY');
INSERT INTO Cashier VALUES (10,'NIGHT');

-- INSERT INTO Waiter VALUES ( w_ID ,TableNO,Cust_ID)
INSERT INTO waiter VALUES (6,100,3000);
INSERT INTO Waiter VALUES (7,101,3001);
INSERT INTO Waiter VALUES (8,102,3002);
INSERT INTO Waiter VALUES (11,103,3003);
INSERT INTO Waiter VALUES (13,105,3008);
INSERT INTO Waiter VALUES (14,104,3007);

-- INSERT INTO DISH VALUES (DishID,dish_name ,Price, c_ID number)
INSERT INTO DISH VALUES (101,'pasta',302,2);
INSERT INTO DISH VALUES (102,'burger',129,3);
INSERT INTO DISH VALUES (103,'pizza',700,5);


-- INSERT INTO PAYMENT VALUES (Pay_id, Amount,  Cust_ID ,CashierID);
INSERT INTO PAYMENT VALUES (900, 3533,  3000,9);
INSERT INTO PAYMENT VALUES (901, 420,  3001,9);
INSERT INTO PAYMENT VALUES (902, 222,  3002,10);
INSERT INTO PAYMENT VALUES (903, 1115, 3000,9);
INSERT INTO PAYMENT VALUES (904, 1116, 3002,10);
INSERT INTO PAYMENT VALUES (905, 2110, 3001,10);
INSERT INTO PAYMENT VALUES (906, 2150, 3004,10);

-- INSERT INTO Reservation VALUES ( dateReserved,Cust_ID,r_ID, m_ID,payment_amount;)
INSERT INTO Reservation VALUES (TO_DATE('2022-01-14','YYYY/MM/DD'), 3004, 200000001, 0,6700);
INSERT INTO Reservation VALUES (TO_DATE('2022-01-23','YYYY/MM/DD'), 3005, 200000002, 1,4500);
INSERT INTO Reservation VALUES (TO_DATE('2022-01-04','YYYY/MM/DD'), 3006, 200000003, 0,1200);
INSERT INTO Reservation VALUES (TO_DATE('2022-02-24','YYYY/MM/DD'), 3003, 200000004, 0,2378);
INSERT INTO Reservation VALUES (TO_DATE('2022-02-24','YYYY/MM/DD'), 3001, 200000005, 1,2978);



-- INSERT INTO ORDERS (DISHID, CustID );
INSERT INTO ORDERS VALUES(101,3000);
INSERT INTO ORDERS VALUES(102,3001);
INSERT INTO ORDERS VALUES(103,3002);
INSERT INTO ORDERS VALUES(103,3005);
INSERT INTO ORDERS VALUES(105,3007);
INSERT INTO ORDERS VALUES(105,3007);


----< Data Update >----
-- changing managers shift
UPDATE Manager 
SET SHIFT= 'Day'
WHERE m_ID = 3;

----< Data Delete >----
-- if we want to sack any manager
DELETE FROM Manager 
WHERE m_ID = 3;


---------------------------------------------------LAB 03-------------------------------------------
SELECT NAME,Phone FROM CUSTOMER;

SELECT Salary FROM EMPLOYEE;
SELECT DISTINCT(Salary) FROM EMPLOYEE;

--divide SALARY by 2 where SALARY>=1000;
SELECT (SALARY/2) FROM EMPLOYEE
WHERE SALARY>=1000;
--USING 'AS'
SELECT (SALARY/2) AS REDUCED_SALARY FROM EMPLOYEE
WHERE SALARY>=1000;
--USING BETWEEN ,AND
SELECT SALARY FROM EMPLOYEE
WHERE SALARY BETWEEN 2000 AND 30000;
--DIFF OF 'IN'  ABD 'BETWEEN'
SELECT NAME,Role FROM EMPLOYEE
WHERE USER_BALANCE IN (7000,50000);
--order by
SELECT w_ID
FROM Waiter
ORDER BY TableNO;
---------
-- SELECT cust_name,COUNT(TableNO) FROM Customer
-- GROUP BY cust_name
-- HAVING COUNT(TableNO)>1
-- Order BY TableNO desc;

SELECT cust_name,Cust_ID
FROM CUSTOMER
ORDER BY Cust_ID DESC;

SELECT Name,ID
FROM EMPLOYEE
ORDER BY SALARY,ID DESC;

--like %---%
SELECT cust_name, Cust_ID
FROM CUSTOMER
where cust_name LIKE '%an%';

--FIND ACC WHICH HAS NAME STARTED WITH D
SELECT cust_name, Cust_ID
FROM CUSTOMER
where cust_name LIKE 'D%';
--FIND ACC WHICH HAS NAME ENDS WITH an
SELECT cust_name, Cust_ID
FROM CUSTOMER
where cust_name LIKE '%an';
--FIND ACC WHICH HAS NAME WITH 'A' IN MIDDLE
SELECT cust_name, Cust_ID
FROM CUSTOMER
where cust_name LIKE '%_a_%';



---------------------------------------------------LAB 04---------------------------------------------------



SELECT COUNT(*) FROM CUSTOMER;

SELECT SUM(SALARY) FROM EMPLOYEE;

SELECT SUM(DISTINCT SALARY) FROM EMPLOYEE;

--one Customer has multiple order in order table
SELECT COUNT(Cust_ID) as Numbers ,DishID
FROM Orders
GROUP BY DishID;

---NUMBER OF SAME AMOUNT OF SALARY IN EMPLOYEE TABLE
SELECT SALARY, COUNT(*)
FROM EMPLOYEE
GROUP BY SALARY
HAVING SALARY<200000;

SELECT SALARY, COUNT(*)
FROM EMPLOYEE
WHERE SALARY<200000
GROUP BY SALARY;

--Ordering by column values
SELECT Name,id FROM employee order by id;


---------------------------------------------------lab 5---------------------------------------------------
--Salary of manager who work in night shift nested query
SELECT NAME,Salary
FROM  Employee
WHERE ID IN (
    SELECT m_id
    FROM Manager
    WHERE SHIFT='NIGHT'
);
-- CUSTOMERS WHO HAS RESERVED 0R DIDNT RESEREVE
SELECT Cust_ID 
FROM PAYMENT
UNION ALL
SELECT Cust_ID  
FROM Reservation;

--INTERSECT (CUSTOMER NAME WHO HAS RESERVED AND CAME WITHOUT RESERVATION WITH REVERVSTION PAYMENT>100)
SELECT CUST_Name
FROM CUSTOMER NATURAL JOIN PAYMENT
INTERSECT 
SELECT CUST_Name
FROM CUSTOMER 
WHERE Cust_ID IN (
    SELECT Cust_id
    FROM Reservation
    WHERE payment_amount>100
);
------minus
-- Customers with Reservation payment less than 100taka
SELECT CUST_Name
FROM CUSTOMER NATURAL JOIN PAYMENT
minus
SELECT CUST_Name
FROM CUSTOMER 
WHERE Cust_ID IN (
    SELECT Cust_id
    FROM Reservation
    WHERE payment_amount>100
);

---------------------------------------------------LAB 06,07---------------------------------------------------
--name who PAID less than 100 USING JOIN
SELECT C.CUST_Name, C.Phone, D.AMOUNT
FROM CUSTOMER C JOIN PAYMENT D
ON (C.Cust_ID= D.Cust_ID)AND(D.AMOUNT>100); 


--NATURAL JOIN 3 TABLES nested
SELECT U.CUST_Name, U.Phone,R.dateReserved, M.AMOUNT
FROM CUSTOMER U NATURAL JOIN RESERVATION R NATURAL JOIN PAYMENT M; 
-- Cross Join
select d.cust_id, d.cust_name, p.pay_id,p.amount from customer d cross join payment p;

-- Inner Join
select d.cust_id, d.cust_name, p.pay_id,p.amount from customer d inner join
payment p on d.cust_id = p.cust_id;
--OUTER JOOIN
--LEFT
SELECT C.CUST_Name,M.AMOUNT
FROM CUSTOMER C LEFT OUTER JOIN PAYMENT M
ON C.Cust_ID=M.Cust_ID;
--Right
SELECT C.CUST_Name,M.AMOUNT
FROM CUSTOMER C RIGHT OUTER JOIN PAYMENT M
ON C.Cust_ID=M.Cust_ID;




--FIND DISH NAME  FROM Chief id
SET SERVEROUTPUT ON
DECLARE
DISHNAME Dish.dish_name%TYPE;
Cheifid Chief.c_ID%TYPE := '3';

BEGIN
SELECT dish_name INTO DISHNAME
FROM Dish
WHERE C_ID=Cheifid;

DBMS_OUTPUT.PUT_LINE ( DISHNAME||' prepared by chief '|| Cheifid );
END;
/

------Procedures--------
-- PL/SQL Procedure for displaying a Single Row

set serveroutput on

declare
var_cust_id  customer.cust_id%type;
var_cust_name customer.cust_name%type;

begin

select cust_id, cust_name  into var_cust_id , var_cust_name from customer
where cust_id = 3000;

dbms_output.put_line('customer_Id : ' || var_cust_id || ', Customer_Name : ' || var_cust_name );

end;
/
-- PL/SQL Procedure for displaying Multiple Rows using Cursor
--- to see if we have completed our target of customers

set serveroutput on

declare
cursor cust is select cust_id, cust_name, Phone from customer;
customer_record cust%rowtype;

begin

open cust;
loop
	fetch cust into customer_record;
	exit when cust%rowcount > 3;
	dbms_output.put_line('Customer_Id : ' || customer_record.cust_id);
	dbms_output.put_line('Customer_Name : ' || customer_record.cust_name);
	dbms_output.put_line('Customer_Name_Phone_no : ' || customer_record.Phone);
end loop;
close cust;

end;
/


-- PL/SQL Procedure which takes User Input & make Decision about Increasing salary of employee

set serveroutput on
declare
sal Employee.SALARY%type;

emp_id Employee.id%type := &Id;

begin

select  Salary into sal from employee
where Id = emp_id;

dbms_output.put_line ('Employee id: ' || emp_id);

if sal = 7000 then
	dbms_output.put_line ('Needs increment');
elsif sal  =8000  then
	dbms_output.put_line ('Needs increment');
elsif sal  =9000  then
	dbms_output.put_line ('Needs increment');
elsif sal  >10000  then
	dbms_output.put_line ('No Need for increment');
end if;

exception
when others then
	dbms_output.put_line (sqlerrm);
end;
/
---------------------------------------------------LAB 08 ,09---------------------------------------------------

----< Trigger FUNCTIONALITY>----
-- Trigger to check the Price of a Dish to while adding it to menu

set serveroutput on

create or replace trigger check_price before insert or update on DISH
for each row

declare
min_price number := 100;
max_price number := 10000;

begin

if :new.price > max_price then
	raise_application_error(-20000,'Price is too high to add to menu');
elsif :new.price < min_price then
	raise_application_error(-20001,'Price is too Small to to add to menu');
else dbms_output.put_line('New Row Inserted Successfully in Dish Table');
end if;

end;
/
INSERT INTO DISH VALUES (109,'Icecream',450,2);
select * from DISH;


-- Trigger to Auto Increment the Customer_id in Customer Table

set serveroutput on

create or replace trigger auto_inc before insert or update on customer
for each row

declare
current_id int;

begin
select max(cust_id) into current_id from customer;
:new.cust_id := current_id + 1;
dbms_output.put_line('New Row Inserted Successfully in Customer Table');

end;
/

insert into customer(cust_id, cust_name, phone,TableNo) values (Null, 'Alim', '+01352653626',105);
insert into customer(cust_id, cust_name, phone,TableNo) values (Null, 'Kalim', '+01352683626',103);
insert into customer(cust_id, cust_name, phone,TableNO) values (Null, 'Jalim', '+01352353626',104);
select * from customer;
delete from customer where cust_id > 3012;
select * from customer

----< TRANSACTION FUNCTIONALITY>----

-- TRANSACTION MANAGEMENT FOR CUSTOMER
savepoint sp1;
delete from customer;
select * from customer;

rollback to sp1;
select * from customer;
commit;



savepoint sp2;
insert into customer(cust_id,cust_name,TableNo,phone_number)values (3015,'Shanks','105','01704252963');
savepoint sp3;
insert into customer(cust_id,cust_name,TableNo,phone_number)values (3016,'Edward Newgate','105','01944252763');
select * from customer;

rollback to sp3;
select * from customer;
rollback to sp2;
select * from customer;


 ----<Creating a  View (create, update, delete, drop)>----

create view customer_view as
select cust_id, cust_name from customer;

select * from customer_view ;

update customer_view  set cust_name = 'Habib' where cust_id = 3005;
select * from customer_view ;

delete from customer_view  where cust_id = 3006;
select * from customer_view ;
   
drop view customer_view ;

insert into customer(cust_id, cust_name) values (3011, 'Xavier');
select * from customer;


 ----< DATE FUNCTIONALITY>----

select sysdate from dual;
select current_date from dual;
select systimestamp from dual;

             -----Change reservation date for a specific customer for 1 month--------
select  dateReserved, payment_amount from Reservation where r_id =200000001;
select add_months (dateReserved, 1) as three_months_extension from Reservation where r_id = 200000001;
select add_months (dateReserved, -1) as three_months_Reduction from Reservation where r_id  = 200000001;


select least (TO_DATE('2022-01-14','YYYY/MM/DD'), TO_DATE('2022-06-30','YYYY/MM/DD')) from dual;
select greatest (TO_DATE('2022-01-14','YYYY/MM/DD'), TO_DATE('2022-06-30','YYYY/MM/DD')) from dual;


select last_day(dateReserved) from Reservation where r_id>= 200000001;
select payment_amount, extract(day from dateReserved) as Day from Reservation where r_id <= 5200000001;
select payment_amount, extract(month from dateReserved) as Month from Reservation where r_id <= 5200000001;
select payment_amount, extract(year from dateReserved) as Year from Reservation where r_id <= 5200000001;


--------------------------------------------------------------------------------------------------------
Set SERVEROUTPUT on
CREATE OR replace Procedure SHOWcus (Id in NUMBER,naem in VARCHAR,nmbr in Number,tab in Number)
IS 
begin
  INSERT INTO CUSTOMER VALUES (Id, naem, nmbr, tab);
end;
/
SHOW ERRORS;
begin
  SHOWcus(21342,'smad',38274637,104);
end;
/
select * from Customer;

Set serveroutput on
create or replace Procedure check_sal (idd in number) IS
sal Employee.salary%type;
e_id Employee.id%type := &id;
begin

  select salary
    into sal
    from Employee
   where id = e_id;
   if sal>10000 then
     dbms_output.put_line('No need');
   elsif sal<10000 then
     dbms_output.put_line('needed');
     
   end if;
   
end;
/
show Errors;
begin
  check_sal(6);
end;
/
set serveroutput on
declare
 Cursor cust_cur Is
select  id,name,salary from Employee;
C_rec cust_cur%rowtype;

begin
  open cust_cur;
  loop
    fetch cust_cur INTO  C_rec;
    exit when cust_cur%notfound;
    dbms_output.put_line(c_rec.name); 
  end loop;
      close cust_cur;
end;
/
