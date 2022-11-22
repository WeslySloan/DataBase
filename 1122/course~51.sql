create or replace trigger movieprod
instead of insert on movieprod
for each row
declare
p_no
chk
begin
movieexec.certnotype;
integer;
select count(*) into chk from movie
where title = :new.title and year = new.year;
if chk=0 then
insert into movie (title, year) values (:new.title, : new.year);
end if;
select count(*) into chk from movieexec
where name:new.producer;
if chk = 0 then
insert into movieexec (name) values (:new.producer);
end if;
select certno into p_no from movieexec where name :new.producer;
update movie
set producerno = p_no
title=:new.title
