create or replace trigger movie_dml
before insert or update on movie
for each row
declare
    avg_len movie.length%type;
    s_name  studio.name%type;
    b_no    movieexec.certno%type;
    p_no    movieexec.certno%type;
    cnt     integer;
    pragma autonomous_transaction;
begin
    select count(*) into cnt from movieexec where certno = :new.producerno;
    if cnt = 0 then
        insert into movieexec(certno,name) values (:new.producerno,'홍길동'||:new.producerno);
    end if;
    if :new.length is null or :new.length <= :old.length then
        select avg(length) into avg_len from movie;
        :new.length := avg_len;
    else
        :new.length := dbms_random.value(100,300);
    end if;
    if :new.studioname is null then
        begin
            select name into s_name
            from (select name from studio where name not in (select studioname from movie) 
                    order by dbms_random.value) 
            where rownum = 1;
        exception
            when no_data_found then
                s_name := 'disney';
        end;
        :new.studioname := s_name;
        select presno into b_no from studio where name = s_name;
        
        update movieexec
        set networth = 0
        where certno = b_no;
        commit;
        
        
        
        
        
        
    end if;
end;