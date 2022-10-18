select title, year, lengh, p.name pname, 
from movie, movieexec p, studio s, movieexec boss
where producerno = certno and sstudioname - s.name and presno = certno;


desc starsin;

select count(*)
from starsin, moviestar;
where movietitle = 'star was' and movieyear = 1977 and starname = name ;