use dse;
select * from customers;
# insert function
insert into customers (customer_id, first_name, last_name, dob, phone) values (6, 'Krish','Sur', '1995-11-11','111-1129');
select * from customers;

# adding default and constraint
alter table customers 
alter phone set default '0000-1111';

select * from customers;
insert into customers (customer_id, first_name, last_name, dob) values (7, 'Vick','Sur', '1995-11-5');