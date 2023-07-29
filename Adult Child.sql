create table family
( person varchar(10),
 type varchar(10),
 age int
);

insert into family values
('A1','Adult',54),
('A2','Adult',53),
('A3','Adult',52),
('A4','Adult',58),
('A5','Adult',54),
('C1','Child',20),
('C2','Child',19),
('C3','Child',22),
('C4','Child',15);
select * from family

with adult as (
select *, row_number()over(order by person) as num
	from family
where type = 'Adult'
),
child as (
select *, row_number()over(order by person) as num
	from family
where type = 'Child'
)

select a.person,c.person
from adult a
left join child c
on a.num = c.num;

with adult as (
select *, row_number()over(order by age desc) as num
	from family
where type = 'Adult'
),
child as (
select *, row_number()over(order by age) as num
	from family
where type = 'Child'
)

select a.person,a.age, c.person, c.age
from adult a
left join child c
on a.num = c.num



