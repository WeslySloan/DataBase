Select address AS 주소 , AVG(length) AS 평균상영시간 , MAX(year) AS 최근개봉년도 from Movie , Moviestar, StarsIn
WHERE starName = name AND title = movieTitle AND starName IN
(
        SELECT com1.name
        FROM MovieStar com1 , MovieStar com2
        WHERE com1.address = com2.address AND NOT com1.name = com2.name
)
GROUP BY address;