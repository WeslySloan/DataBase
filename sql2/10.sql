Select AVG(netWorth) from MovieExec
WHERE name IN
(
    SELECT DISTINCT name from MovieExec, StarsIn, Movie
    WHERE name = starName and producerNo = certNo 
)