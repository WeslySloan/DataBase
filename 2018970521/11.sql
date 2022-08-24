Select COUNT(title) AS 영화제목 , length AS 상영시간 from Movie
HAVING COUNT(title) > 1
GROUP BY length
ORDER BY length DESC;