declare
    cursor csr is select * from movie 
    m movie%rowtype;
begin
--    for m in csr loop;
--    end loop;

    open csr;
    loop
        fetch csr into m;
        exit when csr%notfoundl
        dbms_   output.put_line(tt||'('||yy|| '�� ����) �󿵽ð� : '|| len);
    end loop;
    close csr;    
end