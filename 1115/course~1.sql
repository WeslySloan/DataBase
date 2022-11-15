declare
    fox exception;
    mgm exception;
    dine exception;
begin
    for m in (select * from movie) loop
        begin
            case m.studioname
            when 'fox' then
                raise fox;
            when 'mgm' then
                raise mgm;
            when 'disney' then
                raise disney;
            end case;
        exception
            when case_not_found then
                dbms_output.put_line(m.studioname||' raised');
            when fox then
                dbms_output.put_line('['||m.studioname||'] raised');
            when mgm then
                dbms_output.put_line('['||m.studioname||'] raised');
            when disney then
                raise_application_error(020999, '디즈니 영화사 영화');
        end;
    end loop;
exception
    when disney then
        dbms_output.put_line('['||m.studioname||'] raised');
end;