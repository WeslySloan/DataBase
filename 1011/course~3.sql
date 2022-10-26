declare
    type r_ty is record (
        len  movie.length%type := 100;
        std studio.name%type;
        cnt integer; 
    };
    rec r_ty;
    tt movie.title%type := '%Movie_Title';
    yy movie.year%type := %Movie_Year;
begin
    select length, studioname,count(*) into len, std, cnt 
    from movie, strsin
    where titl= tt and year = yy and title = movietitle and ea = movieyear
    group b length, studioname;
    
    