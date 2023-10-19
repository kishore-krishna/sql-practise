create database rfn;
use rfn;
# creating table Matches
create table Matches (
team varchar(20)
);

#values inserted

insert into Matches values ("Ind");
insert into Matches values ("Aus");
insert into Matches values ("Eng");
insert into Matches values ("Pak");

select * from Matches;

With cte as
 ( 
 select *, Row_number() over( order by team asc) id from Matches    #row number is created
 )
select A.team as 'a-team' , B.team as 'b-team'
from cte as A join cte as B
on A.team != B.team   #A team must not match with B team
where A.id < B.id;    #id value must not match for 1 id

# 11, Oct 2023
/* Rank functions Aggregate functions - AVG, SUM, COUNT, MIN, MAX etc..
Ranking functions - RANK, DENSE_RANK, ROW_NUMBER etc..
Analytic functions - LEAD, LAG, FIRST_VALUE, LAST_VALUE etc... */

use dse;

select * from emp;

select avg(salary) from emp;

#ranking based on eid

select * , avg(salary) over (order by salary) as average
from emp;   # avg salary takes default rule unbounded preceding and current row rule

#apply for count and sum
select * , avg(salary) over (order by salary) as average,
Count(salary) over (order by salary) as count,
sum(salary) over (order by salary) as sum
from emp;

#applying the rule

select * , avg(salary) over (order by salary rows between unbounded preceding and unbounded following) as average,
Count(salary) over (order by salary rows between unbounded preceding and unbounded following) as count,
sum(salary) over (order by salary rows between unbounded preceding and unbounded following) as sum
from emp;

#applying partition

select * , avg(salary) over (partition by eid order by salary rows between unbounded preceding and unbounded following) as average,
Count(salary) over (partition by eid  order by salary rows between unbounded preceding and unbounded following) as count,
sum(salary) over (partition by eid order by salary rows between unbounded preceding and unbounded following) as sum
from emp;

# applying limit for 1 preceding and 1 following
select * , avg(salary) over ( order by salary rows between 1 preceding and 1 following) as average,
Count(salary) over ( order by salary rows between 1 preceding and 1 following) as count,
sum(salary) over (order by salary rows between 1 preceding and 1 following) as sum
from emp;


- ---------------------------------------------- joins 19/10/2023
use orders;
select * from address;
select * from online_customer;

select customer_id, city, customer_fname, customer_email 
from address A left join online_customer OC
on  A.address_id = OC.address_id;

select * from product;

select OC.customer_fname, OC.customer_email, OI.product_quantity, PR.product_price
from online_customer OC left join order_header OH
on OC.customer_id = OH.customer_id
left join order_items OI on OH.order_id = OI.order_id
left join product PR on  OI.product_id = PR.product_id
having avg(product_price)>1000;


