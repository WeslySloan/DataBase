Select title , year from Movie 
WHERE 
studioName =
(
    Select DISTINCT Studio.name from MovieExec , Studio
    WHERE certNo = presNo AND netWorth IN
    (
        Select MIN(netWorth) from MovieExec , Studio
        WHERE certNo = presNo
    )
)
AND
producerNo =
(
    Select DISTINCT certNo from MovieExec , Movie
    WHERE certNo = producerNo AND netWorth IN
    (
        Select MAX(netWorth) from MovieExec , Movie
        WHERE certNo = producerNo
    )
)