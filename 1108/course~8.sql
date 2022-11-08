declare
    cursor st_csr is select * from moviestar
    cursor 
    int_st varchar2(200) := 'insert into star_info value (:1,:2,:3,
        smov_tab(), pmov_taab())';
begin
    for sstt in st_cr loop
        exxecute immediate ins_st uusing st.name, st.addess, st.gender;
    end loop;
end;