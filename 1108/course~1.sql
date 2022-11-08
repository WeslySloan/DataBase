declare
    function get_add return varchar2
    is
        type a_ty is table of varchar2(100);
        city a_ty := a_ty('부산시','서울시','대전시','울산시');
        gu a_ty := a_ty('남구','북구','서구','동구');
        dong a_ty := a_ty('대연동','용호동','대방동','대청동');
    begin
        return city(dbms_random.value(i,city,count)||' '||
               gu(dbms_random.value(i,gu,count)||' '||
               dong(dbms_random.value(i,dong,count)||' '||       
    end;
begin
    for i in 1..5 loop
        if dbms_random
        
        
        execute
end