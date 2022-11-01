declare 
    sname moviesstar.name%type := 'f';
    s moviestar%rowtype;
begin
    select * into =
    from moviestar
    where name = sname;
    if sql%found then
        dbms_output
        