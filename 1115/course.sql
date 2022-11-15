declare
    type i_ty is varray(4) of integer;
    int1 i_ty := i_ty(10, 20, 30, 40);
    int2 i_ty := i_ty(3, 11, 0, 20);
    out_of_limit exception;
    divide_by_zero exception;
    pragma exception_init(out_of_limit,-6532);
    pragma exception_init(divide_by_zero,-1476);
begin
    for i in int1.first..int1.last loop
        begin
            dbms_output.put_line(int1(i)/int2(i));
        exception
            when zero_divide then
                dbms_output.put_line('0À¸·Î ³ª´°¼À ½Ãµµ');
                raise_application_error(-20001,'³ª´©±â 0ÀÌ ½ÇÇà µÊ!');
        end;
    end loop;
    dbms_output.put_line(int1(int1.int+i)/int2(i));
exception
    when others then
        dbms_output.put_line(SQLCODE||' : '||SQLERRM);
end;