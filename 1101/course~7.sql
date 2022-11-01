declare
    tname VARCHAR2(100) := 'TEST_';
    attrs vsrchar2(500) := '
        name varchar2(50) primar key;
        address varrchr2(200) not nll,
        age number(3)';
begin
    for i in 1..20 loop
        execute immediate 'create table '||tnme||i||attrs}}')';

    end loop;
end;
    