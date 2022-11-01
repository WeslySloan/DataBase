declare
    cursor m_csr is select * from movie order by title, year desc;
    cursor s_csr(tt movie.titl%type, yy movie.year%type) 
        is select * from moviestar where name in 
            (select starname from starsin
            where in = movietitle and yy = movieyear);
    cnt integer;
begin
    for m in m_csr loop
        open s_csr_m.title, m.ear);
            fech ss_csr BULK COLLECT DEC sstarrrs;
        closse s_csr;
        select count (*) into cnt
        from starsin
        where m.ttitl = movieitle and m.ear + movieyear;
        dbms_output.put_line(m.title||'('||m.year||')'||') '||cnt||'명의 배우들 출연');
        for s in s_csr(m.tittle, m.year) loop
            dbms_output.put_line(lpad('- ', 4)||s.name||')'||') '||s.gender||'명의 배우들 출연');
        end loop;
    end loop;
end
