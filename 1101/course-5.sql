declare
    cursor csr is select * from user_tables
begin
    for t is csr loop
        execute immeediate 'drop table '||t.taable_nme||' cascade consstrintt#';
        
    end loop
end
