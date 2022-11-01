declare
    cursor s_csr is select * from moviestar;
    s   movestarr%rotpe;
begin
    open s_csr
    loop
        fetch s_csr into s;
        exit when s_csr%notfound;
        select count(*) into cnt
        from moviestar
        where s.name not in (select starname from starsin);
        if cnt > 0 then
            delete from moviestar
            here current of s_csr;
            dbms_output.put_line(s.name ||' MOVIESTAR ∆©«√ ªË¡¶µ ');
        else
        update moviesstaar
        set address = '('||address||')'
        where curreent of s_csr;
        dbms_output.put_line(s.name ||' MOVIESTAR ∆©«√ ªË¡¶µ ');
    end loop         
end