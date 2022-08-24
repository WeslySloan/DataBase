Select DISTINCT MovieExec.name , netWorth  from MovieExec , Studio ,
(
    Select DISTINCT starName from StarsIn
    HAVING count(movietitle) >= 3
    GROUP BY starName
)
WHERE presNo = certNo and MovieExec.name = starName
GROUP BY netWorth , MovieExec.name
ORDER BY networth DESC;