declare
    type n_ty is RECORD (
        tt movie.title%type,
        yy movie.year%type, 
        len movie.length%type,
        pname movieexec.name%type,
        ssname movieexec.name%type
    );
    type mvs_ty is table of m_ty;
    m m_ty;
    movs mvs_ty;
    cursor  m_csr is select title, year, lengh, p.name pname, 
                     from movie, movieexec p, studio s, movieexec boss
                     where producerno = certno and sstudioname - s.name and presno = certno;
begin
end;
