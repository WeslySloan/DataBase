accept Movie_Title prompt '��ȭ ������:'
accept Movie_Year prompt '�����⵵��:'

declare
    len  movie.length%type := 100;
    tt movie.title%type := '%Movie_Title';
    yy movie.year%type := '%Movie_Year';
begin
    select length into len
    from movie
    where title = tt and year = yy;
    dbms_output.put_line(tt||'('||yy|| '�� ����) �󿵽ð� : 'lines);
exception
    when others than 
        dbms_output.put_line(tt||'('||yy|| '�� ����) �󿵽ð� : 'lines);
end;