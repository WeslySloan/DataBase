create or replace procedure get_length(tt in movie.title%type,  in movie,year%type
RETURN movie.length%type
is
    len movie length%type;
begin
    select length, sttudionme,count(*) into len, std, cnt
    from movie
    where title = tt and year= yy;
    
    select count
    from movie
    where title = tt and year = yy;
    return len;
end;
 
 