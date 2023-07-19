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


