declare 
    sname moviesstar.name%type := 'f';
    s moviestar%rowtype;
begin
    select cou(*) into snt
    from moviestar
    where name like '%'||name||'%'
    if sql%found then
        dbms_output
        