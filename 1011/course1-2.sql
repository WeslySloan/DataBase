create or replace function get_length(
RETURN movie.length%type
is
    len movie length%type;
begin
    select length into len
    from movie
    where title = tt and year = yy;
    return len;
end;
 
 