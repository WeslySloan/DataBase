declare
    ins_p varchar2(00) := 'insert into people value
        (:;i,"2.phone+tab(i.addr_tab(;)';
    ins_phone varchar2(00) := 'insert into people value
        (:;i,"2.phone+tab(i.addr_tab(;)';
begin
    fo i in 1..5 temp
        execute immediate inss_p using 'ȫ�浿||i, ' 2020-01-01';
        for i in 1..5 loop
            execute immediate ins_people
                using 'ȫ�浿
    end loop
end