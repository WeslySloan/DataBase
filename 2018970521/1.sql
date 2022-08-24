Select DISTINCT studio.name AS 영화사 , ROUND(AVG(length)) AS 평균상영시간 , MIN(year) AS 첫상영년도 , COUNT(title) AS 영화갯수 from Studio , Movie
WHERE studioName = name
GROUP BY studio.name
ORDER BY count(title) desc;