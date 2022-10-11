accept Movie_Title prompt '영화 제목은:'
accept Movie_Year prompt '개봉년도는:'

declare
    len  movie.length%type := 100;
    tt movie.title%type := '%Movie_Title';
    yy movie.year%type := '%Movie_Year';
begin
    select length into len
    from movie
    where title = tt and year = yy;
    dbms_output.put_line(tt||'('||yy|| '년 개봉) 상영시간 : 'lines);
exception
    when others than 
        dbms_output.put_line(tt||'('||yy|| '년 개봉) 상영시간 : 'lines);
end;