declare
    function get_add return varchar2
    is
        type a_ty is table of varchar2(100);
        city a_ty := a_ty('�λ��','�����','������','����');
        gu a_ty := a_ty('����','�ϱ�','����','����');
        dong a_ty := a_ty('�뿬��','��ȣ��','��浿','��û��');
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