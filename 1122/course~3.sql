create or replace trigger studioinfo
instead of insert on studioinfo
for each row
declare
    p_no movieexec.certnotype;
    chk integer;
begin
    select count(*) into chk from studio
    where name = :new.name;
    if chk = 0 then
    end if;
    select certno into p_no from movieexec
    where name = :new.boss;
    update studio
    set presno = p_no