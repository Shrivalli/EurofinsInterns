create database EurofinsInterns
use EurofinsInterns

--Data Definition Language
create table Product
(
pid int,
pname varchar(30),
price float,
dom date,
status bit
)

drop table Product

alter table Product alter column pid int not null
alter table Product add primary key(pid)




--Data Manipulation Language
insert into product(pid,pname) values(4,'Pencil')
insert into product values(1,'Mobile',56000,'4/5/20',1)
insert into product values(6,'Marker',56,'5/3/20',0,502),(3,'erasor',33,'6/7/20',0)
select * from product 

update product set price=95000 where pid=1

delete from product where pid=4

truncate table product

drop table product



create table supplier
(
sid int primary key,
sname varchar(20),
city varchar(30)
)

insert into supplier values(501,'Ritwik','Pune'),(502,'Shradha','Bangalore')

select * from supplier
select * from product

alter table product add suppid int references supplier(sid)

update product set suppid=501 where pid in (2,3)

select pname,price from product where pname like 'M%'
update product set price=560 where pid=2

select * from product where price>100 and price<1000

select * from product where 
dom between '03/01/2020' and '07/08/20'
and pname like 'M%'

select pname  from product where month(dom)=05

select * from product where suppid in (501,502)

select month(dom), from product
create nonclustered index idx1 on product(pname)

select * from product order by price desc, pname 

insert into product values(7,'chalk',712,getdate(),0,502)

insert into product values(8,'abcd',3,default,1,501)
update product set price=75 where pid=8

alter table product add constraint defdom default getdate() for dom

alter table product add constraint chkprice check (price>10)

--aggregate functions
--min, max, avg, sum, count - output will be a scalar

select * from product
select min(price) from product

--group by'
--select list of group by can have aggregate functions,column in the group by list
select count(price) as 'Number of Products',dom 
from product group by dom
having count(price) >=2
order by dom desc












