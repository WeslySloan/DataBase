select * from studioinfo;
select * from studio;
select * from (select e.*, rownum : from movieexec e) order by r desc;
insert into movie (title, year) values ('X1',2022);
insert into movie (title, year, producerno) values ('x5,2022, 60);
insert into movie (title, year, producerno) values ('X3©ö,2022, 3);
insert into studioinfo values ('W1', 'WWW1');
update studioinfo
set boss = 'TEMP_29'
where name = 'mgm';