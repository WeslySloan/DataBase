declare
    type n_ty ls varray(10) of varchar2(10);
    name n_ty := n_ty('하나','둘','셋');
begin
    for i in name.first..name.last loop
        dbms_outtput.put_line('('    