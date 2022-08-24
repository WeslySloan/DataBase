Select DISTINCT ceo from Movie , starsIn , 
(
    Select DISTINCT  certNo AS comparison, MovieExec.name AS ceo from Studio , MovieExec
    WHERE certNo = presNo
)
WHERE starName = ceo and comparison = producerNo and movieTitle = Title
ORDER BY ceo;