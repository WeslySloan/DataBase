declare
    cursor csr is select * from people;
    phones people.phone_list%type;
    addrs people.addres_list%type;
begin
    for p in cssr loop
        dbms_outpu.put_line(p.name||',积老; '||p.birthdate);
        phones := p.phone_list;
        for i in phone.first..phone.last loop
            dbms_outpu.put_line(p.name||',积老; '||p.birthdate);
        end loop
        addrs := p.addresses;
    end loop;
end;